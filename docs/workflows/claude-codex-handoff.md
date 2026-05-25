# Claude <-> Codex Handoff Workflow

Use this when Q alternates between Claude Code and Codex on the same project. Goal: both agents see the same state; neither overwrites the other; only the session Q explicitly authorizes may push.

## Core Rule

Treat Git state as the shared source of truth. Treat the top entry of `progress.md` as the live handoff. `CLAUDE.md` holds standing project guidance; `AGENTS.md` holds standing agent rules. Neither holds live state.

Before any handoff, the **outgoing** agent runs:

```bash
scripts/agent-handoff.sh checkpoint <self> --stdin <<'EOF'
<summary>
EOF
```

and records in the summary:

- Branch, HEAD, ahead/behind upstream (the script captures these automatically too).
- Files intentionally changed this session.
- Files/directories that are off-limits.
- Verification already run.
- Whether any local server is running.
- Who, if anyone, is explicitly allowed to push.
- What the next session should do first.

The **incoming** agent runs:

```bash
scripts/agent-handoff.sh resume
```

and then:

1. Reads the printed top entry.
2. Reads `CLAUDE.md` and `AGENTS.md`.
3. Confirms `git status` and `git rev-parse HEAD` match the entry. If not, flags the conflict to Q before editing.

## Universal Work Rules

When any agent picks up the project:

1. Inspect `git status --short --branch` before editing.
2. Read `CLAUDE.md`, `AGENTS.md`, and the top of `progress.md`.
3. Protect prior work. Do not reset, checkout, revert, or overwrite files unless Q explicitly asks.
4. Keep commits scoped. Stage only intentional files.
5. Verify with project-appropriate checks before calling work done.
6. Send plans, diffs, and final reports through the Codex review gate when required by project rules.
7. Do not push unless Q explicitly says this session should push.

## Push Rule

Pushing is externally visible. Only the session Q explicitly authorizes should push.

If Q says another session will push:

- Prepare the handoff via `checkpoint`.
- Do not push from the current session.
- Do not imply push approval for future sessions beyond Q's exact instruction.

## Commit Rule

Committing is local but still changes project history.

Before committing:

1. Run `git status --short`.
2. Stage only intended files. `progress.md` may be staged alongside the work it describes, or left for Q.
3. Use `git diff --cached --stat` to confirm scope.
4. Commit with an imperative message.
5. Report the commit hash.

Do not include scratch files, generated browser state, or unrelated untracked assets unless Q explicitly wants them committed.

## When `progress.md` Conflicts with Current State

If the top entry's HEAD differs from `git rev-parse HEAD`, someone committed without checkpointing. Do NOT silently update `progress.md`. Instead:

1. Tell Q both HEADs and the gap.
2. Ask whether to (a) write a fresh checkpoint now to catch up, or (b) investigate before adding entries.

## Quick Checklist

Before handing off:

- [ ] `git status --short` checked.
- [ ] `scripts/agent-handoff.sh checkpoint <self> ...` run.
- [ ] Off-limits files listed in the entry.
- [ ] Server status recorded.
- [ ] Verification recorded.
- [ ] Push permission explicit.
- [ ] Final message to Q says what was committed, what stayed local, and what remains unpushed.

After picking up:

- [ ] `scripts/agent-handoff.sh resume` run.
- [ ] Top entry's HEAD matches current HEAD (or conflict flagged to Q).
- [ ] State summarized in ≤6 bullets back to Q.
