# /resume-in-codex

Prepare the current project state for Codex to resume.

## Steps

1. Run:

```bash
scripts/agent-handoff.sh save codex
```

2. Report both generated handoff paths.
3. Report the exact Codex command printed by the script.
4. Do not commit, push, reset, clean, or switch branches unless Q explicitly asks.

## Output Shape

```text
Codex handoff ready.

Project handoff: <path>
Temp handoff: <path>

Next Codex command:
<command>
```
