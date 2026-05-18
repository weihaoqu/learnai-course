# 2026-05-18 Content + Motion Amendment

**Amends:** `2026-05-16-slide-redesign-design.md` + `2026-05-17-fancy-minimal-amendment.md`
**Branch:** `slide-redesign-2026-05`
**Status:** DRAFT — pending Codex review

---

## 0. Supersedes

This amendment explicitly supersedes the following sections of `2026-05-17-fancy-minimal-amendment.md`:

| Superseded section | What replaces it |
|---|---|
| §4 CSS variable system (`--phase-accent`, `phase-X` classes, single-accent rule) | §7 of this doc: per-phase 2-color palette (`--phase-a`, `--phase-b`, `data-phase` attribute) |
| §5 Motion system (3-animation vocabulary: entrance stagger, underline, click-to-copy pulse) | §6 of this doc: 7-animation vocabulary |
| §6 Typography (Inter variable only, `opsz` axis, 2-weight scale) | §8 of this doc: 3-face system (Mona Sans + Inter + JetBrains Mono) |
| §7 Layout (single skeleton: eyebrow → heading → card → body) | §5 of this doc: 6-template layout system |

**Preserved from 2026-05-17 amendment (not superseded):**
- Orbit-mark corner glyph (one node rotates per phase) — kept as-is. The orbit-mark depends on `.phase-X` CSS classes setting `--phase-accent` and `--phase-angle`. These classes must be **kept alongside** the new `data-phase` attributes — do not remove them. Both systems coexist: `.phase-X` drives orbit-mark; `data-phase` drives the new 2-color palette. **Critical implementation note:** do not remove `--phase-accent` from `.phase-X` class definitions — the orbit-mark node fill (`fill: var(--phase-accent)`) depends on it. The new palette adds `--phase-a`/`--phase-b` as separate variables; it does not replace `--phase-accent`.
- Click-to-copy on `.copy-block` with Web Clipboard API (`navigator.clipboard`) + `execCommand` fallback for non-secure contexts (file:// or http://). "copied ✓" state after 1400ms. Already implemented — do not change.
- Emoji ban (decorative emoji removed) — with **one explicit exception**: S8 capability matrix uses ✅ and ✗ as semantic content, not decoration. This is not a violation of the emoji-ban rule.
- `prefers-reduced-motion` mandate (scope extended in §6.7 of this doc)
- Live-moment features: S7 render counter, S15 plan-check scoreboard, S22 fumble chip — all preserved exactly
- `prefers-reduced-motion` behavior for live-moment features (unchanged from prior amendment)
- IRB/social-risk decisions: nicknames never projected, scoreboard `:names on` is opt-in

---

## 1. Overview

Two simultaneous changes to `session-materials/session-slides.html`:

1. **Content expansion** — 3 new slides + 2 strengthened slides mirroring Q's proven 1-on-1 arc: install → agent-vs-chat concrete → interview demo → skills install workflow. Session extends from 110 → **125 min**. First page rendered by students by **minute 30**.

2. **UI overhaul** — 6 phase-distinct layout templates, 7-animation motion language, 3-face typography system, per-phase 2-color accent palette. Directly addresses: static slides, formulaic layout, plain code blocks, flat/low-density color.

---

## 2. Scope

### In scope
- `session-materials/session-slides.html` — all slides (33 total after additions)
- `session-materials/1-session-agenda.md` — update to 125-min phase timing table

### Out of scope
- `starter.html`, `ops-fallback-checklist.md`, `IRB-non-consent-runbook.md` — no changes
- IRB consent/assent flow — no changes
- GitHub Pages deployment — no push without Q approval

---

## 3. 125-Min Phase Timing Table

This table is authoritative. Footer timing labels on each slide use these values. The agenda must be updated to match.

| Phase | Slides | Start | End | Duration |
|---|---|---|---|---|
| OPEN | S1–S4, S4a | 0:00 | 16:00 | 16 min |
| SAFETY | S5–S6 | 16:00 | 21:00 | 5 min |
| QUICK WIN | S7 | 21:00 | 29:00 | 8 min |
| DECODE | S8–S10 | 29:00 | 39:00 | 10 min |
| PLAN | S11–S13, S13.5, S14–S15 | 39:00 | 57:00 | 18 min |
| BUILD | S16–S18 | 57:00 | 75:00 | 18 min |
| POLISH | S19–S21 | 75:00 | 87:00 | 12 min |
| SHARE | S22 | 87:00 | 93:00 | 6 min |
| LEVEL UP | S23, S23a, S24–S27 | 93:00 | 115:00 | 22 min |
| CLOSE | S28–S30 | 115:00 | 125:00 | 10 min |

**First student page rendered: ~29:00** (end of Quick Win phase). The 110-min spec's "minute 25" target shifts to minute 30 because the OPEN phase now includes install.

---

## 4. Content Map — 33 Slides

### Updated slide index

```
S1   OPEN      · Title card
S2   OPEN      · Pre-test
S3   OPEN      · Consent
S4   OPEN      · Install Claude Code       [RENAMED + REWRITTEN — was "Launch Claude"]
S4a  OPEN      · You're in.                [NEW — verify + first CLI moment]
S5   SAFETY    · Safety first
S6   SAFETY    · Pick nickname
S7   QUICKWIN  · Quick win — first page
S8   DECODE    · Chatbot vs Agent           [REWRITTEN — capability matrix]
S9   DECODE    · CLAUDE.md & context
S10  DECODE    · Permissions · context · usage
S11  PLAN      · Plan beats prompt
S12  PLAN      · The pro workflow
S13  PLAN      · Make Claude interview you  [REFRAMED — bridges to S13.5]
S13.5 PLAN     · Watch it happen            [NEW — live interview demo]
S14  PLAN      · A good plan has
S15  PLAN      · Plan check / scoreboard
S16  BUILD     · First main build prompt
S17  BUILD     · AI gets stuff wrong
S18  BUILD     · Fix it
S19  POLISH    · Open components
S20  POLISH    · UI quick wins
S21  POLISH    · Codex review
S22  SHARE     · Show & tell / fumble chip
S23  LEVELUP   · Skills — use & make        [REFRAMED — bridges to S23a]
S23a LEVELUP   · Install a skill            [NEW — skills.sh + TUI demo]
S24  LEVELUP   · MCP
S25  LEVELUP   · Automation
S26  LEVELUP   · Your toolchain
S27  LEVELUP   · What to read next
S28  CLOSE     · Post-test + survey
S29  CLOSE     · Remember
S30  CLOSE     · Thank you
```

**Note on ordering:** S4 (Install) comes before S4a (Verify). Students must install before they can launch. Old S4 content ("type: claude") becomes the verify step of S4a.

### New and rewritten slides — content spec

#### S4 — Install Claude Code (replaces old "Launch Claude")
- **Heading:** `Install Claude Code.`
- **Time:** OPEN phase, ~6 min
- **Content:**
  - Terminal chrome: `npm install -g @anthropic-ai/claude-code` → wait → success
  - Terminal chrome: node prerequisite note (`node -v` if needed; point to nodejs.org)
  - Facilitator note (`:facilitator` typed command toggles visibility): "Q demos on projected laptop. Students follow on their own Mac."
- **Layout:** `layout-stage`

#### S4a — You're in.
- **Heading:** `You're in.`
- **Time:** OPEN phase, ~1 min
- **Content:**
  - Terminal chrome: `claude` → Claude Code TUI appears
  - Single body line: "This is your agent. It can edit files, run code, and build things."
- **Layout:** `layout-stage`

#### S8 — Chatbot vs Agent (rewritten)
- **Heading:** `Chatbot answers. Agent does.`
- **Time:** DECODE phase
- **Content:** side-by-side capability matrix

| Feature | claude.ai (chatbot) | Claude Code (agent) |
|---|---|---|
| Edit your files | ✗ | ✅ |
| Run terminal commands | ✗ | ✅ |
| Remember your project | ✗ | ✅ |
| Install skills | ✗ | ✅ |
| Build across a codebase | ✗ | ✅ |
| Answer questions | ✅ | ✅ |

Note: ✅ / ✗ here are **semantic content** — an explicit exception to the decorative-emoji ban. These must render as Unicode characters, not emoji images. CSS: `font-family: --font-body; font-variant: normal;`
- **Layout:** `layout-split` — chatbot column left (neutral), agent column right (phase-a accent tint)

#### S13 — Make Claude interview you (reframed)
- **Heading:** `Make Claude interview you.`
- **Change:** Add last line: "→ Next: watch it happen."
- **Layout:** unchanged (magazine spread)

#### S13.5 — Watch it happen (new)
- **Heading:** `Watch it happen.`
- **Time:** PLAN phase, ~5 min
- **Content:**
  - Claude Code TUI chrome showing interview questions flowing one at a time
  - Sidebar (facilitator-visible): "Student volunteer on Q's laptop. Prompt: tell Claude what you want to build."
  - Body: "One question at a time. Claude builds your plan."
- **Layout:** `layout-magazine` — TUI chrome 60% width, facilitator sidebar 40%

#### S23 — Skills (reframed)
- **Change:** Add last line: "→ Next: install one right now."
- **Layout:** unchanged (bento grid)

#### S23a — Install a Skill (new)
- **Heading:** `Add a superpower in 30 seconds.`
- **Time:** LEVEL UP phase, ~4 min
- **Content:**
  - Browser chrome: `skills.sh` — annotated with arrow "copy GitHub URL"
  - Claude Code TUI chrome: user types `"please install this skill from https://github.com/..."` → Claude installs → success
  - Callout tile: "This is how Q has 50+ skills."
- **Layout:** `layout-bento` — browser tile left (1×2), TUI tile right (1×2), callout tile bottom (2×1)

---

## 5. Layout System

Six named layout patterns applied via CSS class on `.slide`. All share CSS custom properties. Slides must not use the legacy pattern (bare `<h1>` + `.glass-card` + body text with no layout class).

### 5.1 Stage (`layout-stage`)
**Slides:** S1–S4a, S22 (SHARE phase)
- Single centered column, vertically centered
- Hero: `--font-display`, weight 800, `--size-hero`
- Phase eyebrow top-left, footer bottom
- Generous padding — no card overlay, no sidebar

### 5.2 Comparison/Split (`layout-split`)
**Slides:** S8–S10
- Two equal columns (`1fr 1fr`), separated by 1px `var(--phase-a)` divider at 40% opacity
- Left column: neutral palette (`--surface`, `--text`)
- Right column: `var(--phase-a)` at 8% opacity background tint, full-opacity labels
- Each column: heading + list or table

### 5.3 Live Canvas (`layout-canvas`)
**Slides:** S7
- Full-bleed content area — render counter as hero
- Phase eyebrow + slide number only
- Counter element uses display type, phase-a color
- **Exception:** S7 retains its `.copy-block` starter-prompt card as a secondary element below the counter. The counter is visually dominant; the copy-block sits beneath it at reduced scale. `layout-canvas` does not suppress `.copy-block` on S7.

### 5.4 Magazine Spread (`layout-magazine`)
**Slides:** S5–S6, S11–S15, S13.5
- Asymmetric grid: `2fr 1fr` (content + sidebar)
- Content: heading + body
- Sidebar: facilitator cues in `--muted`, `font-size: 0.85em`; hidden by default, shown via `:facilitator` typed command
- S15 scoreboard overrides sidebar with the live plan-check scoreboard

### 5.5 Workshop (`layout-workshop`)
**Slides:** S16–S21
- Center-dominant: large build prompt / code chrome occupies `min(680px, 80%)` center
- Narrow label strip left (`--phase-eyebrow`), quick-cue strip right (`--muted`)
- S19–S20 use a 3-card or 5-chip grid inside the center zone

### 5.6 Bento Grid (`layout-bento`)
**Slides:** S23, S23a, S24–S30
- CSS grid with named areas, tile sizes vary: `1×1`, `1×2`, `2×1`, `2×2`
- Each tile: `--surface` card, phase-a tint at 6%, `border-radius: var(--radius-sm)`
- S30 CLOSE big-number variant: hero tiles show oversized numerals (`font-size: clamp(80px, 12vw, 160px)`)

---

## 6. Motion Language

All motion uses CSS `@keyframes` declared outside any media query. `prefers-reduced-motion: reduce` applies `animation-duration: 0.001ms !important` globally, which collapses all animations to instant state without removing their structural role. Typewriter also checks `matchMedia` in JS.

**No information is ever hidden behind animation.** All text and content is present in the DOM. Animation affects opacity/transform/timing, not display or visibility.

### 6.1 Phase intro sweep
- **Trigger:** slide entry into a new phase (not within-phase slide changes)
- **What:** full-width bar in `--phase-a` slides in from left edge to right, then fades out. Height: 3px, `position: fixed`, `top: 0`.
- **Duration:** 800ms, `cubic-bezier(0.25, 0, 0, 1)`
- **Reduced-motion:** collapses to instant (0.001ms rule)

### 6.2 Title underline shimmer
- **Trigger:** every slide entry
- **What:** `<em>` inside `<h1>` gets an animated underline that sweeps right-to-left using `background-size` animation on a `linear-gradient` pseudo-element
- **Duration:** 600ms, `ease-in-out`
- **Reduced-motion:** instant (0.001ms rule)

### 6.3 Content stagger
- **Trigger:** every slide entry
- **What:** `.stagger-child` elements (list items, body paragraphs, cards) start at `opacity: 0, translateY: 8px` and animate to `opacity: 1, translateY: 0` with 60ms cascade delay between items
- **Total settle time:** ≤ 800ms. If >10 items, reduce delay to `40ms` to stay within budget.
- **Reduced-motion:** instant (0.001ms rule)

### 6.4 Typewriter
- **Trigger:** slide entry, on `.typewriter-target` elements inside device chrome
- **Implementation:** JS function. Characters appended one at a time to a visible `<span>` via `setInterval` at 35ms/char. A `.cursor` span with CSS blink follows the revealed text.
- **Skip:** `Esc` keydown calls `skipTypewriter()` — clears interval, sets `.typewriter-target` to full visible text, moves cursor to end. Only skips typewriters on the current active slide.
- **Conflict guard:** `skipTypewriter` must not interfere with typed-command input (`:names on`, `:clear`, etc.). Check `document.activeElement` is not an `<input>`.
- **Reduced-motion:** `matchMedia('(prefers-reduced-motion: reduce)').matches` → reveal full text immediately on entry, no interval

### 6.5 Cursor pulse
- **Trigger:** after typewriter completes (or immediately on reduced-motion fallback if cursor is shown)
- **What:** `.cursor::after { content: '|'; animation: blink 1s step-end infinite; }`
- **Reduced-motion:** cursor hidden (`display: none` inside reduced-motion media query override)

### 6.6 Hover lift
- **Trigger:** `hover` on `.skill-tile`, `.copy-block`, `.bento-tile`
- **What:** `transform: translateY(-2px)`, `box-shadow` adds 4px blur in `--phase-a` at 30% opacity
- **Duration:** 150ms, `ease`
- **Reduced-motion:** no transform change, only color shift (`:hover` border color → `--phase-a`)

### 6.7 Phase-color glow
- **Trigger:** continuous, on `.slide-number-indicator`
- **What:** `box-shadow` pulses between `0 0 4px var(--phase-a)` and `0 0 10px var(--phase-a)` in a 2s loop
- **Period:** 2s ± 200ms (measured)
- **Reduced-motion:** glow removed (`animation: none; box-shadow: none` inside reduced-motion query)

---

## 7. Phase Color Palette

Applied via `data-phase` attribute on each `.slide`. The attribute drives CSS custom properties using `[data-phase="..."]` selectors. These values replace the prior `--phase-accent` single-color system entirely.

```css
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

**Gradient tint:** `background: linear-gradient(135deg, color-mix(in srgb, var(--phase-a) 7%, transparent), transparent)`. Opacity equivalent: 7% (between 5–8%, measurable in DevTools).

**Master palette unchanged:** `--bg: #08081a`, `--surface: #111128`, `--surface2: #1a1a3e`, `--text: #eeeef5`, `--muted: #8888aa`.

---

## 8. Typography System

Three faces loaded via single Google Fonts CDN `<link>`. Added in `<head>` after existing meta tags.

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Mona+Sans:wght@800&family=JetBrains+Mono:wght@400;700&display=swap" rel="stylesheet">
```

**Note on Inter:** Inter is already loaded by the existing `<link>` tag in the HTML (prior to this amendment). The new CDN link adds only Mona Sans and JetBrains Mono. If the CDN is blocked, Inter loads from the existing link or browser cache; the new fonts degrade to fallbacks. Do not remove the existing Inter link.

| Role | Face | Weights | Usage |
|---|---|---|---|
| Display | Mona Sans | 800 | Slide hero `<h1>` only — layout-stage and layout-canvas |
| Body | Inter (already loaded) | 400, 600 | Body copy, eyebrows, footer, sidebar cues |
| Mono | JetBrains Mono | 400, 700 | All device chrome, code blocks |

```css
--font-display: 'Mona Sans', 'Inter', sans-serif;   /* fallback: Inter */
--font-body:    'Inter', system-ui, sans-serif;
--font-mono:    'JetBrains Mono', 'Fira Code', monospace;

--size-hero:    clamp(48px, 7vw, 96px);   /* display, 800 */
--size-h1:      clamp(32px, 4.5vw, 60px); /* body, 600 */
--size-h2:      clamp(20px, 2.5vw, 32px); /* section label, 600 */
--size-body:    clamp(16px, 1.8vw, 22px); /* body, 400 */
--size-mono:    clamp(13px, 1.4vw, 18px); /* code, 400 */
--size-eyebrow: clamp(11px, 1.2vw, 14px); /* tracked caps, 600 */
```

**Offline/no-CDN fallback:** If Mona Sans fails to load, Inter renders. Font display is `swap` so no FOIT. The slide deck works offline — only hero headings degrade to Inter (still acceptable).

**Font resolution:** Mona Sans is available on Google Fonts. If it becomes unavailable, replace with `'Geist'` which may need self-hosting. This is a Q decision, not an implementation blocker.

---

## 9. Device Chrome Components

Pure CSS + HTML + inline SVG. No external images. No CDN image dependencies.

### 9.1 Terminal (`<div class="chrome-terminal">`)
- Header bar: inline SVG traffic lights (◉ red `#ff5f57`, ◉ yellow `#febc2e`, ◉ green `#28c840`), title in `--font-mono --muted`
- Content area: `--font-mono`, `--text`; prompt `$` in `--phase-a`
- `.typewriter-target` inside content area is typewriter-eligible
- Border: `1px solid rgba(255,255,255,0.12)`, `border-radius: 8px`, `background: rgba(0,0,0,0.4)`

### 9.2 Browser (`<div class="chrome-browser">`)
- Header bar: traffic lights + back/fwd arrows (CSS `‹ ›`) + URL bar (`border-radius: 4px`, `--surface2`, lock icon `🔒` — semantic UI icon, not decorative) + tab strip
- Content area: white or near-white background to simulate real browser
- Note: `🔒` lock icon is a semantic UI cue (HTTPS), not decoration. Allowed exception per emoji-ban rule same as S8 ✅/✗.

### 9.3 Editor (`<div class="chrome-editor">`)
- Header: traffic lights + tab bar with filename + close ×
- Left sidebar: file tree (indented `<ul>` with folder/file CSS icons, no images)
- Content: line numbers column (`--muted`) + code column (`--font-mono`)
- Active file highlighted in sidebar: `--phase-a` at 15% background

### 9.4 Claude Code TUI (`<div class="chrome-claudecode">`)
- Header: `Claude Code` label in `--muted`, `--font-mono`
- Prompt: `>` in `--phase-a`, user input in `--text`
- Thinking indicator: `···` animated with `opacity` pulse (collapses to static under reduced-motion)
- Response: `--text` with subtle left border `2px solid var(--phase-a)`
- Success indicator: `✓` in `--phase-a` (semantic status, allowed)

### 9.5 Chat bubble (`<div class="chrome-chat">`)
- User message: right-aligned, `--surface2` background, `border-radius: 12px 12px 0 12px`
- Claude response: left-aligned, `--surface` background, `border-radius: 12px 12px 12px 0`, `2px solid var(--phase-a)` left border
- Used for: S8 illustration, S13.5 if needed

---

## 10. Keyboard and Typed-Command Preservation

### Preserved keyboard bindings (no changes to existing)
| Key | Action |
|---|---|
| `←` / `→` / `Space` / `PageDown` / `PageUp` | Navigation |
| `Home` / `End` | First / last slide |
| `F` | Toggle fullscreen |
| `I` | Toggle theme |
| `S` | Reveal next `.step` on current slide |
| `R` | S7: increment render counter (facilitator key) |
| `T` | S7: start 10-min countdown timer (facilitator key) |
| `A` | S15: record one plan-check approval (facilitator key) |

**There is no autoplay feature.** Prior spec references to `A = autoplay` were incorrect — `A` is the S15 approval key.

### New key (this amendment)
| Key | Action |
|---|---|
| `Esc` | Skip typewriter on current slide — reveal full text instantly |

### Facilitator notes
Toggled via typed command `:facilitator` only. `F` = fullscreen, unchanged.

### Existing typed commands (preserved)
- `:names on` / `:names off` — scoreboard mode
- `:clear` — wipe live-moment state

### New typed command (this amendment)
- `:facilitator` — toggle facilitator sidebar visibility

### Conflict guard for `Esc` / typewriter skip
The existing keydown guard (from commit `dc58cae`) already blocks typed-command keys during active input. `Esc` handler must check: only skip typewriter if no typed-command input is in progress.

---

## 11. Live-Moment Preservation

All three live moments must pass the following specific checks:

### S7 render counter
- Counter persists across slide changes (`sessionStorage` or module-level variable)
- Counter increments on user-triggered action (not auto)
- Display: `--font-display`, phase-a color, accessible label
- Reduced-motion: counter still increments; no animation on number change

### S15 plan-check scoreboard
- `:names on` activates named-mode; `:names off` reverts to count-only mode
- Count-only mode is default (no names projected — IRB requirement)
- Max display: 5 students (clamp-at-5)
- `A` / `a` key increments the approval count (facilitator presses once per student plan approved)
- `:clear` resets scoreboard to 0
- `sessionStorage` persists within the browser tab, **including across page reloads** — this is intentional
- Reduced-motion: checkmarks appear instantly, no slide-in animation

### S22 fumble chip
- Chip displayed after facilitator triggers (`:fumble` typed command or click — use whichever the prior implementation uses, do not change the trigger mechanism)
- No nicknames projected by default

---

## 12. Acceptance Criteria

### Content (S4, S4a, S8, S13, S13.5, S23, S23a)
- **AC1** S4 shows npm install command + node prerequisite note in terminal chrome. Facilitator note visible only when `:facilitator` is active.
- **AC2** S4a shows `claude` verify command in terminal chrome + Claude Code TUI appearing. Body text present.
- **AC3** S8 shows capability matrix with ✅ / ✗ as Unicode characters (not emoji images). Agent column has `--phase-a` tint. Matrix is factually accurate (no false claims).
- **AC4** S13 last line reads "→ Next: watch it happen." and links semantically to S13.5.
- **AC5** S13.5 shows Claude Code TUI chrome with interview questions. Facilitator sidebar cue present (hidden unless `:facilitator` active).
- **AC6** S23 last line reads "→ Next: install one right now."
- **AC7** S23a shows browser chrome (skills.sh) + Claude Code TUI chrome in bento layout. Callout tile present.

### Slide count and ordering
- **AC8** Total slide count is 33. `titles[]` JS array has exactly 33 entries matching the slide index in §4.
- **AC9** S4 (Install) appears before S4a (Verify) in DOM order and navigation.
- **AC10** `data-phase` attribute is set on every slide element. All 10 phase values from §7 are used.

### Layout
- **AC11** Every slide uses one of the 6 layout classes: `layout-stage`, `layout-split`, `layout-canvas`, `layout-magazine`, `layout-workshop`, `layout-bento`.
- **AC12** No slide uses the legacy pattern of bare `<h1>` + `.glass-card` + body text without a layout class.
- **AC13** `layout-split` slides (S8–S10) render two equal columns with phase-a divider.
- **AC14** `layout-bento` slides (S22–S30, S23a) render with CSS grid named areas and varied tile sizes.

### Motion
- **AC15** Phase intro sweep (3px bar, 800ms) fires on phase boundary changes. Does not fire on within-phase navigation.
- **AC16** Title underline shimmer fires on every slide entry (measured: ≤ 700ms duration).
- **AC17** Content stagger: ≥ 2 `.stagger-child` elements per slide cascade with 60ms delay. Total settle ≤ 800ms.
- **AC18** Typewriter fires on `.typewriter-target` in device chrome. `Esc` skips to full reveal. Skip does not interfere with typed commands.
- **AC19** Cursor pulse (`.cursor::after blink`) visible after typewriter completes. Not visible during typewriter. Hidden under reduced-motion.
- **AC20** Hover lift: `.bento-tile`, `.skill-tile`, `.copy-block` lift 2px on hover in browser. Under reduced-motion: no transform, border color changes to `--phase-a`.
- **AC21** Phase-color glow on slide-number indicator: period 2s ± 200ms (verifiable in DevTools Animations panel). Absent under reduced-motion.

### Reduced-motion
- **AC22** `@media (prefers-reduced-motion: reduce)` sets `*, *::before, *::after { animation-duration: 0.001ms !important; }` — collapses all CSS animations to instant.
- **AC23** Typewriter JS checks `matchMedia('(prefers-reduced-motion: reduce)').matches` on slide entry and reveals full text immediately if true.
- **AC24** No information is hidden by animation: all text is in the DOM regardless of animation state.

### Typography
- **AC25** Mona Sans weight 800 renders on hero `<h1>` in `layout-stage` and `layout-canvas` slides. Verified in DevTools Computed Styles.
- **AC26** JetBrains Mono renders in all device chrome elements. Verified in DevTools.
- **AC27** With Mona Sans / JetBrains Mono CDN blocked: display headings fall back to Inter (loaded by the pre-existing Inter `<link>` tag, not the new CDN link), code falls back to `'Fira Code', monospace`. Slide is fully legible. Verify: DevTools > Network > Block `fonts.googleapis.com`; Inter still renders.

### Phase palette
- **AC28** `[data-phase]` CSS selectors resolve `--phase-a` and `--phase-b` correctly for all 10 phases.
- **AC29** Slide background gradient tint: opacity in DevTools is between 5–8% (use color-mix output).

### Device chrome
- **AC30** Terminal chrome: traffic lights (3 circles) render with correct colors, no external images.
- **AC31** Browser chrome renders with URL bar, tab strip, and back/fwd controls — pure CSS/HTML.
- **AC32** Editor chrome renders with sidebar file tree, line numbers, and tab bar — pure CSS/HTML.
- **AC33** Claude Code TUI renders with `>` prompt, thinking indicator, and response area.
- **AC34** Chat bubble renders user (right) and Claude (left) messages with correct alignment and phase-a border.

### Live moments (preserved)
- **AC35** S7 render counter increments correctly and persists across navigation. No regression.
- **AC36** S15 scoreboard: `:names on` activates, `:names off` reverts, `:clear` resets to 0. Count-only is default. Clamp at 5. `A` key increments approval count. `sessionStorage` persists count within browser tab (including across page reloads — intentional).
- **AC37** S22 fumble chip displays correctly. No nicknames projected by default.

### Keyboard and commands
- **AC38** Navigation keys (← → Space PageDown PageUp Home End), `F` (fullscreen), `I` (theme), `S` (step reveal) all behave as before (no regression).
- **AC39** `R` increments S7 render counter. `T` starts S7 10-min timer. `A` increments S15 plan-check approval. All three are guarded: no-op outside their respective live-moment contexts.
- **AC40** `:facilitator` typed command toggles facilitator sidebar in `layout-magazine` slides. Sidebar hidden by default.
- **AC41** `:names on`, `:names off`, `:clear` still work (no regression).
- **AC43-b** `Esc` skips typewriter on current slide. Does not affect navigation or typed commands.

### Orbit-mark
- **AC44** Orbit-mark corner glyph renders on every slide. Node rotates to the correct `--phase-angle` for the current phase.
- **AC45** Both `.phase-X` CSS classes AND `data-phase` attributes are present on every slide element. Removing either breaks something: `.phase-X` = orbit-mark; `data-phase` = 2-color palette.

### Click-to-copy
- **AC46** Clicking a `.copy-block` on localhost:8765 copies text to clipboard (verified by pasting). The "copied ✓" label appears for ~1400ms.
- **AC47** Fallback path (`execCommand`) is present in code for non-secure contexts. Not regression-tested in isolation — existing implementation is preserved unchanged.

### Timing
- **AC42** Footer timing labels on all 33 slides match the phase timing table in §3.
- **AC43** `1-session-agenda.md` updated to 125-min schedule matching §3.

---

## 13. Open Q-side items (not blocking implementation)

- IRB runbook wording (FA 2562 fills) — placeholder text remains
- AC13 IRB consult at T-7d before session
- AC8b HH216 projector dry-run at T-24h
- Confirm exact skills.sh URL to display in S23a (likely `https://skills.sh`)
- If Mona Sans becomes unavailable on Google Fonts: Q decides whether to self-host Geist or stay on Inter fallback
