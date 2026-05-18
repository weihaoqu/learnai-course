# 2026-05-18 Content + Motion Amendment

**Amends:** `2026-05-16-slide-redesign-design.md` + `2026-05-17-fancy-minimal-amendment.md`
**Branch:** `slide-redesign-2026-05`
**Status:** DRAFT — pending Codex review

---

## 1. Overview

This amendment makes two simultaneous changes to `session-materials/session-slides.html`:

1. **Content expansion** — add 3 new slides + strengthen 2 existing slides to mirror Q's proven 1-on-1 teaching arc (install → agent vs chat → skills install → interview demo). Session extends from 110 → 125 min.

2. **UI overhaul** — replace the current single-skeleton layout with 6 phase-distinct layout templates, a 7-animation motion language, a 3-face typography system, and a per-phase 2-color accent palette. This directly addresses the four user-identified gripes: static slides, formulaic layout, plain code blocks, and flat/low-density color.

Prior amendments addressed motion + type + color as polish on the existing skeleton. This amendment breaks the skeleton.

---

## 2. Scope

### In scope
- `session-materials/session-slides.html` — all 30 existing slides + 3 new slides
- Phase layout templates (pure CSS)
- Motion language (pure CSS keyframes + minimal JS for typewriter)
- Typography system (Google Fonts CDN — Mona Sans, JetBrains Mono; Inter already loaded)
- Phase-color palette variables
- Device chrome components (terminal, browser, editor, TUI, chat bubble)
- S8 content rewrite (capability matrix)
- S13 content rewrite (interview demo slide vs tell-slide)
- S23 content reframe (paired with new S23a)

### Out of scope
- `starter.html`, agenda, ops checklist, IRB runbook — no changes
- IRB consent flow — no changes
- Live-moment features (S7 counter, S15 scoreboard, S22 fumble chip) — preserved exactly
- Keyboard navigation, autoplay, fullscreen, typed commands — preserved exactly
- Any push to remote — Q decides after local verification

---

## 3. Content Map

### Session timing: 110 → 125 min (extend, do not cut)

### New slides (3)

#### S4a — Install Claude Code (after current S4 "Open terminal. Type: claude")
- **Phase:** OPEN
- **Heading:** `Install in 60 seconds.`
- **Time allocation:** ~6 min
- **Content:**
  - Terminal chrome showing: `npm install -g @anthropic-ai/claude-code`
  - Then: `claude` to verify
  - Callout: "Need Node? → nodejs.org" with mini browser chrome
  - Facilitator note: Q demos on Q's laptop projected; students follow on their own Mac
- **Layout:** Stage (big type + terminal chrome below)

#### S13.5 — Interview Demo (between current S13 "Make Claude interview you" and S14 "A good plan has")
- **Phase:** PLAN
- **Heading:** `Watch it happen.`
- **Time allocation:** ~5 min
- **Content:**
  - Claude Code TUI chrome showing the interview skill running: questions flowing one at a time
  - Student volunteer on Q's laptop
  - Facilitator cue: "Tell Claude what you want to build. Watch what happens."
- **Layout:** Magazine spread (TUI chrome takes 60% width, facilitator cues in sidebar)

#### S23a — Install a Skill (after current S23 "Skills — Use & Make")
- **Phase:** LEVEL UP
- **Heading:** `Add a superpower in 30 seconds.`
- **Time allocation:** ~4 min
- **Content:**
  - Browser chrome showing `skills.sh`
  - Arrow pointing to "copy GitHub link"
  - Claude Code TUI chrome showing: `"please install this skill from https://github.com/..."`
  - Claude's response installing
  - Callout: "This is how Q installed 50+ skills."
- **Layout:** Bento grid (browser tile left, TUI tile right, callout tile spanning bottom)

### Strengthened slides (2)

#### S8 — Chatbot vs Agent (rewrite)
**Current:** abstract "Chatbot answers. Agent does."
**New:** concrete capability matrix, side-by-side

| Feature | claude.ai (chat) | Claude Code (agent) |
|---|---|---|
| Edit files | ✗ | ✅ |
| Run terminal commands | ✗ | ✅ |
| Persist project context | ✗ | ✅ |
| Install skills | ✗ | ✅ |
| Work across a codebase | ✗ | ✅ |
| Quick questions | ✅ | ✅ |
| Explain concepts | ✅ | ✅ |

**Layout:** Comparison/Split — two columns with clear ✗ / ✅ visual contrast using phase color for agent side.

#### S23 — Skills reframe (paired with S23a)
**Current:** "Pre-packaged superpowers."
**New:** Same theme but ends with explicit bridge: "→ Next slide: install one right now." S23 becomes the concept, S23a becomes the demo.

---

## 4. Layout System

Six layout patterns, shared across 10 phases. Each is a named CSS class applied to the `.slide` element. Layouts share the same CSS custom properties (phase color, accent, etc.) and differ only in grid/flex structure.

### 4.1 Stage (`layout-stage`)
**Used by:** OPEN (S1–S4, S4a), SHARE (S22)
- Single column, vertically centered
- Hero type: display sans, weight 800, very large (clamp 56px–96px)
- Phase eyebrow top-left, footer bottom
- Phase color bar sweeps in from left on entry (800ms)
- Maximum breathing room — no card clutter

### 4.2 Comparison/Split (`layout-split`)
**Used by:** DECODE (S8–S10)
- Two equal columns separated by a 1px phase-color border
- Left: "old way" (neutral palette)
- Right: "new way" (phase color accent, slight gradient tint)
- Each column: heading + bullet list
- S8 gets the capability matrix here

### 4.3 Live Canvas (`layout-canvas`)
**Used by:** QUICK WIN (S7)
- Full-bleed content area with minimal chrome
- Render counter / live output as the hero
- Phase eyebrow + slide number only — no card, no body copy

### 4.4 Magazine Spread (`layout-magazine`)
**Used by:** SAFETY (S5–S6), PLAN (S11–S15, S13.5)
- Asymmetric grid: 60% content area + 40% sidebar
- Content: heading + body
- Sidebar: facilitator cues (dimmed), supplemental examples, or scoreboard hero (S15)
- Mixed weight type (800 display + 400 body)

### 4.5 Workshop (`layout-workshop`)
**Used by:** BUILD (S16–S18), POLISH (S19–S21)
- Center-dominant layout: large build prompt / code block takes center stage
- Narrow sidebar strips (left: phase label, right: quick cues)
- S19 open-components: 3-card grid inside center area
- S20 UI cheats: 5-chip grid inside center area

### 4.6 Bento Grid (`layout-bento`)
**Used by:** LEVEL UP (S23–S27, S23a), CLOSE (S28–S30)
- CSS grid with named areas, varied tile sizes (1×1, 1×2, 2×1, 2×2)
- Each tile: phase-color tinted card with icon + title + 1-line description
- S30 CLOSE uses big-number variant (oversized numerals as hero tiles)

---

## 5. Motion Language

All animations use CSS `@keyframes` + `animation` properties. JS is used only for the typewriter effect and for respecting `prefers-reduced-motion`.

### 5.1 Animation vocabulary

| Name | Trigger | Duration | Easing | Reduced-motion fallback |
|---|---|---|---|---|
| **Phase intro sweep** | Slide change to new phase | 800ms | ease-out | instant |
| **Title underline shimmer** | Slide entry | 600ms | ease-in-out | skip |
| **Content stagger** | Slide entry | 60ms per item, cascading | ease-out | instant reveal |
| **Typewriter** | Slide entry (code blocks only) | 35ms/char | linear | instant reveal |
| **Cursor pulse** | After typewriter, continuous | 1s blink | step-end | hidden |
| **Hover lift** | `hover` on interactive chips/tiles | 150ms | ease | 0px lift |
| **Phase-color glow** | Continuous on slide-number indicator | 2s | ease-in-out, loop | none |

### 5.2 Timing guard
Total slide settling time (stagger + sweep) must not exceed 800ms. Slides with both phase sweep AND content stagger run them in parallel, not sequence.

### 5.3 Typewriter detail
- Triggered on `.slide.active .typewriter-target` elements
- Characters revealed by expanding `max-width` clip, not by JS DOM manipulation (CSS-only for performance)
- `Esc` key dispatches `skipTypewriter` event → instant reveal of all pending typewriters on current slide
- Cursor blink starts after reveal completes

### 5.4 Accessibility
- `@media (prefers-reduced-motion: reduce)` wraps all keyframe declarations; fallback is instant state
- Phase sweep: `animation: none`, final state set immediately
- Typewriter: content shown immediately, no cursor pulse
- All motion is decorative — no information is hidden behind animation

---

## 6. Typography System

### 6.1 Faces

| Role | Face | Weights | Usage |
|---|---|---|---|
| Display | Mona Sans (variable) | 800 | Slide hero headings only |
| Body | Inter (already loaded) | 400, 600 | Body copy, eyebrows, footer, facilitator cues |
| Mono | JetBrains Mono | 400, 700 | All code blocks, device chrome labels |

**Load via Google Fonts CDN** (single `<link>` in `<head>`):
```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Mona+Sans:wght@800&family=JetBrains+Mono:wght@400;700&display=swap" rel="stylesheet">
```

Note: Mona Sans is a GitHub-commissioned font available on Google Fonts as of 2024. If unavailable at build time, fallback: `'Geist', 'Inter', sans-serif`.

### 6.2 Scale
```css
--font-display: 'Mona Sans', 'Geist', 'Inter', sans-serif;
--font-body: 'Inter', system-ui, sans-serif;
--font-mono: 'JetBrains Mono', 'Fira Code', monospace;

/* Heading sizes: clamp(min, preferred, max) */
--size-hero: clamp(48px, 7vw, 96px);    /* display, weight 800 */
--size-h1: clamp(32px, 4.5vw, 60px);   /* body bold, weight 600 */
--size-h2: clamp(20px, 2.5vw, 32px);   /* section label, weight 600 */
--size-body: clamp(16px, 1.8vw, 22px); /* body, weight 400 */
--size-mono: clamp(13px, 1.4vw, 18px); /* code, weight 400 */
--size-eyebrow: clamp(11px, 1.2vw, 14px); /* phase label, weight 600, letter-spaced */
```

---

## 7. Phase Color Palette

Each phase gets two accent colors. These drive:
- Phase intro sweep background
- Gradient tint on slide (`background: linear-gradient(...)` at 6–8% opacity)
- Accent bars, borders, status pills
- Phase-color glow on slide-number indicator
- `layout-split` right-column tint

```css
/* CSS custom properties, set per-slide via JS data attribute or per-phase class */
--phase-a: ...;  /* primary */
--phase-b: ...;  /* secondary */

/* Values */
[data-phase="open"]      { --phase-a: #3b82f6; --phase-b: #a78bfa; }
[data-phase="safety"]    { --phase-a: #fbbf24; --phase-b: #f97316; }
[data-phase="quickwin"]  { --phase-a: #10b981; --phase-b: #34d399; }
[data-phase="decode"]    { --phase-a: #06b6d4; --phase-b: #22d3ee; }
[data-phase="plan"]      { --phase-a: #a78bfa; --phase-b: #c084fc; }
[data-phase="build"]     { --phase-a: #7c3aed; --phase-b: #a855f7; }
[data-phase="polish"]    { --phase-a: #ec4899; --phase-b: #f472b6; }
[data-phase="share"]     { --phase-a: #fbbf24; --phase-b: #fcd34d; }
[data-phase="levelup"]   { --phase-a: #10b981; --phase-b: #06b6d4; }
[data-phase="close"]     { --phase-a: #3b82f6; --phase-b: #06b6d4; }
```

Master surface colors unchanged: `--bg: #08081a`, `--surface: #111128`, `--text: #eeeef5`, `--muted: #8888aa`.

---

## 8. Device Chrome Components

All chrome is pure CSS + HTML. No external images. SVG inline for traffic lights.

### 8.1 Terminal (`<div class="chrome-terminal">`)
```
┌─ ◉ ◎ ◌  ~/workshop ──────────────────┐
│ $ cat CLAUDE.md                        │
│ # Workshop Notes_  ← cursor blinks    │
│ - Call me <nickname>                   │
└────────────────────────────────────────┘
```
- Traffic lights: inline SVG circles (red `#ff5f57`, yellow `#febc2e`, green `#28c840`)
- Title: `--font-mono`, `--muted`, small
- Prompt: `$` in `--phase-a`, command in `--text`
- Content: typewriter-eligible (`.typewriter-target`)
- Border: `1px solid rgba(255,255,255,0.12)`, `border-radius: 8px`

### 8.2 Browser (`<div class="chrome-browser">`)
```
┌─ ◉ ◎ ◌  [←] [→]  🔒 skills.sh  ─────┐
│ [tab: Skills.sh]                       │
│                                        │
│   (page content)                       │
└────────────────────────────────────────┘
```

### 8.3 Editor (`<div class="chrome-editor">`)
```
┌─ ◉ ◎ ◌ ─ [index.html ×] ─────────────┐
│ 📁 workshop/      │  1  <!DOCTYPE...   │
│   index.html  ← │  2  <html>          │
│   CLAUDE.md      │  3    <head>        │
└──────────────────┴────────────────────┘
```

### 8.4 Claude Code TUI (`<div class="chrome-claudecode">`)
```
┌─ Claude Code ──────────────────────────┐
│ > please install this skill from       │
│   https://github.com/...               │
│                                        │
│   ··· thinking                         │
│                                        │
│   ✓ Skill installed successfully       │
└────────────────────────────────────────┘
```

### 8.5 Chat bubble (`<div class="chrome-chat">`)
```
  You ──────────────────── [user bubble] │
  What is an agent?                      │

  Claude ─────────────── [claude bubble] │
  An agent can take actions, not just    │
  generate text...                       │
```
- User: right-aligned, `--surface2` background
- Claude: left-aligned, `--surface` background, subtle `--phase-a` left border

---

## 9. Updated Slide Index (33 slides)

```
S1   OPEN       · Title card
S2   OPEN       · Pre-test
S3   OPEN       · Consent
S4   OPEN       · Launch Claude (open terminal, type claude)
S4a  OPEN       · Install Claude Code [NEW]
S5   SAFETY     · Safety first
S6   SAFETY     · Pick nickname
S7   QUICKWIN   · Quick win — first page
S8   DECODE     · Chatbot vs Agent [REWRITTEN — capability matrix]
S9   DECODE     · CLAUDE.md + context
S10  DECODE     · Permissions · context · usage
S11  PLAN       · Plan beats prompt
S12  PLAN       · The pro workflow
S13  PLAN       · Make Claude interview you [REFRAMED — bridges to S13.5]
S13.5 PLAN      · Watch it happen — interview demo [NEW]
S14  PLAN       · A good plan has
S15  PLAN       · Plan check / scoreboard
S16  BUILD      · First main build prompt
S17  BUILD      · AI gets stuff wrong
S18  BUILD      · Fix it
S19  POLISH     · Open components
S20  POLISH     · UI quick wins
S21  POLISH     · Codex review
S22  SHARE      · Show & tell / fumble chip
S23  LEVELUP    · Skills — use & make [REFRAMED — bridges to S23a]
S23a LEVELUP    · Install a skill — skills.sh + TUI demo [NEW]
S24  LEVELUP    · MCP
S25  LEVELUP    · Automation
S26  LEVELUP    · Your toolchain
S27  LEVELUP    · What to read next
S28  CLOSE      · Post-test + survey
S29  CLOSE      · Remember
S30  CLOSE      · Thank you
```

---

## 10. Acceptance Criteria

### Content
- **AC1** S4a teaches npm install + `claude` verify with terminal chrome. Facilitator note visible (dimmed, toggle with `F` or `:facilitator` typed command).
- **AC2** S8 shows capability matrix with ✗/✅; claude.ai column neutral, Claude Code column in phase-a color.
- **AC3** S13 ends with explicit bridge to S13.5.
- **AC4** S13.5 shows Claude Code TUI chrome with interview questions flowing. Facilitator cue sidebar.
- **AC5** S23 ends with explicit bridge to S23a.
- **AC6** S23a shows browser chrome (skills.sh) + TUI chrome (install command + response) in bento layout.

### Layout
- **AC7** Each of the 6 layout patterns (`layout-stage`, `layout-split`, `layout-canvas`, `layout-magazine`, `layout-workshop`, `layout-bento`) is applied to the correct slides.
- **AC8** No slide uses the old single-skeleton layout (the pre-amendment `<h1> + .glass-card + body` pattern) — all slides migrate to one of the 6 templates.

### Motion
- **AC9** Phase intro sweep (800ms) fires on every phase transition (not on within-phase slide changes).
- **AC10** Title underline shimmer fires on every slide entry.
- **AC11** Content stagger: items reveal with 60ms cascade, total settle ≤ 800ms.
- **AC12** Typewriter fires on `.typewriter-target` elements in code-block chromes. `Esc` skips to instant reveal.
- **AC13** Cursor pulse visible after typewriter completes. Not visible mid-typewriter.
- **AC14** `prefers-reduced-motion: reduce` collapses all animations to instant state. No information hidden behind animation.

### Typography
- **AC15** Mona Sans (weight 800) loads via Google Fonts CDN and renders on hero headings.
- **AC16** JetBrains Mono loads and renders in all device chrome components.
- **AC17** Font fallbacks work without network: Geist/Inter for display, Fira Code/monospace for mono.

### Color
- **AC18** All 10 phase `data-phase` attributes are set on slides and phase CSS vars resolve correctly.
- **AC19** Phase gradient tint visible on slide background (6–8% opacity, not overwhelming).
- **AC20** Phase-color glow on slide-number indicator cycles smoothly.

### Device Chrome
- **AC21** Terminal chrome renders with traffic lights, `$` prompt, typewriter-eligible content area.
- **AC22** No external images — chrome is pure CSS/HTML/SVG.

### Preservation
- **AC23** S7 render counter still works.
- **AC24** S15 scoreboard (`:names on` / `:clear`) still works.
- **AC25** S22 fumble chip still works.
- **AC26** All keyboard navigation preserved: ← / → / Home / End / A (autoplay) / F (fullscreen).
- **AC27** Typed commands (`:names on`, `:clear`, any others) still work.
- **AC28** Total slide count is 33. `titles[]` array updated to 33 entries.

### Session timing
- **AC29** Footer phase-timing labels updated to reflect 125-min session (not 110).

---

## 11. Open Q-side items (not blocking implementation)

- IRB runbook wording (FA 2562 fills) — placeholder text remains
- AC13 IRB consult at T-7d before session
- AC8b HH216 projector dry-run at T-24h
- Confirm `skills.sh` URL to show in S23a (likely `skills.sh` directly)
- Decide whether Mona Sans or Geist for display face (Mona Sans preferred; Geist if Mona not on GFonts)
