# Fancy-Minimal Amendment to Slide Redesign Spec

**Date:** 2026-05-17 (overnight)
**Author:** Q (via Claude) · synthesis of 5 expert reviews · pending Codex review + Q approval
**Status:** DRAFT — amends `2026-05-16-slide-redesign-design.md`
**Parent spec:** `docs/superpowers/specs/2026-05-16-slide-redesign-design.md`
**Trigger:** Q's late-night message: *"make this slides as fancy as possible, with animation, UI improvement"* + chosen direction "fancy minimal" (Q26).

---

## 1. Source — five expert reviews

Saved to `/tmp/` overnight; will be moved into `docs/superpowers/reviews/` if Q approves the amendment.

| # | Lens | One-line top recommendation |
|---|------|------------------------------|
| 1 | Motion designer | Staggered eyebrow → headline → support entrance + phase-color underscore. Plays once per slide, never loops. |
| 2 | Typography & layout | Switch to Inter's variable optical-size axis; collapse eyebrow + accent + `<em>` into one "phase chord" color. |
| 3 | HS dopamine | S15 plan-check as a 5-name live scoreboard that auto-advances to S16 when the last green check lights up — *the* car-ride moment. |
| 4 | Accessibility | Default `--accent-violet: #8b6cf6` fails projector contrast for the small eyebrow; promote to `#a78bfa` minimum, and pair every phase accent with a non-color cue. |
| 5 | Brand & identity | Echo the landing page's orbital ring as a 28px corner glyph that rotates one notch per phase — the deck literally orbits its agenda. |

---

## 2. Where the experts agree (with honest counts)

Codex called out earlier wording that overclaimed consensus. Corrected counts below — "majority" means I'm rolling forward; "split" means it's a judgement call.

| # | Recommendation | Explicit support | Status |
|---|---|---|---|
| 1 | Stop the infinite `gradShift` loop on `<h1><em>` | Motion #5, Typography #2, Accessibility #1, Brand #1 (4 of 5) | Rolling forward |
| 2 | `prefers-reduced-motion: reduce` mandatory and global | Motion, Typography, Accessibility (3 of 5; Brand/HS-Dopamine silent — not opposed) | Rolling forward |
| 3 | One accent color per slide | Brand #4 (primary), Typography signature, Motion (single underline) (3 of 5; Accessibility silent on this specifically, but consistent with their CVD framing) | Rolling forward with explicit "semantic status color" exception — see §6.0 |
| 4 | Eyebrow bumps to ~0.92rem with phase-color rule + tracked caps | Typography #3, Accessibility #2 (2 of 5; others silent) | Rolling forward |
| 5 | Drop emoji `.big-accent` blocks (and inline emoji throughout, e.g. S10 🔒🧠💰, S27 📚🎥💬📧, S28 📋) | Brand #3 (only Brand explicitly; Accessibility implicit re: projector rendering) | Rolling forward — expanded to inline emoji per Codex feedback |
| 6 | Variable Inter (`opsz` axis) instead of static weights | Typography #1 only; no objection from others | Rolling forward |
| 7 | Measure-cap at ~32ch for billboards, ~56ch for activity | Typography #5, Accessibility #5 (dyslexia/ELL adjacent) | Rolling forward |
| 8 | Explicit phase name in eyebrow text (e.g. `PHASE 03 · QUICK WIN`) | Accessibility #4 (non-color cue), Brand #5 (slide-meta) | Rolling forward — non-negotiable per Accessibility |

## 3. Where they conflict + my proposed resolution

### 3.1 Copy-block: real click-to-copy (Q decision 2026-05-17)
- **Motion #2:** click-to-copy interaction with hover lift + emerald pulse.
- **Brand cut #1:** delete the `⌘C` glyph entirely — students paste into their own terminal, not from the projected slide.
- **Q's call (2026-05-17):** **Motion wins.** Real click-to-copy on the projector laptop. Q's machine IS the projector, so Q can click a copy-block during a live demo to put the prompt in clipboard — useful for handing a working prompt to a struggling student via chat or another machine. Students still type from their own laptops, but the affordance is functional, not decorative.
- **Net change vs. parent spec:** keep an affordance on `.copy-block`, but replace the static `::after { content:'⌘C' }` with a state-aware "click to copy" / "copied ✓" treatment that responds to click events via the Web Clipboard API.

### 3.2 Orbital metaphor: signature glyph only (Q decision 2026-05-17)
- **Brand signature:** static 28px corner glyph, one node-dot rotates per phase. Mandatory on every slide.
- **HS Dopamine #1:** S1 nickname-orbit — 5 student nicknames orbiting the title slowly.
- **Q's call (2026-05-17):** **Brand only — drop the nickname orbit entirely.** Projecting student nicknames in a slow rotation on multiple slides introduces social-exposure risk for the IRB-protected minor audience that the parent protocol (FA 2562) did not anticipate. The orbit corner glyph stays as the brand signature; nicknames are NEVER projected by default.
- **Net change:** Add only the static corner glyph to §6. Nickname-orbit components are removed from this amendment.

### 3.3 "Fancy minimal" vs. theatrical
- **Motion + Typography + Brand:** lean austere — restraint is the brand.
- **HS Dopamine:** more theatricality (countdown, scoreboard, fumble award, S8 live re-prompt).
- **My call:** **Take HS Dopamine moves that serve BUILD-FIRST. Skip the ones that serve decoration.**
  - ✅ Adopt: S15 live plan-check scoreboard (Move 1) — rewards finishing the boring part, makes "I got signed off" a status moment.
  - ✅ Adopt: S7 render counter (Move 2) — gamifies the Quick Win, scales for 5 students.
  - ✅ Adopt: S22 "Best AI fumble wins" chip (Move 4) — turns failure anxiety into competitive comedy.
  - ✅ Adopt: S13 headline reframe to "Make Claude *interview* you" (Move 3) + the cringe audit rewrites.
  - ❌ Skip: S8 ASCII-diagram replacement with live re-prompt (Move 5) — too fragile if Claude is offline; ASCII diagram stays.
  - ❌ Cut: S1 nickname orbit — projecting student identifiers crosses an IRB social-risk line (Q decision 2026-05-17 § 3.2).

### 3.4 Ink-wash theme: brand element or accessibility fallback?
- **Brand cut #3:** demote — keep keyboard shortcut, remove toggle button, don't count as part of design system.
- **My call:** **Keep as-is.** Q's existing site identity uses ink-wash heavily; CLAUDE.md treats it as part of the visual identity. Removing without consulting Q is overreach. Brand's concern (two themes = two brands) is fair — mitigation: the orbital corner glyph must render correctly in BOTH themes with appropriate color adaptation.

### 3.5 S5 Safety layout
- **Accessibility #3:** single-column with background tints + glyphs + border-bars (CVD safety).
- **Typography #4:** 2-column rhythm-list with phase-color numerical prefix.
- **Brand cut #2:** delete the dashed amber `parent-box`; demote parent rule to a normal italicized paragraph.
- **My call:** **All three are compatible.** Single-column layout (Accessibility wins on CVD). Each item gets a left-edge border-bar + tinted background + glyph (Accessibility's triple-redundant cue). Parent rule demoted to plain italicized paragraph (Brand). Typography's rhythm-list pattern applies to S10, S14, S20, S27, S29 — not S5 specifically.

---

## 4. Proposed amendments to parent spec §6 (Visual & Styling System)

Replace the current ~30-line §6 with the expanded system below.

### §6.0 Philosophy

Hi-contrast "one idea, huge" + **tasteful, build-first motion + workshop-notebook restraint**. Every motion, every accent, every typographic flourish must answer: *does this help a 15-year-old understand or build?* If no, cut it.

Three pillars: **One Accent Per Slide · One Motion Per Slide · One Signature Repeated.**

#### Semantic status color exception (formal carve-out)

The "one accent per slide" rule has exactly **one formal exception**: a fixed semantic palette for status, used in addition to the phase accent. The semantic palette is fixed-purpose, not phase-dependent, and is the only second color that may appear on a slide.

| Semantic role | Hex | Approved usage | Scope |
|---|---|---|---|
| `--status-danger` | `#f87171` | S5 safety `.no` items (DANGER) | S5 only |
| `--status-success` | `#34d399` | S15 plan-check green ticks, S7 render counter "page rendered" indicator, S5 safety `.yes` items, AND universally on `.copy-block.copied` (transient post-click feedback) | S5, S7, S15, plus `.copy-block.copied` on any slide |
| `--status-warning` | `#f59e0b` | S22 fumble-chip border (WARNING / playful caution) | S22 only |

Outside the scope column above, these colors must NOT appear. No "I'll use the status-success green in S29" — that breaks the contract. Each phase still has its `--phase-accent` (the eyebrow, the `<em>` underline, the orbit-mark dot); the semantic color is layered ONLY where status meaning is conveyed (red = stop / wrong, green = approved / done, amber = warning / playful).

This exception is what makes "one accent per slide" honest: outside semantic status, the phase color is the only color you see.

### §6.1 Typography system

Single family: **Inter variable** with optical-size axis (`opsz: 14..32`) and weight axis (`wght: 400..800`). Italic weights loaded so `<em>` flourishes work without a second family. Instrument Serif fully removed.

```html
<link href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,400..800;1,14..32,400..700&display=swap" rel="stylesheet">
```

Type scale (CSS custom properties — single source of truth):

| Token | Role | Min | Fluid | Max | Weight | Tracking | Optical-size |
|---|---|---|---|---|---|---|---|
| `--type-hero` | billboards | 4.5rem | 9vw | 8rem | 700 | -0.005em | 32 |
| `--type-headline` | non-billboard H1 | 3rem | 6vw | 5rem | 700 | 0 | 28 |
| `--type-sub` | `.subtitle` | 1.35rem | 1.9vw | 1.7rem | 400 | -0.005em | 20 |
| `--type-list` | `<li>` activity items | 1.25rem | 1.5vw | 1.55rem | 500 | 0 | 18 |
| `--type-body` | paragraphs | 1.1rem | 1.2vw | 1.25rem | 400 | 0 | 16 |
| `--type-eyebrow` | phase label, all-caps | 0.92rem | 1vw | 1rem | 600 | 0.22em | 14 |
| `--type-code` | copy-block, diagrams | 1.05rem | 1.2vw | 1.2rem | 500 | -0.01em | — |
| `--type-muted` | footers | 0.95rem | 1vw | 1.05rem | 400 | 0.02em | 14 |

Line-height: `--lh-hero: 0.98`, `--lh-headline: 1.04`, `--lh-list: 1.45`, `--lh-body: 1.55`, `--lh-code: 1.6`.

Measure caps: `.slide.billboard .subtitle, .slide.billboard p { max-width: 32ch; }`; `.copy-block, .rhythm-list { max-width: 56ch; }`.

**Headline tracking change vs. parent spec:** Replace the inherited `letter-spacing: -0.025em` on `h1` with `-0.005em` (Accessibility #5 — negative tracking hurts dyslexic/ELL decoding at distance).

**Variable-axis bindings (required for Inter optical sizing):**

```css
html { font-optical-sizing: auto; }
body { font-family: 'Inter', -apple-system, sans-serif; }

.eyebrow      { font-size: var(--type-eyebrow);
                font-variation-settings: 'opsz' 14, 'wght' 600;
                letter-spacing: var(--track-eyebrow); }

h1            { font-size: var(--type-headline);
                font-variation-settings: 'opsz' 28, 'wght' 700;
                line-height: var(--lh-headline);
                letter-spacing: -0.005em; }

.slide.billboard h1 { font-size: var(--type-hero);
                      font-variation-settings: 'opsz' 32, 'wght' 700;
                      line-height: var(--lh-hero); }

.subtitle     { font-size: var(--type-sub);
                font-variation-settings: 'opsz' 20, 'wght' 400;
                line-height: var(--lh-body); }

p, li         { font-size: var(--type-body);
                font-variation-settings: 'opsz' 16, 'wght' 400;
                line-height: var(--lh-body); }

.rhythm-list li { font-size: var(--type-list);
                  font-variation-settings: 'opsz' 18, 'wght' 500;
                  line-height: var(--lh-list); }

.muted        { font-size: var(--type-muted);
                font-variation-settings: 'opsz' 14, 'wght' 400; }

.copy-block, .diagram {
                font-family: 'SF Mono','Fira Code',monospace;
                font-size: var(--type-code);
                line-height: var(--lh-code);
                letter-spacing: -0.01em;
                /* monospace falls back through default opsz; no font-variation-settings here */ }
```

The `'opsz'` axis values (14 / 16 / 18 / 20 / 28 / 32) match Inter's exposed range. `font-optical-sizing: auto` on `html` is the global enable; the explicit `font-variation-settings` per-element wins where set. If the variable-axis fetch fails (CDN outage), the system-font fallback `-apple-system, sans-serif` keeps the deck readable.

### §6.2 Color system — "one accent per slide"

The 10 phase accents (parent spec §6) stay, but their *usage rules* change:

```css
.slide { --phase-accent: var(--text-primary); } /* default: no accent at all */
.slide.phase-open     { --phase-accent: #67e8f9; } /* cyan */
.slide.phase-safety   { --phase-accent: #f87171; } /* rose, AAA-safe */
.slide.phase-quickwin { --phase-accent: #34d399; } /* emerald */
.slide.phase-decode   { --phase-accent: #c4b5fd; } /* violet (lifted from #a78bfa for AAA) */
.slide.phase-plan     { --phase-accent: #60a5fa; } /* blue */
.slide.phase-build    { --phase-accent: #f59e0b; } /* amber */
.slide.phase-polish   { --phase-accent: #d4a73d; } /* gold */
.slide.phase-share    { --phase-accent: #38bdf8; } /* sky-cyan (differentiated from Open's #67e8f9) */
.slide.phase-levelup  { --phase-accent: #c4b5fd; } /* violet */
.slide.phase-close    { --phase-accent: #34d399; } /* emerald */
```

**Usage rules:**
- `--phase-accent` is the ONLY accent color visible on a slide.
- Three places use it: (a) eyebrow text + leading rule, (b) `<em>` underline (NOT fill), (c) corner orbit-mark node dot.
- Body text, lists, paragraphs always use `var(--text-secondary)` or `var(--text-primary)`. Never the accent.
- Cards (`.glass-card`, `.warning`, `.key-idea`, `.analogy`) drop tinted backgrounds. Border-left in `--phase-accent`, transparent fill.
- The modifier classes `.eyebrow.blue/.rose/.emerald/.amber/.violet` are **deleted**. Phase class is the only color source.

**Color-blind safety (Accessibility #4):**
- Phase identity NEVER relies on color alone. Every slide eyebrow includes the phase name in text: `PHASE 03 · QUICK WIN`.
- Cyan-cyan collision between Open and Share resolved by using a warmer cyan (`#38bdf8`) for Share.
- Violet-violet collision between Decode and Level Up resolved by their phase-name disambiguation in the eyebrow.

**S5 Safety slide (critical):** Single column. Each item gets background tint + left border-bar + glyph + label color (triple-redundant CVD cue):

```css
.safety-grid { grid-template-columns: 1fr; max-width: 640px; }
.safety-grid .no  { padding:.6rem 1rem; border-radius:8px; font-weight:600;
                    color:#fecaca; background:rgba(220,38,38,.18);
                    border-left:4px solid #f87171; }
.safety-grid .yes { padding:.6rem 1rem; border-radius:8px; font-weight:600;
                    color:#bbf7d0; background:rgba(16,185,129,.14);
                    border-left:4px solid #34d399; }
```

### §6.3 Motion system

Three motion moves, applied universally. All gated by `prefers-reduced-motion`:

**Move A — Staggered entrance** (every slide, fires once on `.active`):
```css
@keyframes riseIn { from { opacity:0; transform:translateY(12px); } to { opacity:1; transform:translateY(0); } }
.slide.active .eyebrow   { animation: riseIn .42s cubic-bezier(.16,1,.3,1) both;     animation-delay:   0ms; }
.slide.active h1         { animation: riseIn .52s cubic-bezier(.16,1,.3,1) both;     animation-delay:  80ms; }
.slide.active .subtitle,
.slide.active .lede,
.slide.active ul,
.slide.active .copy-block,
.slide.active .diagram,
.slide.active .safety-grid { animation: riseIn .56s cubic-bezier(.16,1,.3,1) both;   animation-delay: 180ms; }
.slide.active .muted,
.slide.active .parent-box  { animation: riseIn .56s cubic-bezier(.16,1,.3,1) both;   animation-delay: 280ms; }
```

**Move B — Phase-color underscore on billboards** (one-shot on `.active`):
```css
.slide.billboard h1 { position: relative; display: inline-block; }
.slide.billboard h1::after { content:''; position:absolute; left:50%; bottom:-10px; width:0; height:3px;
                             background: var(--phase-accent); border-radius:2px; transform:translateX(-50%); }
.slide.billboard.active h1::after { animation: underscore .54s cubic-bezier(.16,1,.3,1) .26s forwards; }
@keyframes underscore { to { width: 62%; } }
```

**Move C — Step reveal punch** (existing `S` key reveal, with snap):
```css
.step { opacity:.18; transform:translateX(-8px); transition: opacity .35s, transform .35s, background .35s; }
.step.revealed { opacity:1; transform:translateX(0); background: rgba(79,143,247,.06); }
.step.revealed::before { content:''; display:inline-block; width:6px; height:6px; border-radius:50%;
                         background: var(--phase-accent); margin-right:.6rem; vertical-align:middle;
                         animation: dotPop .32s cubic-bezier(.34,1.56,.64,1) both; }
@keyframes dotPop { from{transform:scale(0);} to{transform:scale(1);} }
```

**Gradient on `<em>`:** Kept ONLY on S1 (Title) and S30 (Thank You) — plays once on entry, freezes. Everywhere else, `<em>` gets a single-color phase-accent underline (Brand #1):
```css
h1 em { font-style:italic; color:inherit; position:relative;
        background-image: linear-gradient(transparent 78%, var(--phase-accent) 78%, var(--phase-accent) 92%, transparent 92%);
        background-size: 100% 100%; background-repeat: no-repeat; padding: 0 .05em; }
.slide#s0 h1 em, .slide#s29 h1 em { /* S1 and S30 only: keep gradient as scarcity flourish, one-shot */
  background: linear-gradient(135deg, #93c5fd, #c4b5fd, #fbcfe8) text;
  -webkit-background-clip: text; -webkit-text-fill-color: transparent;
  background-size: 220% 220%; background-position: 0% 50%;
  animation: gradSweep 1.2s cubic-bezier(.16,1,.3,1) .14s both;
}
@keyframes gradSweep { to { background-position: 100% 50%; } }
```

**Reduced-motion global (covers ALL motion in the deck — non-negotiable):**
```css
@media (prefers-reduced-motion: reduce) {
  /* Universal kill: animations to ~zero, transitions to ~zero, scroll auto */
  *, *::before, *::after {
    animation-duration: 0.001ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.001ms !important;
    scroll-behavior: auto !important;
  }
  /* Slide entrance lands in final state */
  .slide.active * { opacity: 1 !important; transform: none !important; }
  /* Billboard underscore appears at full width, no draw */
  .slide.billboard.active h1::after { width: 62%; }
  /* S1/S30 gradient settles at midpoint instead of sweeping */
  h1 em { background-position: 50% 50%; }
  /* Step reveal: all steps visible by default; no slide/pop */
  .step { opacity: 1; transform: none; }
  .step.revealed::before { animation: none; }
  /* Copy-block click states: no lift, no pulse — click still copies */
  .copy-block, .copy-block:hover { transform: none; }
  .copy-block.copied { animation: none; }
  /* Brush-wipe between slides: instant, no displacement filter */
  .brush-wipe.sweeping .ink-stroke { animation: none; transform: translateX(110%); }
  /* Phase-rotation orbit-mark: snap to final angle, no transition */
  .orbit-mark .node { transition: none; }
  /* Live-moment features (S7 counter, S15 scoreboard, S22 chip): static */
  .render-counter, .render-counter * { animation: none; transition: none; }
  .scoreboard, .scoreboard * { animation: none; transition: none; }
  .scoreboard .build-flash { display: none; }   /* skip the "BUILD" flash on auto-advance */
  .fumble-chip { animation: none; }
}
```

**Ink-wash toggle debounce** (Accessibility 4.2):
```css
body, body.theme-ink { transition: background-color 500ms ease, color 500ms ease; }
```
Plus JS debounce on the `I` keypress to ≥600ms.

### §6.4 Identity moves

**Eyebrow as anchor (Typography #3, Brand #5 merged):**
```css
.eyebrow { font-size: var(--type-eyebrow); font-weight:600;
           letter-spacing: var(--track-eyebrow); text-transform: uppercase;
           color: var(--phase-accent); margin-bottom: 1.6rem;
           display: inline-flex; align-items: center; gap: 0.7rem; }
.eyebrow::before { content: ''; width: 24px; height: 1px; background: currentColor; }
```

**Eyebrow text format:** Always `PHASE NN · NAME` (e.g., `PHASE 03 · QUICK WIN`). Non-color phase identifier — required by Accessibility #4.

**Slide-meta footer (Brand #5):**
```css
.slide-meta { position:absolute; left:7vw; bottom:5vh;
              font-family:'SF Mono',monospace; font-size:.7rem; letter-spacing:.14em;
              color:var(--text-tertiary); text-transform:uppercase; }
.slide-meta b { color: var(--phase-accent); font-weight: 600; }
```
Format: `PHASE 03 · QUICK WIN · 15:00 → 25:00`. One line. Bottom-left of every slide.

**Corner orbit-mark (Brand signature):**
```svg
<!-- inline in body, JS-positioned to lower-right of slide -->
<svg class="orbit-mark" viewBox="0 0 28 28" aria-hidden="true">
  <circle class="ring" cx="14" cy="14" r="12" />
  <circle class="ring" cx="14" cy="14" r="7"  />
  <circle class="node" cx="14" cy="2"  r="1.8" />  <!-- rotated via --phase-angle -->
</svg>
```
```css
.orbit-mark { position:absolute; right:1.6rem; bottom:1.6rem; width:28px; height:28px;
              opacity:.55; transition: opacity .3s, transform .8s; }
.orbit-mark .ring { fill:none; stroke: var(--border-glow); stroke-width:.6; }
.orbit-mark .node { fill: var(--phase-accent); transform-origin: 14px 14px;
                    transform: rotate(var(--phase-angle, 0deg)); transition: transform .8s; }
```
Each `.slide.phase-X` sets `--phase-angle` corresponding to its position in the 10-phase cycle (Open=0°, Safety=36°, ..., Close=324°). On phase change, the dot rotates smoothly — the deck literally orbits.

**On S1 only,** the orbit-mark gets a one-line caption *"the orbit is your agenda — each phase rotates one notch"* and is 2× scale. After S1, it's silent.

**Copy-block click-to-copy (per Q decision §3.1):**
```css
.copy-block { cursor: pointer;
              transition: border-color .2s var(--ease), transform .2s var(--ease); }
.copy-block:hover { border-color: var(--phase-accent); transform: translateY(-1px); }
.copy-block::after { content: 'click to copy'; position: absolute; top: 0.6rem; right: 0.8rem;
                     font-size: 0.7rem; color: var(--text-tertiary); opacity: 0.6;
                     transition: color .2s, opacity .2s; }
.copy-block:hover::after { color: var(--phase-accent); opacity: 1; }
.copy-block.copied { border-color: var(--status-success); animation: copiedPulse .6s var(--ease); }
.copy-block.copied::after { content: 'copied ✓'; color: var(--status-success); opacity: 1; }
@keyframes copiedPulse {
  0%   { box-shadow: 0 0 0 0 rgba(52,211,153,.45); }
  100% { box-shadow: 0 0 0 14px rgba(52,211,153,0); }
}
```
```js
document.querySelectorAll('.copy-block').forEach(el => {
  el.addEventListener('click', async () => {
    // Strip the affordance hint from the copied text
    const text = el.innerText.replace(/click to copy|copied ✓/g, '').trim();
    try {
      await navigator.clipboard.writeText(text);
      el.classList.add('copied');
      setTimeout(() => el.classList.remove('copied'), 1400);
    } catch (e) {
      // Clipboard API requires secure context. Fail silently — Q can fall back
      // to selecting the text manually.
    }
  });
});
```
The clipboard API requires a secure context (HTTPS or `localhost`). If Q opens the file via `file://`, copy may fail. Mitigation: serve the deck via `python -m http.server` during the session. The ops-fallback checklist gets a one-line note.

**Nickname orbit:** REMOVED per Q decision §3.2. No student-identifier projection by default.

### §6.5 Cuts from parent spec

- Delete `.eyebrow.blue/.rose/.emerald/.amber/.violet` modifier classes (Brand #4).
- Delete `.big-accent` emoji blocks on S2, S3, S28 (Brand #3).
- Replace inline emoji on S10 (🔒 🧠 💰), S27 (📚 🎥 💬 📧) with the typographic phase-tag pattern + plain text labels (Codex blocker #6 — emoji renders inconsistently on the HH216 projector machine; Brand #3 expanded). S5 ❌ / ✅ glyphs stay because they carry semantic meaning (success/danger) and are paired with redundant non-color cues per §6.2.
- Replace the static `.copy-block::after { content:'⌘C' }` with the state-aware "click to copy" / "copied ✓" affordance per §6.4 (Q decision §3.1 — Brand cut #1 reversed).
- Demote dashed-amber `.parent-box` on S5 to a normal italicized paragraph (Brand cut #2).
- Remove the infinite `gradShift` animation everywhere except S1 + S30, where it plays once on slide entry (Motion #5, Brand #1, Accessibility #1).
- Remove the nickname-orbit component entirely (Q decision §3.2 — IRB social-risk surface).

---

## 5. Proposed amendments to parent spec §3 (Pedagogy Decisions)

### §3.11 — Engagement scoring & live moments (NEW · IRB-mitigated per Q decision)

Three small live-moment features support the build-first pedagogy without distracting from it. **All three default to count-only mode; named modes require explicit Q opt-in and must be cleared from IRB before session day.**

**Storage rule (binding for all three features):**
- State lives in `sessionStorage` ONLY (cleared when the browser tab closes), never in `localStorage`.
- No nicknames persist beyond the session.
- A `:clear` facilitator command zeroes all in-memory state immediately.

**(a) S7 render counter.** Visible "**0 / 5** pages rendered" + 10-min countdown. Q manually presses `R` to increment when a student renders their `starter.html`. **Names never shown on this slide.** When the 5th rendering registers, a tasteful single non-looping success pulse plays — no confetti, no fireworks, a one-shot `box-shadow` ring in `--status-success` is sufficient.

**(b) S15 plan-check scoreboard — count-only by default.** During the plan phase (S13–S14), Q presses `A` to increment the approval count. The slide shows "**N / 5** plans approved" — no nicknames, no per-student dots. When the 5th approval lands, the slide auto-advances to S16 with the existing `.brush-wipe` transition + a single word "**BUILD**" displayed for 1.4s before S16 fully renders.

> **Named mode (Q opt-in only):** If Q types `:names on` during the session, the scoreboard switches to showing approved nicknames. This mode MUST be explicitly opted into and SHOULD be cleared with Monmouth IRB beforehand. Default remains count-only.

**(c) S22 fumble award — verbal only, no on-slide nickname.** The slide shows a small `--status-warning` chip below the show & tell list reading "Best AI fumble of the day." Q names the winner *verbally only* at the end of show & tell — the nickname is never rendered on the slide. Fumble = funniest AI bug narrative, NOT most embarrassed student. Criteria documented in `session-materials/ops-fallback-checklist.md`. If Q can't pick a clear winner, the award is skipped entirely.

**Facilitator keys (consolidated, single-letter):**
- `R` — S7 render counter increment
- `T` — S7 timer start (separately, on Q's signal)
- `A` — S15 plan-check approval count increment
- `:clear` — clear all in-memory live-moment state immediately (typed)
- `:names on` / `:names off` — toggle named mode for the scoreboard (typed; default OFF)

**Pedagogical rationale:** All three serve the build-first lesson by gamifying the *finishing* of each phase. In a 5-student cohort, social proof from peer progress is the strongest motivator. Count-only mode preserves social proof ("we're 3 of 5 there") without exposing laggards.

**Social-risk mitigations applied (per Q decision 2026-05-17, addresses Codex blocker #7):**

| Risk | Mitigation |
|---|---|
| Projecting student identifiers exposes laggards / introduces new IRB surface | Count-only mode is the default. Nicknames never appear on any slide unless Q explicitly types `:names on`. |
| `localStorage` retains participant identifiers post-session | Switched to `sessionStorage` (volatile, tab-scoped). `:clear` command for manual zeroing. |
| Real-name leakage if a student picks a non-fictional handle | Nickname input layer (added in Task 4, S6) includes a heuristic warning if the entered string matches common-first-name patterns (length 3–10, single mixed-case word, no numbers/symbols). Q always reviews before pressing `R` or `A`. |
| Fumble award one mis-pick from humiliation | Verbal-only (no slide rendering of the named student). Criteria pre-documented. Skip-allowed. |
| Auto-advance from S15 to S16 feels like a glitch to Q | Q is informed of this behavior in the runbook. Pressing `←` returns to S15 normally. |
| IRB protocol may not anticipate this surface | **AC13 (added in §10):** Q confirms with the Monmouth IRB office that the in-memory count-only treatment fits within FA 2562, or files a protocol amendment, BEFORE session day. Plan completion does not block on this. |

---

## 6. Proposed amendments to parent spec §10 (Acceptance criteria)

Add four new criteria:

> **AC10:** All animations honor `prefers-reduced-motion: reduce` per §6.3. Verified slide-by-slide via Chrome DevTools "Emulate CSS media feature `prefers-reduced-motion: reduce`" toggle. Specific checks: slide entrance lands instantly in final state; billboard underscore appears at full width without draw; S1/S30 gradient settles at midpoint; step reveal shows all steps immediately; copy-block click still copies but skips lift/pulse; brush-wipe is instant; orbit-mark snaps to target angle; live-moment elements (counter, scoreboard, fumble chip) are static.
>
> **AC11:** Contrast + color-blind safety:
> - Every phase accent in §6.2 AND every semantic status color in §6.0 measures ≥4.5:1 contrast against `--bg-deep` (verified with WebAIM Contrast Checker on each pair; show table).
> - Color-blindness check performed by enabling Chrome DevTools Rendering panel → "Emulate vision deficiencies" → run protanopia + deuteranopia on slides S1, S5, S7, S15, S22, and the phase-transition pairs Open↔Share (cyan↔sky-cyan), Decode↔Level-Up (violet↔violet). Pass criteria: no two adjacent phases or status colors merge into the same hue, OR — if they do — a non-color cue (phase-name text in eyebrow, glyph + border-bar in safety grid, count text in scoreboard) makes them unambiguously distinguishable.
>
> **AC12:** Three live-moment features (S7 render counter, S15 plan-check scoreboard, S22 fumble chip) pass these enumerated keyboard-state cases:
> 1. **No trigger:** slide renders with counter at "0 / 5", scoreboard at "0 / 5", fumble chip visible — all in resting state.
> 2. **Increment within range:** `R` press during S7 increments 0→1, 1→2, … 4→5; `A` press during S15 same.
> 3. **Increment past 5:** further presses are no-ops (clamp at 5).
> 4. **5th approval auto-advances S15→S16** with brush-wipe + "BUILD" flash; `←` returns to S15 normally.
> 5. **`:clear` typed:** all counters reset to 0 immediately; named-mode toggles off.
> 6. **`:names on` typed:** scoreboard switches to nickname display IF a nickname store exists in sessionStorage; otherwise reverts to count-only and surfaces a console warning.
> 7. **Reduced-motion mode:** all increments still register; only the visual lift / pulse / BUILD-flash are suppressed.
> 8. **sessionStorage clearing:** closing the browser tab and reopening shows counters at 0; no persistent state from prior sessions.
>
> **AC13 (IRB / social-risk gate — Q follow-up, NOT a plan-completion gate):** Before session day, Q confirms with the Monmouth IRB office that the in-memory count-only treatment of student approvals fits within protocol FA 2562, OR files a protocol amendment if named mode will be used. The implementation plan completes without this; AC13 is tracked in `session-materials/ops-fallback-checklist.md` under a `T-7d` block (allowing IRB response time).

---

## 7. Implementation plan delta

The existing plan (`2026-05-16-slide-redesign-plan.md`) needs these changes if Q approves this amendment:

| Task | Change |
|---|---|
| Task 1 Step 4a | Replace Inter font link with the variable-font version (italic + opsz axis). Add `html { font-optical-sizing: auto; }`. |
| Task 1 Step 4b | Add the new `:root` type tokens (§6.1) + the global `prefers-reduced-motion` override per §6.3 (covers entrance, underscore, step, copy-block, brush-wipe, orbit-mark, live-moment, gradient) + ink-wash 600ms debounce. |
| Task 1 Step 4b (continued) | Add the new `:root` semantic status colors: `--status-danger #f87171`, `--status-success #34d399`, `--status-warning #f59e0b` (§6.0 exception). |
| Task 1 Step 4c | Replace the 10 phase classes with the new color values from §6.2. Add per-element `font-variation-settings` bindings from §6.1 (eyebrow, h1, billboard h1, subtitle, p/li, rhythm-list, muted, copy-block). |
| Task 1 (NEW Step 4d) | Add the three motion CSS rules from §6.3 (entrance, underscore, step-reveal) + the gradient one-shot on S1/S30 only. |
| Task 1 (NEW Step 4e) | Add the orbit-mark inline SVG component + the `--phase-angle` custom property per phase class (0°, 36°, …, 324°). |
| Task 1 (NEW Step 4f) | Add the click-to-copy JS + state-aware `::after` "click to copy" / "copied ✓" CSS for `.copy-block` (§6.4). |
| Task 2 — S1 | Add 2× scale orbit-mark with caption "the orbit is your agenda — each phase rotates one notch". S1 keeps the gradient `<em>` one-shot. |
| Task 2 — S2, S3, S4 | Replace any `.big-accent` emoji blocks with the typographic phase tag (`PHASE 01 · OPEN` per §6.4). |
| Task 2-11 (all) | Delete `.eyebrow.blue/.rose/.emerald/.amber/.violet` modifier classes. Update eyebrow text format to `PHASE NN · NAME`. Add `.slide-meta` footer to every slide. Add the orbit-mark inline SVG (with `--phase-angle` matching the slide's phase). Apply the correct `.phase-X` class to every slide. |
| Task 3 — S5 Safety | Switch safety-grid to single-column. Add background-tint + border-bar + glyph triple-redundancy to `.no/.yes` (§6.2). Demote `.parent-box` to italicized paragraph (no dashed border). |
| Task 4 — S6 (Pick Your Nickname) | Add a small `.nickname-input` text field with a heuristic real-name validation (warn-only) per §3.11 risk table. No nickname projection on any other slide. Store in `sessionStorage` only. |
| Task 4 — S7 (Tiny Build) | Add `.render-counter` element ("**N / 5** pages rendered" — count-only) + 10-min countdown. Facilitator keys: `R` (increment count, clamps at 5), `T` (start timer). 5th render triggers the non-looping `--status-success` box-shadow ring. |
| Task 5 — S10 | Remove inline emoji (🔒 🧠 💰) from the three list items. Use the typographic phase-tag pattern + plain text labels (e.g. `01 · Permissions`, `02 · Context`, `03 · Usage`). |
| Task 6 — S13 | Replace headline "Tell Claude:" with "Make Claude *interview* you." Add subtitle "You're the expert on your persona. It's not." |
| Task 6 — S15 | Add live scoreboard (count-only) with facilitator key `A` (increment approval, clamps at 5). 5th approval triggers auto-advance to S16 via brush-wipe + "BUILD" flash (1.4s). Support `:names on` / `:names off` typed commands + `:clear`. Default count-only. |
| Task 9 — S22 | Add `.fumble-chip` pill (`--status-warning` border, not amber) below the show & tell list. No nickname rendered on slide; Q names verbally only. |
| Task 10 — S23 | (no change — Skills SKILL.md sample stays; copy-block now click-to-copy.) |
| Task 10 — S27 | Remove inline emoji (📚 🎥 💬 📧). Replace with the typographic phase-tag pattern + plain text labels. |
| Task 11 — S28 | Remove `.big-accent` 📋. Replace with the typographic phase tag. |
| Task 11 — S29 | Apply cringe-audit rewrite: takeaway #1 → "AI is fast. You are slow on purpose." (See §8 open question 2 — pending Q final approval.) |
| Task 11 — S30 | Keep gradient `<em>` one-shot. Apply cringe-audit rewrite of subtitle (pending §8 question 3). Add 2× scale orbit-mark final position. |
| Task 13 (IRB runbook) | Add a new section: "Live-moment features — when nicknames may be projected." Documents the `:names on` opt-in and the criteria for the verbal-only fumble award. |
| Task 14 (ops-fallback) | Add a `T-7d` block for AC13 IRB consult. Add a `T-15min` reminder: serve via `python -m http.server` so the Clipboard API works. |
| Task 16 (LOCAL final verification) | Add local checks for AC10 (DevTools reduced-motion toggle, slide-by-slide), AC11 (Sim Daltonism / DevTools CVD emulation on flagged slides), AC12 (the 8 enumerated keyboard scenarios). AC13 is NOT a local gate (it's Q + IRB). |
| Task 17 (CODEX FINAL REVIEW) | Update the Codex prompt to include the new AC10-12 criteria as required checks in the diff review. Confirm: variable-axis Inter applied, semantic status colors only used in their approved scopes, no localStorage of identifiers, no nickname projection by default, click-to-copy works with fallback. |

---

## 8. Open style questions (still pending Q — none block implementation; defaults applied)

The two big decisions (copy-block click-to-copy, social-risk mitigation) are resolved. **Nickname orbit was cut entirely** per the social-risk decision (§3.2). These remaining style questions still need your call eventually, but the amendment ships with sensible defaults so we can keep moving:

| # | Question | Default I'm shipping with | Override how? |
|---|---|---|---|
| 1 | S29 takeaway #1: "AI is fast. You are slow on purpose." | KEEP (HS Dopamine cringe-audit rewrite) | Reply with your preferred line; I edit in 30s |
| 2 | S30 subtitle: "Build something dumb this week. Email it to me." | KEEP "dumb" — it's permission-language for HS to take risks | Reply with alternative; I edit |
| 3 | Facilitator keys (`R`, `T`, `A`, `:names on/off`, `:clear`) | KEEP as drafted in §3.11 | Reply with renames |
| 4 | Other cringe-audit rewrites (S1 subtitle, S5 headline, S20 headline, S25 headline) | KEEP all HS Dopamine rewrites: S1 → "A landing page about who you wish you were. 110 min." · S5 → "Read this before you talk to Claude." · S20 → "5 moves. Pick 2." · S25 → "Set once. It runs without you." | Reply with which to revert |
| 5 | Ink-wash theme toggle | KEEP toggle (current spec; preserves your existing brand identity) | Defer to polish phase |

All five default to "ship as drafted." None of these gate implementation. Override at any time and I'll patch the affected slides.

---

## 9. Risks if this amendment ships unchanged

- **Scope creep into implementation.** The amendment touches ~15 of 17 plan tasks (up from 14 with the addition of S10/S27 emoji removal + the live-moment tasks). Adds ~6-8 hrs of implementation time. Honest call: it's a real redesign of the visual layer, not a polish pass.
- **AC13 IRB consult is on Q.** The amendment mitigates social-risk via count-only default + sessionStorage + verbal-only fumble award, but Monmouth IRB still needs a heads-up before session day. Not a plan-completion gate; it IS a session-day gate.
- **Variable Inter font weight.** The variable-axis link is bigger (~190KB vs ~70KB static). Acceptable for an in-room session but worth noting.
- **Clipboard API + `file://` protocol.** Click-to-copy requires a secure context. Q must serve the deck via `python -m http.server` (or `localhost`) during the session, not via `open file://`. Reminder added to ops-fallback-checklist `T-15min`.
- **Facilitator cognitive load.** New keys to remember during the live session (`R`, `T`, `A`, `:names on/off`, `:clear`). Mitigation: `ops-fallback-checklist.md` gets a one-page key reference.
- **Orbit-mark feels precious if mis-implemented.** Must be silent (low opacity, no animation beyond the per-phase rotation). If it pulses or breathes, kill it.
- **S15 scoreboard auto-advance** changes the deck's keyboard semantics (Q didn't press `→`, deck advanced anyway). Q must know this beforehand or it'll feel like a glitch.

---

## 10. Status

- 5 expert reports synthesized.
- This amendment NOT yet sent to Codex for review.
- This amendment NOT yet approved by Q.
- No implementation has started.

**Next steps (in order):**
1. Send this amendment to Codex for review (Rule #1).
2. Bring Codex's verdict + this doc to Q for sign-off.
3. If Q approves, update `2026-05-16-slide-redesign-plan.md` with the deltas from §7.
4. Re-run Codex review on the updated plan.
5. Begin implementation per Q's earlier execution choice (branch-only, stop after Task 2, Codex per-task).
