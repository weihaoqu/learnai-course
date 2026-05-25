# Claude <-> Codex Handoff Workflow

Use this when Q works in Claude Code, switches to Codex for review/editing/verification, then syncs the result back to a Claude Code session.

The goal is simple: both agents know the current state, neither overwrites the other, and only the session Q explicitly authorizes may push.

## When To Use

- Q has one Claude Code session and one Codex session on the same project.
- One agent has made or reviewed changes that the other session must know about.
- Work may be committed locally before another session pushes.
- The worktree has unrelated untracked or dirty files that must not be swept into a commit.

## Core Rule

Treat Git state as the shared source of truth, and treat `CLAUDE.md` as the live human-readable handoff for Claude Code.

Before any handoff, record:

- Branch name.
- Current commit hash and commit message.
- Files intentionally changed.
- Files/directories that are unrelated and must be left alone.
- Verification already run.
- Whether any local server is running.
- Who, if anyone, is explicitly allowed to push.

## Claude Code -> Codex

Before switching from Claude Code to Codex:

1. Run `git status --short`.
2. If Q approved a commit, commit completed scoped work before handing it off.
3. If not committing, write down exactly which files are intentionally dirty.
4. Stop local dev servers unless the next session needs them.
5. Tell Codex:
   - Branch.
   - Goal.
   - Key files.
   - Current dirty/untracked files.
   - What must not be overwritten.

Example handoff:

```text
Branch: slide-redesign-2026-05
Goal: review and improve session-materials/session-slides.html
Intentional files: session-materials/session-slides.html
Do not touch: unrelated untracked files, consent text, deployment config
Server: stopped
Push: do not push
```

## Codex Work Rules

When Codex picks up a Claude Code project:

1. Inspect `git status --short` before editing.
2. Read `CLAUDE.md` and any current handoff block.
3. Protect user/Claude changes. Do not reset, checkout, revert, or overwrite files unless Q explicitly asks.
4. Keep commits scoped. Stage only intentional files.
5. Verify with the project-appropriate checks before calling work done.
6. Send plans, diffs, and final reports through the Codex review gate when required by project rules.
7. Do not push unless Q explicitly says this Codex session should push.

## Codex -> Claude Code

Before switching back to Claude Code:

1. Commit finished scoped work if Q asked for a commit.
2. Stop any local server unless Q is actively testing.
3. Update the top of `CLAUDE.md` with a current handoff block.
4. Include:
   - Branch.
   - Commit hash and message.
   - Commit scope.
   - Verification summary.
   - Server status.
   - Push permission status.
   - Files/directories the next session must not touch.
5. Tell Q whether the handoff block is committed or only local.

## Current Handoff Block Template

Paste this at the top of `CLAUDE.md`, above the stable project guidance:

```markdown
# Current Handoff — YYYY-MM-DD

Read this before pushing or editing.

- Current branch: `<branch>`
- Current committed work: `<hash> <message>`
- Commit scope: `<files>`
- Do not reset, checkout, revert, or overwrite `<protected files>` unless Q explicitly asks.
- Summary of completed work: `<short bullets>`
- Verification: `<checks run>`
- Before pushing, run `git status` and confirm `git log -1 --oneline` shows `<hash>` or a descendant that includes it.
- Push only if Q explicitly tells this session to push.
- Leave unrelated untracked files/directories alone: `<list>`.
- Local server: `<running/stopped + port>`.
```

## Push Rule

Pushing is externally visible. Only the session Q explicitly authorizes should push.

If Q says another session will push:

- Prepare the handoff.
- Do not push from the current session.
- Do not imply push approval for future sessions beyond Q's exact instruction.

## Commit Rule

Committing is local but still changes project history.

Before committing:

1. Run `git status --short`.
2. Stage only intended files.
3. Use `git diff --cached --stat` to confirm scope.
4. Commit with an imperative message.
5. Report the commit hash.

Do not include local coordination files, scratch files, generated browser state, or unrelated untracked assets unless Q explicitly wants them committed.

If `CLAUDE.md` is local/untracked in a project, edits to it are workspace coordination only until Q explicitly asks to commit it.

## Quick Checklist

Use this checklist when moving between Claude Code and Codex:

- [ ] `git status --short` checked.
- [ ] Current branch recorded.
- [ ] Current commit hash recorded.
- [ ] Intentional files listed.
- [ ] Unrelated dirty/untracked files listed as off-limits.
- [ ] Server status recorded.
- [ ] Verification recorded.
- [ ] Push permission explicit.
- [ ] `CLAUDE.md` current handoff updated.
- [ ] Final message tells Q what was committed, what stayed local, and what remains unpushed.
