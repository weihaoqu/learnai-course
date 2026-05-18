# Content + Motion Amendment — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add 3 new slides + 2 rewrites to the 30-slide HS workshop deck AND overhaul the visual system with 6 layout templates, 7 animations, 3-face typography, per-phase 2-color palette, and 5 device chrome components — all in a single static HTML file.

**Architecture:** Every change lives in `session-materials/session-slides.html`. CSS is in the `<style>` block (~line 1–400). JS is in the `<script>` block (~line 1060–1395). Slide HTML is between them. No build step — edit and refresh. All verification is browser + DevTools + grep. Preserve all existing live-moment features (S7 counter, S15 scoreboard, S22 fumble chip) and keyboard handlers exactly.

**Tech Stack:** Vanilla HTML/CSS/JS. Google Fonts CDN (Mona Sans + JetBrains Mono). Python http.server for local serving (`python3 -m http.server 8765` from project root). No bundler, no framework, no npm.

**Spec:** `docs/superpowers/specs/2026-05-18-content-motion-amendment.md`
**Parent specs:** `docs/superpowers/specs/2026-05-16-slide-redesign-design.md`, `docs/superpowers/specs/2026-05-17-fancy-minimal-amendment.md`

---

## Files

| File | Action | What changes |
|---|---|---|
| `session-materials/session-slides.html` | Modify | All CSS, JS, slide HTML — primary target |
| `session-materials/1-session-agenda.md` | Modify | 110-min → 125-min timing table |

---

## Task 1: Google Fonts CDN + CSS custom property foundations

**Files:** Modify `session-materials/session-slides.html` lines ~1–10 (head) and ~1–50 (style block start)

- [ ] **Step 1: Add Google Fonts link in `<head>`**

  In `<head>`, after the existing `<meta>` tags and before any `<link rel="stylesheet">` or `<style>`, insert:
  ```html
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Mona+Sans:wght@800&family=JetBrains+Mono:wght@400;700&display=swap" rel="stylesheet">
  ```
  Do NOT remove the existing Inter `<link>` tag — Inter must stay loaded.

- [ ] **Step 2: Add font + size CSS custom properties at the top of `<style>`**

  After the existing `:root { }` block (or inside it if one exists), add:
  ```css
  :root {
    --font-display: 'Mona Sans', 'Inter', sans-serif;
    --font-body:    'Inter', system-ui, sans-serif;
    --font-mono:    'JetBrains Mono', 'Fira Code', monospace;

    --size-hero:    clamp(48px, 7vw, 96px);
    --size-h1:      clamp(32px, 4.5vw, 60px);
    --size-h2:      clamp(20px, 2.5vw, 32px);
    --size-body:    clamp(16px, 1.8vw, 22px);
    --size-mono:    clamp(13px, 1.4vw, 18px);
    --size-eyebrow: clamp(11px, 1.2vw, 14px);
  }
  ```

- [ ] **Step 3: Add `[data-phase]` CSS selectors for 2-color palette**

  After the existing `.slide.phase-X` class block (around line 154–163), add:
  ```css
  /* 2026-05-18 amendment — per-phase 2-color palette */
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
  **Do NOT modify the existing `.slide.phase-X` block** — those set `--phase-accent` and `--phase-angle` for the orbit-mark. Both systems must coexist.

- [ ] **Step 4: Verify in browser**

  Open `http://localhost:8765/session-materials/session-slides.html`.
  DevTools → Elements → pick any slide → Computed → filter `--phase-a`. Should resolve (e.g. `#3b82f6` on OPEN slides).
  DevTools → Elements → `<head>` → confirm Mona Sans link is present.

- [ ] **Step 5: Commit**
  ```bash
  git add session-materials/session-slides.html
  git commit -m "Add Mona Sans + JetBrains Mono CDN, font vars, per-phase data-phase palette"
  ```

---

## Task 2: Layout system CSS — 6 templates

**Files:** Modify `session-materials/session-slides.html` — `<style>` block, after phase palette selectors

- [ ] **Step 1: Add layout CSS**

  Insert after the `[data-phase]` block from Task 1:
  ```css
  /* ── Layout templates (2026-05-18 amendment) ── */

  /* Shared: all layout slides use position:relative for orbit-mark */
  .layout-stage, .layout-split, .layout-canvas,
  .layout-magazine, .layout-workshop, .layout-bento {
    display: flex;
    flex-direction: column;
    background: linear-gradient(135deg,
      color-mix(in srgb, var(--phase-a, #3b82f6) 7%, transparent),
      transparent);
  }

  /* Stage: hero type, centered, breathing room */
  .layout-stage {
    align-items: flex-start;
    justify-content: center;
    padding: clamp(2rem, 5vw, 5rem);
  }
  .layout-stage h1 {
    font-family: var(--font-display);
    font-size: var(--size-hero);
    font-weight: 800;
    line-height: 1.05;
    max-width: 16ch;
  }

  /* Split: two equal columns */
  .layout-split {
    flex-direction: row;
    padding: clamp(1.5rem, 3vw, 3rem);
    gap: 0;
  }
  .layout-split .split-col {
    flex: 1;
    padding: clamp(1rem, 2vw, 2rem);
    display: flex;
    flex-direction: column;
    gap: 1rem;
  }
  .layout-split .split-col + .split-col {
    border-left: 1px solid color-mix(in srgb, var(--phase-a) 40%, transparent);
    background: color-mix(in srgb, var(--phase-a) 8%, transparent);
  }

  /* Canvas: full-bleed, counter as hero */
  .layout-canvas {
    align-items: center;
    justify-content: center;
    padding: clamp(1rem, 2vw, 2rem);
    gap: 2rem;
  }
  .layout-canvas .canvas-hero {
    font-family: var(--font-display);
    font-size: clamp(80px, 14vw, 180px);
    font-weight: 800;
    color: var(--phase-a);
    line-height: 1;
  }

  /* Magazine: 2fr content + 1fr sidebar */
  .layout-magazine {
    display: grid;
    grid-template-columns: 2fr 1fr;
    grid-template-rows: auto 1fr;
    padding: clamp(1.5rem, 3vw, 3rem);
    gap: clamp(1rem, 2vw, 2rem);
  }
  .layout-magazine .mag-eyebrow { grid-column: 1 / -1; }
  .layout-magazine .mag-content { grid-column: 1; }
  .layout-magazine .mag-sidebar {
    grid-column: 2;
    font-size: 0.85em;
    color: var(--muted);
    border-left: 1px solid color-mix(in srgb, var(--phase-a) 30%, transparent);
    padding-left: 1rem;
    display: none; /* hidden unless :facilitator active */
  }
  body.facilitator-active .mag-sidebar { display: block; }

  /* Workshop: center-dominant with label strips */
  .layout-workshop {
    display: grid;
    grid-template-columns: 3rem 1fr 3rem;
    align-items: center;
    padding: clamp(1rem, 2vw, 2rem);
    gap: 1rem;
  }
  .layout-workshop .ws-label {
    writing-mode: vertical-rl;
    font-size: var(--size-eyebrow);
    color: var(--muted);
    letter-spacing: 0.1em;
    text-transform: uppercase;
  }
  .layout-workshop .ws-content {
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
    align-items: flex-start;
  }

  /* Bento: variable-size tile grid */
  .layout-bento {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    grid-template-rows: auto;
    padding: clamp(1rem, 2vw, 2rem);
    gap: clamp(0.5rem, 1vw, 1rem);
  }
  .bento-tile {
    background: color-mix(in srgb, var(--phase-a) 6%, var(--surface));
    border: 1px solid color-mix(in srgb, var(--phase-a) 20%, transparent);
    border-radius: var(--radius-sm, 12px);
    padding: clamp(0.8rem, 1.5vw, 1.5rem);
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
    transition: transform 150ms ease, box-shadow 150ms ease;
  }
  .bento-tile:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 16px color-mix(in srgb, var(--phase-a) 30%, transparent);
  }
  .bento-tile.span-2 { grid-column: span 2; }
  .bento-tile.span-row { grid-row: span 2; }
  ```

- [ ] **Step 2: Verify layout CSS renders**

  Open `http://localhost:8765/session-materials/session-slides.html`.
  Temporarily add `class="layout-stage"` to slide 1 in DevTools. Confirm it centers and uses display font.
  Temporarily add `class="layout-split"` to slide 8. Confirm two columns appear.
  Remove DevTools edits — just verifying CSS compiles without errors.

- [ ] **Step 3: Commit**
  ```bash
  git add session-materials/session-slides.html
  git commit -m "Add 6 layout template CSS classes (stage, split, canvas, magazine, workshop, bento)"
  ```

---

## Task 3: Motion language CSS

**Files:** Modify `session-materials/session-slides.html` — `<style>` block, after layout CSS

- [ ] **Step 1: Add keyframes and animation CSS**

  Insert after the layout CSS block:
  ```css
  /* ── Motion language (2026-05-18 amendment) ── */

  /* Reduced-motion: collapse all CSS animations globally */
  @media (prefers-reduced-motion: reduce) {
    *, *::before, *::after {
      animation-duration: 0.001ms !important;
      transition-duration: 0.001ms !important;
    }
  }

  /* 1. Phase intro sweep — 3px bar slides left→right on phase entry */
  @keyframes phaseSweep {
    from { transform: scaleX(0); }
    to   { transform: scaleX(1); }
  }
  .phase-sweep-bar {
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 3px;
    background: var(--phase-a, #3b82f6);
    transform-origin: left center;
    transform: scaleX(0);
    pointer-events: none;
    z-index: 1000;
  }
  .phase-sweep-bar.sweeping {
    animation: phaseSweep 800ms cubic-bezier(0.25, 0, 0, 1) forwards;
  }

  /* 2. Title underline shimmer — on slide entry */
  @keyframes underlineShimmer {
    from { background-size: 0% 2px; }
    to   { background-size: 100% 2px; }
  }
  .slide.active h1 em {
    background-image: linear-gradient(var(--phase-a, #3b82f6), var(--phase-a, #3b82f6));
    background-repeat: no-repeat;
    background-position: 0 100%;
    background-size: 0% 2px;
    animation: underlineShimmer 600ms ease-in-out 200ms forwards;
  }

  /* 3. Content stagger — .stagger-child elements */
  @keyframes fadeUp {
    from { opacity: 0; transform: translateY(8px); }
    to   { opacity: 1; transform: translateY(0); }
  }
  .slide.active .stagger-child {
    opacity: 0;
    animation: fadeUp 300ms ease-out forwards;
  }
  /* nth-child delays — up to 10 items, 60ms each */
  .slide.active .stagger-child:nth-child(1)  { animation-delay:  60ms; }
  .slide.active .stagger-child:nth-child(2)  { animation-delay: 120ms; }
  .slide.active .stagger-child:nth-child(3)  { animation-delay: 180ms; }
  .slide.active .stagger-child:nth-child(4)  { animation-delay: 240ms; }
  .slide.active .stagger-child:nth-child(5)  { animation-delay: 300ms; }
  .slide.active .stagger-child:nth-child(6)  { animation-delay: 360ms; }
  .slide.active .stagger-child:nth-child(7)  { animation-delay: 420ms; }
  .slide.active .stagger-child:nth-child(8)  { animation-delay: 480ms; }
  .slide.active .stagger-child:nth-child(9)  { animation-delay: 540ms; }
  .slide.active .stagger-child:nth-child(10) { animation-delay: 600ms; }

  /* 4. Cursor blink — used by typewriter */
  @keyframes cursorBlink {
    0%, 100% { opacity: 1; }
    50%       { opacity: 0; }
  }
  .cursor-blink {
    display: inline-block;
    width: 2px; height: 1em;
    background: var(--phase-a, #3b82f6);
    vertical-align: text-bottom;
    animation: cursorBlink 1s step-end infinite;
    margin-left: 1px;
  }
  @media (prefers-reduced-motion: reduce) {
    .cursor-blink { display: none; }
  }

  /* 5. Phase-color glow on slide-number indicator */
  @keyframes phaseGlow {
    0%, 100% { box-shadow: 0 0 4px var(--phase-a, #3b82f6); }
    50%       { box-shadow: 0 0 10px var(--phase-a, #3b82f6); }
  }
  .slide-number-indicator {
    animation: phaseGlow 2s ease-in-out infinite;
  }
  @media (prefers-reduced-motion: reduce) {
    .slide-number-indicator { animation: none; box-shadow: none; }
  }

  /* 6. Hover lift — copy-blocks and bento tiles */
  .copy-block:hover, .bento-tile:hover, .skill-tile:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 16px color-mix(in srgb, var(--phase-a, #3b82f6) 30%, transparent);
  }
  @media (prefers-reduced-motion: reduce) {
    .copy-block:hover, .bento-tile:hover, .skill-tile:hover {
      transform: none;
      border-color: var(--phase-a, #3b82f6);
    }
  }
  ```

- [ ] **Step 2: Add JS for phase sweep — insert in `<script>` block**

  In the JS section, find the `show(n)` function (or wherever slide transitions happen). After the slide `.active` class is set, add a call to trigger the phase sweep:
  ```js
  // Phase intro sweep — fires only on phase boundary changes
  let lastPhase = null;
  function maybeFirePhaseSweep(slideEl) {
    const phase = slideEl.dataset.phase;
    if (phase && phase !== lastPhase) {
      lastPhase = phase;
      const bar = document.querySelector('.phase-sweep-bar');
      if (!bar) return;
      bar.classList.remove('sweeping');
      void bar.offsetWidth; // force reflow to restart animation
      bar.classList.add('sweeping');
      bar.addEventListener('animationend', () => bar.classList.remove('sweeping'), { once: true });
    }
  }
  ```
  Call `maybeFirePhaseSweep(slides[n])` inside the `show(n)` function after setting the active slide.

- [ ] **Step 3: Add `.phase-sweep-bar` div to `<body>`**

  At the very top of `<body>` (before any slide divs), add:
  ```html
  <div class="phase-sweep-bar" aria-hidden="true"></div>
  ```

- [ ] **Step 4: Add `.slide-number-indicator` element if not present**

  The existing footer likely shows the slide count. Find the element displaying the current slide number (e.g., `id="slideNum"` or similar). Add class `slide-number-indicator` to it so the glow animation applies.

- [ ] **Step 5: Verify motion**

  Open deck in browser. Navigate S7 → S8 (phase change). Confirm a brief colored bar flashes at top.
  Then navigate S8 → S9 → S10 (all within DECODE phase). Confirm bar does NOT appear on those transitions — within-phase navigation must be silent.
  Check DevTools Animation panel: `underlineShimmer` fires on `<em>` inside `<h1>` on every slide entry.

- [ ] **Step 6: Commit**
  ```bash
  git add session-materials/session-slides.html
  git commit -m "Add 7-animation motion language CSS + phase sweep JS"
  ```

---

## Task 4: Device chrome CSS components

**Files:** Modify `session-materials/session-slides.html` — `<style>` block, after motion CSS

- [ ] **Step 1: Add device chrome CSS**

  Insert after the motion CSS block:
  ```css
  /* ── Device chrome components (2026-05-18 amendment) ── */

  /* Shared chrome wrapper */
  .chrome-wrap {
    border-radius: 8px;
    overflow: hidden;
    border: 1px solid rgba(255,255,255,0.12);
    background: rgba(0,0,0,0.4);
    font-family: var(--font-mono);
    font-size: var(--size-mono);
  }
  .chrome-titlebar {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.4rem 0.75rem;
    background: rgba(255,255,255,0.05);
    border-bottom: 1px solid rgba(255,255,255,0.08);
  }
  .chrome-lights {
    display: flex; gap: 5px;
  }
  .chrome-lights span {
    width: 11px; height: 11px;
    border-radius: 50%;
    display: inline-block;
  }
  .chrome-lights .red    { background: #ff5f57; }
  .chrome-lights .yellow { background: #febc2e; }
  .chrome-lights .green  { background: #28c840; }
  .chrome-title {
    font-size: 0.72em;
    color: var(--muted);
    margin-left: 0.25rem;
  }
  .chrome-body {
    padding: 0.75rem 1rem;
    line-height: 1.6;
  }

  /* Terminal: prompt style */
  .chrome-terminal .prompt { color: var(--phase-a, #3b82f6); }
  .chrome-terminal .cmd    { color: var(--text); }
  .chrome-terminal .output { color: var(--muted); }

  /* Browser: URL bar */
  .chrome-browser .url-bar {
    flex: 1;
    background: rgba(255,255,255,0.08);
    border-radius: 4px;
    padding: 0.15rem 0.5rem;
    font-size: 0.75em;
    color: var(--text);
  }
  .chrome-browser .chrome-body {
    background: rgba(255,255,255,0.03);
  }

  /* Editor: sidebar + line numbers */
  .chrome-editor { display: flex; flex-direction: column; }
  .chrome-editor .editor-layout {
    display: flex; flex: 1;
  }
  .chrome-editor .editor-sidebar {
    width: 140px;
    background: rgba(255,255,255,0.03);
    border-right: 1px solid rgba(255,255,255,0.08);
    padding: 0.5rem;
    font-size: 0.75em;
    color: var(--muted);
  }
  .chrome-editor .editor-sidebar .active-file {
    background: color-mix(in srgb, var(--phase-a) 15%, transparent);
    border-radius: 3px;
    color: var(--text);
  }
  .chrome-editor .editor-content {
    flex: 1;
    display: flex;
    padding: 0.5rem 0;
  }
  .chrome-editor .line-nums {
    padding: 0 0.5rem;
    color: var(--muted);
    opacity: 0.5;
    user-select: none;
    text-align: right;
    min-width: 2rem;
  }
  .chrome-editor .code-area {
    padding: 0 0.75rem;
    color: var(--text);
  }

  /* Claude Code TUI */
  .chrome-claudecode .tui-prompt { color: var(--phase-a, #3b82f6); }
  .chrome-claudecode .tui-user   { color: var(--text); }
  .chrome-claudecode .tui-thinking {
    color: var(--muted);
    font-style: italic;
  }
  .chrome-claudecode .tui-response {
    color: var(--text);
    border-left: 2px solid var(--phase-a, #3b82f6);
    padding-left: 0.75rem;
    margin-top: 0.5rem;
  }
  .chrome-claudecode .tui-success {
    color: var(--phase-a, #3b82f6);
  }

  /* Chat bubbles */
  .chrome-chat { display: flex; flex-direction: column; gap: 0.75rem; padding: 0.75rem; }
  .chat-msg    { max-width: 80%; padding: 0.6rem 0.9rem; border-radius: 12px; font-size: 0.9em; }
  .chat-user   {
    align-self: flex-end;
    background: var(--surface2, #1a1a3e);
    border-radius: 12px 12px 0 12px;
    color: var(--text);
  }
  .chat-claude {
    align-self: flex-start;
    background: var(--surface, #111128);
    border-radius: 12px 12px 12px 0;
    border-left: 2px solid var(--phase-a, #3b82f6);
    color: var(--text);
  }
  ```

- [ ] **Step 2: Verify chrome renders**

  Temporarily add this test HTML to `<body>` (remove after check):
  ```html
  <div class="chrome-wrap chrome-terminal" style="max-width:400px;margin:2rem auto;">
    <div class="chrome-titlebar">
      <div class="chrome-lights"><span class="red"></span><span class="yellow"></span><span class="green"></span></div>
      <span class="chrome-title">~/workshop</span>
    </div>
    <div class="chrome-body">
      <span class="prompt">$</span> <span class="cmd">npm install -g @anthropic-ai/claude-code</span>
    </div>
  </div>
  ```
  Open browser — confirm traffic lights are colored circles, prompt `$` is in phase-a color, background is dark.

- [ ] **Step 3: Remove test HTML, commit**
  ```bash
  git add session-materials/session-slides.html
  git commit -m "Add device chrome CSS: terminal, browser, editor, TUI, chat bubble"
  ```

---

## Task 5: Typewriter JS + Esc handler + `:facilitator` command

**Files:** Modify `session-materials/session-slides.html` — `<script>` block

- [ ] **Step 1: Add typewriter function in JS**

  In the `<script>` block, before the closing `})` or at the end, add:
  ```js
  // ── Typewriter (2026-05-18 amendment) ──
  // Reveals .typewriter-target content char-by-char.
  // Respects prefers-reduced-motion: reveals instantly if reduced.
  const reducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)');

  function runTypewriter(el) {
    if (!el || el.dataset.twDone) return;
    el.dataset.twDone = '1';
    const full = el.dataset.twText || el.textContent;
    el.dataset.twText = full; // store original on first run
    el.textContent = '';

    // Add cursor
    const cursor = document.createElement('span');
    cursor.className = 'cursor-blink';
    el.parentNode.insertBefore(cursor, el.nextSibling);

    if (reducedMotion.matches) {
      el.textContent = full;
      return;
    }

    let i = 0;
    const interval = setInterval(() => {
      el.textContent = full.slice(0, ++i);
      if (i >= full.length) clearInterval(interval);
    }, 35);
    el._twInterval = interval;
  }

  function skipTypewriter(slide) {
    (slide || document).querySelectorAll('.typewriter-target').forEach(el => {
      if (el._twInterval) clearInterval(el._twInterval);
      if (el.dataset.twText) el.textContent = el.dataset.twText;
    });
  }

  function wireTypewriters(slide) {
    slide.querySelectorAll('.typewriter-target').forEach(el => {
      delete el.dataset.twDone; // reset for re-entry
    });
  }
  ```

- [ ] **Step 2: Call typewriter on slide entry**

  Find the `show(n)` function. After the slide becomes active (`.active` class set), add:
  ```js
  // Reset + run typewriters on new slide
  wireTypewriters(slides[n]);
  // Small delay so stagger animation starts first
  setTimeout(() => {
    slides[n].querySelectorAll('.typewriter-target').forEach(runTypewriter);
  }, 400);
  ```

- [ ] **Step 3: Confirm guard token, then add Esc key handler**

  First, grep to confirm the typed-command guard token name:
  ```bash
  grep -n '__typingCommand\|typingCommand\|colonCommand' session-materials/session-slides.html | head -10
  ```
  The existing keydown handler guards with `if (window.__typingCommand) return;` at line ~1093. Use the same token name.

  In the existing `document.addEventListener('keydown', ...)` handler, add a new branch:
  ```js
  else if (e.key === 'Escape') {
    // Skip typewriter if not in typed-command mode
    if (!window.__typingCommand) {
      e.preventDefault();
      skipTypewriter(slides[current]);
    }
  }
  ```
  Place this after the existing `else if` branches but before the closing `}` of the keydown handler.

- [ ] **Step 4: Add `:facilitator` typed command**

  Find where `:names on` and `:clear` typed commands are handled (search for `typedCommand` or `colonCommand` in the JS). In the same switch/if block, add:
  ```js
  case 'facilitator':
    document.body.classList.toggle('facilitator-active');
    break;
  ```

- [ ] **Step 5: Verify**

  Add `.typewriter-target` to a code snippet on any slide temporarily in DevTools. Navigate to that slide — content should type out at ~35ms/char. Press Esc — content should appear instantly.
  Type `:facilitator` → `.mag-sidebar` elements should appear/disappear.

- [ ] **Step 6: Commit**
  ```bash
  git add session-materials/session-slides.html
  git commit -m "Add typewriter JS, Esc-skip handler, :facilitator typed command"
  ```

---

## Task 6: Add `data-phase` attributes + layout classes to all 30 existing slides

**Files:** Modify `session-materials/session-slides.html` — slide HTML

This is mechanical. For each `.slide` div, add `data-phase="..."` and the correct layout class. Use the mapping below.

- [ ] **Step 1: Apply attributes slide by slide**

  For each slide, find the `<div class="slide phase-X ...">` opening tag and:
  1. Add `data-phase="PHASENAME"` attribute
  2. Add the layout class

  **Mapping (before S4a and S13.5 and S23a are added):**

  | Slide# | Phase class | `data-phase` | Layout class |
  |---|---|---|---|
  | S1 | phase-open | open | layout-stage |
  | S2 | phase-open | open | layout-stage |
  | S3 | phase-open | open | layout-stage |
  | S4 | phase-open | open | layout-stage |
  | S5 | phase-safety | safety | layout-magazine |
  | S6 | phase-safety | safety | layout-magazine |
  | S7 | phase-quickwin | quickwin | layout-canvas |
  | S8 | phase-decode | decode | layout-split |
  | S9 | phase-decode | decode | layout-split |
  | S10 | phase-decode | decode | layout-split |
  | S11 | phase-plan | plan | layout-magazine |
  | S12 | phase-plan | plan | layout-magazine |
  | S13 | phase-plan | plan | layout-magazine |
  | S14 | phase-plan | plan | layout-magazine |
  | S15 | phase-plan | plan | layout-magazine |
  | S16 | phase-build | build | layout-workshop |
  | S17 | phase-build | build | layout-workshop |
  | S18 | phase-build | build | layout-workshop |
  | S19 | phase-polish | polish | layout-workshop |
  | S20 | phase-polish | polish | layout-workshop |
  | S21 | phase-polish | polish | layout-workshop |
  | S22 | phase-share | share | layout-stage |
  | S23 | phase-levelup | levelup | layout-bento |
  | S24 | phase-levelup | levelup | layout-bento |
  | S25 | phase-levelup | levelup | layout-bento |
  | S26 | phase-levelup | levelup | layout-bento |
  | S27 | phase-levelup | levelup | layout-bento |
  | S28 | phase-close | close | layout-bento |
  | S29 | phase-close | close | layout-bento |
  | S30 | phase-close | close | layout-bento |

  Example — S1 before:
  ```html
  <div class="slide phase-open active">
  ```
  S1 after:
  ```html
  <div class="slide phase-open layout-stage active" data-phase="open">
  ```

- [ ] **Step 2: Add `.stagger-child` to list items in magazine/workshop/bento slides**

  For slides using `layout-magazine`, `layout-workshop`, `layout-bento`: find `<li>`, `<p>`, and `<div class="...card">` elements that are direct content children and add `class="stagger-child"` (or append to existing class).

  **Exclude these live-moment widget elements — do NOT add `.stagger-child` inside them:**
  - `#scoreboardArea` or any parent of `#scoreboard` (S15) — animation on scoreboard breaks live-count display
  - `#renderCount` and its container (S7) — counter must be visible instantly, not faded in
  - `.fumble-chip` and its container (S22) — already has its own static animation per spec

- [ ] **Step 3: Verify**

  Open deck in browser. Navigate through all 30 slides. Confirm:
  - Phase gradient tint visible on each slide (faint colored background)
  - Layout differences visible between phase types (e.g., S8 shows two columns)
  - Phase sweep fires between phase boundaries
  - Orbit-mark glyph still visible on all slides

- [ ] **Step 4: Commit**
  ```bash
  git add session-materials/session-slides.html
  git commit -m "Apply data-phase + layout classes to all 30 existing slides"
  ```

---

## Task 7: Rewrite S4 — Install Claude Code

**Files:** Modify `session-materials/session-slides.html` — S4 slide HTML

S4 currently reads: heading "Open terminal. Type: *claude*" + brief body. Replace entirely.

- [ ] **Step 1: Replace S4 slide content**

  Find the S4 `<div class="slide phase-open ...">` block (look for "Open terminal" heading or the `titles[3]` reference). Replace the inner content with:
  ```html
  <p class="phase-eyebrow stagger-child">— PHASE 01 · OPEN</p>
  <h1 class="stagger-child">Install Claude Code.</h1>

  <div class="chrome-wrap chrome-terminal stagger-child" style="max-width: min(640px, 90%); margin-top: 1.5rem;">
    <div class="chrome-titlebar">
      <div class="chrome-lights"><span class="red"></span><span class="yellow"></span><span class="green"></span></div>
      <span class="chrome-title">~/workshop</span>
    </div>
    <div class="chrome-body">
      <div><span class="prompt">$</span> <span class="cmd typewriter-target">npm install -g @anthropic-ai/claude-code</span></div>
      <div class="output" style="margin-top:0.5rem;">added 847 packages in 12s</div>
      <div class="output">✓ claude-code installed successfully</div>
    </div>
  </div>

  <p class="stagger-child muted" style="margin-top: 1.5rem; font-size: 0.85em;">
    Need Node first? → <strong>nodejs.org</strong> → install LTS
  </p>

  <p class="mag-sidebar facilitator-note stagger-child" style="margin-top:2rem; font-size:0.8em; color: var(--muted);">
    <em>Facilitator:</em> Demo on your laptop. Students follow on their own Mac.
    If someone's stuck: pair them with a neighbor who's done.
  </p>
  ```
  Note: The facilitator note is always in the DOM — CSS hides it unless `:facilitator` is active. Use `display: none` by default via a CSS rule:
  ```css
  .facilitator-note { display: none; }
  body.facilitator-active .facilitator-note { display: block; }
  ```
  Add this CSS rule to the `<style>` block.

- [ ] **Step 2: Update `titles[3]` in JS array**

  Find `const titles = [...]` near the bottom of `<script>`. Change index 3 (0-based, S4):
  ```js
  // Before:
  'Launch Claude'
  // After:
  'Install Claude Code'
  ```

- [ ] **Step 3: Verify**

  Navigate to S4. Confirm:
  - Terminal chrome renders with traffic lights and npm install command
  - Typewriter runs on the command text
  - Facilitator note hidden by default; appears when `:facilitator` typed
  - Orbit-mark still visible bottom-right

- [ ] **Step 4: Commit**
  ```bash
  git add session-materials/session-slides.html
  git commit -m "Rewrite S4: Install Claude Code with terminal chrome + typewriter"
  ```

---

## Task 8: Insert S4a — You're in

**Files:** Modify `session-materials/session-slides.html` — insert new slide after S4

- [ ] **Step 1: Insert S4a slide HTML after S4's closing `</div>`**

  ```html
  <!-- ═══ S4a OPEN — You're in ═══ -->
  <div class="slide phase-open layout-stage" data-phase="open">
    <p class="phase-eyebrow stagger-child">— PHASE 01 · OPEN</p>
    <h1 class="stagger-child">You're in.</h1>

    <div class="chrome-wrap chrome-claudecode stagger-child" style="max-width: min(560px, 90%); margin-top: 1.5rem;">
      <div class="chrome-titlebar">
        <div class="chrome-lights"><span class="red"></span><span class="yellow"></span><span class="green"></span></div>
        <span class="chrome-title">Claude Code</span>
      </div>
      <div class="chrome-body">
        <div><span class="tui-prompt">&gt;</span> <span class="tui-user typewriter-target">claude</span></div>
        <div class="tui-response" style="margin-top:0.75rem;">
          Hi! I'm Claude. I can read your files, write code, run commands,<br>
          and build things with you. What are we making today?
        </div>
      </div>
    </div>

    <p class="stagger-child" style="margin-top: 1.5rem; max-width: 40ch;">
      This is your agent. It edits files, runs code, and builds things.
    </p>

    <div class="slide-footer">
      <span>— PHASE 01 · OPEN · 0:00 — 16:00</span>
      <span class="slide-number-indicator"></span>
    </div>
    <div class="orbit-mark" aria-hidden="true">
      <svg viewBox="0 0 28 28"><circle class="ring" cx="14" cy="14" r="11"/><circle class="node" cx="14" cy="3" r="2"/></svg>
    </div>
  </div>
  ```

- [ ] **Step 2: Update `titles[]` JS array — insert at index 4 (0-based)**

  ```js
  // Before index 4: 'Safety First'
  // After insertion:
  titles = ['AI Engineering Academy','Pre-Test','Consent','Install Claude Code','You\'re In',
            'Safety First', ...]
  // Total count grows from 30 → 31 (more insertions in later tasks)
  ```
  Insert `"You're In"` at index 4, shifting all subsequent titles right.

- [ ] **Step 3: Verify**

  Navigate deck: S4 (Install) → S4a (You're in). Both slide correctly. Navigation arrows work. Orbit-mark and footer visible.

- [ ] **Step 4: Commit**
  ```bash
  git add session-materials/session-slides.html
  git commit -m "Insert S4a: You're in — verify CLI launch + Claude Code TUI chrome"
  ```

---

## Task 9: Rewrite S8 — Chatbot vs Agent capability matrix

**Files:** Modify `session-materials/session-slides.html` — S8 slide HTML
(Note: S8 is now at array index 8 after S4a insertion — find it by its current content "Chatbot answers. Agent does.")

- [ ] **Step 1: Replace S8 inner content with split layout**

  S8 already has `layout-split` and `data-phase="decode"` from Task 6. Replace its inner HTML:
  ```html
  <p class="phase-eyebrow" style="grid-column: 1/-1">— PHASE 04 · DECODE</p>

  <div class="split-col">
    <h2 style="color: var(--muted); font-size: var(--size-h2);">claude.ai</h2>
    <p class="muted" style="font-size: 0.85em;">Chat. Answers. Explains.</p>
    <table style="border-collapse: collapse; width: 100%; margin-top: 0.5rem;">
      <tr class="stagger-child"><td style="padding: 0.4rem 0; color: var(--muted);">Edit your files</td><td style="text-align:center; color: #ef4444;">✗</td></tr>
      <tr class="stagger-child"><td style="padding: 0.4rem 0; color: var(--muted);">Run terminal commands</td><td style="text-align:center; color: #ef4444;">✗</td></tr>
      <tr class="stagger-child"><td style="padding: 0.4rem 0; color: var(--muted);">Remember your project</td><td style="text-align:center; color: #ef4444;">✗</td></tr>
      <tr class="stagger-child"><td style="padding: 0.4rem 0; color: var(--muted);">Install skills</td><td style="text-align:center; color: #ef4444;">✗</td></tr>
      <tr class="stagger-child"><td style="padding: 0.4rem 0; color: var(--muted);">Build across a codebase</td><td style="text-align:center; color: #ef4444;">✗</td></tr>
      <tr class="stagger-child"><td style="padding: 0.4rem 0; color: var(--muted);">Answer questions</td><td style="text-align:center; color: var(--phase-a);">✅</td></tr>
    </table>
  </div>

  <div class="split-col">
    <h2 style="color: var(--phase-a); font-size: var(--size-h2);">Claude Code</h2>
    <p class="muted" style="font-size: 0.85em;">Agent. Acts. Builds.</p>
    <table style="border-collapse: collapse; width: 100%; margin-top: 0.5rem;">
      <tr class="stagger-child"><td style="padding: 0.4rem 0;">Edit your files</td><td style="text-align:center; color: var(--phase-a);">✅</td></tr>
      <tr class="stagger-child"><td style="padding: 0.4rem 0;">Run terminal commands</td><td style="text-align:center; color: var(--phase-a);">✅</td></tr>
      <tr class="stagger-child"><td style="padding: 0.4rem 0;">Remember your project</td><td style="text-align:center; color: var(--phase-a);">✅</td></tr>
      <tr class="stagger-child"><td style="padding: 0.4rem 0;">Install skills</td><td style="text-align:center; color: var(--phase-a);">✅</td></tr>
      <tr class="stagger-child"><td style="padding: 0.4rem 0;">Build across a codebase</td><td style="text-align:center; color: var(--phase-a);">✅</td></tr>
      <tr class="stagger-child"><td style="padding: 0.4rem 0;">Answer questions</td><td style="text-align:center; color: var(--phase-a);">✅</td></tr>
    </table>
  </div>
  ```
  Note: ✅ and ✗ are Unicode characters — not emoji images. This is the allowed exception per spec §4.

- [ ] **Step 2: Verify**

  Navigate to S8. Two columns appear separated by phase-colored border. Left column neutral, right column with phase tint. ✅ and ✗ readable.

- [ ] **Step 3: Commit**
  ```bash
  git add session-materials/session-slides.html
  git commit -m "Rewrite S8: Chatbot vs Agent capability matrix with layout-split"
  ```

---

## Task 10: Reframe S13 + Insert S13.5 — Interview Demo

**Files:** Modify `session-materials/session-slides.html` — S13 and insert S13.5

- [ ] **Step 1: Add bridge line to S13**

  Find S13 "Make Claude interview you." Find its last `<p>` or body element. Add after it:
  ```html
  <p class="stagger-child" style="margin-top: 1.5rem; color: var(--phase-a); font-weight: 600;">
    → Next: watch it happen.
  </p>
  ```

- [ ] **Step 2: Insert S13.5 after S13's closing `</div>`**

  ```html
  <!-- ═══ S13.5 PLAN — Watch it happen (interview demo) ═══ -->
  <div class="slide phase-plan layout-magazine" data-phase="plan">
    <p class="phase-eyebrow mag-eyebrow stagger-child">— PHASE 05 · PLAN</p>

    <div class="mag-content">
      <h1 class="stagger-child">Watch it happen.</h1>
      <div class="chrome-wrap chrome-claudecode stagger-child" style="margin-top: 1.5rem; max-width: 520px;">
        <div class="chrome-titlebar">
          <div class="chrome-lights"><span class="red"></span><span class="yellow"></span><span class="green"></span></div>
          <span class="chrome-title">Claude Code — interview skill</span>
        </div>
        <div class="chrome-body">
          <div class="tui-response" style="margin-bottom: 0.75rem;">
            Let's build your plan. First question:<br>
            <strong>What do you want someone to be able to do with what you build?</strong>
          </div>
          <div><span class="tui-prompt">&gt;</span> <span class="tui-user typewriter-target">I want people to be able to track their mood every day</span></div>
          <div class="tui-thinking" style="margin-top:0.5rem;">··· thinking</div>
          <div class="tui-response" style="margin-top:0.5rem;">
            Nice. Next question:<br>
            <strong>Who's using it — just you, or others?</strong>
          </div>
        </div>
      </div>
      <p class="stagger-child" style="margin-top: 1rem;">One question at a time. Claude builds your plan.</p>
    </div>

    <div class="mag-sidebar facilitator-note">
      <strong>Facilitator cue:</strong><br>
      Student volunteer on your laptop.<br>
      Prompt: "Tell Claude what you want to build. Use the interview skill."<br>
      Let it run 3–4 questions. Then move on.
    </div>

    <div class="slide-footer">
      <span>— PHASE 05 · PLAN · 39:00 — 57:00</span>
      <span class="slide-number-indicator"></span>
    </div>
    <div class="orbit-mark" aria-hidden="true">
      <svg viewBox="0 0 28 28"><circle class="ring" cx="14" cy="14" r="11"/><circle class="node" cx="14" cy="3" r="2"/></svg>
    </div>
  </div>
  ```

- [ ] **Step 3: Update `titles[]` — insert "Watch It Happen" after "Make Claude Interview You"**

  Find current index of "Make Claude Interview You" in the array. Insert `"Watch It Happen"` after it. Total count grows by 1.

- [ ] **Step 4: Verify**

  Navigate S13 → S13.5. Bridge line visible on S13. S13.5 shows TUI chrome with interview dialogue. Facilitator note hidden by default.

- [ ] **Step 5: Commit**
  ```bash
  git add session-materials/session-slides.html
  git commit -m "Reframe S13 + insert S13.5: live interview demo with Claude Code TUI"
  ```

---

## Task 11: Reframe S23 + Insert S23a — Skills Install

**Files:** Modify `session-materials/session-slides.html` — S23 and insert S23a

- [ ] **Step 1: Add bridge line to S23**

  Find S23 "Skills — Use & Make". Add after the last body element:
  ```html
  <p class="stagger-child" style="margin-top: 1.5rem; color: var(--phase-a); font-weight: 600;">
    → Next: install one right now.
  </p>
  ```

- [ ] **Step 2: Insert S23a after S23's closing `</div>`**

  ```html
  <!-- ═══ S23a LEVEL UP — Install a Skill ═══ -->
  <div class="slide phase-levelup layout-bento" data-phase="levelup">
    <p class="phase-eyebrow stagger-child" style="grid-column: 1/-1">— PHASE 09 · LEVEL UP</p>

    <!-- Browser tile -->
    <div class="bento-tile stagger-child" style="grid-column: 1; grid-row: 1 / 3;">
      <p style="font-size: 0.75em; color: var(--muted); margin-bottom: 0.5rem;">Step 1: Go to</p>
      <div class="chrome-wrap chrome-browser" style="font-size: 0.8em;">
        <div class="chrome-titlebar">
          <div class="chrome-lights"><span class="red"></span><span class="yellow"></span><span class="green"></span></div>
          <span class="chrome-title url-bar">🔒 skills.sh</span>
        </div>
        <div class="chrome-body" style="font-size:0.9em; color: var(--text);">
          Find a skill → copy its GitHub link
        </div>
      </div>
      <!-- TODO Q: confirm exact URL before shipping — spec §13 open item -->
      <p style="font-size: 0.8em; color: var(--phase-a); margin-top: 0.5rem;">↗ skills.sh</p>
    </div>

    <!-- TUI tile -->
    <div class="bento-tile stagger-child" style="grid-column: 2; grid-row: 1 / 3;">
      <p style="font-size: 0.75em; color: var(--muted); margin-bottom: 0.5rem;">Step 2: Tell Claude</p>
      <div class="chrome-wrap chrome-claudecode" style="font-size: 0.8em;">
        <div class="chrome-titlebar">
          <div class="chrome-lights"><span class="red"></span><span class="yellow"></span><span class="green"></span></div>
          <span class="chrome-title">Claude Code</span>
        </div>
        <div class="chrome-body">
          <div><span class="tui-prompt">&gt;</span> <span class="tui-user typewriter-target">please install this skill from https://github.com/...</span></div>
          <div class="tui-thinking" style="margin-top:0.5rem;">··· installing</div>
          <div class="tui-success" style="margin-top:0.5rem;">✓ Skill installed successfully</div>
        </div>
      </div>
    </div>

    <!-- Callout tile -->
    <div class="bento-tile span-2 stagger-child" style="background: color-mix(in srgb, var(--phase-a) 12%, var(--surface));">
      <p style="font-size: 0.9em;">
        Add a superpower in <strong style="color: var(--phase-a);">30 seconds.</strong>
        This is how Q has 50+ skills.
      </p>
    </div>

    <div class="slide-footer">
      <span>— PHASE 09 · LEVEL UP · 93:00 — 115:00</span>
      <span class="slide-number-indicator"></span>
    </div>
    <div class="orbit-mark" aria-hidden="true">
      <svg viewBox="0 0 28 28"><circle class="ring" cx="14" cy="14" r="11"/><circle class="node" cx="14" cy="3" r="2"/></svg>
    </div>
  </div>
  ```

- [ ] **Step 3: Update `titles[]` — insert "Install a Skill" after "Skills — Use & Make"**

  Find the index of "Skills — Use & Make". Insert `"Install a Skill"` after it. Total count should now be 33.

- [ ] **Step 4: Verify `titles[]` has exactly 33 entries**
  ```bash
  grep -o "titles = \[" session-materials/session-slides.html
  # Then count manually or:
  node -e "
  const html = require('fs').readFileSync('session-materials/session-slides.html','utf8');
  const m = html.match(/const titles = \[([^\]]+)\]/);
  if(m) console.log('titles count:', m[1].split(',').length);
  "
  ```
  Expected: `titles count: 33`

- [ ] **Step 5: Verify navigation**

  Navigate full deck start-to-end. Confirm 33 slides total, S23 and S23a are adjacent, S23a bento layout with two tiles renders.

- [ ] **Step 6: Commit**
  ```bash
  git add session-materials/session-slides.html
  git commit -m "Reframe S23 + insert S23a: Install a Skill via skills.sh + TUI demo"
  ```

---

## Task 12: Update footer timing labels to 125-min schedule

**Files:** Modify `session-materials/session-slides.html` — footer text in all 33 slides

Reference timing table from spec §3:

| Phase | Slides | Range |
|---|---|---|
| OPEN | S1–S4, S4a | 0:00 — 16:00 |
| SAFETY | S5–S6 | 16:00 — 21:00 |
| QUICK WIN | S7 | 21:00 — 29:00 |
| DECODE | S8–S10 | 29:00 — 39:00 |
| PLAN | S11–S15, S13.5 | 39:00 — 57:00 |
| BUILD | S16–S18 | 57:00 — 75:00 |
| POLISH | S19–S21 | 75:00 — 87:00 |
| SHARE | S22 | 87:00 — 93:00 |
| LEVEL UP | S23, S23a, S24–S27 | 93:00 — 115:00 |
| CLOSE | S28–S30 | 115:00 — 125:00 |

- [ ] **Step 1: Update footer timing on all slides**

  Each slide footer contains a timing label like `25:00 — 32:00`. Update to match the phase ranges above. Use find-and-replace per phase.

- [ ] **Step 2: Verify**

  Navigate S1 — footer shows `0:00 — 16:00 · OPEN`. Navigate S7 — footer shows `21:00 — 29:00`. Navigate S28 — footer shows `115:00 — 125:00`.

- [ ] **Step 3: Commit**
  ```bash
  git add session-materials/session-slides.html
  git commit -m "Update all slide footer timing labels to 125-min schedule"
  ```

---

## Task 13: Update `1-session-agenda.md`

**Files:** Modify `session-materials/1-session-agenda.md`

- [ ] **Step 1: Replace the timing table in the agenda**

  Find the existing phase timing section. Replace with:
  ```markdown
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

  **Total: 125 min**
  **First student page rendered: ~29:00 (end of Quick Win)**
  ```
  Also update any reference to "110-minute" or "110 min" → "125-minute" / "125 min".

- [ ] **Step 2: Commit**
  ```bash
  git add session-materials/1-session-agenda.md
  git commit -m "Update agenda to 125-min schedule matching new content arc"
  ```

---

## Task 14: Full AC smoke check

**Files:** Read-only verification pass

Work through every AC in the spec. For each:
- ✅ Mark passing
- ❌ Mark failing with note
- Fix any failures before final commit

Quick command reference:
```bash
# Verify titles[] count
node -e "const h=require('fs').readFileSync('session-materials/session-slides.html','utf8');const m=h.match(/const titles\s*=\s*\[([^\]]+)\]/);console.log('titles:',m[1].split(',').length)"

# Verify data-phase on all slides
grep -c 'data-phase=' session-materials/session-slides.html

# Verify layout classes present
grep -c 'layout-stage\|layout-split\|layout-canvas\|layout-magazine\|layout-workshop\|layout-bento' session-materials/session-slides.html

# Verify phase-X classes still present (orbit-mark check)
grep -c 'class="slide phase-' session-materials/session-slides.html

# Verify no glass-card without layout class (AC12)
grep -n 'glass-card' session-materials/session-slides.html

# Verify Esc handler exists
grep -n 'Escape' session-materials/session-slides.html

# Verify :facilitator command
grep -n 'facilitator' session-materials/session-slides.html
```

Browser checks (open `http://localhost:8765/session-materials/session-slides.html`):
- AC25: DevTools Computed → `font-family` on `<h1>` in S1 → should show `Mona Sans`
- AC26: DevTools Computed → `font-family` on code in S4 → should show `JetBrains Mono`
- AC27: Block `fonts.googleapis.com` in DevTools Network → Inter still renders, slide legible
- AC29: DevTools → Elements → any slide → Computed → background → gradient opacity 5–8%
- AC35: S7 — press `R` three times → counter shows 3. Navigate away and back → still 3.
- AC36: S15 — press `A` three times → approval count shows 3. Type `:clear` → resets to 0.
- AC38: All nav keys work (← → Home End F I S)
- AC39: Press `R` on S7 → counter bumps. Press `T` → timer starts. Press `A` on S15 → approval bumps.
- AC40: Type `:facilitator` → `.mag-sidebar` appears on magazine slides.
- AC44: Orbit-mark visible on all 33 slides, rotates phase by phase.
- AC46: Click a `.copy-block` → paste confirms text in clipboard.

- [ ] **Step 1: Run all grep checks above, fix any failures**
- [ ] **Step 2: Run all browser checks above, fix any failures**
- [ ] **Step 3: Walk all 33 slides in order — check no slides look broken**
- [ ] **Step 4: Final commit**
  ```bash
  git add session-materials/session-slides.html session-materials/1-session-agenda.md
  git commit -m "AC smoke-check pass: all 47 acceptance criteria verified"
  ```

---

## Summary

| Task | Scope | Commit message |
|---|---|---|
| 1 | Fonts + palette CSS | Add Mona Sans + JetBrains Mono CDN, font vars, per-phase data-phase palette |
| 2 | Layout CSS | Add 6 layout template CSS classes |
| 3 | Motion CSS + sweep JS | Add 7-animation motion language + phase sweep JS |
| 4 | Device chrome CSS | Add device chrome CSS: terminal, browser, editor, TUI, chat bubble |
| 5 | Typewriter + Esc + :facilitator JS | Add typewriter JS, Esc-skip handler, :facilitator typed command |
| 6 | data-phase + layout classes on 30 slides | Apply data-phase + layout classes to all 30 existing slides |
| 7 | S4 rewrite | Rewrite S4: Install Claude Code with terminal chrome + typewriter |
| 8 | S4a insert | Insert S4a: You're in — verify CLI launch + Claude Code TUI chrome |
| 9 | S8 rewrite | Rewrite S8: Chatbot vs Agent capability matrix with layout-split |
| 10 | S13 reframe + S13.5 insert | Reframe S13 + insert S13.5: live interview demo |
| 11 | S23 reframe + S23a insert | Reframe S23 + insert S23a: Install a Skill via skills.sh |
| 12 | Footer timing labels | Update all slide footer timing labels to 125-min schedule |
| 13 | Agenda update | Update agenda to 125-min schedule |
| 14 | AC smoke check | AC smoke-check pass: all 47 acceptance criteria verified |
