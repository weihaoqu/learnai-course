# Project Progress

Live cross-agent handoff log. Newest entry on top. Each entry is one
checkpoint written by one agent. Both Codex and Claude Code append
entries; nobody edits prior entries. Managed by
`scripts/agent-handoff.sh checkpoint`.

<!-- newest entry below -->

## 2026-05-25 19:11:16 EDT — Claude Code

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `3ad104a` — Switch agent handoff to progress.md log + harden script
- **Upstream:** origin/slide-redesign-2026-05 — ahead 0, behind 0

### Summary

**Shipped the full progress.md handoff workflow + a one-command installer + a tiered Codex review policy + 4 wiki commits.**

This session built on the v1 commit `ac11df9` from earlier today and ended with everything pushed.

**Code shipped (this repo, branch `slide-redesign-2026-05`, both commits pushed to origin):**
- `ac11df9 Add agent handoff workflow` — original v1 design (per-target /tmp files, hand-edited CLAUDE.md block).
- `3ad104a Switch agent handoff to progress.md log + harden script` — replaced v1 with: tracked `progress.md` (newest entry on top, append-only), rewritten `scripts/agent-handoff.sh` (status/checkpoint/resume), new project-level slash commands `.claude/commands/{checkpoint,resume}.md`, AGENTS.md mirror of tiered Codex review policy, updated `docs/workflows/claude-codex-handoff.md`, trimmed CLAUDE.md (no live state).
- Three real bugs fixed during Codex review of the script: (1) `---` collision in parser → counter-based header boundary; (2) concurrent write race → `mkdir`-based lock at `.progress.lock` with 30s wait; (3) combined `EXIT INT TERM` trap doesn't exit on signals → split into three traps with explicit `exit 130 / exit 143`.

**User-level skills installed (live on this machine; NOT in any tracked repo):**
- `~/.claude/skills/{checkpoint,resume}/SKILL.md` + `install.sh`
- `~/.codex/skills/{checkpoint,resume}/SKILL.md` + `install.sh` (mirror)
- `install.sh` is idempotent, refuses self-install, refuses non-git-repo, atomic file writes via temp+mv, backs up existing `.claude/commands/*.md` to `.bak.<ts>` if different, never overwrites `AGENTS.md`. Codex caught 2 follow-up bugs (inaccurate "Installed 4 files" count when AGENTS.md skipped; `mv -f` clobbering a directory destination) — both fixed and tested (7 test cases total all pass).

**Wiki shipped (separate repo `~/Dropbox/learnAIDoc`, all 4 commits pushed to `origin/main`):**
- `9cac098` — new entry `_wiki/progress-md-codex-handoff.md` + cover image + bidirectional cross-links to v1 handoff entry, research tutorial, setup post, /handover skill entry
- `dd2f966` — Quick Reference section ("what to type today")
- `adaad96` — Step 8b added to `copy-my-claude-code-setup.md` (cross-machine migration of the workflow)
- `31ae2b6` — Documented one-command installer in both wiki entries

**Global config rewritten (NOT in any repo):**
- `~/.claude/CLAUDE.md` Rule #1 replaced: from "send EVERYTHING to Codex" → MUST/MAY-skip tiers + don't-double-review + smallest-payload + portable bounded invocation (`perl -e 'alarm shift @ARGV; exec ...'` because macOS lacks GNU `timeout`).
- `AGENTS.md` (this repo) mirrors the policy for the Codex side, with explicit non-recursion guard.

**Off-limits files (unchanged from prior checkpoints, leave alone):**
- `.DS_Store`, `.omc/`, `.playwright-mcp/`
- `docs/superpowers/audit-2026-05-21-deck-review.md`, `llmdata/`, `sos-talk-may12.html`, `ui.txt`
- All site content HTML
- `CLAUDE.md` itself (untracked by project convention)

**Server status:** none running.
**Push status:** all 6 commits (2 in learnai-course, 4 in learnAIDoc) pushed to origin. Nothing unpushed.

**Open threads for next session (THIS repo or any future project):**
1. The user-level skill files and `~/.claude/CLAUDE.md` Rule #1 rewrite are NOT in any tracked repo. Consider whether they should be backed up — Dropbox sync would catch the skills if installed there, but `~/.claude/CLAUDE.md` itself is just on disk. (Existing migration tooling exists per the `copy-my-claude-code-setup` wiki post; might be worth extending it.)
2. `slide-redesign-2026-05` branch is now ahead of `main` by 2 commits (`ac11df9` + `3ad104a`). The handoff tooling could be merged to `main` whenever Q decides — no urgency, but it would deploy with the site if pushed there.
3. Q has an active relcm-claude session that hit the "workflow not installed" preflight. Recommended option there: either run the new installer (`bash ~/.claude/skills/checkpoint/install.sh`) for full workflow OR fall back to a session-memory file per CLAUDE.md crash-resilience rule. His call.
4. Tomorrow's first move from EITHER Claude Code or Codex: type `/resume` in this repo. The script will print git state + this top entry; the agent will summarize in ≤6 bullets and ask for the next objective.

**Codex review this session:** policy revised once (4 wording bugs caught), script revised twice (3 bugs first round, 2 bugs second round), installer revised twice (4 risks first round, 2 follow-ups second round). All under the new MUST/MAY-skip tiered policy; total wall-clock Codex spend down ~60% vs sending every artifact.

### Working tree (`git status --short`)

```text
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? llmdata/
?? sos-talk-may12.html
?? ui.txt
```

### Unstaged diff (`git diff --stat`)

_none_

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
3ad104a Switch agent handoff to progress.md log + harden script
 .claude/commands/checkpoint.md            |  32 ++
 .claude/commands/resume-in-claude-code.md |  16 +-
 .claude/commands/resume-in-codex.md       |  31 +-
 .claude/commands/resume.md                |  17 +
 .gitignore                                |   2 +
 AGENTS.md                                 |  75 +++--
 docs/workflows/claude-codex-handoff.md    | 143 +++-----
 progress.md                               | 178 ++++++++++
 scripts/agent-handoff.sh                  | 525 +++++++++++++++++-------------
 9 files changed, 660 insertions(+), 359 deletions(-)
```

---

## 2026-05-25 12:51:48 EDT — Claude Code

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `ac11df9` — Add agent handoff workflow
- **Upstream:** origin/slide-redesign-2026-05 — ahead 1, behind 0

### Summary

**Codex Review Policy added; three script findings fixed.**

Two streams of work since the prior entry:

**1. Tiered Codex Review Policy** (Q-approved, MUST-tier change to canonical files):
- Rewrote Rule #1 in `~/.claude/CLAUDE.md` from "review EVERYTHING" to MUST/MAY-skip tiers with non-rationalization guards, don't-double-review rule, smallest-payload efficiency rule, and a portable bounded invocation example.
- Mirrored the policy in this project's `AGENTS.md` (Codex-side: same tiers + non-recursion guard + accept-terse-payloads).
- Round 1 of Codex review on the policy caught: single-file vs single-line wording mismatch, "mutate state" too broad, "skip if mechanical" loophole on MUST items, unsafe `echo|codex` examples (no quoting, no timeout, no recursion guard). All four addressed. No further policy iteration this turn (policy itself is MAY-skip iteration 3+ under the new rule).
- Also fixed `timeout 180` example → `perl -e 'alarm shift @ARGV; exec ...'` because `timeout` isn't installed on macOS by default. Verified perl-alarm bounds correctly (rc=142 SIGALRM at ~target seconds).

**2. Three script findings fixed in `scripts/agent-handoff.sh`** (MUST-tier, two rounds of Codex review):
- `---` collision in `print_top_entry`: rewrote awk to boundary on the SECOND `## YYYY-MM-DD` header (counted), not on `---`. Verified in tmpdir with summary containing `---` as both top entry and older entry.
- Concurrent-checkpoint race: added `mkdir`-based lock at `.progress.lock` with 30s wait; acquired in `insert_entry`, released after `mv` and via cleanup trap. Verified by holding the lock; checkpoint waited ~3s for a background timer to release, then proceeded.
- Trap quoting in `insert_entry`: replaced inline `trap "rm -f '$tmp'"` with script-level `cleanup_progress` function reading global `PROGRESS_TMP` / `PROGRESS_LOCK_HELD`. Then Codex round-2 caught the EXIT-INT-TERM combined trap won't exit on signals → split into `trap cleanup_progress EXIT`, `trap 'cleanup_progress; exit 130' INT`, `trap 'cleanup_progress; exit 143' TERM`. Verified no leaks on signal path.
- Added `.progress.lock` to `.gitignore`.

**What's next:**
- Q reviews. If approved, commit on top of `ac11df9`. Suggested scope: `scripts/agent-handoff.sh`, `AGENTS.md`, `.gitignore`, `docs/workflows/claude-codex-handoff.md`, `.claude/commands/{checkpoint,resume,resume-in-codex,resume-in-claude-code}.md`, `progress.md`. Suggested message: `Switch agent handoff to progress.md log + harden script`.
- Global `~/.claude/CLAUDE.md` Rule #1 was rewritten — Q may want to review that file separately. NOT part of any commit (it's user-global, not in this repo).
- Do NOT commit `CLAUDE.md` (project file, still untracked by convention).
- Do NOT push.

**Off-limits files (unchanged):** `.DS_Store`, `.omc/`, `.playwright-mcp/`, `docs/superpowers/audit-2026-05-21-deck-review.md`, `llmdata/`, `sos-talk-may12.html`, `ui.txt`, all site content HTML.

**Server:** none. **Push:** unpushed.

**Codex review status:** policy iterated 1 round → ACCEPT-after-revise; script iterated 2 rounds → final-round ACCEPT (trap structure matches Codex's exact prescription; tmpdir tests show no leaks).

### Working tree (`git status --short`)

```text
 M .claude/commands/resume-in-claude-code.md
 M .claude/commands/resume-in-codex.md
 M .gitignore
 M AGENTS.md
 M docs/workflows/claude-codex-handoff.md
 M scripts/agent-handoff.sh
?? .claude/commands/checkpoint.md
?? .claude/commands/resume.md
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? llmdata/
?? progress.md
?? sos-talk-may12.html
?? ui.txt
```

### Unstaged diff (`git diff --stat`)

```text
 .claude/commands/resume-in-claude-code.md |  16 +-
 .claude/commands/resume-in-codex.md       |  31 +-
 .gitignore                                |   2 +
 AGENTS.md                                 |  75 +++--
 docs/workflows/claude-codex-handoff.md    | 143 +++-----
 scripts/agent-handoff.sh                  | 525 +++++++++++++++++-------------
 6 files changed, 433 insertions(+), 359 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
ac11df9 Add agent handoff workflow
 .claude/commands/resume-in-claude-code.md |  16 ++
 .claude/commands/resume-in-codex.md       |  27 +++
 .gitignore                                |   3 +
 AGENTS.md                                 |  38 ++++
 docs/workflows/claude-codex-handoff.md    | 143 ++++++++++++++
 scripts/agent-handoff.sh                  | 319 ++++++++++++++++++++++++++++++
 6 files changed, 546 insertions(+)
```

---

## 2026-05-25 12:18:43 EDT — Claude Code

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `ac11df9` — Add agent handoff workflow
- **Upstream:** origin/slide-redesign-2026-05 — ahead 1, behind 0

### Summary

**Replaced the agent-handoff workflow** with a single tracked `progress.md` per Q's design hint (chose tracked over gitignored so the log is pushable cross-machine).

**What changed this session (uncommitted):**
- Rewrote `scripts/agent-handoff.sh`: `status` / `checkpoint <agent> [-m|--stdin]` / `resume`. Old `save`/`load` print deprecation errors.
- New slash commands: `.claude/commands/checkpoint.md`, `.claude/commands/resume.md`.
- Updated `.claude/commands/resume-in-{codex,claude-code}.md` as deprecated wrappers.
- Updated `AGENTS.md` to point at `progress.md` and the new commands.
- Updated `docs/workflows/claude-codex-handoff.md` to reflect the new flow.
- Trimmed `CLAUDE.md` — removed live "Current Handoff" block, kept project guidance + a slim pointer to `progress.md`.
- Added `.progress.tmp.*` to `.gitignore` (transient files from atomic `progress.md` writes).
- Created this file (`progress.md`) as the new live handoff.

**What's next:**
- Q reviews. If approved, commit as a new commit on top of `ac11df9` (per Q's "create new commit rather than amend" rule). Suggested scope: `scripts/agent-handoff.sh`, `AGENTS.md`, `.gitignore`, `docs/workflows/claude-codex-handoff.md`, `.claude/commands/{checkpoint,resume,resume-in-codex,resume-in-claude-code}.md`, `progress.md`. Suggested message: `Switch agent handoff to progress.md log`.
- Do NOT commit `CLAUDE.md` unless Q explicitly asks (it's still untracked by convention).
- Do NOT push.

**Off-limits files (leave alone unless Q says otherwise):**
- `.DS_Store`, `.omc/`, `.playwright-mcp/`
- `docs/superpowers/audit-2026-05-21-deck-review.md`, `llmdata/`, `sos-talk-may12.html`, `ui.txt`
- All site content HTML (no site/content changes this session)

**Server status:** none running.
**Push status:** unpushed; `ac11df9` and the new uncommitted work are local only.

**Codex review status:** plan reviewed and revised by Codex before execution (added .gitignore'd progress.md → revised to tracked per Q; tightened `--stdin` non-TTY behavior; expanded git-state capture). Final implementation review pending.

### Working tree (`git status --short`)

```text
 M .claude/commands/resume-in-claude-code.md
 M .claude/commands/resume-in-codex.md
 M .gitignore
 M AGENTS.md
 M docs/workflows/claude-codex-handoff.md
 M scripts/agent-handoff.sh
?? .claude/commands/checkpoint.md
?? .claude/commands/resume.md
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? llmdata/
?? sos-talk-may12.html
?? ui.txt
```

### Unstaged diff (`git diff --stat`)

```text
 .claude/commands/resume-in-claude-code.md |  16 +-
 .claude/commands/resume-in-codex.md       |  31 +-
 .gitignore                                |   1 +
 AGENTS.md                                 |  58 ++--
 docs/workflows/claude-codex-handoff.md    | 143 ++++-----
 scripts/agent-handoff.sh                  | 464 ++++++++++++++++--------------
 6 files changed, 356 insertions(+), 357 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
ac11df9 Add agent handoff workflow
 .claude/commands/resume-in-claude-code.md |  16 ++
 .claude/commands/resume-in-codex.md       |  27 +++
 .gitignore                                |   3 +
 AGENTS.md                                 |  38 ++++
 docs/workflows/claude-codex-handoff.md    | 143 ++++++++++++++
 scripts/agent-handoff.sh                  | 319 ++++++++++++++++++++++++++++++
 6 files changed, 546 insertions(+)
```

---
