#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  scripts/agent-handoff.sh status
  scripts/agent-handoff.sh save codex
  scripts/agent-handoff.sh save claude
  scripts/agent-handoff.sh load [codex|claude]

This script writes handoff notes only. It never commits, pushes, resets,
cleans, checks out, or switches branches.
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

PROJECT_NAME="$(basename "$ROOT")"
SESSION_DIR=".omc/state/sessions"
DATE="$(date +%F)"
TIME_SLUG="$(date +%H%M%S)"
TIMESTAMP="$(date '+%Y-%m-%d %H:%M:%S %Z')"

current_branch() {
  local branch
  branch="$(git branch --show-current 2>/dev/null || true)"
  if [[ -n "$branch" ]]; then
    echo "$branch"
  else
    git rev-parse --short HEAD
  fi
}

head_hash() {
  git rev-parse HEAD
}

head_subject() {
  git log -1 --format=%s
}

upstream_ref() {
  git rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>/dev/null || true
}

ahead_behind() {
  local upstream="$1"
  if [[ -z "$upstream" ]]; then
    echo "no upstream"
    return
  fi
  local counts
  counts="$(git rev-list --left-right --count "$upstream"...HEAD 2>/dev/null || true)"
  if [[ -z "$counts" ]]; then
    echo "upstream unavailable"
    return
  fi
  local behind ahead
  behind="${counts%%[[:space:]]*}"
  ahead="${counts##*[[:space:]]}"
  echo "ahead ${ahead}, behind ${behind}"
}

tracked_dirty() {
  git status --short --untracked-files=no
}

full_status() {
  git status --short
}

latest_session_memory() {
  if [[ ! -d "$SESSION_DIR" ]]; then
    echo "(none)"
    return
  fi
  ls -t "$SESSION_DIR"/session_*.md 2>/dev/null | grep -v '_resume_in_' | head -1 || true
}

latest_resume_handoff() {
  if [[ ! -d "$SESSION_DIR" ]]; then
    echo ""
    return
  fi
  local raw_target="${1:-}"
  if [[ -n "$raw_target" ]]; then
    local slug
    slug="$(target_slug "$raw_target")"
    ls -t "$SESSION_DIR"/session_*_resume_in_"$slug".md 2>/dev/null | head -1 || true
    return
  fi
  ls -t "$SESSION_DIR"/session_*_resume_in_*.md 2>/dev/null | head -1 || true
}

print_status() {
  local branch upstream hash subject latest
  branch="$(current_branch)"
  upstream="$(upstream_ref)"
  hash="$(head_hash)"
  subject="$(head_subject)"
  latest="$(latest_session_memory)"

  echo "# Agent Handoff Status"
  echo
  echo "- Project: ${PROJECT_NAME}"
  echo "- Repo: ${ROOT}"
  echo "- Time: ${TIMESTAMP}"
  echo "- Branch: ${branch}"
  echo "- HEAD: ${hash}"
  echo "- Commit: ${subject}"
  echo "- Upstream: ${upstream:-"(none)"}"
  echo "- Ahead/behind: $(ahead_behind "$upstream")"
  echo "- Latest session memory: ${latest:-"(none)"}"
  echo
  echo "## Dirty Tracked Files"
  local dirty
  dirty="$(tracked_dirty)"
  if [[ -n "$dirty" ]]; then
    echo "$dirty"
  else
    echo "(none)"
  fi
  echo
  echo "## Full Short Status"
  local status
  status="$(full_status)"
  if [[ -n "$status" ]]; then
    echo "$status"
  else
    echo "(clean)"
  fi
}

target_slug() {
  case "${1:-}" in
    codex) echo "codex" ;;
    claude|claude-code|claude_code) echo "claude_code" ;;
    *)
      echo "agent-handoff: expected target 'codex' or 'claude'" >&2
      exit 2
      ;;
  esac
}

target_label() {
  case "$1" in
    codex) echo "Codex" ;;
    claude_code) echo "Claude Code" ;;
  esac
}

next_command() {
  case "$1" in
    codex)
      echo "cd \"$ROOT\" && codex \"Read /tmp/learnai_resume_in_codex_latest.md and resume.\""
      ;;
    claude_code)
      echo "cd \"$ROOT\" && claude"
      echo "# In Claude Code, run: /resume-in-claude-code"
      ;;
  esac
}

write_handoff() {
  local raw_target="$1"
  local slug label branch upstream hash subject latest status dirty out tmp tmp_build
  umask 077
  slug="$(target_slug "$raw_target")"
  label="$(target_label "$slug")"
  branch="$(current_branch)"
  upstream="$(upstream_ref)"
  hash="$(head_hash)"
  subject="$(head_subject)"
  latest="$(latest_session_memory)"
  dirty="$(tracked_dirty)"
  status="$(full_status)"

  mkdir -p "$SESSION_DIR"
  out="${SESSION_DIR}/session_${DATE}_${TIME_SLUG}_resume_in_${slug}.md"
  tmp="/tmp/learnai_resume_in_${slug}_latest.md"

  {
    echo "# Resume in ${label} - ${DATE}"
    echo
    echo "Generated: ${TIMESTAMP}"
    echo
    echo "## Target Agent"
    echo
    echo "${label}"
    echo
    echo "## Current Git State"
    echo
    echo "- Project: ${PROJECT_NAME}"
    echo "- Repo: ${ROOT}"
    echo "- Branch: ${branch}"
    echo "- HEAD: ${hash}"
    echo "- Commit: ${subject}"
    echo "- Upstream: ${upstream:-"(none)"}"
    echo "- Ahead/behind: $(ahead_behind "$upstream")"
    echo
    echo "## Dirty Tracked Files"
    echo
    if [[ -n "$dirty" ]]; then
      echo '```text'
      echo "$dirty"
      echo '```'
    else
      echo "(none)"
    fi
    echo
    echo "## Full Short Status"
    echo
    if [[ -n "$status" ]]; then
      echo '```text'
      echo "$status"
      echo '```'
    else
      echo "(clean)"
    fi
    echo
    echo "## Latest Session Memory"
    echo
    echo "${latest:-"(none)"}"
    echo
    echo "## Context Excerpt From Latest Session Memory"
    echo
    if [[ -n "$latest" && "$latest" != "(none)" && -f "$latest" ]]; then
      echo '```markdown'
      sed -n '1,160p' "$latest"
      echo '```'
    else
      echo "(none)"
    fi
    echo
    echo "## Required Local Context"
    echo
    echo "- Read \`CLAUDE.md\` if present, but treat this handoff and current Git state as the latest session state."
    echo "- Read \`docs/workflows/claude-codex-handoff.md\` if present."
    echo "- Leave unrelated untracked/local files alone unless Q explicitly asks."
    echo "- Do not push, reset, clean, or force-update unless Q explicitly approves."
    echo
    echo "## Open Questions / Blockers"
    echo
    echo "- Ask Q for the next objective before editing unless the current chat gives one."
    echo "- Decide whether to commit the handoff tooling after Q reviews it."
    echo
    echo "## Exact Next Command"
    echo
    echo '```bash'
    next_command "$slug"
    echo '```'
  } > "$out"

  tmp_build="$(mktemp "/tmp/learnai_resume_in_${slug}_latest.XXXXXX")"
  cp "$out" "$tmp_build"
  chmod 600 "$out" "$tmp_build"
  if [[ -d "$tmp" ]]; then
    echo "agent-handoff: refusing to replace directory '$tmp'" >&2
    rm -f "$tmp_build"
    exit 1
  fi
  mv -f "$tmp_build" "$tmp"
  if [[ -L "$tmp" || ! -f "$tmp" ]]; then
    echo "agent-handoff: expected regular file at '$tmp'" >&2
    exit 1
  fi
  chmod 600 "$tmp"
  echo "Wrote project handoff: $out"
  echo "Wrote temp handoff: $tmp"
  echo "Next command:"
  next_command "$slug"
}

load_handoff() {
  local raw_target="${1:-}"
  local handoff
  handoff="$(latest_resume_handoff "$raw_target")"
  print_status
  echo
  echo "# Latest Resume Handoff"
  echo
  if [[ -n "$handoff" && -f "$handoff" ]]; then
    echo "Path: $handoff"
    echo
    cat "$handoff"
  else
    echo "(none found)"
  fi
}

cmd="${1:-}"
case "$cmd" in
  status)
    print_status
    ;;
  save)
    write_handoff "${2:-}"
    ;;
  load)
    load_handoff "${2:-}"
    ;;
  -h|--help|help|"")
    usage
    ;;
  *)
    echo "agent-handoff: unknown command '$cmd'" >&2
    usage >&2
    exit 2
    ;;
esac
