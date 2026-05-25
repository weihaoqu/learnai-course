# /resume

Pick up where the last session left off.

## Steps

1. Run:

   ```bash
   scripts/agent-handoff.sh resume
   ```

2. Read `CLAUDE.md` (project guidance) and `AGENTS.md` (agent rules) if present.
3. Summarize the current state in ≤6 bullets, covering: branch, HEAD, working-tree cleanliness, what the last entry said was next, and any off-limits files.
4. Flag any conflict (e.g., top entry's HEAD ≠ current HEAD).
5. Ask Q for the next objective unless the entry already specifies one.
6. Do not commit, push, reset, clean, or switch branches unless Q explicitly asks.
