# Slide Deck Redesign Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

> ## ⚠️ THIS PLAN IS AMENDED — read both documents
>
> This plan was Codex-approved on 2026-05-16. On 2026-05-17, Q requested a "fancy minimal" pivot. The amendment lives at:
>
> **`docs/superpowers/specs/2026-05-17-fancy-minimal-amendment.md`**
>
> When the plan and the amendment conflict, **the amendment wins.** The amendment's §7 "Implementation plan delta" is the authoritative list of task-by-task changes. Read it BEFORE acting on any task here. Specifically the amendment changes:
> - Inter loaded as a variable font with `opsz` axis (not static weights)
> - Adds CSS for `font-variation-settings`, semantic status colors (`--status-danger/success/warning`), motion system (entrance + underscore + step reveal), orbit-mark SVG, click-to-copy on `.copy-block`
> - Updates every slide to: drop `.eyebrow.color` modifier classes, add `PHASE NN · NAME` eyebrow text, add `.slide-meta` footer, add orbit-mark inline SVG, apply correct `.phase-X` class
> - Adds live-moment features (S7 render counter, S15 plan-check scoreboard, S22 fumble chip — all count-only by default, `sessionStorage` only, no nickname projection)
> - Adds ACs 10-13 for reduced-motion, contrast+CVD, keyboard scenarios, and IRB consult
> - Removes inline emoji on S10/S27 and `.big-accent` on S2/S3/S28
> - Reframes S13 headline + applies cringe-audit rewrites on S29/S30/S5/S20/S25/S1 subtitle
>
> If an implementer encounters a step here that contradicts the amendment, follow the amendment and note the divergence in the commit message.

**Goal:** Replace `session-materials/session-slides.html` with a 30-slide / 110-min build-first deck per the approved spec at `docs/superpowers/specs/2026-05-16-slide-redesign-design.md` AS AMENDED by `docs/superpowers/specs/2026-05-17-fancy-minimal-amendment.md`; create two facilitator-only docs and a static starter HTML for the ops fallback; update the agenda markdown.

**Architecture:** Build the new deck in a side-by-side file (`session-slides-v2.html`) so the current 20-slide deck stays usable mid-build; swap with `git rm` + `git mv` only after the new file passes visual verification. The new file copies the existing CSS framework (deck navigation, keyboard shortcuts, ink-wash toggle, HUD) verbatim, adds ~14 new CSS classes for the hi-contrast billboard aesthetic + motion + status + orbit-mark + click-to-copy + live-moment systems, and rewrites all 30 slides as inline HTML. No build step, no dependencies, no JS framework — same constraints as the rest of the static site.

**Tech Stack:** Vanilla HTML5 + inline CSS + inline ES2015 (no modules). Fonts: **Inter variable** with `opsz` axis (per amendment §6.1), single sans-serif family. QR codes: existing base64-embedded PNG pattern used in current S4. Testing: open in browser via `python -m http.server` (required for click-to-copy Clipboard API) and visually verify against amendment §6 + spec §5 content.

---

## File Structure

**New files:**
- `session-materials/session-slides-v2.html` — work-in-progress new deck (renamed to `session-slides.html` at the end)
- `session-materials/IRB-non-consent-runbook.md` — facilitator-only runbook scaffold (Q fills IRB-specific wording)
- `session-materials/ops-fallback-checklist.md` — facilitator-only ops guide
- `session-materials/starter.html` — static HTML fallback used when Claude unreachable

**Modified files:**
- `session-materials/session-slides.html` — replaced at the end via `git mv session-slides-v2.html session-slides.html`
- `session-materials/1-session-agenda.md` — updated to the new 10-phase / 110-min plan

**Untouched files (intentional):**
- `index.html`, course pages — links to `session-slides.html` keep working because filename stays the same after the rename.
- IRB consent text in `consent_texts.md` — locked per CLAUDE.md / spec §8.

**Conventions:**
- Each slide is one top-level `<div class="slide" id="sN">` block, matching the current file's pattern.
- Phase accent applied via a phase-class on `.slide` (e.g., `.slide.phase-safety`), which scopes accent-color CSS variables for that slide only.
- Copy-pasteable code blocks use a new `.copy-block` class with a small inline "copy" affordance.
- All QR codes use the existing base64-embedded PNG approach (no external network requests).

---

## Task 1: Set up working branch + scaffold the new deck file

**Files:**
- Create: `session-materials/session-slides-v2.html`

- [ ] **Step 1: Confirm clean working tree on main**

Run: `git status -s`
Expected: only the untracked files we already know about (`.DS_Store`, `CLAUDE.md`, `llmdata/`, `sos-talk-may12.html`, `ui.txt`). No `session-materials/` changes.

- [ ] **Step 2: Create a working branch**

Run: `git checkout -b slide-redesign-2026-05`
Expected: `Switched to a new branch 'slide-redesign-2026-05'`

- [ ] **Step 3: Create the scaffold file**

Copy the entire current `session-materials/session-slides.html` to `session-materials/session-slides-v2.html`, then remove all `<div class="slide" ...>` blocks (the 20 existing slides), keeping the surrounding head/CSS/titlebar/HUD/JS. The resulting file has the framework but no slides yet.

Programmatic approach:
```bash
cp session-materials/session-slides.html session-materials/session-slides-v2.html
```
Then use the Edit tool to remove the body content between `<div class="deck" id="deck">` and the matching `</div>` that closes the deck — leaving just `<div class="deck" id="deck"></div>` empty.

Also update inside `<title>` and the titlebar's `.deck-name` to: `AI Engineering Academy — v2 redesign` (temporary; we revert at the rename step).

- [ ] **Step 4a: Swap fonts to Inter only (single sans-serif per spec §6)**

In the `<head>`, replace the Google Fonts `<link>` line:

```html
<link href="https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=DM+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
```

with:

```html
<link href="https://fonts.googleapis.com/css2?family=Inter:ital,wght@0,400;0,500;0,600;0,700;0,800;1,400;1,600&display=swap" rel="stylesheet">
```

(Includes italic weights so `<em>` italic still works without a second family.)

In `:root`, update the two font vars to a single family:

```css
--font-display: 'Inter', -apple-system, sans-serif;
--font-body:    'Inter', -apple-system, sans-serif;
```

(Do NOT introduce `--font-em`; Instrument Serif is removed entirely per spec §6 "one sans-serif type family.")

Then update the `h1 em` rule to inherit Inter italic:

```css
h1 em { font-style: italic;
        background:linear-gradient(135deg,var(--accent-blue),var(--accent-violet),var(--accent-rose));
        -webkit-background-clip:text; background-clip:text; -webkit-text-fill-color:transparent;
        background-size:200% 200%; animation:gradShift 8s ease infinite; }
```

- [ ] **Step 4b: Add billboard, copy-block, safety-grid, parent-box, toolchain-tree CSS**

Append into the existing `<style>` block, after the existing `.brush-wipe` rules and before the `body.theme-ink` block:

```css
/* ═══ BILLBOARD AESTHETIC (v2 redesign) ═══ */
.slide.billboard .slide-inner { text-align:center; }
.slide.billboard h1 { font-size:clamp(3.6rem,8vw,7rem); line-height:1.02; margin-bottom:1.6rem; }
.slide.billboard .subtitle { font-size:clamp(1.1rem,1.6vw,1.4rem); margin-left:auto; margin-right:auto; }

.copy-block { background:var(--bg-card); border:1px solid var(--border-glow); border-radius:14px;
              padding:1.2rem 1.4rem; font-family:'SF Mono','Fira Code',monospace; font-size:0.98rem;
              line-height:1.55; color:#e0f2fe; white-space:pre-wrap; text-align:left;
              max-width:760px; margin:1.2rem auto; position:relative; }
.copy-block::after { content:'⌘C'; position:absolute; top:0.6rem; right:0.8rem; font-size:0.7rem;
                     color:var(--text-tertiary); opacity:0.6; }

.safety-grid { display:grid; grid-template-columns:1fr 1fr; gap:0.6rem 1.6rem;
               max-width:760px; margin:1.4rem auto; text-align:left; font-size:1.1rem; }
.safety-grid .no { color:var(--accent-rose); }
.safety-grid .yes { color:var(--accent-emerald); }

.parent-box { max-width:760px; margin:1.4rem auto 0; padding:0.9rem 1.2rem;
              border:1px dashed var(--accent-amber); border-radius:10px; font-size:0.95rem;
              color:var(--text-secondary); text-align:left; }
.parent-box b { color:var(--accent-amber); }

.toolchain-tree { font-family:'SF Mono',monospace; font-size:1.05rem; line-height:1.7;
                  text-align:left; max-width:520px; margin:1.2rem auto;
                  color:var(--text-primary); }

.qr-box { display:inline-block; padding:0.6rem; background:#fff; border-radius:10px; margin-top:0.6rem; }
.qr-box img { display:block; width:200px; height:200px; }
.qr-box .placeholder { display:flex; align-items:center; justify-content:center;
                       width:200px; height:200px; color:#0b1220; font-weight:600;
                       text-align:center; padding:0.6rem; font-size:0.78rem; }
```

- [ ] **Step 4c: Add all 10 phase accent classes (one per phase in spec §6)**

Append into the same `<style>` block:

```css
/* ═══ PHASE ACCENTS — spec §6 ═══ */
/* Each class re-points the violet accent (used by eyebrows + h1 em gradient) to the phase color. */
.phase-open     { --accent-violet: #22d3ee; }  /* cyan */
.phase-safety   { --accent-violet: var(--accent-rose); }
.phase-quickwin { --accent-violet: var(--accent-emerald); }
.phase-decode   { --accent-violet: #a78bfa; }  /* violet */
.phase-plan     { --accent-violet: var(--accent-blue); }
.phase-build    { --accent-violet: var(--accent-amber); }
.phase-polish   { --accent-violet: #d4a73d; }  /* gold */
.phase-share    { --accent-violet: #22d3ee; }  /* cyan */
.phase-levelup  { --accent-violet: #a78bfa; }  /* violet */
.phase-close    { --accent-violet: var(--accent-emerald); }
```

When later tasks add slides, each slide gets `class="slide phase-<name>"` per its phase. Slides without an explicit phase fall back to the default violet.

- [ ] **Step 5: Open scaffold in browser to verify framework still works**

Run: `open session-materials/session-slides-v2.html`
Expected: blank deck (no slides yet), titlebar shows "AI Engineering Academy — v2 redesign", HUD shows "0/0", keyboard `I` toggles ink-wash, `F` enters fullscreen. No console errors.

- [ ] **Step 6: Commit scaffold**

```bash
git add session-materials/session-slides-v2.html
git commit -m "Scaffold v2 deck with billboard CSS classes"
```

---

## Task 2: Phase 1 OPEN — slides S1–S4

**Files:**
- Modify: `session-materials/session-slides-v2.html` (insert inside `<div class="deck" id="deck">`)

- [ ] **Step 1: Add S1 Title slide**

Insert at the end of the empty deck div:

```html
<!-- ═══ S1 TITLE ═══ -->
<div class="slide billboard phase-open active" id="s0">
  <div class="slide-inner">
    <div class="eyebrow">Prof. Weihao Qu · Monmouth University HH216</div>
    <h1>AI Engineering <em>Academy</em></h1>
    <p class="subtitle">A personal landing page about your persona. Built with AI. 110 minutes.</p>
    <p class="muted" style="margin-top:2rem; font-size:0.85rem;">← → navigate · <kbd>I</kbd> ink-wash · <kbd>F</kbd> fullscreen</p>
  </div>
</div>
```

- [ ] **Step 2: Add S2 Pre-test slide**

```html
<!-- ═══ S2 PRE-TEST ═══ -->
<div class="slide billboard phase-open" id="s1">
  <div class="slide-inner">
    <div class="big-accent">📋</div>
    <h1>5-minute <em>quiz</em></h1>
    <p class="subtitle">No grade. We measure what you learn today.</p>
    <div class="glass-card" style="max-width:520px; margin:1.4rem auto;">
      <p><strong>QR code + short URL goes here</strong> — placeholder until Q provides the live pre-test link.</p>
    </div>
  </div>
</div>
```

- [ ] **Step 3: Add S3 Consent slide**

```html
<!-- ═══ S3 CONSENT ═══ -->
<div class="slide billboard phase-open" id="s2">
  <div class="slide-inner">
    <div class="big-accent">📝</div>
    <h1>Read. <em>Decide.</em></h1>
    <p class="subtitle">I Agree or I Do Not Agree — either way you do everything today.</p>
    <!-- Reuse base64 QR from existing S4; placeholder for now -->
    <div class="glass-card" style="max-width:520px; margin:1.4rem auto;">
      <p><strong>QR code → weihaoqu.github.io/learnai-course/</strong> (use base64 PNG from old slide 4 here)</p>
    </div>
    <p class="muted" style="font-size:0.8rem; margin-top:1rem;">Non-consent path → facilitator runbook (NOT shown to students)</p>
  </div>
</div>
```

- [ ] **Step 4: Add S4 Launch Claude slide**

```html
<!-- ═══ S4 LAUNCH CLAUDE ═══ -->
<div class="slide billboard phase-open" id="s3">
  <div class="slide-inner">
    <h1>Open terminal. Type: <em>claude</em></h1>
    <p class="subtitle">Hit enter. Raise hand if anything is red.</p>
    <p class="muted" style="margin-top:1.4rem;">Tech help happens in parallel — we don't wait.</p>
  </div>
</div>
```

- [ ] **Step 5: Open in browser and verify Phase 1 renders**

Run: `open session-materials/session-slides-v2.html`
Expected: 4 slides navigable with arrow keys. S1 shows on load. HUD reads "1/4" → "4/4". Ink-wash toggle works on every slide.

- [ ] **Step 6: Commit Phase 1**

```bash
git add session-materials/session-slides-v2.html
git commit -m "Add Phase 1 OPEN slides S1-S4"
```

---

## Task 3: Phase 2 SAFETY — slides S5–S6

**Files:**
- Modify: `session-materials/session-slides-v2.html`

- [ ] **Step 1: Add S5 Safety Rules slide (the most content-dense billboard)**

Append:

```html
<!-- ═══ S5 SAFETY RULES ═══ -->
<div class="slide phase-safety" id="s4">
  <div class="slide-inner" style="text-align:center;">
    <div class="eyebrow rose">Before any AI input</div>
    <h1>Safety <em>first.</em></h1>
    <div class="safety-grid">
      <div class="no">❌ NO real name (use a nickname)</div>
      <div class="no">❌ NO address, school name, phone, email</div>
      <div class="no">❌ NO passwords, health, family details</div>
      <div class="no">❌ NO face photos</div>
      <div class="yes">✅ Files stay on YOUR laptop</div>
      <div class="yes">✅ Read every permission prompt</div>
    </div>
    <div class="parent-box">
      <b>Parents:</b> no screen photos · no coaching answers · no pressure around consent.
    </div>
  </div>
</div>
```

- [ ] **Step 2: Add S6 Pick Your Nickname slide**

```html
<!-- ═══ S6 PICK YOUR NICKNAME ═══ -->
<div class="slide billboard phase-safety" id="s5">
  <div class="slide-inner">
    <h1>Pick your <em>nickname.</em></h1>
    <p class="subtitle">Write it on a sticky note. We use it for the whole session.</p>
    <p class="muted" style="margin-top:1rem; font-size:0.92rem;">Skyline · NebulaCat · Trail · GameDev42 · CodexJr</p>
  </div>
</div>
```

- [ ] **Step 3: Browser verify**

Run: `open session-materials/session-slides-v2.html`
Expected: 6 slides. S5 shows ❌ items in rose color, ✅ items in emerald, parent box in dashed amber border. Both safety slides show rose eyebrow accent.

- [ ] **Step 4: Commit**

```bash
git add session-materials/session-slides-v2.html
git commit -m "Add Phase 2 SAFETY slides S5-S6"
```

---

## Task 4: Phase 3 QUICK WIN — slide S7

**Files:**
- Modify: `session-materials/session-slides-v2.html`

- [ ] **Step 1: Add S7 Tiny Build slide with copy-block**

Append:

```html
<!-- ═══ S7 TINY BUILD ═══ -->
<div class="slide phase-quickwin" id="s6">
  <div class="slide-inner" style="text-align:center;">
    <div class="eyebrow emerald">Quick win</div>
    <h1>First page. <em>Right now.</em></h1>
    <p class="subtitle">Paste this. Hit enter. Watch.</p>
    <div class="copy-block">Make me a <b style="color:#fde68a">starter.html</b> that says
"Hi, I'm &lt;nickname&gt;". Dark background.
One sentence about what my persona likes
(anything fictional is fine).
Open it in my browser when done.</div>
    <div class="qr-box"><div class="placeholder">QR: Q to fill (help page or text-of-prompt link)</div></div>
    <p class="muted" style="margin-top:1.2rem;">Goal: every student has a page on screen by minute 25.</p>
  </div>
</div>
```

- [ ] **Step 2: Browser verify**

Open and arrow to S7. Verify the copy-block renders with monospace font, light-blue text, the "⌘C" affordance in the top-right corner of the block, and the `<b>` highlight on "starter.html".

- [ ] **Step 3: Commit**

```bash
git add session-materials/session-slides-v2.html
git commit -m "Add Phase 3 QUICK WIN slide S7"
```

---

## Task 5: Phase 4 DECODE — slides S8–S10

**Files:**
- Modify: `session-materials/session-slides-v2.html`

- [ ] **Step 1: Add S8 Chatbot vs Agent**

```html
<!-- ═══ S8 CHATBOT vs AGENT ═══ -->
<div class="slide phase-decode" id="s7">
  <div class="slide-inner">
    <div class="eyebrow">Decode what just happened</div>
    <h1>Chatbot answers. <em>Agent does.</em></h1>
    <div class="diagram" style="max-width:680px; margin:1.2rem auto;">CHATBOT:  ask  →  answer

AGENT:    ask  →  USE TOOLS  →  CHECK  →  try again</div>
    <p class="subtitle">What you just saw: the tool loop. That's what makes Claude Code an agent.</p>
  </div>
</div>
```

- [ ] **Step 2: Add S9 CLAUDE.md & Context**

```html
<!-- ═══ S9 CLAUDE.MD & CONTEXT ═══ -->
<div class="slide phase-decode" id="s8">
  <div class="slide-inner">
    <div class="eyebrow">Decode</div>
    <h1>Claude reads <em>CLAUDE.md</em> first.</h1>
    <div class="diagram" style="max-width:560px; margin:1.2rem auto;">── CLAUDE.md ──────────────
# Workshop Notes
- Call me &lt;nickname&gt;
- I'm 15 — keep code simple
- Plain HTML/CSS only
───────────────────────────</div>
    <p class="subtitle">Guidance, not enforcement. Loaded into context every session.</p>
  </div>
</div>
```

- [ ] **Step 3: Add S10 Permissions · Context · Usage**

```html
<!-- ═══ S10 PERMISSIONS · CONTEXT · USAGE ═══ -->
<div class="slide phase-decode" id="s9">
  <div class="slide-inner">
    <div class="eyebrow">Decode</div>
    <h1>Three things to <em>watch.</em></h1>
    <div style="max-width:760px; margin:1.4rem auto; text-align:left;">
      <p style="margin:0.8rem 0; font-size:1.15rem;">🔒 <b>Permissions</b> — Claude asks before writing files. Read carefully.</p>
      <p style="margin:0.8rem 0; font-size:1.15rem;">🧠 <b>Context</b> — Working memory. Finite. <code>/clear</code> starts fresh.</p>
      <p style="margin:0.8rem 0; font-size:1.15rem;">💰 <b>Usage</b> — Your account budget. Pro is plenty for learning.</p>
    </div>
    <p class="muted" style="margin-top:1rem;"><code>/clear</code> resets the conversation. Not your files. Not your usage.</p>
  </div>
</div>
```

- [ ] **Step 4: Browser verify Phase 4**

Open and arrow through S8 → S9 → S10. Verify the diagram boxes render with the monospace font and the cyan text from `.diagram` styling. Verify the inline `<code>` doesn't break layout.

- [ ] **Step 5: Commit**

```bash
git add session-materials/session-slides-v2.html
git commit -m "Add Phase 4 DECODE slides S8-S10"
```

---

## Task 6: Phase 5 PLAN — slides S11–S15

**Files:**
- Modify: `session-materials/session-slides-v2.html`

- [ ] **Step 1: Add S11 Plan beats Prompt**

```html
<!-- ═══ S11 PLAN BEATS PROMPT ═══ -->
<div class="slide billboard phase-plan" id="s10">
  <div class="slide-inner">
    <h1>Plan beats <em>Prompt.</em></h1>
    <p class="subtitle">The #1 mistake: jumping in too fast.</p>
  </div>
</div>
```

- [ ] **Step 2: Add S12 Pro Workflow**

```html
<!-- ═══ S12 PRO WORKFLOW ═══ -->
<div class="slide phase-plan" id="s11">
  <div class="slide-inner" style="text-align:center;">
    <div class="eyebrow blue">The pro rhythm</div>
    <h1><em>PLAN</em> → ONE PROMPT → ITERATE → POLISH</h1>
    <p class="subtitle">You'll do all four — same way pros do.</p>
  </div>
</div>
```

- [ ] **Step 3: Add S13 Ask Claude to Interview You**

```html
<!-- ═══ S13 ASK CLAUDE TO INTERVIEW YOU ═══ -->
<div class="slide phase-plan" id="s12">
  <div class="slide-inner" style="text-align:center;">
    <div class="eyebrow blue">Plan deeply</div>
    <h1>Tell <em>Claude:</em></h1>
    <div class="copy-block">Interview me one question at a time
to plan a personal landing page for
my nickname persona. Cover: who they
are, sections, vibe, color, signature.
Output a structured plan.</div>
    <p class="subtitle" style="margin-top:1rem;">Answer carefully. Better plan = better build.</p>
  </div>
</div>
```

- [ ] **Step 4: Add S14 A Good Plan Has**

```html
<!-- ═══ S14 A GOOD PLAN HAS ═══ -->
<div class="slide phase-plan" id="s13">
  <div class="slide-inner">
    <div class="eyebrow blue">Checklist</div>
    <h1>A good plan <em>has:</em></h1>
    <ul style="max-width:680px; margin:1.4rem auto; font-size:1.15rem; line-height:2;">
      <li>1 sentence about your persona</li>
      <li>3 sections (e.g., About / Projects / Contact)</li>
      <li>A vibe word (calm / bold / playful / pro)</li>
      <li>A color</li>
      <li>One thing that makes it YOURS</li>
    </ul>
  </div>
</div>
```

- [ ] **Step 5: Add S15 Plan Check**

```html
<!-- ═══ S15 PLAN CHECK ═══ -->
<div class="slide phase-plan" id="s14">
  <div class="slide-inner" style="text-align:center;">
    <h1>Show Q your <em>plan.</em></h1>
    <p class="subtitle">30-second review. Wave me over.</p>
    <!-- Checklist visual matching S14 -->
    <ul style="display:inline-block; text-align:left; max-width:520px; margin:1rem auto;
               font-size:1.05rem; line-height:2; list-style:none; padding-left:0;">
      <li>☐ 1 sentence about your persona</li>
      <li>☐ 3 sections (About / Projects / Contact)</li>
      <li>☐ A vibe word</li>
      <li>☐ A color</li>
      <li>☐ One thing that makes it YOURS</li>
    </ul>
    <p class="muted" style="margin-top:1rem;">No good plan, no build.</p>
  </div>
</div>
```

- [ ] **Step 6: Browser verify Phase 5**

Open and arrow through S11 → S15. Verify S13 copy-block renders correctly. Verify S14 list shows with sufficient line spacing for projector readability.

- [ ] **Step 7: Commit**

```bash
git add session-materials/session-slides-v2.html
git commit -m "Add Phase 5 PLAN slides S11-S15"
```

---

## Task 7: Phase 6 BUILD — slides S16–S18

**Files:**
- Modify: `session-materials/session-slides-v2.html`

- [ ] **Step 1: Add S16 First Main Build Prompt with scaffold caveat**

```html
<!-- ═══ S16 FIRST MAIN BUILD PROMPT ═══ -->
<div class="slide phase-build" id="s15">
  <div class="slide-inner" style="text-align:center;">
    <div class="eyebrow amber">Build the real one</div>
    <h1>Now the <em>real one.</em></h1>
    <div class="copy-block">Using the plan we just made, build me
a single HTML file for a personal
landing page. Open it when done.</div>
    <div class="warning" style="max-width:680px; margin:1.2rem auto;">
      <h3>Why one prompt</h3>
      <p>Small site = one-prompt scaffold for learning. Real projects = small prompts, verify each step.</p>
    </div>
  </div>
</div>
```

- [ ] **Step 2: Add S17 AI Gets Stuff Wrong**

```html
<!-- ═══ S17 AI GETS STUFF WRONG ═══ -->
<div class="slide phase-build" id="s16">
  <div class="slide-inner">
    <div class="eyebrow amber">Expect this</div>
    <h1>Expect 1–2 things <em>broken.</em></h1>
    <ul style="max-width:680px; margin:1.2rem auto; font-size:1.1rem; line-height:1.9;">
      <li>A link goes to the wrong place</li>
      <li>The font looks weird</li>
      <li>A section is missing</li>
    </ul>
    <p class="lede" style="margin-top:1.2rem; text-align:center;">Bug ≠ failure. Bug = iteration.</p>
  </div>
</div>
```

- [ ] **Step 3: Add S18 Fix It**

```html
<!-- ═══ S18 FIX IT ═══ -->
<div class="slide phase-build" id="s17">
  <div class="slide-inner" style="text-align:center;">
    <div class="eyebrow amber">Iterate</div>
    <h1>Talk like a <em>teammate.</em></h1>
    <div style="max-width:560px; margin:1.4rem auto; text-align:left; font-family:'SF Mono',monospace; font-size:1rem; line-height:2;">
      <p>"Make the header bigger."</p>
      <p>"The font is ugly. Try modern."</p>
      <p>"Add a dark mode toggle."</p>
    </div>
    <p class="subtitle">Plain English. Specific. One at a time.</p>
  </div>
</div>
```

- [ ] **Step 4: Browser verify Phase 6**

Verify S16–S18 use amber accent (phase-build class). Verify S16's warning box renders with the existing `.warning` styling (amber left border).

- [ ] **Step 5: Commit**

```bash
git add session-materials/session-slides-v2.html
git commit -m "Add Phase 6 BUILD slides S16-S18"
```

---

## Task 8: Phase 7 POLISH — slides S19–S21

**Files:**
- Modify: `session-materials/session-slides-v2.html`

- [ ] **Step 1: Add S19 Open Components**

```html
<!-- ═══ S19 OPEN COMPONENTS ═══ -->
<div class="slide phase-polish" id="s18">
  <div class="slide-inner" style="text-align:center;">
    <div class="eyebrow">Polish · 21st.dev</div>
    <h1>Use <em>open</em> components.</h1>
    <p class="subtitle">21st.dev · shadcn/ui — free, open licenses.</p>
    <div class="warning" style="max-width:680px; margin:1.2rem auto;">
      <h3>Check the license</h3>
      <p>Don't paste closed-source code. Open licenses are clearly labeled (MIT, Apache, etc.).</p>
    </div>
  </div>
</div>
```

- [ ] **Step 2: Add S20 UI Quick Wins**

```html
<!-- ═══ S20 UI QUICK WINS ═══ -->
<div class="slide phase-polish" id="s19">
  <div class="slide-inner">
    <div class="eyebrow">Polish</div>
    <h1>5 cheats to look <em>pro.</em></h1>
    <ul style="max-width:680px; margin:1.4rem auto; font-size:1.15rem; line-height:2;">
      <li>Gradient background</li>
      <li>One sans-serif font (Inter, Geist)</li>
      <li>Lucide icons, not emojis</li>
      <li>Generous whitespace</li>
      <li>Dark mode by default</li>
    </ul>
    <p class="muted" style="text-align:center;">Tell Claude: "apply these."</p>
  </div>
</div>
```

- [ ] **Step 3: Add S21 Codex Review**

```html
<!-- ═══ S21 CODEX REVIEW ═══ -->
<div class="slide phase-polish" id="s20">
  <div class="slide-inner" style="text-align:center;">
    <div class="eyebrow">Polish · second opinion</div>
    <h1>Second <em>opinion.</em></h1>
    <p class="subtitle">Different AI. Different blind spots.</p>
    <div class="copy-block">/codex review</div>
    <div class="warning" style="max-width:680px; margin:1.2rem auto;">
      <h3>Important</h3>
      <p>Review <strong>reduces risk</strong>. It does <strong>not prove correctness</strong>.</p>
    </div>
  </div>
</div>
```

- [ ] **Step 4: Browser verify Phase 7**

Verify S19–S21 use gold accent (phase-polish overrides the violet base). Verify warning boxes render consistently across all three.

- [ ] **Step 5: Commit**

```bash
git add session-materials/session-slides-v2.html
git commit -m "Add Phase 7 POLISH slides S19-S21"
```

---

## Task 9: Phase 8 SHARE — slide S22

**Files:**
- Modify: `session-materials/session-slides-v2.html`

- [ ] **Step 1: Add S22 Show & Tell**

```html
<!-- ═══ S22 SHOW & TELL ═══ -->
<div class="slide phase-share" id="s21">
  <div class="slide-inner" style="text-align:center;">
    <div class="eyebrow">Share</div>
    <h1>2 min <em>each.</em></h1>
    <ul style="display:inline-block; text-align:left; font-size:1.15rem; line-height:2; margin-top:0.6rem;">
      <li>Show your page</li>
      <li>One thing you learned</li>
      <li>One thing AI got wrong</li>
    </ul>
    <p class="muted" style="margin-top:1.4rem;">We celebrate the fumbles.</p>
  </div>
</div>
```

- [ ] **Step 2: Browser verify + Commit**

```bash
git add session-materials/session-slides-v2.html
git commit -m "Add Phase 8 SHARE slide S22"
```

---

## Task 10: Phase 9 LEVEL UP — slides S23–S27

**Files:**
- Modify: `session-materials/session-slides-v2.html`

- [ ] **Step 1: Add S23 Skills — Use & Make**

```html
<!-- ═══ S23 SKILLS ═══ -->
<div class="slide phase-levelup" id="s22">
  <div class="slide-inner">
    <div class="eyebrow">Level up</div>
    <h1>Pre-packaged <em>superpowers.</em></h1>
    <div class="copy-block">── .claude/skills/landing-page/SKILL.md ──
---
name: landing-page
description: Build a personal landing page
---
Interview me one question at a time.
Cover: persona, sections, vibe, color.
Then build the HTML file.
─────────────────────────────────────</div>
    <p class="subtitle" style="text-align:center;">Did it twice? Codify it. Type <code>/landing-page</code> anywhere.</p>
    <p class="muted" style="text-align:center; font-size:0.85rem;">Project: <code>.claude/skills/</code>  ·  Personal: <code>~/.claude/skills/</code></p>
  </div>
</div>
```

- [ ] **Step 2: Add S24 MCP**

```html
<!-- ═══ S24 MCP ═══ -->
<div class="slide phase-levelup" id="s23">
  <div class="slide-inner">
    <div class="eyebrow">Level up</div>
    <h1><em>MCP</em> = connect to anything.</h1>
    <div class="diagram" style="max-width:680px; margin:1.2rem auto; text-align:center;">[ Claude Code ] ─── MCP ─── [ Gmail · GitHub · Drive · custom ]</div>
    <p class="subtitle">Protocol for external tools, data, and APIs.</p>
    <div class="warning" style="max-width:680px; margin:1.2rem auto;">
      <h3>Today</h3>
      <p>We did <strong>NOT</strong> connect personal accounts.</p>
    </div>
  </div>
</div>
```

- [ ] **Step 3: Add S25 Automation**

```html
<!-- ═══ S25 AUTOMATION ═══ -->
<div class="slide phase-levelup" id="s24">
  <div class="slide-inner">
    <div class="eyebrow">Level up</div>
    <h1>AI while you <em>sleep.</em></h1>
    <div class="two-col" style="max-width:760px; margin:1.4rem auto;">
      <div>
        <h3>Hooks</h3><p>On every save.</p>
        <h3 style="margin-top:1rem;">Cron</h3><p>Daily/weekly.</p>
        <h3 style="margin-top:1rem;">Agents</h3><p>Background jobs.</p>
      </div>
      <div>
        <div class="key-idea"><h3>The pattern</h3><p>Set once. Run forever.</p></div>
      </div>
    </div>
  </div>
</div>
```

- [ ] **Step 4: Add S26 Your Toolchain**

```html
<!-- ═══ S26 YOUR TOOLCHAIN ═══ -->
<div class="slide phase-levelup" id="s25">
  <div class="slide-inner">
    <div class="eyebrow">Level up</div>
    <h1>You direct. Tools <em>execute.</em></h1>
    <div class="toolchain-tree">YOU (supervisor)
 ├─ Claude Code  →  builds
 ├─ Codex        →  reviews
 ├─ Skills       →  workflows
 ├─ MCP          →  connections
 └─ CLAUDE.md    →  your rules</div>
    <p class="subtitle" style="text-align:center;">Toolchain under your supervision.</p>
  </div>
</div>
```

- [ ] **Step 5: Add S27 What to Read Next**

```html
<!-- ═══ S27 WHAT TO READ NEXT ═══ -->
<div class="slide phase-levelup" id="s26">
  <div class="slide-inner">
    <div class="eyebrow">Keep going</div>
    <h1>What to <em>read next.</em></h1>
    <ul style="max-width:680px; margin:1.4rem auto; font-size:1.1rem; line-height:2;">
      <li>📚 <strong>LearnAI Wiki</strong> — weihaoqu.github.io/learnAIDoc</li>
      <li>🎥 <strong>Claude 101 playlist</strong> — Anthropic on YouTube</li>
      <li>💬 <strong>Office hours</strong> — Saturdays (web app)</li>
      <li>📧 <strong>Email Prof. Qu</strong> — weihaoqu25@gmail.com</li>
    </ul>
  </div>
</div>
```

- [ ] **Step 6: Browser verify Phase 9**

Verify all 5 Level Up slides use violet accent (phase-levelup). Verify the toolchain-tree on S26 renders with monospace alignment intact.

- [ ] **Step 7: Commit**

```bash
git add session-materials/session-slides-v2.html
git commit -m "Add Phase 9 LEVEL UP slides S23-S27"
```

---

## Task 11: Phase 10 CLOSE — slides S28–S30

**Files:**
- Modify: `session-materials/session-slides-v2.html`

- [ ] **Step 1: Add S28 Post-test + Survey**

```html
<!-- ═══ S28 POST-TEST + SURVEY ═══ -->
<div class="slide billboard phase-close" id="s27">
  <div class="slide-inner">
    <div class="big-accent">📋</div>
    <h1>Same quiz. <em>New score.</em></h1>
    <p class="subtitle">10 min. Honest answers shape the next session.</p>
    <div class="glass-card" style="max-width:520px; margin:1.4rem auto;">
      <p><strong>QR code goes here</strong> — placeholder for the post-test/survey URL.</p>
    </div>
  </div>
</div>
```

- [ ] **Step 2: Add S29 Remember**

```html
<!-- ═══ S29 REMEMBER ═══ -->
<div class="slide phase-close" id="s28">
  <div class="slide-inner">
    <div class="eyebrow emerald">Take this home</div>
    <h1>Three <em>things.</em></h1>
    <ol style="max-width:760px; margin:1.4rem auto; font-size:1.25rem; line-height:2; list-style-position:inside;">
      <li>AI is a tool. <em>You</em> are the thinker.</li>
      <li>A plan beats a clever prompt.</li>
      <li>You direct the toolchain.</li>
    </ol>
  </div>
</div>
```

- [ ] **Step 3: Add S30 Thank You**

```html
<!-- ═══ S30 THANK YOU ═══ -->
<div class="slide billboard phase-close" id="s29">
  <div class="slide-inner">
    <h1>Thank <em>you.</em></h1>
    <p class="subtitle">The web app is yours. Build something this week. Send it to me.</p>
    <div class="qr-box"><div class="placeholder">QR → weihaoqu.github.io/learnai-course/</div></div>
    <p class="muted" style="margin-top:1.4rem;">weihaoqu.github.io/learnai-course · weihaoqu25@gmail.com</p>
  </div>
</div>
```

- [ ] **Step 4: Final-phase browser verify**

Open and arrow from S1 to S30. HUD should show "1/30" → "30/30". No console errors. Every slide reads from at least 6ft away (rough test: stand back from monitor).

- [ ] **Step 5: Commit**

```bash
git add session-materials/session-slides-v2.html
git commit -m "Add Phase 10 CLOSE slides S28-S30"
```

---

## Task 12: Update session-agenda.md to the new 10-phase / 110-min plan

**Files:**
- Modify: `session-materials/1-session-agenda.md`

- [ ] **Step 1: Rewrite the agenda table to match the new structure**

Replace the contents of `session-materials/1-session-agenda.md` with:

```markdown
# Session Agenda — Minute-by-Minute Plan
## 5 High School Students | Monmouth University HH216 | Summer 2026

| Time | Duration | Activity | Notes |
|------|----------|----------|-------|
| 0:00 | 10 min | **Phase 1 OPEN** | Pre-test + consent + launch Claude. Tech rescue parallel. |
| 0:10 | 5 min | **Phase 2 SAFETY** | Safety rules + pick nickname. Before any AI input. |
| 0:15 | 10 min | **Phase 3 QUICK WIN** | starter.html prompt → every student has a page by 0:25. |
| 0:25 | 7 min | **Phase 4 DECODE** | Chatbot vs Agent · CLAUDE.md · Permissions/Context/Usage. |
| 0:32 | 18 min | **Phase 5 PLAN** | Plan beats Prompt → ask Claude to interview you → plan check. |
| 0:50 | 20 min | **Phase 6 BUILD** | One main build prompt → expect bugs → iterate. |
| 1:10 | 10 min | **Phase 7 POLISH** | Open components · UI quick wins · /codex review. |
| 1:20 | 10 min | **Phase 8 SHARE** | 2 min each: page + lesson + AI fumble. |
| 1:30 | 13 min | **Phase 9 LEVEL UP** | Skills · MCP · Automation · toolchain · what to read next. |
| 1:43 | 7 min | **Phase 10 CLOSE** | Post-test + survey + 3 takeaways + thank you. |

**Total: 110 minutes**

## Pacing Tips
- If running short: cut S25 Automation first, then S24 MCP, then S20 UI Quick Wins. Never cut Safety, Quick Win, Plan Check, Show & Tell, or Post-test.
- Plan Check (S15) can be done shoulder-to-shoulder during the plan phase to save serialized time.
- If a student finishes their build very early: have them try one Polish improvement and then run /codex review.

## Facilitator-only docs
- `IRB-non-consent-runbook.md` — exact words for "I Do Not Agree" path.
- `ops-fallback-checklist.md` — pre-session checks + recovery scripts.
- `starter.html` — static fallback if Claude is unreachable.

## Tech notes
- Slides: `session-slides.html` (30 slides, 110 min).
- Keyboard: ←/→ navigate, `I` ink-wash toggle, `F` fullscreen, `S` reveal steps.
```

- [ ] **Step 2: Commit**

```bash
git add session-materials/1-session-agenda.md
git commit -m "Update agenda to 10-phase / 110-min plan"
```

---

## Task 13: Create the IRB-non-consent runbook scaffold

**Files:**
- Create: `session-materials/IRB-non-consent-runbook.md`

- [ ] **Step 1: Create the file with placeholders for Q to fill IRB-approved wording**

```markdown
# IRB Non-Consent Runbook — Facilitator Only

> **Status:** SCAFFOLD. Q must fill the bracketed `[…]` sections with the exact FA 2562-approved wording before the session. Do NOT improvise these scripts.

**Protocol:** Monmouth IRB FA 2562
**Use:** Quick reference when a student or parent declines research participation.
**Audience:** Q (facilitator) only. Not shown to students.

---

## Trigger: Student clicks "I Do Not Agree" on the consent screen

**Say to the student (private, 30 seconds):**
> [APPROVED WORDING HERE — confirm participation in all activities continues; data will not be collected for research; no penalty.]

**Action:**
- Note the student's nickname on the facilitator clipboard.
- Their pre-test and post-test responses are [DISCARDED / KEPT-BUT-FLAGGED — confirm with IRB].
- The student participates fully in every Phase 2–10 activity.

---

## Trigger: Parent declines on behalf of student

**Say to the parent (private):**
> [APPROVED WORDING HERE — same outcome as student decline; the activity is open to all students.]

**Action:**
- Same as student decline.

---

## Trigger: Student changes mind mid-session

**Say:**
> [APPROVED WORDING HERE — withdrawal is allowed at any time.]

**Action:**
- Note time of withdrawal on clipboard.
- Treat any already-submitted pre-test as [DISCARDED / RETAINED — confirm with IRB].

---

## What NEVER changes regardless of consent status
- The student gets to do every activity.
- The student takes their built site home.
- The student receives the parent info sheet at the end.
- The student is not singled out, named, or treated differently.

---

## Hand-off if Q is briefly absent
If another adult is supervising and a consent question arises before Q can return, the only acceptable answer is:
> "Please wait one minute for Prof. Qu — they're the only person who can answer that."

Never improvise IRB-related wording.
```

- [ ] **Step 2: Commit the scaffold**

```bash
git add session-materials/IRB-non-consent-runbook.md
git commit -m "Add IRB non-consent runbook scaffold (Q fills approved wording)"
```

- [ ] **Step 3: STOP — surface to Q for IRB-approved wording (gate for AC5)**

The runbook is incomplete with placeholder markers (`[APPROVED WORDING HERE]`, `[DISCARDED / KEPT-BUT-FLAGGED]`). AC5 requires the file to "exist with content per §7.1" — placeholders don't satisfy that.

Surface to Q:
> "IRB runbook scaffold committed. The bracketed wording in §Triggers and the data-retention markers must be replaced with the FA 2562-approved language. Please paste the approved text (or point me to it) and I'll commit the final version."

Do NOT proceed to Task 14 until Q has provided wording. If Q wants to defer (e.g., IRB office takes a week to respond), explicitly mark AC5 as "pending Q + IRB" in the final acceptance report rather than claiming it's done.

- [ ] **Step 4: After Q provides wording, replace placeholders and commit final**

Edit the file: replace every `[…]` marker with Q's exact wording. Then:

```bash
git add session-materials/IRB-non-consent-runbook.md
git commit -m "Fill IRB non-consent runbook with FA 2562-approved wording"
```

---

## Task 14: Create the ops fallback checklist

**Files:**
- Create: `session-materials/ops-fallback-checklist.md`

- [ ] **Step 1: Create the file**

```markdown
# Ops Fallback Checklist — Facilitator Only

> **Use:** Pre-session readiness + in-session failure recovery. Print and bring.

---

## T-24 hours

- [ ] Parent email reminder sent (parent-email-template.md text)
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

- [ ] `session-slides.html` open in browser, fullscreened
- [ ] `starter.html` in same folder as a fallback (see § Fallbacks)
- [ ] Printed copies stacked: IRB-non-consent-runbook, this checklist
- [ ] Sticky notes + markers on each desk

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
3. Have students edit `starter.html` by hand: change nickname, sentence, color
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

## Fallbacks bundled

- `starter.html` (this folder) — static HTML page that mimics Phase 3 Quick Win output. Open and edit by hand if Claude is unreachable.
- Existing PDFs in this folder (Homework, Cheatsheet, Parent guide) work fully offline.
```

- [ ] **Step 2: Commit**

```bash
git add session-materials/ops-fallback-checklist.md
git commit -m "Add ops fallback checklist for facilitator"
```

---

## Task 15: Create the static starter.html fallback

**Files:**
- Create: `session-materials/starter.html`

- [ ] **Step 1: Create the file with editable values genuinely hoisted to the top**

The fallback only works if students can really change 4 things by editing 4 lines (name, sentence, accent color, vibe word). Color cannot be buried in CSS rules — it must live in a single CSS custom property declared at the top.

```html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Starter — Your Persona</title>

<!-- ┌──────────────────────────────────────────────────────┐ -->
<!-- │  EDIT THESE 4 LINES BELOW TO MAKE THIS YOUR PAGE     │ -->
<!-- │  (the rest of the file works automatically)          │ -->
<!-- └──────────────────────────────────────────────────────┘ -->
<style>
  :root {
    --nickname: 'YOUR-NICKNAME';        /* 1. Your nickname (in quotes)        */
    --tag:      'I like fictional things.';  /* 2. One sentence about your persona */
    --accent:   #60a5fa;                /* 3. Accent color — pick any hex      */
    --vibe:     'calm';                 /* 4. Vibe word (calm/bold/playful/pro) */
  }
</style>

<style>
  /* (Below this line, you don't have to change anything.) */
  *, *::before, *::after { margin:0; padding:0; box-sizing:border-box; }
  body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", system-ui, sans-serif;
         background:#0b1220; color:#f0f4f8; min-height:100vh;
         display:flex; flex-direction:column; align-items:center; justify-content:center;
         padding:2rem; text-align:center; line-height:1.6; }
  h1 { font-size: clamp(2.2rem, 6vw, 4rem); margin-bottom: 1rem; color: var(--accent); }
  h1::after { content: var(--nickname); }
  p.tag::after { content: var(--tag); }
  p.tag { font-size:1.2rem; color:#b3becf; max-width:560px; margin-bottom:2rem; }
  .vibe-chip { display:inline-block; padding:4px 12px; border:1px solid var(--accent);
               color:var(--accent); border-radius:999px; font-size:0.85rem;
               text-transform:uppercase; letter-spacing:0.1em; margin-bottom:1.4rem; }
  .vibe-chip::after { content: var(--vibe); }
  .sections { display:grid; grid-template-columns:repeat(auto-fit, minmax(180px, 1fr));
              gap:1rem; max-width:760px; width:100%; }
  .section { background:rgba(255,255,255,0.04); border:1px solid rgba(255,255,255,0.08);
             border-radius:12px; padding:1.2rem; }
  .section h2 { font-size:1rem; text-transform:uppercase; letter-spacing:0.1em;
                color:var(--accent); margin-bottom:0.4rem; }
  .section p { font-size:0.95rem; color:#cbd5e1; }
  footer { margin-top:3rem; color:#64748b; font-size:0.85rem; }
</style>
</head>
<body>

<span class="vibe-chip"></span>
<h1>Hi, I'm </h1>
<p class="tag"></p>

<div class="sections">
  <div class="section"><h2>About</h2><p>A sentence or two about your persona.</p></div>
  <div class="section"><h2>Projects</h2><p>Something your persona has made or wants to make.</p></div>
  <div class="section"><h2>Contact</h2><p>How a friend could reach your persona (fictional).</p></div>
</div>

<footer>Built at AI Engineering Academy · Monmouth University</footer>

</body>
</html>
```

The 4 hoisted custom properties (`--nickname`, `--tag`, `--accent`, `--vibe`) are read by `content: var(...)` rules elsewhere. This is the only way to genuinely make "edit 4 lines = personalize the page" true without JavaScript.

- [ ] **Step 2: Browser verify**

Run: `open session-materials/starter.html`
Expected: clean dark page; the nickname `YOUR-NICKNAME` appears after "Hi, I'm "; vibe chip shows `calm`; tagline reads "I like fictional things.".

- [ ] **Step 3: Verify edit-the-top-4-lines actually works**

Edit the top `<style>` block: change `--nickname` to `'Skyline'`, `--accent` to `#10b981`, `--vibe` to `'bold'`. Save. Reload browser.
Expected: name changes to Skyline, all accent colors become emerald-green, vibe chip reads BOLD. If anything doesn't update, the hoist is broken — fix before continuing.

- [ ] **Step 4: Commit starter.html**

```bash
git add session-materials/starter.html
git commit -m "Add static starter.html with hoisted editable values"
```

- [ ] **Step 5: Update parent-email-template.md to distribute starter.html in advance**

Add a paragraph to `session-materials/6-parent-email-template.md` (find the existing template; insert near the "what to bring" section). The URL must be the **raw GitHub user content** URL — the regular `blob/...` URL serves the GitHub web wrapper, not the file itself, and "Save As" on that page saves an HTML snapshot of GitHub's site, not the starter.

```markdown
**Optional download (only needed if network fails on session day):**
We recommend downloading the offline starter page in advance.

On macOS / Linux (Terminal):

    curl -L -o ~/Desktop/starter.html \
      https://raw.githubusercontent.com/weihaoqu/learnai-course/main/session-materials/starter.html

On Windows or by hand:
1. Open this URL in a browser:
   https://raw.githubusercontent.com/weihaoqu/learnai-course/main/session-materials/starter.html
2. Press ⌘S / Ctrl-S to save the file.
3. Confirm the saved file's name is `starter.html` (not `starter.html.txt`).
4. Save to the Desktop.

If everything goes smoothly on session day, your child won't open this file.
It's a safety net only.
```

(If `6-parent-email-template.md` doesn't already exist with that section, insert at the most logical place — read the file before editing.)

- [ ] **Step 6: Commit the parent-email update**

```bash
git add session-materials/6-parent-email-template.md
git commit -m "Distribute starter.html via parent email as offline fallback"
```

---

## Task 16: Final verification + swap v2 into place

**Files:**
- Modify: `session-materials/session-slides.html` (replaced)
- Delete: `session-materials/session-slides-v2.html` (renamed away)

**Note on AC8 split** (spec §10 #8, amended). The HH216 projector dry-run can't be done from Q's monitor. The spec formally splits the criterion:
- **AC8a (in scope, this task):** monitor readability check — every slide reads from 8–10ft on Q's home monitor.
- **AC8b (Q follow-up, NOT a plan-completion gate):** real HH216 projector dry-run, scheduled by Q at least 24 hours before session day. Recorded as a `T-24h` TODO in `session-materials/ops-fallback-checklist.md` (added in Step 13 below).

- [ ] **Step 1: Update the JS `titles` array from 20 entries to 30**

In `session-materials/session-slides-v2.html`, find the line:

```javascript
const titles = ['AI Engineering Academy','Today\'s Plan','Pre-Test', ...]; // 20 entries
```

Replace with the new 30 titles:

```javascript
const titles = [
  'AI Engineering Academy',          // S1
  'Pre-Test',                        // S2
  'Consent',                         // S3
  'Launch Claude',                   // S4
  'Safety First',                    // S5
  'Pick Your Nickname',              // S6
  'Quick Win — First Page',          // S7
  'Chatbot vs Agent',                // S8
  'CLAUDE.md & Context',             // S9
  'Permissions · Context · Usage',   // S10
  'Plan Beats Prompt',               // S11
  'The Pro Workflow',                // S12
  'Interview Yourself',              // S13
  'A Good Plan Has',                 // S14
  'Plan Check',                      // S15
  'First Main Build Prompt',         // S16
  'AI Gets Stuff Wrong',             // S17
  'Fix It',                          // S18
  'Open Components',                 // S19
  'UI Quick Wins',                   // S20
  'Codex Review',                    // S21
  'Show & Tell',                     // S22
  'Skills — Use & Make',             // S23
  'MCP',                             // S24
  'Automation',                      // S25
  'Your Toolchain',                  // S26
  'What to Read Next',               // S27
  'Post-Test + Survey',              // S28
  'Remember',                        // S29
  'Thank You',                       // S30
];
```

- [ ] **Step 2: Open the deck in fullscreen mode**

Run: `open session-materials/session-slides-v2.html`
Click into the window, hit `F` for fullscreen.
Expected: title slide fills the screen.

- [ ] **Step 3: Walk slides S1→S15 (Phases 1–5), verify rendering**

Arrow through each slide. Verify:
- No console errors (open DevTools)
- HUD slide title updates per the array (e.g., S5 reads "Safety First")
- Phase accent shows on the eyebrow color (S1–S4 cyan, S5–S6 rose, S7 emerald, S8–S10 violet, S11–S15 blue)

If any slide is wrong, note slide number and which check failed.

- [ ] **Step 4: Walk slides S16→S30 (Phases 6–10), verify rendering**

Continue arrowing through. Same checks. HUD counter reaches "30/30" at S30.

- [ ] **Step 5: Test ink-wash toggle on a random slide**

On any slide, press `I`. Verify ink-wash theme applies (cream background, dark serif text). Press `I` again to revert.

- [ ] **Step 6: Readability check from 8–10ft (AC8a)**

Step back 8–10ft from your monitor. Arrow through every slide once more. Note any slide whose headline or list item requires squinting. If any, file a follow-up commit to bump font size for that specific slide (don't break the swap on this).

- [ ] **Step 7: Strip the v2-redesign tag from the title and titlebar**

Edit `session-materials/session-slides-v2.html`:
- `<title>` → `AI Engineering Academy — Session Slides`
- Titlebar `.deck-name` → `AI Engineering Academy`

- [ ] **Step 8: Resolve QR placeholders (gate for AC4)**

Search the deck for ALL unresolved QR placeholders. The patterns in the plan vary by slide, so use a broad grep:

```bash
grep -n -i "QR" session-materials/session-slides-v2.html
```

There are **5** expected QR locations:
- S2 — pre-test URL (`<strong>QR code + short URL goes here</strong>`)
- S3 — consent URL (`<strong>QR code → weihaoqu...</strong>`)
- S7 — help / prompt-text URL (`<div class="placeholder">QR: Q to fill...</div>`)
- S28 — post-test/survey URL (`<strong>QR code goes here</strong>`)
- S30 — web app home (`<div class="placeholder">QR → weihaoqu...</div>`)

For each, replace the placeholder with a real base64-encoded PNG of the live QR code, OR mark unresolved and surface to Q. **Do not swap to main with placeholders surviving unless Q has explicitly approved that they ship as TODOs.**

If Q hasn't supplied real QR URLs/PNGs yet, stop here and surface:
> "Five QR slots need real codes (S2 pre-test, S3 consent, S7 help, S28 post-test, S30 web app). Please paste the URLs and I'll generate/embed base64 PNGs."

- [ ] **Step 9: Replace target via `git rm` + `git mv` (target exists)**

Plain `git mv session-slides-v2.html session-slides.html` fails because the target exists. Use:

```bash
git rm session-materials/session-slides.html
git mv session-materials/session-slides-v2.html session-materials/session-slides.html
```

- [ ] **Step 10: Verify the renamed file**

Run: `open session-materials/session-slides.html`
Expected: 30-slide deck loads, same as the v2 we tested. Old 20-slide content is gone.

- [ ] **Step 11: Confirm linking pages still work**

Run: `grep -n "session-slides.html" /Users/oreo/Desktop/learnai-course/index.html`
Expected: link points to `session-materials/session-slides.html`. Open `index.html` in browser and click through to slides to confirm the link resolves.

- [ ] **Step 12: Final commit**

```bash
git add session-materials/session-slides.html
git commit -m "Swap in redesigned 30-slide session deck"
```

- [ ] **Step 13: Add AC8b reminder to ops-fallback-checklist.md**

Edit `session-materials/ops-fallback-checklist.md`. Add a new `T-24 hours` block (or append to the existing one created in Task 14) with:

```markdown
- [ ] **HH216 projector dry-run (AC8b — REQUIRED before session day)**
      Bring laptop, drive to HH216, connect to projector, run through all 30 slides.
      Walk to the back row. Confirm every headline and primary list item reads.
      Fix any unreadable slide on the spot via a follow-up commit (font-bump).
      Per spec §10 AC8b, this is a Q-only step and is not part of plan completion,
      but the deck is NOT ready to project until this is done.
```

Then commit:

```bash
git add session-materials/ops-fallback-checklist.md
git commit -m "Add HH216 projector dry-run reminder (AC8b)"
```

- [ ] **Step 14: Verify branch is clean and ready**

Run: `git status -s && git log --oneline main..HEAD`
Expected: clean working tree; ~16 commits ahead of main.

---

## Task 17: Final Codex review of the implementation

**Files:** none modified

- [ ] **Step 1: Send the full diff to Codex for a final code review per Rule #1**

Avoid `$(cat ...)` arg-injection (brittle: shell quoting / arg-length limits). Use a prompt file + stdin:

```bash
git diff main..HEAD -- session-materials/ docs/superpowers/ > /tmp/final-diff.patch

cat > /tmp/codex-impl-prompt.txt <<'EOF'
Code-review this diff for a static HTML deck redesign. The spec lives at:
docs/superpowers/specs/2026-05-16-slide-redesign-design.md

Confirm:
(1) 30 slides present and ordered per spec §4
(2) phase accent classes applied per spec §6 (10 phases)
(3) safety + privacy language matches spec §3.3
(4) facilitator-only docs exist and reference IRB FA 2562 + ops fallback
(5) no broken HTML/CSS
(6) no leaked TODO / placeholder wording survived ("QR: Q to fill", "[APPROVED WORDING HERE]")
(7) titles array has exactly 30 entries
(8) starter.html top-4-edit hoist genuinely works

Be terse. List blocking issues only.

DIFF:
EOF

cat /tmp/codex-impl-prompt.txt /tmp/final-diff.patch \
  | codex exec --sandbox read-only --skip-git-repo-check - \
  2>&1 | tee /tmp/codex-final-impl-review.txt
```

The trailing `-` tells `codex exec` to read the prompt from stdin (per `codex exec --help`).

- [ ] **Step 2: If Codex flags blockers, fix and re-commit; if approved, surface to Q**

Bring Codex's verdict back to Q. If READY, ask Q to do the final manual dry-run on the projector before any push to remote. If issues, fix them as small follow-up commits, re-run review.

- [ ] **Step 3: DO NOT PUSH**

Per Q's CLAUDE.md: "NEVER push to remote without asking Q first." This plan ends with local commits only. Q decides when to push.

---

## Notes for the executor

- **Order matters.** Tasks 1 → 16 are sequential. Tasks 12–15 (agenda + facilitator docs + starter) can be done in parallel after Task 11 if the executor is comfortable; otherwise sequential is safer.
- **Each task ends with a commit.** Commit messages should be imperative ("Add Phase X slides"), no Co-Authored-By footer required for individual implementation commits per the user's recent commit style (`b4bcd30 Add QR code to session slides and materials` has no co-author footer).
- **Don't push.** Branch stays local until Q approves.
- **Don't modify** `consent_texts.md`, the pre/post-test URLs, or anything in `llmdata/`.
- **Placeholders to flag for Q.** **Five** QR codes are placeholders that Q must fill: S2 (pre-test URL), S3 (consent URL — base64 PNG can be copied from current S4), S7 (help / prompt URL), S28 (post-test/survey URL), S30 (web-app home). All five are caught by `grep -i QR session-materials/session-slides-v2.html` per Task 16 Step 8.
- **If anything diverges from spec:** stop. Don't improvise. Note the divergence and surface to Q before continuing.
