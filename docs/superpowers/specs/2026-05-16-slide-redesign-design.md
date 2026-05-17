# Slide Deck Redesign — Summer 2026 HS Session

**Date:** 2026-05-16
**Author:** Q (Dr. Weihao Qu) · drafted with Claude · reviewed by Codex
**Status:** Approved skeleton — pending implementation plan
**Replaces:** `session-materials/session-slides.html` (current 20-slide version)
**Scope:** Total redesign driven by live-session debrief from 2026-05-15

---

## 1. Motivation

**Trigger.** Q ran a live session and reported two failures:

1. **Too abstract.** Vibe-Trap (S7) felt preachy; 4-Part Prompt Structure (S8) felt academic. Students glazed.
2. **Too lecture-y.** Project time was the highlight; talking was not.

Q's call: **total redesign**, not a patch. Build-first arc, workshop vibe, hi-contrast billboard aesthetic.

**Additional scope.** Q later requested agent-fundamentals coverage (CLAUDE.md, MCP, Skills, context/usage, Codex usage, UI tricks like 21st.dev, automation, creating your own skill). Codex review surfaced a showstopper: the first draft put the first page build at minute 55 — same lecture failure as the deck being replaced. This spec reflects the post-Codex restructure.

---

## 2. Audience & Constraints

- **Audience:** 5 first-time HS students (15–17 yo). Parents observe.
- **Setting:** Monmouth University HH216, Summer 2026.
- **Time budget:** 110 minutes (was 90; +20 min for agent-fundamentals coverage).
- **IRB:** Protocol FA 2562. Pre-test, consent, post-test, survey cannot be modified. Non-consent path must be honored exactly.
- **Tech state at arrival:** Most students arrive with Claude Code installed. Expect 1–2 troubleshoots — handled in parallel with the OPEN phase, not as a serialized block.
- **Hard pedagogical promise:** Build-first. **Every student must have a rendered HTML page on screen by minute 25.**
- **Visual aesthetic:** Hi-contrast "one idea, huge" billboard style. Each slide = one statement or one big visual. Dark background, neon accent, very large headline.
- **Reusability:** Slides also serve self-study (next cohort, online viewers). Activity slides must contain enough on-screen text that the activity reads even without a teacher present.

---

## 3. Pedagogy Decisions (with rationale)

### 3.1 Build-first, with quick-win artifact
**Decision:** Every student renders a `starter.html` by minute 25 — before any deep teaching.
**Why:** First-time students need a visible win before vocabulary, or theory slides recreate the lecture failure that drove this redesign. Codex flagged this as the showstopper.
**Trade:** Less depth in opening framing.

### 3.2 AskUserQuestion-then-prompt workflow (rebranded)
**Decision:** Students plan by asking Claude to interview them one question at a time, then write ONE crafted build prompt, then iterate.
**Why:** Teaches "plan beats prompt" by *doing* it. Replaces the academic 4-Part Prompt Structure slide that failed in the previous session. Models how pros actually work (spec → execute → iterate).
**Trade:** Pedagogically rich but doesn't generalize cleanly past small builds. We mitigate with an on-slide caveat in S16.
**Language:** Avoid the "AskUserQuestion" tool name. Say "ask Claude to interview you one question at a time." (Codex feedback — jargon hurts comprehension.)

### 3.3 Safety before AI input
**Decision:** Dedicated Safety phase (S5–S6) before any prompt is sent.
**Why:** Personal-page topic + minors + IRB = real privacy risk. Every student adopts a nickname/fictional persona. No real names, addresses, schedules, contact info, health, family, or face photos enter Claude at any point.
**Trade:** 5 min of session time.

### 3.4 Mini-module placement: AFTER first render, not before
**Decision:** Teach agent fundamentals (chatbot vs agent, CLAUDE.md, permissions/context/usage) immediately after the quick-win build, when students have just witnessed those mechanics live.
**Why:** "Decode what just happened" is far more memorable than "here are concepts you'll see later." Codex's #2 flag.
**Trade:** Concepts get less air time individually. We compress 6 fundamental slides to 3 to keep it under 7 minutes.

### 3.5 MCP and Skills move to Level Up
**Decision:** MCP and Skills are not taught in the main flow. They appear in Phase 9 Level Up as roadmap content.
**Why:** Students don't use MCP or write Skills in-session. Teaching them before they have a workflow worth automating is wasted air time. Codex's #2/3.
**Trade:** Less depth on these topics in-session — students see them as "what's next" rather than internalize.

### 3.6 Codex review framed as risk-reduction, not proof
**Decision:** S21 includes the explicit caveat: "Review reduces risk; it doesn't prove correctness."
**Why:** Codex's #5. HS students must not learn to over-trust any AI's verdict.

### 3.7 "Toolchain under your supervision," not "AI team"
**Decision:** Phase 9's recap diagram frames the agent stack as a toolchain you direct, not a team that acts independently.
**Why:** Codex's #3. "Team" language anthropomorphizes and obscures responsibility. Students must own the supervision role.

### 3.8 No hard numbers on context or usage
**Decision:** S10 says "finite working memory + account usage" not "200K tokens / $20/mo."
**Why:** Codex's #3. Product specifics drift; the principle ("two budgets, both finite") is durable.

### 3.9 Open components with license check
**Decision:** S19 says "Use open components · check the license," not "steal beautiful components."
**Why:** Codex's #5. HS students need to learn licensing as a habit, not piracy as a joke.

### 3.10 Parent rule explicit
**Decision:** S5 includes a parent rule: no screen photos, no coaching survey answers, no pressure around consent.
**Why:** Parents observing minors in an IRB-protected study create real role-confusion risk. Make the boundary explicit.

---

## 4. Skeleton

**30 slides · 110 min · 10 phases.** Hi-contrast billboards. ▮ Teach / ▯ Activity.

```
PHASE 1 — OPEN (0–10 min) · tech rescue in parallel
  S1   ▮ Title
  S2   ▯ Pre-test                QR + "5 min · no grade"
  S3   ▯ Consent                 QR + "I Agree / I Do Not Agree"
                                  (non-consent path → facilitator runbook)
  S4   ▯ Launch Claude           Terminal → `claude` → hand up if red

PHASE 2 — SAFETY FIRST (10–15 min)
  S5   ▮ Safety rules            Fictional persona only. Forbidden info list.
                                  Parent rule.
  S6   ▯ Pick your nickname      Concrete: write a nickname now.

PHASE 3 — QUICK WIN (15–25 min)
  S7   ▯ Tiny build              Paste starter.html prompt → first page
                                  on screen by minute 25.

PHASE 4 — DECODE WHAT JUST HAPPENED (25–32 min)
  S8   ▮ Chatbot vs Agent        The tool loop you just watched.
  S9   ▮ CLAUDE.md & context     Guidance loaded INTO context.
  S10  ▮ Permissions · context   Three things to watch. /clear resets
       · usage                    the conversation only.

PHASE 5 — PLAN YOUR REAL SITE (32–50 min)
  S11  ▮ Plan beats Prompt       Big-idea billboard.
  S12  ▮ Pro Workflow            PLAN → ONE PROMPT → ITERATE → POLISH
  S13  ▯ Ask Claude to interview "Interview me one question at a time…"
       you                       
  S14  ▮ A good plan has         5-item checklist.
  S15  ▯ Plan check              Coach gate with Q.

PHASE 6 — BUILD YOUR REAL SITE (50–70 min)
  S16  ▯ First Main Build Prompt Fill-in template + scaffold caveat.
  S17  ▮ AI gets stuff wrong     Bug ≠ failure.
  S18  ▯ Fix it                  Talk like a teammate.

PHASE 7 — POLISH (70–80 min)
  S19  ▯ Open components         21st.dev / shadcn · check license.
  S20  ▮ UI quick wins           5 cheats.
  S21  ▯ Codex review            Second opinion · reduces risk only.

PHASE 8 — SHARE (80–90 min)
  S22  ▯ Show & Tell             2 min: page + lesson + AI fumble.

PHASE 9 — LEVEL UP (90–103 min · tour pace ~2.5 min/slide)
  S23  ▮ Skills · use & make     Project path .claude/skills/…/SKILL.md
  S24  ▮ MCP                     Protocol for external tools. Not today.
  S25  ▮ Automation              Hooks · cron · background agents.
  S26  ▮ Your toolchain          You supervise; tools execute.
  S27  ▮ What to read next       Wiki · playlist · office hours · email.

PHASE 10 — CLOSE (103–110 min)
  S28  ▯ Post-test + Survey      QR.
  S29  ▮ Remember                3 takeaways.
  S30  ▯ Thank you               QR home + send-me-what-you-make.
```

---

## 5. Slide-by-Slide Content

For each slide: **▮ Teach** or **▯ Activity**. Format:
- HERO (huge headline)
- SUB / LIST / SAMPLE / TEMPLATE (supporting element)
- FOOTER (small note, optional)
- CUE (1-line speaker prompt)

### Phase 1 — OPEN

```
S1 ▮ TITLE
   HERO:    AI Engineering Academy
   SUB:     A personal landing page about your persona. Built with AI. 110 min.
   FOOTER:  Prof. Weihao Qu · Monmouth University HH216
   CUE:     "Hi. I'm Prof. Qu. Today you build a real page about a
             persona. Parents — your kid will show it to you in 100 min."

S2 ▯ PRE-TEST
   HERO:    5-minute quiz
   SUB:     No grade. We measure what you learn today.
   FUNCT:   Big QR + short URL
   CUE:     "Open on your laptop. Not graded. Baseline."

S3 ▯ CONSENT
   HERO:    Read. Decide.
   SUB:     I Agree or I Do Not Agree — either way you do everything today.
   FUNCT:   Big QR → weihaoqu.github.io/learnai-course/
   FOOTER:  (non-consent → facilitator runbook · NOT shown to students)
   CUE:     "Read carefully. Click your choice."

S4 ▯ LAUNCH CLAUDE
   HERO:    Open terminal.  Type:  claude
   SUB:     Hit enter. Raise hand if anything is red.
   FOOTER:  Tech help happens in parallel — we don't wait.
   CUE:     "Type the word claude. Red text = hand up, I'll fix you
             while we keep moving."
```

### Phase 2 — SAFETY FIRST

```
S5 ▮ SAFETY RULES
   HERO:    Safety first.
   LIST:    ❌  NO real name (use a nickname)
            ❌  NO address, school name, phone, email
            ❌  NO passwords, health, family details
            ❌  NO face photos
            ✅  Files stay on YOUR laptop
            ✅  Read every permission prompt
   PARENT BOX (bottom):
            Parents: no screen photos. No coaching answers.
            No pressure around consent.
   CUE:     "Before AI: two rules. Nickname only — Claude doesn't
             need your real name. Read every permission prompt — Claude
             asks before writing files. Parents: observers, not coaches."

S6 ▯ PICK YOUR NICKNAME
   HERO:    Pick your nickname.
   SUB:     Write it on a sticky note. We use it for the whole session.
   EXAMPLES (small): Skyline · NebulaCat · Trail · GameDev42 · CodexJr
   CUE:     "30 seconds. Pick something fun. This is who Claude
             will know today."
```

### Phase 3 — QUICK WIN

```
S7 ▯ TINY BUILD
   HERO:    First page. Right now.
   TEMPLATE: ─────────────────────────────────────
             Make me a `starter.html` that says
             "Hi, I'm <nickname>". Dark background.
             One sentence about what my persona
             likes (anything fictional is fine).
             Open it in my browser when done.
             ─────────────────────────────────────
   SUB:     Paste. Hit enter. Watch.
   FOOTER:  Goal: every student has a page on screen by minute 25.
   CUE:     "Replace nickname. Pick something fictional you 'like' —
             robot dogs, space pirates, whatever. Send."
```

### Phase 4 — DECODE WHAT JUST HAPPENED

```
S8 ▮ CHATBOT vs AGENT
   HERO:    Chatbot answers. Agent does.
   DIAGRAM: CHATBOT:  ask → answer
            AGENT:    ask → USE TOOLS → CHECK → try again
   SUB:     What you just saw: the tool loop. That's what makes
            Claude Code an agent.
   CUE:     "ChatGPT in browser = mostly chatbot. What you just
             saw = agent. Claude wrote the file, opened it,
             checked it. You'll see that loop a hundred times today."

S9 ▮ CLAUDE.md & CONTEXT
   HERO:    Claude reads CLAUDE.md first.
   SAMPLE:  ── CLAUDE.md ──────────────────
            # Workshop Notes
            - Call me <nickname>
            - I'm 15 — keep code simple
            - Plain HTML/CSS only
            ──────────────────────────────
   SUB:     Guidance, not enforcement. Loaded into context every session.
   CUE:     "Project rules in a file. Claude reads it first. MY
             CLAUDE.md says 'Call me Q' — that's why Claude calls
             me Q. Try writing one."

S10 ▮ PERMISSIONS · CONTEXT · USAGE
   HERO:    Three things to watch.
   LIST:    🔒 Permissions — Claude asks before writing files. Read carefully.
            🧠 Context     — Working memory. Finite. `/clear` starts fresh.
            💰 Usage       — Your account budget. Pro is plenty for learning.
   FOOTER:  /clear resets the conversation. Not your files. Not your usage.
   CUE:     "Three knobs. Permissions stop dangerous things. Context
             fills up — clear when stale. Usage is your monthly budget."
```

### Phase 5 — PLAN YOUR REAL SITE

```
S11 ▮ PLAN BEATS PROMPT
   HERO:    Plan beats Prompt.
   SUB:     The #1 mistake: jumping in too fast.
   CUE:     "Now we plan a REAL page. Same pattern as starter.html,
             but deeper. Most people skip planning — that's why
             they fight with AI."

S12 ▮ PRO WORKFLOW
   HERO:    PLAN → ONE PROMPT → ITERATE → POLISH
            [4 big chips with arrows]
   SUB:     You'll do all four — same way pros do.
   CUE:     "This rhythm. You did one round on starter. Now we
             do it deeper for your real page."

S13 ▯ ASK CLAUDE TO INTERVIEW YOU
   HERO:    Tell Claude:
   TEMPLATE: ─────────────────────────────────────
             Interview me one question at a time
             to plan a personal landing page for
             my nickname persona. Cover: who they
             are, sections, vibe, color, signature.
             Output a structured plan.
             ─────────────────────────────────────
   SUB:     Answer each carefully. Better plan = better build.
   CUE:     "Paste. Claude will ask you stuff. Answer as your
             nickname persona, not your real self. Take your time."

S14 ▮ A GOOD PLAN HAS
   HERO:    A good plan has:
   LIST:    · 1 sentence about your persona
            · 3 sections (e.g., About / Projects / Contact)
            · A vibe word (calm / bold / playful / pro)
            · A color
            · One thing that makes it YOURS
   CUE:     "Check the plan against this. Missing one? Tell Claude
             'ask one more question.'"

S15 ▯ PLAN CHECK
   HERO:    Show Q your plan.
   SUB:     30-second review. Wave me over.
   CHECKLIST visual matching S14
   CUE:     "No good plan, no build. Wave me over. I sign off,
             you build."
```

### Phase 6 — BUILD YOUR REAL SITE

```
S16 ▯ FIRST MAIN BUILD PROMPT
   HERO:    Now the real one.
   TEMPLATE: ─────────────────────────────────────
             Using the plan we just made, build
             me a single HTML file for a personal
             landing page. Open it when done.
             ─────────────────────────────────────
   FOOTER (call-out box):
            Small site = one-prompt scaffold.
            Real projects = small prompts, verify each step.
   CUE:     "Paste. Claude has your plan in context. One prompt,
             one build. In real life you'd break this up — today
             is a teaching scaffold."

S17 ▮ AI GETS STUFF WRONG
   HERO:    Expect 1–2 things broken.
   LIST:    · A link goes to the wrong place
            · The font looks weird
            · A section is missing
   FOOTER:  Bug ≠ failure.   Bug = iteration.
   CUE:     "Every first build has bugs. Pros expect them. You
             just talk to Claude."

S18 ▯ FIX IT
   HERO:    Talk like a teammate.
   EXAMPLES: "Make the header bigger."
             "The font is ugly. Try modern."
             "Add a dark mode toggle."
   SUB:     Plain English. Specific. One at a time.
   CUE:     "Don't write code. Talk. Specific complaints, one
             at a time."
```

### Phase 7 — POLISH

```
S19 ▯ OPEN COMPONENTS
   HERO:    Use open components.
   SUB:     21st.dev · shadcn/ui — free, open licenses.
   WARNING: Check the license. Don't paste closed-source code.
   CUE:     "Free and open libraries. Find a button you like, copy,
             ask Claude to integrate. Check the license tag — open is fine."

S20 ▮ UI QUICK WINS
   HERO:    5 cheats to look pro.
   LIST:    · Gradient background
            · One sans-serif font (Inter, Geist)
            · Lucide icons, not emojis
            · Generous whitespace
            · Dark mode by default
   FOOTER:  Tell Claude: "apply these."
   CUE:     "Five cheats. Pick two. Tell Claude."

S21 ▯ CODEX REVIEW
   HERO:    /codex review
   SUB:     Second opinion. Different blind spots.
   WARNING: Review reduces risk. It doesn't prove correctness.
   CUE:     "Different AI = different blind spots. Run /codex review
             before show & tell. Pros always get a second opinion."
```

### Phase 8 — SHARE

```
S22 ▯ SHOW & TELL
   HERO:    2 min each.
   LIST:    · Show your page
            · One thing you learned
            · One thing AI got wrong
   CUE:     "2 min. Show. One lesson. One fumble. We celebrate
             the fumbles."
```

### Phase 9 — LEVEL UP

```
S23 ▮ SKILLS — USE & MAKE
   HERO:    Pre-packaged superpowers.
   SAMPLE:  ── .claude/skills/landing-page/SKILL.md ──
            ---
            name: landing-page
            description: Build a personal landing page
            ---
            Interview me one question at a time.
            Cover: persona, sections, vibe, color.
            Then build the HTML file.
            ──────────────────────────────────────
   SUB:     Did it twice? Codify it.
   FOOTER:  Project: .claude/skills/…/SKILL.md
            Personal: ~/.claude/skills/…/SKILL.md
   CUE:     "Save a workflow once, replay forever. Project skill in
             .claude/skills. Personal in ~/.claude/skills."

S24 ▮ MCP
   HERO:    MCP = connect to anything.
   SUB:     Protocol for external tools, data, and APIs.
   DIAGRAM: Claude Code ─ MCP ─ [Gmail · GitHub · Drive · custom]
   WARNING: We did NOT connect personal accounts today.
   CUE:     "When you want Claude to email, push code, control a
             browser — MCP. Not today. At home, with care."

S25 ▮ AUTOMATION
   HERO:    AI while you sleep.
   ROW:     HOOKS — on every save
            CRON  — daily/weekly
            AGENTS — background jobs
   SUB:     Set once. Run forever.
   CUE:     "Format on save. Email summary Monday morning. Build
             on commit. Set it and forget it."

S26 ▮ YOUR TOOLCHAIN
   HERO:    You direct. Tools execute.
   DIAGRAM: YOU (supervisor)
             ├─ Claude Code  →  builds
             ├─ Codex        →  reviews
             ├─ Skills       →  workflows
             ├─ MCP          →  connections
             └─ CLAUDE.md    →  your rules
   SUB:     Toolchain under your supervision.
   CUE:     "Real AI work = directing a toolchain. You decide.
             Tools execute. You verify."

S27 ▮ WHAT TO READ NEXT
   HERO:    Keep going.
   LIST:    📚 LearnAI Wiki — weihaoqu.github.io/learnAIDoc
            🎥 Claude 101 playlist — Anthropic on YouTube
            💬 Office hours — Saturdays
            📧 weihaoqu25@gmail.com
   CUE:     "Wiki for depth. Playlist for tutorials. Office
             hours if stuck. Email me — I read every one."
```

### Phase 10 — CLOSE

```
S28 ▯ POST-TEST + SURVEY
   HERO:    Same quiz. New score.
   SUB:     10 min. Honest answers shape the next session.
   FUNCT:   Big QR.
   CUE:     "Same questions as the start. See your growth. Plus
             a survey — be brutally honest."

S29 ▮ REMEMBER
   HERO:    Three things.
   LIST:    1. AI is a tool. You are the thinker.
            2. A plan beats a clever prompt.
            3. You direct the toolchain.
   CUE:     "Take these home. Forget everything else, remember these."

S30 ▯ THANK YOU
   HERO:    Thank you.
   SUB:     The web app is yours. Build something this week. Send it to me.
   FUNCT:   Big QR + email.
   FOOTER:  weihaoqu.github.io/learnai-course
   CUE:     "Parents — info sheet on your way out. Students — keep
             building. Send me what you make."
```

---

## 6. Visual & Styling System

**Aesthetic:** Hi-contrast "one idea, huge." Each slide reads from across the room. Black/very-dark background. Single neon accent color per slide phase. Headlines very large (~80–120pt equivalent). Generous whitespace. Almost no decorative chrome.

**Reuse from existing deck:**
- The current `session-slides.html` keyboard shortcuts (← → arrows, S reveal, I ink-wash toggle, F fullscreen) stay.
- The ink-wash theme toggle stays as an option.
- The QR code on slide 4 (consent) carries over to multiple slides (S2, S3, S7, S28, S30).
- The keyboard hint footer stays on the title slide only.

**New visual rules:**
- One sans-serif type family (Inter or Geist) across the deck.
- Phase accent colors:
  - Open: cyan
  - Safety: rose (urgency)
  - Quick Win: emerald (success)
  - Decode: violet (insight)
  - Plan: blue (cool, thoughtful)
  - Build: amber (action)
  - Polish: gold
  - Share: cyan
  - Level Up: violet
  - Close: emerald
- ▮ Teach billboards: minimal text, one headline + one supporting line/list.
- ▯ Activity billboards: include a copy-pasteable code block where relevant (S7, S13, S16, S21, S23), with a visible copy affordance.

**Out of scope for the visual redesign:**
- Custom illustrations / iconography commissions
- Animated transitions beyond what the current deck already has
- Video embeds (the previous deck used 2; new deck has none in the main flow)

---

## 7. Facilitator-Only Documents (NOT in student deck)

Both ship alongside the deck in `session-materials/` but are not shown to students.

### 7.1 `IRB-non-consent-runbook.md`
Tied verbatim to FA 2562 approved protocol. Contains:
- Exact words to say if a student picks "I Do Not Agree"
- Exact words for a parent declining on a student's behalf
- Confirmation that the student still participates fully in all activities
- Confirmation that no data from that student is collected for research
- Where the student's pre/post test results go (discarded vs. kept-but-flagged)
- Single-page printable

### 7.2 `ops-fallback-checklist.md`
Facilitator's pre-session and in-session ops guide. Contains:
- **T–24h:** parent email reminder, setup-guide check, charging reminder
- **T–1h:** projector test, network test, Claude login test on Q's machine
- **T–15min:** static HTML starter template available in repo (fallback if Claude is unreachable)
- **In-session failure modes:** Claude login fail / quota hit / network down / package install asked-for / file written to wrong place
- **Recovery scripts** for each failure mode
- **Local-file-only success path:** create → open → fix → save — never publish
- **No-surprise-installs rule:** if Claude proposes installing something, decline and ask Q

---

## 8. What's Explicitly Out of Scope

- **Pre/post-test content changes** — IRB-locked.
- **Consent-text wording** — IRB-locked.
- **Adding a video** — previous deck used 2 videos; new deck has none. Codex flagged that videos can break ops fallback if network fails. If a video is ever added back, it must have a fallback path.
- **Connecting personal accounts via MCP in-session** — Codex #5 / privacy risk.
- **A second project option** — shared template (personal landing page) only. Lessons from today's session: choice paralyzed some students.
- **Day-2 / follow-up curriculum** — out of scope. Q can build a Session 2 deck later for advanced topics.

---

## 9. Open Questions & Risks

| # | Question / Risk | Mitigation |
|---|-----------------|------------|
| 1 | The 10-min Quick Win in Phase 3 assumes Claude responds in <2 min for all 5 students. If quota or latency hits, the timing collapses. | Ops fallback (§7.2) includes a static HTML starter the facilitator can hand students. |
| 2 | Plan Check (S15) is a serialized gate through Q. With 5 students at 1 min each = 5 min. If a student is mid-plan when checked, time slips. | Q can sign off in parallel by reading shoulder-to-shoulder during the plan phase. |
| 3 | S23 Skills SKILL.md syntax may drift if Claude Code's skill format changes before summer 2026. | Verify SKILL.md frontmatter format 2 weeks before session; update slide if needed. |
| 4 | S24 MCP "we did NOT connect today" assumes no student tries on their own. A curious student could connect their own Gmail from the terminal. | Phase 2 Safety rule covers this. Q reinforces verbally. |
| 5 | Hi-contrast aesthetic vs. current ink-wash theme. Some content (samples, code blocks) needs careful contrast tuning. | Visual implementation phase will lock contrast values; design review before printing/projecting. |
| 6 | 110 min may run over with 5 students at variable build pace. | If running long: cut S25 Automation, then S24 MCP, then S20 UI Quick Wins. Never cut Safety, Quick Win, Plan Check, Show & Tell, or Post-test. |

---

## 10. Acceptance Criteria

The redesigned deck is done when:

1. `session-materials/session-slides.html` contains all 30 slides matching the content in §5.
2. The hi-contrast billboard aesthetic (§6) is applied consistently.
3. Keyboard shortcuts and ink-wash toggle from the current deck still work.
4. All QR codes resolve to the correct URLs (consent → web app; post-test → form).
5. `session-materials/IRB-non-consent-runbook.md` exists with content per §7.1.
6. `session-materials/ops-fallback-checklist.md` exists with content per §7.2.
7. A static HTML starter template exists in `session-materials/` for ops fallback.
8. Readability is verified two ways — both required, but only AC8a blocks implementation completion:
   - **AC8a (completion gate):** Q does a readability walk-through on her own monitor at 8–10ft: every slide's headline and primary text reads from that distance. Slides that fail get a follow-up font-bump commit.
   - **AC8b (Q follow-up, NOT a plan-completion gate):** A live dry-run on the projector at HH216 — done by Q at least 24 hours before the actual session — confirms every slide reads from the back row. This step requires physical access to HH216 and cannot be satisfied from the development machine; the implementation plan completes without it, and the dry-run is tracked in `session-materials/ops-fallback-checklist.md` under a `T-24h` block.
9. The session-agenda markdown (`session-materials/1-session-agenda.md`) is updated to match the new 10-phase / 110-min plan.

---

## 11. Implementation Plan (next step, not this doc)

A separate implementation plan will follow (`docs/superpowers/plans/2026-05-16-slide-redesign-plan.md`). It will break this spec into ordered build tasks with verification checkpoints. The implementation plan is NOT this document.
