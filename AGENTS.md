# LearnAI Agent Handoff

- Call the user **Q**.
- Read `CLAUDE.md` first (standing project guidance).
- Read the top of `progress.md` next — it is the live cross-agent handoff log.
- Treat Git state as the source of truth. Start with `git status --short --branch` and `git log -1 --oneline --decorate`. If `progress.md`'s top entry disagrees with current Git state, flag the conflict to Q before editing.
- Do not push, reset, clean, force-update, or overwrite another agent's work unless Q explicitly approves.
- Do not modify consent/assent text without Q's explicit approval.
- Before reporting completed work, apply the Codex Review Policy below (tiered). If the review fails or is unavailable, report that explicitly.

## Resume Triggers

When Q says **resume**, **pick up where we left off**, **continue**, or runs `/resume`:

1. Run `scripts/agent-handoff.sh resume`.
2. Read the printed top entry plus `CLAUDE.md`.
3. Continue from that state, protecting unrelated local/ignored files.

When Q says **save context**, **next session**, **pick up later**, **checkpoint**, or runs `/checkpoint`:

1. Decide on a short summary: what changed, what's next, off-limits files, server/push status.
2. Run (the agent argument is who YOU are, not the audience):

   ```bash
   scripts/agent-handoff.sh checkpoint <your-agent> --stdin <<'EOF'
   <summary>
   EOF
   ```

3. Report the path printed by the script. Stop unless Q asks for more work.

### Deprecated triggers (still recognized)

When Q says **resume in codex**:

1. Run `scripts/agent-handoff.sh checkpoint claude --stdin <<...>>` describing where to pick up.
2. Tell Q: `Codex can resume by running: cd <repo> && codex "Run /resume and continue."`
3. Stop unless Q asks for more work.

When Q says **resume in claude code**:

1. Run `scripts/agent-handoff.sh checkpoint codex --stdin <<...>>` describing where to pick up.
2. Tell Q: `Claude Code can resume by running /resume in the project.`
3. Stop unless Q asks for more work.

## Files

- `progress.md` — live cross-agent log (tracked, newest entry on top). Read only the top entry on resume.
- `scripts/agent-handoff.sh` — `status` / `checkpoint` / `resume`. Read-only on git; writes only to `progress.md`.
- `docs/workflows/claude-codex-handoff.md` — reusable policy.
- `.claude/commands/checkpoint.md` and `.claude/commands/resume.md` — Claude Code project slash commands.
- `.claude/commands/resume-in-codex.md` and `.claude/commands/resume-in-claude-code.md` — deprecated wrappers.

## Codex Review Policy

Mirror of `~/.claude/CLAUDE.md` Rule #1. Applies whether you are executing work or reviewing Claude Code's payload.

**When you (Codex) are executing work:**

- **MUST review (no skip)**: commits/pushes/deploys; scripts that write files outside scratch dirs (`/tmp`, `$TMPDIR`), mutate shared/persistent state, take untrusted input, or run with elevated privileges; security-sensitive changes; canonical files (`CLAUDE.md` / `AGENTS.md` / `progress.md` / workflow docs); multi-step plans (>2 files OR >50 lines OR new architecture).
- **MAY skip (announce it)**: single-line edits, read-only outputs, discussion, 3+ iterations on the same artifact after Q approved direction. Say *"Skipping Codex review — <reason>"* so Q can override.
- **Diff-only is still review**: for MUST items, if the plan was already reviewed, send the diff. **Never fully skip a MUST-tier item**, even if it "feels mechanical."
- **Smallest payload wins**: prefer `git diff` over whole files.

**When Claude Code sends you a payload to review:**

- Accept terse payloads. A `git diff` is sufficient for code review; bullet points are sufficient for plan review. Don't demand the whole repo when the diff is enough.
- One revision round per artifact unless Q says otherwise.
- **Non-recursion**: do NOT invoke Codex on your own review output. Do NOT run any `codex exec` / `codex:rescue` / nested-codex command from within an active review. Q's tooling treats nested reviews as bugs.

## Anti-patterns

- Do not edit prior entries in `progress.md`. Append a new one with corrections.
- Do not run `checkpoint codex` from Claude Code (or vice versa) — the agent label identifies the writer, not the audience.
- Do not assume `progress.md`'s top entry reflects current HEAD unless the entry's HEAD matches `git rev-parse HEAD`. Run `checkpoint` after every commit.
