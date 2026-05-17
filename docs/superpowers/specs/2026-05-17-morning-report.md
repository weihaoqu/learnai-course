# Morning Report — Slide Redesign "Fancy Minimal" Pivot

**Date:** 2026-05-17, prepared overnight while Q slept
**Status:** Awaiting Q decisions on 7 Codex blockers + 6 open questions before any implementation begins
**Read time:** ~8 minutes

---

## What ran overnight

1. **5 expert reviewers dispatched in parallel:**
   - Motion designer · Typography & layout · HS dopamine · Accessibility · Brand identity
   - Each read the current `session-slides.html` + the approved spec + the approved plan + the "fancy minimal" directive
   - Reports saved to `/tmp/expert-{1..5}-*.md`
2. **Synthesis written** to `docs/superpowers/specs/2026-05-17-fancy-minimal-amendment.md` (380 lines)
3. **Codex review of synthesis:** **NOT READY** — 7 blockers identified
4. **No implementation touched.** Branch `slide-redesign-2026-05` still doesn't exist. All slides still in pre-implementation state.

---

## One-line per expert

| # | Lens | Top recommendation |
|---|------|---------------------|
| 1 | Motion designer | Staggered eyebrow → headline → support entrance + phase-color underscore. Plays once per slide, never loops. |
| 2 | Typography & layout | Switch to Inter variable optical-size axis; collapse eyebrow + accent + `<em>` into one "phase chord" color. |
| 3 | HS dopamine | S15 plan-check as a 5-name live scoreboard that auto-advances to S16 — *the* car-ride moment. |
| 4 | Accessibility | Default `--accent-violet: #8b6cf6` fails projector contrast at 0.74rem eyebrow size; promote to `#a78bfa`+. Color-only encoding on S5 fails CVD. |
| 5 | Brand & identity | Echo `index.html`'s orbital ring as a 28px corner glyph that rotates one notch per phase — the deck literally orbits its agenda. |

Full reports: `/tmp/expert-1-motion-designer.md` through `/tmp/expert-5-brand-identity.md`.

---

## Where the 5 experts agreed

1. Kill the infinite `gradShift` loop on `<em>` (4 of 5).
2. `prefers-reduced-motion` is mandatory and global (3 of 5).
3. One accent color per slide. Stop layering (3 of 5).
4. Eyebrow bumps to ~0.92rem with phase-color rule + tracked caps (2 of 5).
5. Drop `.big-accent` emoji blocks (Brand leads).
6. Variable Inter (`opsz` axis) instead of static weights (Typography; no objection elsewhere).
7. Measure-cap text columns ~32ch for billboards (Typography; supported by Accessibility).
8. Add explicit phase name in eyebrow text (Accessibility + Brand both demand this).

---

## Where experts conflicted (and where I made a call you may want to revisit)

| # | Conflict | My call in the amendment | Alternative |
|---|----------|--------------------------|-------------|
| A | Copy-block clickable (Motion) vs. delete glyph (Brand) | Delete `⌘C` glyph; copy-block stays as visual reference only | Re-enable click-to-copy since Q's laptop IS the projector and Q can copy for a struggling student |
| B | Orbital glyph (Brand) vs. nickname orbit (HS Dopamine) | Both — corner glyph everywhere + nickname orbit only on S1/S22/S30 | One, not both |
| C | Austere (Motion/Typography/Brand) vs. theatrical (HS Dopamine) | Adopt 4 of HS Dopamine's 5 moves; skip live re-prompt on S8 | Skip more of HS Dopamine to stay austere |
| D | Ink-wash toggle: brand element (current spec) vs. demote (Brand) | Keep as-is | Demote per Brand cut #3 |
| E | S5 Safety layout: single-column tints (Accessibility) vs. 2-column rhythm (Typography) vs. demote parent-box (Brand) | Combined all three: single-column + tints + demoted parent | Pick one purist position |

---

## Codex's 7 blockers on the amendment (with my recommended response)

### 1. Synthesis overclaims consensus
- **Codex:** I said "all five / four-of-five agree" on emoji cuts and one-accent, but it's softer than that.
- **My response:** **Accept.** Will rewrite §2 to be honest about who said what.
- **Q decision needed?** No, mechanical fix.

### 2. "One accent per slide" self-contradicted
- **Codex:** Amendment says `--phase-accent` is the only visible color, then introduces S5 red/green, S15 green checks, S22 amber chip, S7 confetti, emerald nickname orbit. That's six exceptions.
- **My response:** **Accept.** Will add a formal **"semantic status color" exception** with strict scope: red=DANGER (S5 no items), green=SUCCESS (S15 checks, render counter), amber=WARNING (S22 fumble chip). These are *status*, not *phase*. Document the rule explicitly so future additions don't sprawl.
- **Q decision needed?** No, mechanical fix once exception is named.

### 3. Copy-block policy incoherent
- **Codex:** I wrote "delete click affordance" then "keep click-to-copy hover only on Q's laptop preview." But Q's laptop *is* the projector. No separate preview.
- **My response:** Pick a clean position. **Two options:**
  - **(a)** Fully delete click-to-copy. Copy-block is pure visual reference. Students see the prompt on screen and type it themselves. Cleanest.
  - **(b)** Fully enable click-to-copy. Q can click during the live demo to put a working prompt in clipboard for chat or another machine. Useful for the IRB-vulnerable laggard student case.
- **Q decision needed?** **Yes — your call between (a) and (b).**

### 4. Technical spec incomplete
- **Codex:** Inter `opsz` link is fine, phase colors verify against `#060b18`, but I never specified `font-variation-settings` or `font-optical-sizing`. Reduced-motion rules omit confetti, brush-wipe, scoreboard/BUILD flash, nickname orbit, `scroll-behavior: auto`.
- **My response:** **Accept.** Will add full `font-variation-settings` and `font-optical-sizing: auto` to type tokens; expand reduced-motion override to enumerate every new motion element.
- **Q decision needed?** No, mechanical fix.

### 5. AC11/AC12 not testable enough
- **Codex:** AC11 needs a named CVD check method/threshold and must include the new semantic status colors (not just phase colors). AC12 needs concrete scenarios for keyboard input states.
- **My response:** **Accept.** Will rewrite:
  - AC11 → "Verified via Sim Daltonism (or browser DevTools CVD simulation) for protanopia + deuteranopia; both semantic colors (red/green/amber) and phase colors carry redundant non-color cues."
  - AC12 → enumerated cases: no trigger / invalid nickname / duplicate nickname / reset storage / 5th approval auto-advance / reduced-motion mode.
- **Q decision needed?** No, mechanical fix.

### 6. Implementation delta misses work
- **Codex:** Missing tasks for nickname-orbit + `N` key + storage clearing, inline emoji removal in S10/S27, confetti handling, and AC10-12 belong in Task 16 (local) + Task 17 (Codex prompts), not just Task 16.
- **My response:** **Accept.** Will expand §7 of the amendment with the missing rows.
- **Q decision needed?** No, mechanical fix.

### 7. New IRB/social-risk surface (the important one)
- **Codex:** *"Projecting/storing nicknames and lighting approvals exposes laggards and may retain participant identifiers in localStorage. Fumble award is also one bad pick from public embarrassment."*
- **My response:** This is the one I want your call on. Concrete proposals:
  - **Nicknames in localStorage:** Switch to in-memory only (cleared on page reload). Add a `:clear` facilitator command. Add real-name validation (reject anything matching a list of common first names — actually impossible to be exhaustive, but we can reject anything with mixed case + only letters + length 4-10 as a heuristic).
  - **Scoreboard exposure of laggards:** Default to **count-only** mode (shows "3 of 5 approved" not nicknames). Q opts in to named mode by typing `:names on`. If a laggard is visibly stuck, Q never enables names.
  - **Fumble award:** Pre-decide criteria — funniest *bug narrative*, not most embarrassed *student*. Document in `ops-fallback-checklist.md`. If no clear winner, skip the award entirely.
  - **IRB review:** Q should run any new student-identifier projection through Monmouth IRB before session day. May require a protocol amendment.
- **Q decision needed?** **Yes — IRB-vulnerable design choice. Your call.**

---

## 6 open questions from the amendment doc (§8)

These don't depend on the Codex blockers — they're tone/style calls only Q can make:

1. **Nickname orbit on S1**: keep, or cut entirely? *(I marked tentative.)*
2. **S29 rewrite #1**: "AI is fast. You are slow on purpose." — is that a line you'd actually say?
3. **S30 rewrite**: "Build something dumb this week. Email it to me." — comfortable using "dumb" with IRB-watching parents? Alternative: "Build something for fun."
4. **Facilitator keys**: `N`, `R`, `T`, `:approve <nick>` — consolidate? Add `:reject <nick>` for plan-check?
5. **Cringe audit rewrites** (S1 subtitle, S5 headline, S20 headline, S25 headline) — accept all, or pick?
6. **Ink-wash theme**: keep toggle (current), demote per Brand, or defer to polish phase?

---

## Files in the tree this morning

```
docs/superpowers/
├── specs/
│   ├── 2026-05-16-slide-redesign-design.md        (committed — parent spec)
│   ├── 2026-05-17-fancy-minimal-amendment.md      (DRAFT — Codex NOT READY)
│   └── 2026-05-17-morning-report.md               (this file)
└── plans/
    └── 2026-05-16-slide-redesign-plan.md          (committed — locked, pending amendment)

/tmp/
├── expert-1-motion-designer.md
├── expert-2-typography-layout.md
├── expert-3-hs-dopamine.md
├── expert-4-accessibility.md
├── expert-5-brand-identity.md
├── codex-amendment-output.txt                     (full Codex verdict)
└── codex-amendment-review.txt                     (the prompt I sent)
```

Git: 3 local commits on `main` since yesterday (spec, spec-amendment-AC8-split, plan). **No push.** Branch `slide-redesign-2026-05` not created. Amendment + this morning report not yet committed (waiting for your approval).

---

## What I recommend you do first (in order)

1. **Skim this morning report** (10 min).
2. **Decide blocker #3** (copy-block: pure visual vs. click-to-copy live).
3. **Decide blocker #7** (the IRB/social-risk handling — this is the only one with real downside).
4. **Pick from the 6 open questions** (or punt to "design as you go").
5. **Approve or reject the amendment direction** ("yes, apply the mechanical fixes and let's go" / "let's narrow to specific moves" / "drop the amendment, ship the original spec").

Once those decisions land, I'll:
- Apply the mechanical fixes (blockers 1, 2, 4, 5, 6).
- Incorporate your decisions on 3 and 7.
- Re-run Codex on the revised amendment until READY.
- Update the implementation plan to incorporate §7 deltas.
- Re-run Codex on the updated plan until READY.
- Resume execution per your original Q25 answers (branch-only, stop after Task 2, Codex per-task).

ETA from "Q approves" to first slide on screen: ~30 min (mostly Codex review cycles).

---

## Honest risk readback

- This amendment touches ~14 of 17 plan tasks. It's a real visual redesign, not a polish pass. Easy to underestimate.
- The HS Dopamine moves (scoreboard, render counter, fumble award) introduce **new social-risk surface** that the parent IRB protocol may not have envisioned. The parent spec said "AES-256-GCM encryption on advanced course page" and "Student names collected only for pre/post matching, then deleted" — projecting nicknames on a slide is *different* and may require IRB awareness.
- The amendment makes the deck visually distinct from typical AI-slide-tool output, which is good for brand but risks looking austere if HS Dopamine moves get cut and nothing replaces them. The deck needs *either* signature theatricality *or* signature restraint — half-and-half reads as confused.

Sleep well, Q. Everything is in `docs/superpowers/specs/2026-05-17-*.md` when you wake.
