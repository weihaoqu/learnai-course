# Ops Fallback Checklist — Facilitator Only

> **Use:** Pre-session readiness + in-session failure recovery. Print and bring.

---

## T-7 days

- [ ] **AC13 — IRB consult.** Confirm with Monmouth IRB office that the in-memory count-only treatment of student approvals (S15 scoreboard) fits within protocol FA 2562. If `:names on` mode will be used, file a protocol amendment. (Plan completion does NOT block on this; session day DOES.)

## T-24 hours

- [ ] **AC8b — HH216 projector dry-run (REQUIRED before session day).**
      Bring laptop, drive to HH216, connect to projector, run through all 30 slides.
      Walk to the back row. Confirm every headline and primary list item reads.
      Fix any unreadable slide on the spot via a follow-up commit (font-bump).
      Per spec §10 AC8b, this is a Q-only step and is not part of plan completion,
      but the deck is NOT ready to project until this is done.

- [ ] Parent email reminder sent (parent-email-template.md text + starter.html link)
- [ ] Setup guide link verified live on the web app
- [ ] Charging reminder included in parent email
- [ ] Wi-Fi credentials confirmed for HH216

## T-1 hour

- [ ] Projector test from Q's laptop
- [ ] Network test (open weihaoqu.github.io/learnai-course/ on Q's laptop)
- [ ] Claude CLI test on Q's laptop: `claude --version` succeeds
- [ ] Pre-test, consent, post-test URLs all open
- [ ] QR codes scan correctly with a phone

## T-15 minutes

- [ ] **Serve `session-slides.html` via `python -m http.server`** — NOT `file://`. The Clipboard API for click-to-copy `.copy-block` elements requires a secure context. `file://` will silently fail copy attempts.
- [ ] `session-slides.html` open in browser, fullscreened (`F`)
- [ ] `starter.html` in same folder as a fallback (see § Fallbacks)
- [ ] Printed copies stacked: IRB-non-consent-runbook, this checklist
- [ ] Sticky notes + markers on each desk

---

## Live-session facilitator keys

| Key | What it does |
|-----|--------------|
| `←` / `→` | Navigate slides |
| `I` | Toggle ink-wash theme |
| `F` | Fullscreen |
| `S` | Reveal steps (where applicable) |
| `R` | S7: increment render counter (clamps at 5) |
| `T` | S7: start 10-min countdown timer |
| `A` | S15: increment plan-check approval count |
| `:names on` Enter | S15: enable named-mode scoreboard (shows nicknames) — IRB caveat |
| `:names off` Enter | S15: revert to count-only |
| `:clear` Enter | Reset ALL live-moment state (counter, scoreboard, timer) |

---

## In-session failure modes

### Claude login fails for a student
1. Have student check their Pro subscription is active (browser → claude.ai → log in)
2. If still failing: pair them with a student whose Claude works
3. They co-drive — both learn, only one machine builds

### Quota hit (Claude says "limit reached")
1. Switch the student to claude.ai chat in the browser (no Claude Code)
2. They paste the same prompts; build is HTML-only so it works there
3. After session, log incident for usage planning

### Network down
1. Open `starter.html` (the prebuilt fallback) on every student machine
2. Skip Phase 3 Quick Win
3. Have students edit `starter.html` by hand: change nickname, sentence, color, vibe
4. Run the full session offline — focus on the planning skill and the agent fundamentals
5. Skip Phase 4 DECODE specifics tied to live Claude run; pivot to "what Claude WOULD have done"

### Claude proposes a package install ("npm install …" or similar)
1. **DECLINE** — never install during session
2. Tell Claude: "no installs, plain HTML/CSS only"
3. If Claude insists, switch that student to the browser chat path

### File written to wrong place
1. Have the student find the file with `ls` from their terminal
2. Move it: `mv path/to/file ~/Desktop/`
3. Reopen in browser

---

## Local-file-only success path

For every student, the success criterion is:
1. **Create** a local HTML file with Claude's help
2. **Open** it in their default browser
3. **Fix** at least one thing in iteration
4. **Save** the file to their Desktop or Documents
5. **Never publish** — this is a learning artifact, not a deployment

If a student asks to put their site online: "Awesome — let's talk about that after the session. Email me."

---

## No-surprise-installs rule

The only commands students should run today:
- `claude` (start Claude Code)
- `/clear` (reset conversation)
- `/codex review` (Phase 7)
- Editor commands inside Claude (handled by the agent)

Anything else, especially `npm install`, `brew install`, `pip install`, or `git clone` of unknown repos: **decline**.

---

## Live-moment social-risk reminders (S15 scoreboard, S22 fumble award)

- **Scoreboard default is count-only.** Never type `:names on` without IRB clearance (see T-7d).
- **A laggard student feels exposed at "3 / 5" with 2 min on the clock.** Increment manually; pause when anyone is visibly stuck.
- **Fumble award (S22) is verbal-only.** Never display the winner's nickname on screen. Pre-decide: funniest *bug narrative*, not most embarrassed *student*. If no clear winner, SKIP the award entirely.

---

## Fallbacks bundled

- `starter.html` (this folder) — static HTML page that mimics Phase 3 Quick Win output. Open and edit by hand if Claude is unreachable.
- Existing PDFs in this folder (Homework, Cheatsheet, Parent guide) work fully offline.
