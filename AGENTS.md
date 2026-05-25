# LearnAI Agent Handoff

- Call the user **Q**.
- Read `CLAUDE.md` first if present. If `CLAUDE.md` conflicts with current Git state or a freshly generated handoff, surface the conflict before editing.
- Treat Git state as the source of truth: start with `git status --short --branch` and `git log -1 --oneline --decorate`.
- Do not push, reset, clean, force-update, or overwrite another agent's work unless Q explicitly approves.
- Do not modify consent/assent text without Q's explicit approval.
- Before reporting completed work, run the Codex review gate when available. If it fails or is unavailable, report that explicitly.

## Resume Triggers

When Q says **resume in codex**:

1. Run `scripts/agent-handoff.sh load codex`.
2. Read the latest handoff it prints.
3. Continue from that state, protecting unrelated untracked/local files.

When Q says **resume in claude code**:

1. Run `scripts/agent-handoff.sh save claude`.
2. Report the project handoff path and `/tmp` handoff path.
3. Stop unless Q asks for more work.

In Claude Code, the project slash command `/resume-in-claude-code` means "load the latest Claude Code handoff and continue here." In Codex, the text trigger "resume in claude code" means "save a Claude Code handoff for Q and stop."

When Q says **save context**, **next session**, **pick up later**, or similar:

1. Run `scripts/agent-handoff.sh save codex` if the next agent is unknown or Codex is likely.
2. Run `scripts/agent-handoff.sh save claude` if Q specifically says Claude Code is next.
3. Report the generated path(s).

## Shared Workflow

- Reusable policy: `docs/workflows/claude-codex-handoff.md`.
- Durable local session notes: `.omc/state/sessions/session_*.md` (local/gitignored).
- Claude Code commands:
  - `/resume-in-codex`
  - `/resume-in-claude-code`
