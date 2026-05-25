# /resume-in-claude-code

Load the latest project handoff and continue in Claude Code.

## Steps

1. Run:

```bash
scripts/agent-handoff.sh load claude
```

2. Read the printed handoff, `CLAUDE.md` if present, and `docs/workflows/claude-codex-handoff.md` if present.
3. Summarize the current state in six bullets or fewer.
4. Ask Q for the next objective unless the handoff already contains an explicit objective.
5. Do not commit, push, reset, clean, or switch branches unless Q explicitly asks.
