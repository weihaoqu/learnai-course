# /resume-in-codex

> **DEPRECATED**: prefer `/checkpoint` (then tell Q to run Codex). Kept for muscle memory; forwards to the new flow.

Prepare the current project state for Codex to resume.

## Steps

1. Write a checkpoint to `progress.md` (Claude Code is the writer):

   ```bash
   scripts/agent-handoff.sh checkpoint claude --stdin <<'EOF'
   <summary of session, what to do next, off-limits files>
   EOF
   ```

2. Tell Q exactly:

   ```
   Codex can resume by running:
       cd "<repo>" && codex "Run /resume and continue."
   ```

3. Stop unless Q asks for more work.
