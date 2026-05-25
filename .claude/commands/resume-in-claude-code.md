# /resume-in-claude-code

> **DEPRECATED**: prefer `/resume`. Kept for muscle memory; forwards to the new flow.

Load the latest progress entry and continue in Claude Code.

## Steps

1. Run:

   ```bash
   scripts/agent-handoff.sh resume
   ```

2. Read the printed entry plus `CLAUDE.md` and `AGENTS.md` if present.
3. Summarize the current state in ≤6 bullets.
4. Ask Q for the next objective unless the entry already specifies one.
5. Do not commit, push, reset, clean, or switch branches unless Q explicitly asks.
