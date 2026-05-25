#!/usr/bin/env bash
set -euo pipefail

PROGRESS_MARKER="<!-- newest entry below -->"

usage() {
  cat <<'USAGE'
Usage:
  scripts/agent-handoff.sh status
  scripts/agent-handoff.sh checkpoint <agent> -m "<summary>"
  scripts/agent-handoff.sh checkpoint <agent> --stdin
  scripts/agent-handoff.sh resume

<agent> identifies who is writing the entry: 'codex' or 'claude'.
With --stdin, the summary is read from standard input (use a heredoc).

This script only reads from git and writes progress.md. It never
commits, pushes, resets, cleans, checks out, or switches branches.

Concurrent checkpoints are serialized via a mkdir-based lock at
.progress.lock (in repo root). If the lock is stale, remove it manually:
    rmdir .progress.lock

Deprecated subcommands ('save', 'load') print upgrade instructions
and exit non-zero.
USAGE
}

repo_root() {
  git rev-parse --show-toplevel 2>/dev/null || {
    echo "agent-handoff: not inside a git repository" >&2
    exit 1
  }
}

ROOT="$(repo_root)"
cd "$ROOT"

PROGRESS_FILE="${ROOT}/progress.md"
PROGRESS_LOCK_DIR="${ROOT}/.progress.lock"

# State for the global cleanup trap. Set by insert_entry; cleared once
# the move succeeds so cleanup is a no-op on the happy path.
PROGRESS_TMP=""
PROGRESS_LOCK_HELD=0

cleanup_progress() {
  if [[ -n "$PROGRESS_TMP" && -e "$PROGRESS_TMP" ]]; then
    rm -f "$PROGRESS_TMP"
  fi
  if (( PROGRESS_LOCK_HELD == 1 )); then
    rmdir "$PROGRESS_LOCK_DIR" 2>/dev/null || true
    PROGRESS_LOCK_HELD=0
  fi
}
# EXIT runs on normal exit. INT/TERM must explicitly exit, otherwise bash
# can resume the script body after the trap and act on stale state.
# cleanup_progress is idempotent so the EXIT-after-signal double-run is safe.
trap cleanup_progress EXIT
trap 'cleanup_progress; exit 130' INT
trap 'cleanup_progress; exit 143' TERM

acquire_progress_lock() {
  local max_wait=30
  local waited=0
  while ! mkdir "$PROGRESS_LOCK_DIR" 2>/dev/null; do
    if (( waited >= max_wait )); then
      echo "agent-handoff: could not acquire lock $PROGRESS_LOCK_DIR within ${max_wait}s." >&2
      echo "Another checkpoint may be in progress. If stale: rmdir $PROGRESS_LOCK_DIR" >&2
      exit 1
    fi
    sleep 1
    waited=$((waited + 1))
  done
  PROGRESS_LOCK_HELD=1
}

current_branch() {
  local branch
  branch="$(git branch --show-current 2>/dev/null || true)"
  if [[ -n "$branch" ]]; then
    echo "$branch"
  else
    git rev-parse --short HEAD
  fi
}

head_hash() { git rev-parse HEAD; }
head_subject() { git log -1 --format=%s; }

upstream_ref() {
  git rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>/dev/null || true
}

ahead_behind() {
  local upstream="$1"
  if [[ -z "$upstream" ]]; then
    echo "no upstream"
    return
  fi
  local counts behind ahead
  counts="$(git rev-list --left-right --count "$upstream"...HEAD 2>/dev/null || true)"
  if [[ -z "$counts" ]]; then
    echo "upstream unavailable"
    return
  fi
  read -r behind ahead <<< "$counts"
  echo "ahead ${ahead}, behind ${behind}"
}

agent_label() {
  case "${1:-}" in
    codex) echo "Codex" ;;
    claude|claude-code|claude_code) echo "Claude Code" ;;
    *)
      echo "agent-handoff: agent must be 'codex' or 'claude' (got '${1:-}')" >&2
      exit 2
      ;;
  esac
}

print_status() {
  local branch upstream hash subject ab
  branch="$(current_branch)"
  upstream="$(upstream_ref)"
  hash="$(head_hash)"
  subject="$(head_subject)"
  ab="$(ahead_behind "$upstream")"

  echo "# Agent Handoff Status"
  echo
  echo "- Project: $(basename "$ROOT")"
  echo "- Repo: ${ROOT}"
  echo "- Time: $(date '+%Y-%m-%d %H:%M:%S %Z')"
  echo "- Branch: ${branch}"
  echo "- HEAD: ${hash}"
  echo "- Commit: ${subject}"
  echo "- Upstream: ${upstream:-"(none)"}"
  echo "- Ahead/behind: ${ab}"
  if [[ -f "$PROGRESS_FILE" ]]; then
    echo "- progress.md: ${PROGRESS_FILE}"
  else
    echo "- progress.md: (missing — first checkpoint will create it)"
  fi
  echo
  echo "## Working tree (git status --short)"
  local short
  short="$(git status --short)"
  if [[ -n "$short" ]]; then
    echo "$short"
  else
    echo "(clean)"
  fi
}

# Parse the top entry from progress.md.
# Boundary: from after $PROGRESS_MARKER through (but not including) the
# SECOND "## <ISO-date> — " heading. The top entry's own header counts
# as the first such heading; the next entry's header is the second and
# stops the parse. Anchored on YYYY-MM-DD so a user-authored "## " inside
# a summary won't be misinterpreted as an entry boundary, and on header
# (not '---') so a summary containing a Markdown horizontal rule or a
# code-block line of '---' doesn't truncate the entry.
print_top_entry() {
  if [[ ! -f "$PROGRESS_FILE" ]]; then
    echo "(no progress.md yet — run: scripts/agent-handoff.sh checkpoint <agent> -m \"...\")"
    return
  fi
  if ! grep -qF -- "$PROGRESS_MARKER" "$PROGRESS_FILE"; then
    echo "(progress.md missing marker; showing first 80 lines verbatim)"
    head -80 "$PROGRESS_FILE"
    return
  fi
  awk -v marker="$PROGRESS_MARKER" '
    seen == 1 && /^## [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9] / {
      headers++
      if (headers > 1) exit
    }
    seen == 1 { print }
    $0 == marker { seen = 1; next }
  ' "$PROGRESS_FILE"
}

print_resume() {
  print_status
  echo
  echo "## Latest progress.md entry"
  echo
  print_top_entry
  echo
  echo "## Next"
  echo
  echo "- Read CLAUDE.md and AGENTS.md if present."
  echo "- Confirm the working tree and HEAD above match what you expect."
  echo "- Ask Q for the next objective unless the entry already specifies one."
}

build_entry() {
  local label="$1" timestamp="$2" branch="$3" hash="$4" subject="$5"
  local upstream="$6" ab="$7" summary="$8"
  local status_short="$9" diff_stat="${10}" cached_stat="${11}" last_commit="${12}"

  echo
  echo "## ${timestamp} — ${label}"
  echo
  echo "- **Branch:** \`${branch}\`"
  echo "- **HEAD:** \`${hash:0:7}\` — ${subject}"
  echo "- **Upstream:** ${upstream:-"(none)"} — ${ab}"
  echo
  echo "### Summary"
  echo
  echo "${summary}"
  echo
  echo "### Working tree (\`git status --short\`)"
  echo
  if [[ -n "$status_short" ]]; then
    echo '```text'
    echo "$status_short"
    echo '```'
  else
    echo "_clean_"
  fi
  echo
  echo "### Unstaged diff (\`git diff --stat\`)"
  echo
  if [[ -n "$diff_stat" ]]; then
    echo '```text'
    echo "$diff_stat"
    echo '```'
  else
    echo "_none_"
  fi
  echo
  echo "### Staged diff (\`git diff --cached --stat\`)"
  echo
  if [[ -n "$cached_stat" ]]; then
    echo '```text'
    echo "$cached_stat"
    echo '```'
  else
    echo "_none_"
  fi
  echo
  echo "### Latest commit (\`git show --stat --oneline HEAD\`)"
  echo
  if [[ -n "$last_commit" ]]; then
    echo '```text'
    echo "$last_commit"
    echo '```'
  else
    echo "_no commits yet_"
  fi
  echo
  echo "---"
}

# Inserts a new entry directly after $PROGRESS_MARKER (or creates the file
# with the entry on first run). Serialized via mkdir lock; atomic via
# temp-file + mv. Cleanup is handled by the script-level trap.
insert_entry() {
  local entry="$1"
  acquire_progress_lock
  PROGRESS_TMP="$(mktemp "${ROOT}/.progress.tmp.XXXXXX")"
  if [[ ! -f "$PROGRESS_FILE" ]]; then
    {
      echo "# Project Progress"
      echo
      echo "Live cross-agent handoff log. Newest entry on top. Each entry is one"
      echo "checkpoint written by one agent. Both Codex and Claude Code append"
      echo "entries; nobody edits prior entries. Managed by"
      echo "\`scripts/agent-handoff.sh checkpoint\`."
      echo
      echo "$PROGRESS_MARKER"
      printf '%s\n' "$entry"
    } > "$PROGRESS_TMP"
  else
    if ! grep -qF -- "$PROGRESS_MARKER" "$PROGRESS_FILE"; then
      echo "agent-handoff: progress.md missing marker; refusing to overwrite" >&2
      exit 1
    fi
    local marker_line
    marker_line="$(grep -nF -- "$PROGRESS_MARKER" "$PROGRESS_FILE" | head -1 | cut -d: -f1)"
    head -n "$marker_line" "$PROGRESS_FILE" > "$PROGRESS_TMP"
    printf '%s\n' "$entry" >> "$PROGRESS_TMP"
    tail -n +"$((marker_line + 1))" "$PROGRESS_FILE" >> "$PROGRESS_TMP"
  fi
  chmod 644 "$PROGRESS_TMP"
  mv -f "$PROGRESS_TMP" "$PROGRESS_FILE"
  # Signal to cleanup_progress that the tmp file no longer exists.
  PROGRESS_TMP=""
  # Release the lock here so the cleanup trap doesn't double-rmdir.
  rmdir "$PROGRESS_LOCK_DIR" 2>/dev/null || true
  PROGRESS_LOCK_HELD=0
}

write_checkpoint() {
  local agent_raw="${1:-}"
  if [[ -z "$agent_raw" ]]; then
    echo "agent-handoff: checkpoint requires <agent> ('codex' or 'claude')" >&2
    exit 2
  fi
  shift
  local label
  label="$(agent_label "$agent_raw")"

  local summary="" source=""
  while [[ $# -gt 0 ]]; do
    case "$1" in
      -m|--message)
        shift
        if [[ $# -eq 0 ]]; then
          echo "agent-handoff: -m requires a value" >&2
          exit 2
        fi
        summary="$1"
        source="-m"
        ;;
      --stdin)
        if [[ -t 0 ]]; then
          echo "agent-handoff: --stdin given but stdin is a TTY" >&2
          exit 2
        fi
        summary="$(cat)"
        source="--stdin"
        ;;
      *)
        echo "agent-handoff: unknown checkpoint arg '$1'" >&2
        exit 2
        ;;
    esac
    shift
  done

  if [[ -z "$source" ]]; then
    echo "agent-handoff: checkpoint requires -m \"<summary>\" or --stdin" >&2
    exit 2
  fi
  summary="${summary%$'\n'}"
  if [[ -z "${summary//[[:space:]]/}" ]]; then
    echo "agent-handoff: checkpoint summary is empty" >&2
    exit 2
  fi

  local branch upstream hash subject ab status_short diff_stat cached_stat last_commit timestamp
  branch="$(current_branch)"
  upstream="$(upstream_ref)"
  hash="$(head_hash)"
  subject="$(head_subject)"
  ab="$(ahead_behind "$upstream")"
  status_short="$(git status --short)"
  diff_stat="$(git diff --stat)"
  cached_stat="$(git diff --cached --stat)"
  last_commit="$(git show --stat --oneline HEAD 2>/dev/null || true)"
  timestamp="$(date '+%Y-%m-%d %H:%M:%S %Z')"

  local entry
  entry="$(build_entry "$label" "$timestamp" "$branch" "$hash" "$subject" \
    "$upstream" "$ab" "$summary" \
    "$status_short" "$diff_stat" "$cached_stat" "$last_commit")"

  insert_entry "$entry"
  echo "Wrote checkpoint for ${label} -> ${PROGRESS_FILE}"
  echo
  echo "Latest entry:"
  echo
  print_top_entry
}

deprecated_save() {
  echo "agent-handoff: 'save' is DEPRECATED in favor of 'checkpoint'." >&2
  echo >&2
  echo "  Old: scripts/agent-handoff.sh save <target>" >&2
  echo "  New: scripts/agent-handoff.sh checkpoint <your-agent> -m \"<summary>\"" >&2
  echo >&2
  echo "  <your-agent> is who YOU are (codex or claude), not the audience." >&2
  exit 2
}

deprecated_load() {
  echo "agent-handoff: 'load' is DEPRECATED in favor of 'resume'." >&2
  echo >&2
  echo "  Old: scripts/agent-handoff.sh load [target]" >&2
  echo "  New: scripts/agent-handoff.sh resume" >&2
  exit 2
}

cmd="${1:-}"
case "$cmd" in
  status)            print_status ;;
  checkpoint)        shift; write_checkpoint "$@" ;;
  resume)            print_resume ;;
  save)              deprecated_save ;;
  load)              deprecated_load ;;
  -h|--help|help|"") usage ;;
  *)
    echo "agent-handoff: unknown command '$cmd'" >&2
    usage >&2
    exit 2
    ;;
esac
