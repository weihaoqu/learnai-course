# /checkpoint

Write a checkpoint entry to `progress.md` so the next session (Codex or Claude Code) can resume cleanly.

## When to use

- Before stopping work for the day.
- Before switching to the other agent.
- After completing a meaningful milestone.

## Steps

1. Decide what the entry should cover:
   - What changed this session (1-3 bullets).
   - What's next.
   - Off-limits files or anything the next session must not touch.
   - Server status, push status.
2. Run (Claude Code is the writer here):

   ```bash
   scripts/agent-handoff.sh checkpoint claude --stdin <<'EOF'
   <your summary here, markdown allowed>
   EOF
   ```

3. Report the new entry path to Q. Stop unless Q asks for more work.

## Notes

- This appends to `progress.md` at repo root (tracked). The next session reads only the top entry.
- It does NOT commit, push, or change git state. Q decides whether `progress.md` ships in the next commit.
- The `<agent>` argument is who YOU are, not the audience. From Codex, use `checkpoint codex`.
