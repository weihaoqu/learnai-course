# Project Progress

Live cross-agent handoff log. Newest entry on top. Each entry is one
checkpoint written by one agent. Both Codex and Claude Code append
entries; nobody edits prior entries. Managed by
`scripts/agent-handoff.sh checkpoint`.

<!-- newest entry below -->

## 2026-07-31 09:17:28 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `3ec9516` — Add Module 0B transformer deep dive
- **Upstream:** origin/slide-redesign-2026-05 — ahead 0, behind 0

### Summary

Completed Week 14 final showcase module.

What changed:
- Added week-14-final-showcase.html as a standalone 60-minute interactive teaching deck: final showcase framing, small/medium/large class format planner, demo evidence arc, final rubric, readiness checklist, presentation timer, AI-use disclosure builder, peer feedback builder, career reflection builder, Final Showcase Packet builder, and conditional course-close/post-test slide.
- Updated index.html Week 14 learning-path entry and orbit card to link to week-14-final-showcase.html and use the full title "Week 14: Final Web App Showcase and AI Collaboration Reflection."
- Week 14 requirements covered: final app or fallback; Week 10 build evidence; Week 11 verified source/career evidence; Week 13 security/privacy/limitation evidence; AI-use disclosure with "how I checked it"; known limitation; realistic next step; conditional research post-test handling.
- Did not link the 404 Agent Portfolio Evidence page. External resources are optional/supporting only: Google PAIR Guidebook, PAIR codelab, NACE Career Readiness, and Stanford d.school feedback method.

Verification:
- git diff --check passed for index.html and the new Week 14 file.
- Inline JS parse passed for index.html and week-14-final-showcase.html.
- Local href/src check passed for Week 14 and the hub Week 14 target.
- Week 14 section balance passed: 11/11 sections, 11 slide sections, no duplicate ids, required slide ids present.
- Week 14 non-ASCII scan found no matches.
- External Week 14 links returned HTTP 200.
- Bounded Codex full review found no blockers; applied the one non-blocking title consistency fix and a one-line slide-id cleanup; final delta review approved.
- No Playwright/browser automation used, per Q's prior instruction.

No commit or push performed.

Suggested next work:
- Q can inspect Week 14 locally via week-14-final-showcase.html and the Week 14 hub card.
- Next useful step is an end-to-end course-map review across Weeks 1-14, or commit preparation if Q is satisfied.

### Working tree (`git status --short`)

```text
 M index.html
 M module-00-llm-basics.html
 M progress.md
?? CLAUDE.md
?? course-case-bank.html
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? docs/week-03-14-material-candidates.md
?? image/
?? session-materials/week-05-synthetic-admin-dataset.csv
?? sos-talk-may12.html
?? teacher-training-ai-fluency.html
?? ui.txt
?? week-02-agent-foundations.html
?? week-02-foundation-readiness-check.html
?? week-03-responsible-ai-decisions.html
?? week-04-writing-word-documents.html
?? week-05-data-excel-workflows.html
?? week-06-media-generation-presentations.html
?? week-07-midterm-studio.html
?? week-08-web-basics-design.html
?? week-09-interactivity-intelligence.html
?? week-10-complete-static-deployment.html
?? week-11-knowledge-career-evidence.html
?? week-12-advanced-prompting.html
?? week-13-security-review-lab.html
?? week-14-final-showcase.html
```

### Unstaged diff (`git diff --stat`)

```text
 index.html                |  410 +++++--
 module-00-llm-basics.html |   27 +
 progress.md               | 2738 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 3056 insertions(+), 119 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
3ec9516 Add Module 0B transformer deep dive
 index.html                                         |  42 +-
 module-00b-transformer-deep-dive.html              | 599 +++++++++++++++++++++
 .../transformer-deep-dive-homework.html            | 148 +++++
 .../transformer-deep-dive-homework.pdf             | Bin 0 -> 31627 bytes
 4 files changed, 775 insertions(+), 14 deletions(-)
```

---

## 2026-07-31 08:22:24 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `3ec9516` — Add Module 0B transformer deep dive
- **Upstream:** origin/slide-redesign-2026-05 — ahead 0, behind 0

### Summary

Integrated Q's newly listed LearnAI wiki posts into the CS-215 web app selectively.

What changed:
- Updated index.html orbit resources for Weeks 2, 6, 8, 11, and 13.
- Updated week-02-agent-foundations.html homework optional deep-dive card with AI Agent Book and What Is Agentic Engineering links.
- Updated week-06-media-generation-presentations.html homework with optional/demo links for AI slide tools, Manim + Remotion, and transcript-first video editing. Clearly marked setup-heavy video workflows as not required.
- Updated week-08-web-basics-design.html with a new optional requirements-interview slide using grill-me and html-anything, plus matching homework resource links.
- Updated week-11-knowledge-career-evidence.html homework with optional Awesome Auto Research Tools map.
- Updated week-13-security-review-lab.html with a new action-risk tiers slide using OpenWorker as a case only, plus a minimum-sufficient-fix triage note using Ponytail. Clarified optional security references in homework.
- Updated teacher-training-ai-fluency.html with a hidden instructor-facing Agent Resources section covering AI Agent Book, CMU 11-768, What Is Agentic Engineering, Claude Code context/CLAUDE.md practices, Matt Pocock skills, grill-me, Ponytail, OpenWorker, AI slide tools, Manim + Remotion, video-use, html-anything, Awesome Auto Research Tools, and the LearnAI wiki index.

Resource placement rationale:
- Student-facing required path remains unchanged.
- New student-facing resources are optional and tied to existing week goals.
- Setup-heavy tools (video-use, Manim/Remotion, auto-research tools, OpenWorker) are optional/demo/case resources only.
- CMU 11-768 and Claude context practices stay hidden/instructor-facing because they are too advanced/noisy for required CS-215 student work.
- OpenWorker is framed as an action-risk classification case only; no install/connect instruction was added.
- Ponytail is framed as minimum sufficient fix / anti-overengineering for Week 13 review triage.

Verification:
- git diff --check passed for all affected files.
- Inline JS parse passed for index.html, Week 2, Week 6, Week 8, Week 11, Week 13, and teacher training pages.
- Local href/anchor check passed for affected files.
- Section balance passed: Week 2 21/21, Week 6 12/12, Week 8 10/10, Week 11 13/13, Week 13 14/14, teacher training 10/10.
- New text scan found no non-ASCII characters in affected module pages.
- Public wiki URLs returned HTTP 200, including corrected wiki index URL at https://weihaoqu.github.io/learnAIDoc/wiki-index.html.
- No Playwright/browser automation used.

Review gate:
- Bounded Codex review found no blockers.
- Review suggested clearer Week 2 claude-tap label and clearer Week 13 optional security wording.
- Applied those wording fixes and ran a focused follow-up review; no blockers.

No commit or push performed.

Suggested next work:
- Move on to Week 14 final presentation/showcase module, unless Q wants to inspect the newly integrated wiki resource links first.

### Working tree (`git status --short`)

```text
 M index.html
 M module-00-llm-basics.html
 M progress.md
?? CLAUDE.md
?? course-case-bank.html
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? docs/week-03-14-material-candidates.md
?? image/
?? session-materials/week-05-synthetic-admin-dataset.csv
?? sos-talk-may12.html
?? teacher-training-ai-fluency.html
?? ui.txt
?? week-02-agent-foundations.html
?? week-02-foundation-readiness-check.html
?? week-03-responsible-ai-decisions.html
?? week-04-writing-word-documents.html
?? week-05-data-excel-workflows.html
?? week-06-media-generation-presentations.html
?? week-07-midterm-studio.html
?? week-08-web-basics-design.html
?? week-09-interactivity-intelligence.html
?? week-10-complete-static-deployment.html
?? week-11-knowledge-career-evidence.html
?? week-12-advanced-prompting.html
?? week-13-security-review-lab.html
```

### Unstaged diff (`git diff --stat`)

```text
 index.html                |  409 +++++--
 module-00-llm-basics.html |   27 +
 progress.md               | 2636 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 2953 insertions(+), 119 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
3ec9516 Add Module 0B transformer deep dive
 index.html                                         |  42 +-
 module-00b-transformer-deep-dive.html              | 599 +++++++++++++++++++++
 .../transformer-deep-dive-homework.html            | 148 +++++
 .../transformer-deep-dive-homework.pdf             | Bin 0 -> 31627 bytes
 4 files changed, 775 insertions(+), 14 deletions(-)
```

---

## 2026-07-31 08:04:10 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `3ec9516` — Add Module 0B transformer deep dive
- **Upstream:** origin/slide-redesign-2026-05 — ahead 0, behind 0

### Summary

Completed Week 13 AI-assisted security review module.

What changed:
- Added standalone interactive deck: week-13-security-review-lab.html (654 lines, 13 slide sections).
- Updated index.html Week 13 learning-path card to link to week-13-security-review-lab.html.
- Updated index.html Week 13 orbit card from placeholder resource to the new final-app review lab.
- Added Week 13 hub resources: agentic-engineering-quest.html, OWASP GenAI LLM Top 10, GitHub Push Protection, OpenAI Safety Best Practices, optional OWASP Agentic Security, and optional MITRE ATLAS.

Week 13 teaching flow:
- Start from the Week 10-11 project artifacts.
- Frame security as protecting users, data, repo history, and trust before Week 14 showcase.
- Use expert sources as checklists, not vocabulary homework.
- Teach a small threat model: assets, entry points, trust boundaries, actions.
- Adapt four risks for student static apps: prompt injection, sensitive information disclosure, improper output handling, excessive agency.
- Run a static app scan: secrets/private data, localStorage, inputs, raw HTML output, links, overclaims, presentation limitation.
- Teach concrete output-handling checks including innerHTML, markdown/rich rendering, URL params, user text reflected into DOM, links from user input, and generated text presented as fact.
- Teach secret/repo-history handling: do not publish or paste secrets into AI tools; stop sharing, remove, revoke/rotate if real, and ask before redeploying.
- Provide an agent review prompt builder for Claude Code/Codex with strict scope: review/help only, no secrets, no push/deploy/install/delete/backend/API features without approval.
- Provide adversarial test builder for safe student-owned static UI tests.
- Provide triage and fix-ticket builder: fix before Week 14, document limitation, or ask instructor.
- Exit artifact: Week 13 Security Review Packet.

Homework status:
- Required: submit Security Review Packet with asset map, static app checklist summary, two adversarial tests, one fix ticket, no-secrets statement, and one known presentation limitation.
- Required: run at least two safe adversarial tests and record expected vs observed behavior.
- Required: if any real secret/private data/API key is found, stop sharing, remove it, revoke/rotate if real, document the fix, and ask instructor before redeploying.
- Optional: OWASP LLM Top 10 overview, GitHub Push Protection docs, OWASP Agentic Security, MITRE ATLAS.

Verification:
- git diff --check passed for index.html and week-13-security-review-lab.html.
- Inline JS parse passed for index.html and week-13-security-review-lab.html.
- Local href/anchor check passed.
- Week 13 section balance passed: 13 opening and 13 closing section tags.
- New Week 13 file scan found no non-ASCII characters.
- External references returned HTTP 200: OWASP LLM Top 10, GitHub Push Protection, OpenAI Safety Best Practices, OWASP Agentic Security, MITRE ATLAS.
- No Playwright/browser automation used.

Review gate:
- Bounded Codex plan review found no blockers and suggested packet headings, no-secrets-to-AI rule, output-handling concretes, triage rule, and tighter title. These were incorporated.
- Bounded Codex final diff review found no blockers.

No commit or push performed.

Suggested next work:
- Move on to Week 14 final presentation/showcase module, unless Q wants to manually inspect Week 13 first.

### Working tree (`git status --short`)

```text
 M index.html
 M module-00-llm-basics.html
 M progress.md
?? CLAUDE.md
?? course-case-bank.html
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? docs/week-03-14-material-candidates.md
?? image/
?? session-materials/week-05-synthetic-admin-dataset.csv
?? sos-talk-may12.html
?? teacher-training-ai-fluency.html
?? ui.txt
?? week-02-agent-foundations.html
?? week-02-foundation-readiness-check.html
?? week-03-responsible-ai-decisions.html
?? week-04-writing-word-documents.html
?? week-05-data-excel-workflows.html
?? week-06-media-generation-presentations.html
?? week-07-midterm-studio.html
?? week-08-web-basics-design.html
?? week-09-interactivity-intelligence.html
?? week-10-complete-static-deployment.html
?? week-11-knowledge-career-evidence.html
?? week-12-advanced-prompting.html
?? week-13-security-review-lab.html
```

### Unstaged diff (`git diff --stat`)

```text
 index.html                |  409 +++++---
 module-00-llm-basics.html |   27 +
 progress.md               | 2526 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 2843 insertions(+), 119 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
3ec9516 Add Module 0B transformer deep dive
 index.html                                         |  42 +-
 module-00b-transformer-deep-dive.html              | 599 +++++++++++++++++++++
 .../transformer-deep-dive-homework.html            | 148 +++++
 .../transformer-deep-dive-homework.pdf             | Bin 0 -> 31627 bytes
 4 files changed, 775 insertions(+), 14 deletions(-)
```

---

## 2026-07-30 23:57:08 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `3ec9516` — Add Module 0B transformer deep dive
- **Upstream:** origin/slide-redesign-2026-05 — ahead 0, behind 0

### Summary

Completed Week 11 Knowledge Acquisition and Career Evidence module.

What changed:
- Added standalone interactive deck: week-11-knowledge-career-evidence.html (622 lines, 13 slide sections).
- Updated index.html Week 11 learning-path card to link to week-11-knowledge-career-evidence.html.
- Updated index.html Week 11 orbit card from placeholder resources to the new evidence-studio module.
- Added Week 11 resources in the hub: ai-life-skills.html, Digital Inquiry Group lateral reading, NACE Career Readiness, Purdue Citing AI Guide, and optional Anthropic AI Fluency for Students.

Week 11 teaching flow:
- Start from the Week 10 deployed or deployment-ready project.
- Frame AI research as a starting point, not an authority.
- Teach lateral reading: leave, investigate, compare, return.
- Classify claim types and claim strength: directly observed, supported by source, inferred, uncertain/not verified.
- Build a one-claim research log.
- Separate citation from AI-use disclosure.
- Map project action to career-ready evidence using selected NACE competencies.
- Draft a classroom-safe project story.
- Add privacy/identity safety checks.
- Submit the Week 11 Evidence and Career Packet.

Homework status:
- Required: Week 11 Evidence and Career Packet with one verified claim, source trail, project story, and AI-use disclosure.
- Required source move: apply lateral reading to one project-related source and record claim-strength label.
- Optional enrichment: external Digital Inquiry Group activity or Anthropic AI Fluency for Students if account access is smooth.

Verification:
- git diff --check passed for index.html and week-11-knowledge-career-evidence.html.
- Inline JS parse passed for index.html and week-11-knowledge-career-evidence.html.
- Local href check passed.
- Week 11 section balance passed: 13 opening and 13 closing section tags.
- New Week 11 file scan found no non-ASCII characters.
- External references returned HTTP 200: Digital Inquiry Group, NACE, Purdue, Anthropic Skilljar.
- No Playwright/browser automation used, per Q's earlier instruction.

Review gate:
- Bounded Codex final review found one content blocker: ambiguous "Required or recommended" homework wording.
- Fixed it by splitting required lateral-reading work from optional enrichment.
- Focused follow-up reviews found no blockers; final optional DIG link label was clarified.

No commit or push performed.

Suggested next work:
- Move on to Week 13, unless Q wants to manually inspect Week 11 first.
- Week 12 is already built; Week 13 security/vulnerability management is still planned.

### Working tree (`git status --short`)

```text
 M index.html
 M module-00-llm-basics.html
 M progress.md
?? CLAUDE.md
?? course-case-bank.html
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? docs/week-03-14-material-candidates.md
?? image/
?? session-materials/week-05-synthetic-admin-dataset.csv
?? sos-talk-may12.html
?? teacher-training-ai-fluency.html
?? ui.txt
?? week-02-agent-foundations.html
?? week-02-foundation-readiness-check.html
?? week-03-responsible-ai-decisions.html
?? week-04-writing-word-documents.html
?? week-05-data-excel-workflows.html
?? week-06-media-generation-presentations.html
?? week-07-midterm-studio.html
?? week-08-web-basics-design.html
?? week-09-interactivity-intelligence.html
?? week-10-complete-static-deployment.html
?? week-11-knowledge-career-evidence.html
?? week-12-advanced-prompting.html
```

### Unstaged diff (`git diff --stat`)

```text
 index.html                |  408 +++++---
 module-00-llm-basics.html |   27 +
 progress.md               | 2418 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 2734 insertions(+), 119 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
3ec9516 Add Module 0B transformer deep dive
 index.html                                         |  42 +-
 module-00b-transformer-deep-dive.html              | 599 +++++++++++++++++++++
 .../transformer-deep-dive-homework.html            | 148 +++++
 .../transformer-deep-dive-homework.pdf             | Bin 0 -> 31627 bytes
 4 files changed, 775 insertions(+), 14 deletions(-)
```

---

## 2026-07-30 23:37:39 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `3ec9516` — Add Module 0B transformer deep dive
- **Upstream:** origin/slide-redesign-2026-05 — ahead 0, behind 0

### Summary

Added claude-tap to Week 2 as an instructor observability demo.

What changed:
- Updated week-02-agent-foundations.html with an "Agent observability" slide after the Trace a Prompt activity.
- Added minimal CSS for the observability grid and trace tags.
- Updated Week 2 homework optional background card to mention sanitized agent traces and label claude-tap as "Instructor demo source only" with "No student install required."
- Updated index.html Week 2 orbit resources to include "Instructor Demo: claude-tap".

Design rationale:
- The content is positioned in Week 2 because it directly supports the agent-components lesson: prompt layers, messages, context, tool schema, tool call, result, streaming chunks, token usage, request diffs, and human review point.
- It is not required student setup or homework.
- It is framed as agent observability/evidence, not casual debugging.

Safety boundaries added:
- Do not require students/minors to install or run a local proxy.
- Use only pre-reviewed, sanitized, synthetic or approved traces.
- Traces must not contain live repo secrets, credentials, private prompts, student data, personal files, or unredacted tool output.

Verification:
- Inline JS parse passed for index.html and week-02-agent-foundations.html.
- Local href/anchor check passed after ignoring the existing data:, favicon URI.
- git diff --check passed for index.html and week-02-agent-foundations.html.
- GitHub claude-tap URL returned HTTP 200.
- Week 2 section count check passed: 21 opening and 21 closing section tags.
- New Week 2 file scan found no non-ASCII matches.
- Bounded Codex review found no blockers; optional wording tweak was applied and rechecked.

No commit or push performed.

### Working tree (`git status --short`)

```text
 M index.html
 M module-00-llm-basics.html
 M progress.md
?? CLAUDE.md
?? course-case-bank.html
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? docs/week-03-14-material-candidates.md
?? image/
?? session-materials/week-05-synthetic-admin-dataset.csv
?? sos-talk-may12.html
?? teacher-training-ai-fluency.html
?? ui.txt
?? week-02-agent-foundations.html
?? week-02-foundation-readiness-check.html
?? week-03-responsible-ai-decisions.html
?? week-04-writing-word-documents.html
?? week-05-data-excel-workflows.html
?? week-06-media-generation-presentations.html
?? week-07-midterm-studio.html
?? week-08-web-basics-design.html
?? week-09-interactivity-intelligence.html
?? week-10-complete-static-deployment.html
?? week-12-advanced-prompting.html
```

### Unstaged diff (`git diff --stat`)

```text
 index.html                |  408 +++++---
 module-00-llm-basics.html |   27 +
 progress.md               | 2327 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 2643 insertions(+), 119 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
3ec9516 Add Module 0B transformer deep dive
 index.html                                         |  42 +-
 module-00b-transformer-deep-dive.html              | 599 +++++++++++++++++++++
 .../transformer-deep-dive-homework.html            | 148 +++++
 .../transformer-deep-dive-homework.pdf             | Bin 0 -> 31627 bytes
 4 files changed, 775 insertions(+), 14 deletions(-)
```

---

## 2026-07-30 23:28:05 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `3ec9516` — Add Module 0B transformer deep dive
- **Upstream:** origin/slide-redesign-2026-05 — ahead 0, behind 0

### Summary

Completed Week 10 complete static project and deployment module implementation.

What changed:
- Added standalone interactive page: week-10-complete-static-deployment.html.
- Updated index.html Week 10 learning-path card to link to week-10-complete-static-deployment.html.
- Updated index.html Week 10 orbit card with subtitle "Static app + deployment", interactive status, and resources for project-building, GitHub Pages, MDN Web Storage API, and Google PAIR Guidebook.

Week 10 module structure:
- Opening deployment studio at week-10-complete-static-deployment.html:108.
- Six-checkpoint build path at line 122: architecture, file-ready, local test, deploy, post-test, packet.
- Static architecture slide at line 139.
- Deployment readiness checker at line 154.
- Optional browser storage/localStorage demo at line 178, explicitly non-sensitive only and not secure storage.
- Deployment plan builder at line 203 with GitHub Pages quickstart link.
- Smoke-test builder at line 226.
- Agent prompt builder for complete-project polish pass at line 247.
- Week 10 Complete Project Packet artifact at line 269.
- Homework/deploy-or-fallback slide at line 289.

Approved design requirements satisfied:
- Week 10 now treats deployment as a core outcome, not an optional afterthought.
- It builds directly on Week 8 app brief + Week 9 interaction.
- It distinguishes completion from complexity: focus is file readiness, states, reset/control, optional storage, tests, deployment, and evidence.
- It keeps a fallback path if account/setup blocks deployment.
- It frames deployment as public static prototype sharing, not production service readiness.
- It includes concrete "do not deploy" examples: real names, emails, grades, health details, identity information, credentials, private prompts, or secret keys.
- Consent/assent text was not modified.

Verification:
- No Playwright/browser automation used per Q's earlier constraint.
- Inline JS parse passed for index.html and week-10-complete-static-deployment.html.
- Local href/anchor check passed for index.html and week-10-complete-static-deployment.html.
- git diff --check passed for index.html and week-10-complete-static-deployment.html.
- New Week 10 file has no non-ASCII matches.
- External references returned HTTP 200: GitHub Pages quickstart, MDN Web Storage API, MDN localStorage, Google PAIR Guidebook.
- Slide section count check passed: 10 opening and 10 closing section tags.
- Targeted scan found no font-size vw, clamp(), radial-gradient(circle), width:100vw, or innerHTML in the Week 10 page.
- Final bounded Codex review found no safety blockers; follow-up subtitle fix was reviewed with no remaining blockers within the no-Playwright verification boundary.

Review caveats:
- Browser/visual/runtime behavior was not verified with Playwright or a real browser automation pass. No local jsdom/Puppeteer package was available, and I did not install one into the static repo.
- The final review again observed the full index.html diff includes broader pre-existing course-hub changes against HEAD. I did not revert them; Week 10-specific edits are the new Week 10 link/card/resource updates.

No commit or push performed.

Next:
- Discuss Week 11: Knowledge Acquisition and Career Development. Existing hub wording points to AI tutoring, information retrieval/synthesis, citations, job hunting, resume optimization, and interview roleplay. Need decide whether Week 11 should focus more on research/learning, career, or both.

### Working tree (`git status --short`)

```text
 M index.html
 M module-00-llm-basics.html
 M progress.md
?? CLAUDE.md
?? course-case-bank.html
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? docs/week-03-14-material-candidates.md
?? image/
?? session-materials/week-05-synthetic-admin-dataset.csv
?? sos-talk-may12.html
?? teacher-training-ai-fluency.html
?? ui.txt
?? week-02-agent-foundations.html
?? week-02-foundation-readiness-check.html
?? week-03-responsible-ai-decisions.html
?? week-04-writing-word-documents.html
?? week-05-data-excel-workflows.html
?? week-06-media-generation-presentations.html
?? week-07-midterm-studio.html
?? week-08-web-basics-design.html
?? week-09-interactivity-intelligence.html
?? week-10-complete-static-deployment.html
?? week-12-advanced-prompting.html
```

### Unstaged diff (`git diff --stat`)

```text
 index.html                |  408 ++++++---
 module-00-llm-basics.html |   27 +
 progress.md               | 2217 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 2533 insertions(+), 119 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
3ec9516 Add Module 0B transformer deep dive
 index.html                                         |  42 +-
 module-00b-transformer-deep-dive.html              | 599 +++++++++++++++++++++
 .../transformer-deep-dive-homework.html            | 148 +++++
 .../transformer-deep-dive-homework.pdf             | Bin 0 -> 31627 bytes
 4 files changed, 775 insertions(+), 14 deletions(-)
```

---

## 2026-07-30 22:52:58 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `3ec9516` — Add Module 0B transformer deep dive
- **Upstream:** origin/slide-redesign-2026-05 — ahead 0, behind 0

### Summary

Completed Week 9 interactivity module implementation.

What changed:
- Added standalone interactive page: week-09-interactivity-intelligence.html.
- Updated index.html Week 9 learning-path card to link to week-09-interactivity-intelligence.html.
- Updated index.html Week 9 orbit card to mark the module as 1-hour interactive and link the new deck, with resources for the existing web-building resource and MDN events reference.

Week 9 module structure:
- Opening bridge from Week 8 App Design Brief to Week 9 behavior at week-09-interactivity-intelligence.html:107.
- Week 8 to Week 9 feature map and privacy guard at line 121.
- Shared Study Break Picker demo at line 137 with validation, rule-based output, and textContent-safe rendering.
- Interaction pipeline slide at line 159 with input/event/validation/state/output controls and aria-pressed state.
- Simple intelligence decision-table slide at line 176 with bad-rule vs better-rule example.
- Adaptive agent build prompt generator at line 196 for Claude Code or Codex.
- Test-case builder at line 218.
- Human approval loop at line 238.
- Week 9 Interactive Feature Brief exit artifact at line 260.
- Homework slide at line 280.

Scope and safety:
- Week 9 extends each student's Week 8 app idea rather than introducing a separate project.
- Shared demo is Study Break Picker.
- Boundary is frontend-only: no API keys, backend, database, login, private student data, public posting, or advice-domain expansion.
- Consent/assent text was not modified.
- No Playwright/browser automation used.

Verification:
- Bounded Codex plan review: no blockers; added requested safeguards.
- Inline JS parse passed for index.html and week-09-interactivity-intelligence.html.
- Local href/anchor check passed for index.html and week-09-interactivity-intelligence.html.
- git diff --check passed for index.html and week-09-interactivity-intelligence.html.
- MDN events reference returned HTTP 200 at the canonical URL.
- New Week 9 file has no non-ASCII matches.
- Targeted scan found no font-size vw, clamp(), radial-gradient(circle), width:100vw, or innerHTML in the Week 9 page.
- Slide section count check passed: 10 opening and 10 closing section tags.
- Bounded Codex final review found no blockers after follow-up accessibility fixes.

Review follow-up addressed:
- Added initial inert/aria-hidden state for inactive slides.
- Added aria-pressed to pipeline buttons and synchronized it in setPipe().
- Changed MDN wording from restrictive to "vocabulary and reference".

Notes:
- The final review observed the full index.html diff includes broader pre-existing course-hub changes against HEAD. I did not revert them; the Week 9-specific edits are the new Week 9 link/card/resource updates.
- Existing untracked course pages and assets remain in the worktree; do not remove or overwrite them without Q's approval.
- No commit or push performed.

Next:
- Discuss Week 10: complete web project structure, storage/persistence boundaries, final app polish, and how to build on Week 8 brief + Week 9 interactive feature.

### Working tree (`git status --short`)

```text
 M index.html
 M module-00-llm-basics.html
 M progress.md
?? CLAUDE.md
?? course-case-bank.html
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? docs/week-03-14-material-candidates.md
?? image/
?? session-materials/week-05-synthetic-admin-dataset.csv
?? sos-talk-may12.html
?? teacher-training-ai-fluency.html
?? ui.txt
?? week-02-agent-foundations.html
?? week-02-foundation-readiness-check.html
?? week-03-responsible-ai-decisions.html
?? week-04-writing-word-documents.html
?? week-05-data-excel-workflows.html
?? week-06-media-generation-presentations.html
?? week-07-midterm-studio.html
?? week-08-web-basics-design.html
?? week-09-interactivity-intelligence.html
?? week-12-advanced-prompting.html
```

### Unstaged diff (`git diff --stat`)

```text
 index.html                |  408 ++++++---
 module-00-llm-basics.html |   27 +
 progress.md               | 2106 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 2422 insertions(+), 119 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
3ec9516 Add Module 0B transformer deep dive
 index.html                                         |  42 +-
 module-00b-transformer-deep-dive.html              | 599 +++++++++++++++++++++
 .../transformer-deep-dive-homework.html            | 148 +++++
 .../transformer-deep-dive-homework.pdf             | Bin 0 -> 31627 bytes
 4 files changed, 775 insertions(+), 14 deletions(-)
```

---

## 2026-07-30 20:26:31 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `3ec9516` — Add Module 0B transformer deep dive
- **Upstream:** origin/slide-redesign-2026-05 — ahead 0, behind 0

### Summary

Completed Week 7 Midterm Studio implementation.

What changed:
- Added standalone interactive page: week-07-midterm-studio.html.
- Updated index.html Week 7 learning-path placeholder to link to week-07-midterm-studio.html at index.html lines 501-503.
- Updated index.html orbit card for Week 7 at lines 707-711 with interactive status and resources.

Week 7 module structure:
- Hero and completion rule at week-07-midterm-studio.html line 172.
- Skills map for Weeks 1-6 competencies.
- Foundation check at line 207, auto-scored out of 20.
- Project seed choice board at line 268; explicitly says no Week 8 web/design skills required yet.
- Midterm brief builder at line 287.
- Live agent run or transcript fallback at line 337.
- Evidence, review, and rubric section at line 389.
- Generated packet section at line 435.
- Score logic includes foundation check in the 100-point total at line 502 and threshold/status text at line 513.

Approved design requirements satisfied:
- Week 7 is an assessment/reset studio, not a new-topic lecture.
- It assesses Weeks 1-6 only and explicitly avoids Week 8 HTML/CSS/design dependency.
- It includes access fallback via transcript analysis.
- It includes academic-integrity/human-judgment prompts.
- It includes concrete evidence requirements: exact prompt/transcript, output summary, verification action, rejected/changed AI suggestion, privacy/copyright/accessibility/disclosure check.
- It includes readiness threshold: total >= 70, agent delegation >= 12/20, verification/review >= 12/20.
- It generates a copyable/printable midterm packet.

Verification:
- No Playwright/browser automation used.
- Inline JS parse passed for index.html and week-07-midterm-studio.html.
- Local href/anchor check passed for index.html and week-07-midterm-studio.html.
- git diff --check passed for index.html and week-07-midterm-studio.html.
- Diff contains no new non-ASCII characters.
- Design-rule scan found no Q references, font-size vw, clamp(), or radial-gradient(circle) in Week 7 page.
- Specific rubric check passed: 12-point threshold options exist and foundation score is included in totalScore().
- Bounded Codex final review reported no blockers.

No commit or push performed.

Next:
- Continue to Week 8 planning/build refinement, or revise Week 7 content/rubric if Q wants a different grading emphasis.
- Existing untracked course pages and assets remain in the worktree; do not remove or overwrite them without Q's approval.

### Working tree (`git status --short`)

```text
 M index.html
 M module-00-llm-basics.html
 M progress.md
?? CLAUDE.md
?? course-case-bank.html
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? docs/week-03-14-material-candidates.md
?? image/
?? session-materials/week-05-synthetic-admin-dataset.csv
?? sos-talk-may12.html
?? teacher-training-ai-fluency.html
?? ui.txt
?? week-02-agent-foundations.html
?? week-02-foundation-readiness-check.html
?? week-03-responsible-ai-decisions.html
?? week-04-writing-word-documents.html
?? week-05-data-excel-workflows.html
?? week-06-media-generation-presentations.html
?? week-07-midterm-studio.html
?? week-08-web-basics-design.html
?? week-12-advanced-prompting.html
```

### Unstaged diff (`git diff --stat`)

```text
 index.html                |  407 ++++++---
 module-00-llm-basics.html |   27 +
 progress.md               | 2003 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 2318 insertions(+), 119 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
3ec9516 Add Module 0B transformer deep dive
 index.html                                         |  42 +-
 module-00b-transformer-deep-dive.html              | 599 +++++++++++++++++++++
 .../transformer-deep-dive-homework.html            | 148 +++++
 .../transformer-deep-dive-homework.pdf             | Bin 0 -> 31627 bytes
 4 files changed, 775 insertions(+), 14 deletions(-)
```

---

## 2026-07-30 19:14:23 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `3ec9516` — Add Module 0B transformer deep dive
- **Upstream:** origin/slide-redesign-2026-05 — ahead 0, behind 0

### Summary

Completed Week 1-3 case-bank integration and Week 6 media-generation teaching module.

What changed:
- Added course-case-bank.html with week-aligned course cases from Q's wiki posts:
  - Week 1 hooks at course-case-bank.html#week-1.
  - Weeks 2-3 agent mindset/limits cases at course-case-bank.html#weeks-2-3.
  - Later sections for building apps, career/portfolio, prompting, hidden teacher training, and advanced enrichment.
- Updated module-00-llm-basics.html with a Week 1 motivation slide at line 203 and link to course-case-bank.html#week-1 at line 221.
- Updated index.html Week 1-3 learning path links at lines 433, 450, and 463.
- Updated index.html orbit resources for Week 1-3 at lines 675, 681, and 687.
- Added week-06-media-generation-presentations.html as a standalone 60-minute Week 6 teaching deck.
- Linked Week 6 from the learning path at index.html lines 490-493.
- Updated Week 6 orbit card metadata and resources at index.html lines 700-705.

Week 6 module contents:
- Required creative path: ChatGPT image generation, with access-failure fallback.
- Flow: communication goal -> source boundaries -> visual brief -> prompt repair -> iteration moves -> critique clinic -> presentation integration -> disclosure -> asset packet -> rubric/homework.
- Explicit access-blocked equivalence appears at week-06-media-generation-presentations.html lines 166-167 and again in homework/rubric.
- Source boundaries and official OpenAI links appear at week-06-media-generation-presentations.html lines 173-202.
- Inactive slide focusability blocker fixed with visibility:hidden/visible CSS and inert/aria-hidden management at week-06-media-generation-presentations.html line 495.

Verification:
- No Playwright/browser automation used.
- Inline JS parse passed for index.html, module-00-llm-basics.html, course-case-bank.html, and week-06-media-generation-presentations.html.
- Local href/anchor check passed for those four files.
- External target/rel/aria check passed for course-case-bank.html and week-06-media-generation-presentations.html.
- git diff --check passed for the touched files.
- Diff contains no new non-ASCII characters.
- Specific inactive-slide focus guard check passed.
- LearnAI wiki links in course-case-bank.html returned HTTP 200 via curl.
- Official OpenAI source pages used for Week 6 opened through the web tool on 2026-07-30, though direct curl to OpenAI returned 403 from their edge.
- Bounded Codex review initially found an inactive-slide focusability blocker and then a dated source-check assertion concern; both were fixed.
- Final bounded Codex review reported no blockers.

No commit or push performed.

Next:
- Continue from Week 7 planning or return to the earlier Week 6 discussion if Q wants refinements.
- Existing untracked course pages and assets remain in the worktree; do not remove or overwrite them without Q's approval.

### Working tree (`git status --short`)

```text
 M index.html
 M module-00-llm-basics.html
 M progress.md
?? CLAUDE.md
?? course-case-bank.html
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? docs/week-03-14-material-candidates.md
?? image/
?? session-materials/week-05-synthetic-admin-dataset.csv
?? sos-talk-may12.html
?? teacher-training-ai-fluency.html
?? ui.txt
?? week-02-agent-foundations.html
?? week-02-foundation-readiness-check.html
?? week-03-responsible-ai-decisions.html
?? week-04-writing-word-documents.html
?? week-05-data-excel-workflows.html
?? week-06-media-generation-presentations.html
?? week-08-web-basics-design.html
?? week-12-advanced-prompting.html
```

### Unstaged diff (`git diff --stat`)

```text
 index.html                |  406 +++++++---
 module-00-llm-basics.html |   27 +
 progress.md               | 1904 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 2218 insertions(+), 119 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
3ec9516 Add Module 0B transformer deep dive
 index.html                                         |  42 +-
 module-00b-transformer-deep-dive.html              | 599 +++++++++++++++++++++
 .../transformer-deep-dive-homework.html            | 148 +++++
 .../transformer-deep-dive-homework.pdf             | Bin 0 -> 31627 bytes
 4 files changed, 775 insertions(+), 14 deletions(-)
```

---

## 2026-07-30 18:58:32 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `3ec9516` — Add Module 0B transformer deep dive
- **Upstream:** origin/slide-redesign-2026-05 — ahead 0, behind 0

### Summary

Completed the Week 1 / Weeks 1-3 wiki case-bank integration before resuming Week 6.

What changed:
- Added standalone supporting page: course-case-bank.html.
- Added a short Week 1 motivation hook slide to module-00-llm-basics.html at #future-work:
  - Forward Deployed Engineer: problem/stakeholder/agent/verification/shipping framing.
  - Problem definition: domain understanding matters before prompting an agent to build.
  - AI Fluency Index: fluent users iterate, critique, ask for missing context, and remain responsible.
  - Reflection prompt: which human skill becomes more important when AI can generate drafts, code, images, and analysis?
- Updated module-00-llm-basics.html jump nav with a Future button.
- Updated index.html Week 1 learning path with Case Hooks link to course-case-bank.html#week-1.
- Updated index.html Week 2 learning path with Agent Mindset Cases link to course-case-bank.html#weeks-2-3.
- Updated index.html Week 3 learning path with Limits Cases link to course-case-bank.html#weeks-2-3.
- Updated index.html orbit resources:
  - Week 1 adds Case Hooks.
  - Week 2 adds Agent Mindset Cases.
  - Week 3 adds Limits Case Bank.

Case bank structure:
- Week 1 Hooks: forward-deployed-engineer-ai, lawyer-won-hackathon-problem-definition, ai-fluency-index.
- Weeks 2-3: karpathy-end-of-coding, frustration-shifts-upward-ai-coding, ai-brain-fry-cognitive-fatigue.
- Weeks 8-10 building apps: problem definition and frustration-shifts-upward cases.
- Week 11/14 career/learning: career-ops, resume-dead-claude-folder, forward-deployed role, MuJing optional learning case.
- Week 12 prompting: shortest-prompt-lines-that-work and bilingual-prompting-technique, with source-verification caution on numerical claims.
- Hidden teacher training: ai-education-teacher-factory, notebooklm-grading-education-paradox, ai-fluency-index.
- Week 13/advanced: Mythos verification, automated alignment researchers, medical AI scientist, finance tools, SubQ, TurboQuant, TensorTonic.
- The page includes a caveat that the summaries are course placements, not fresh verification of every external claim inside the original wiki posts.

Verification:
- No Playwright/browser automation used.
- Inline JS parse passed for index.html, module-00-llm-basics.html, and course-case-bank.html.
- Local href/anchor check passed for index.html, module-00-llm-basics.html, and course-case-bank.html.
- External target/rel/aria check passed for course-case-bank.html.
- git diff --check passed for index.html, module-00-llm-basics.html, and course-case-bank.html.
- ASCII-only check passed for course-case-bank.html and module-00-llm-basics.html.
- Public LearnAI wiki URLs in course-case-bank.html returned HTTP 200 for all linked posts.
- Bounded Codex review reported no blockers.

Current status:
- Week 1 now has a case hook supporting Q's "what AI means for students" framing.
- Weeks 1-3 now have linked case-bank support from the course hub.
- No commit or push performed.
- Existing uncommitted/untracked course files remain in the worktree.

Next:
- Resume Week 6 implementation using the previously reviewed plan: AI-Powered Media Generation and Presentation Assets, with ChatGPT image generation as the required creative tool and no Playwright unless Q later permits it.

### Working tree (`git status --short`)

```text
 M index.html
 M module-00-llm-basics.html
 M progress.md
?? CLAUDE.md
?? course-case-bank.html
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? docs/week-03-14-material-candidates.md
?? image/
?? session-materials/week-05-synthetic-admin-dataset.csv
?? sos-talk-may12.html
?? teacher-training-ai-fluency.html
?? ui.txt
?? week-02-agent-foundations.html
?? week-02-foundation-readiness-check.html
?? week-03-responsible-ai-decisions.html
?? week-04-writing-word-documents.html
?? week-05-data-excel-workflows.html
?? week-08-web-basics-design.html
?? week-12-advanced-prompting.html
```

### Unstaged diff (`git diff --stat`)

```text
 index.html                |  405 +++++++---
 module-00-llm-basics.html |   27 +
 progress.md               | 1799 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 2112 insertions(+), 119 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
3ec9516 Add Module 0B transformer deep dive
 index.html                                         |  42 +-
 module-00b-transformer-deep-dive.html              | 599 +++++++++++++++++++++
 .../transformer-deep-dive-homework.html            | 148 +++++
 .../transformer-deep-dive-homework.pdf             | Bin 0 -> 31627 bytes
 4 files changed, 775 insertions(+), 14 deletions(-)
```

---

## 2026-07-30 17:50:06 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `3ec9516` — Add Module 0B transformer deep dive
- **Upstream:** origin/slide-redesign-2026-05 — ahead 0, behind 0

### Summary

Completed Week 5 teaching module implementation after Q approved the plan.

What changed:
- Added standalone interactive Week 5 deck: week-05-data-excel-workflows.html.
- Added a supplied synthetic admin CSV dataset for the Week 5 homework/lab: session-materials/week-05-synthetic-admin-dataset.csv.
- Updated index.html Week 5 learning-path entry to open week-05-data-excel-workflows.html.
- Updated index.html orbit/course data for Week 5:
  - sub: Spreadsheet evidence lab
  - desc: office-data workflow with synthetic datasets, raw-tab preservation, AI-assisted cleaning, formulas, charts, verification, and evidence packets
  - tags: Syllabus Week 5, Excel, Data Workflows
  - stats: 60 minutes, Interactive
  - primary href: week-05-data-excel-workflows.html
  - resources: Copilot in Excel, Excel Prompt Tips, Claude File Creation
- Hardened index.html safeHref so future local relative links with query strings are accepted rather than silently converted to #.

Week 5 deck contents:
- 12-slide 60-minute class titled Data, Excel, and Administrative Workflows / Spreadsheet Evidence.
- Source boundaries include Microsoft Copilot in Excel docs, Microsoft data insights, Microsoft Excel prompt tips, Claude file creation, Claude file uploads, and Q's Office integration wiki.
- Teaching stance: office-data literacy with agents, not a full data science week. AI can help clean, calculate, summarize, and visualize, but the workbook remains evidence.
- Added the review-suggested raw-tab/versioning habit: duplicate the workbook or keep a Raw tab unchanged before AI edits.
- Added explicit no-fabricated-data rule: missing values must be flagged, excluded, estimated with clear labeling, or sent back for human decision.
- Interactive pieces:
  - source-boundary/resource slide
  - spreadsheet evidence hierarchy
  - data safety gate with allowed / ask first / not allowed cases
  - data prompt builder and copy button
  - messy-table triage lab
  - formula accept/revise/reject checker
  - chart critique interaction with selected-critique feedback
  - workflow checklist with progress meter
  - AI-assisted data evidence packet builder and copy button
  - homework rubric and homework slide
- Homework: use the supplied synthetic admin dataset or Q-approved synthetic data; produce cleaned table, two formulas, one chart/PivotTable, and 3-bullet insight memo; submit prompt log, before/after evidence, two-row formula verification, chart critique, privacy decision, disclosure, and one rejected AI suggestion with rationale.

Verification:
- No Playwright/browser automation used, per Q's earlier instruction.
- Inline JS parse passed for index.html and week-05-data-excel-workflows.html.
- Local href/anchor check passed for index.html and week-05-data-excel-workflows.html, including the local CSV link.
- External target/rel/aria check passed for Week 5 deck source links.
- git diff --check passed for index.html, week-05-data-excel-workflows.html, and session-materials/week-05-synthetic-admin-dataset.csv.
- ASCII-only check passed for the Week 5 deck and CSV.
- Week 5 external URL reachability check returned HTTP 200 for all deck links: Copilot in Excel, Data insights, Excel prompt tips, Claude file creation, Claude uploads, and Q Office wiki.
- Bounded Codex review initially reported no blockers and suggested accessible external-link labels, more specific chart feedback, and a concrete supplied dataset; all were addressed.
- Final bounded Codex short review reported no blockers.

Current status:
- Weeks 1-5 now have implemented/linked teaching materials in the local app state, with Weeks 3-5 newly completed in this session sequence.
- No commit or push performed.
- Existing uncommitted/untracked course files remain in the worktree.

Next:
- Present Week 6 plan before editing. Week 6 should focus on AI-powered media generation and presentation assets, with ChatGPT image as the required creative tool per Q's earlier decision.

### Working tree (`git status --short`)

```text
 M index.html
 M progress.md
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? docs/week-03-14-material-candidates.md
?? image/
?? session-materials/week-05-synthetic-admin-dataset.csv
?? sos-talk-may12.html
?? teacher-training-ai-fluency.html
?? ui.txt
?? week-02-agent-foundations.html
?? week-02-foundation-readiness-check.html
?? week-03-responsible-ai-decisions.html
?? week-04-writing-word-documents.html
?? week-05-data-excel-workflows.html
?? week-08-web-basics-design.html
?? week-12-advanced-prompting.html
```

### Unstaged diff (`git diff --stat`)

```text
 index.html  |  399 +++++++++-----
 progress.md | 1691 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 1971 insertions(+), 119 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
3ec9516 Add Module 0B transformer deep dive
 index.html                                         |  42 +-
 module-00b-transformer-deep-dive.html              | 599 +++++++++++++++++++++
 .../transformer-deep-dive-homework.html            | 148 +++++
 .../transformer-deep-dive-homework.pdf             | Bin 0 -> 31627 bytes
 4 files changed, 775 insertions(+), 14 deletions(-)
```

---

## 2026-07-30 17:36:23 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `3ec9516` — Add Module 0B transformer deep dive
- **Upstream:** origin/slide-redesign-2026-05 — ahead 0, behind 0

### Summary

Completed Week 4 teaching module implementation after Q approved the plan.

What changed:
- Added standalone interactive Week 4 deck: week-04-writing-word-documents.html.
- Updated index.html Week 4 learning-path entry to open week-04-writing-word-documents.html and keep module-00-llm-basics.html#concepts as the reusable email/context lab.
- Updated index.html orbit/course data for Week 4:
  - sub: Reviewable revision lab
  - desc: professional writing workflow with prompt briefs, Copilot/Claude Word paths, tracked changes or manual change logs, verification, disclosure, and revision packets
  - tags: Syllabus Week 4, Word, Reviewable Revision
  - stats: 60 minutes, Interactive
  - primary href: week-04-writing-word-documents.html
  - resources: Email Context Lab, Copilot in Word, Claude for Word
- Hardened index.html orbit detail rendering after review: escaped injected course/resource text, added safe href handling, aria-current/aria-pressed for active orbit nodes, aria-disabled for planned chips, visible focus styles for resource chips, and accessible labels for external resource links that open in a new tab.

Week 4 deck contents:
- 12-slide 60-minute interactive class titled Writing and Word Documents / Reviewable Revision.
- Source boundaries include Microsoft Copilot in Word, Microsoft 365 Copilot prompt guide, Claude for Word, Purdue AI citation/disclosure guide, and Q's Claude for Word wiki as a supporting walkthrough.
- Teaching flow: reviewable revision principle, source boundaries, workflow model, prompt brief builder, prompt repair quiz, tool-path comparison, live email revision lab, revision decision game, review checklist, disclosure builder, revision packet builder, and homework.
- Homework: complete one AI-assisted revision on a non-sensitive email/memo/paragraph; submit original text, prompt brief, revision, tracked-changes screenshot or manual change log, verification notes, disclosure, and rejected suggestions with rationale. Use Copilot in Word if available, Claude for Word if installed, or approved AI chat plus manual change log as fallback.

Verification:
- No Playwright/browser automation used, per Q's earlier instruction.
- Inline JS parse passed for index.html and week-04-writing-word-documents.html.
- Local href/anchor check passed for index.html and week-04-writing-word-documents.html.
- External target/rel check passed for Week 4 deck.
- git diff --check passed for index.html and week-04-writing-word-documents.html.
- ASCII-only check passed for Week 4 deck.
- Week 4 external URL reachability check returned HTTP 200 for all deck links: Copilot in Word, Copilot prompt guide, Claude for Word, Purdue AI citation guide.
- Bounded Codex review initially reported no blockers and suggested minor resource-chip accessibility/hardening improvements; those were applied. Final bounded Codex review reported no blockers.

Current status:
- Weeks 1-4 now have implemented/linked teaching materials in the local app state, with Week 3 and Week 4 newly completed in this session segment.
- No commit or push performed.
- Existing uncommitted/untracked course files remain in the worktree.

Next:
- Present Week 5 plan before editing. Week 5 should focus on AI for Data, Excel, and Administrative Workflows, with Copilot assumed available, Claude encouraged, and a tool-neutral fallback if access differs.

### Working tree (`git status --short`)

```text
 M index.html
 M progress.md
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? docs/week-03-14-material-candidates.md
?? image/
?? sos-talk-may12.html
?? teacher-training-ai-fluency.html
?? ui.txt
?? week-02-agent-foundations.html
?? week-02-foundation-readiness-check.html
?? week-03-responsible-ai-decisions.html
?? week-04-writing-word-documents.html
?? week-08-web-basics-design.html
?? week-12-advanced-prompting.html
```

### Unstaged diff (`git diff --stat`)

```text
 index.html  |  398 ++++++++++-----
 progress.md | 1600 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 1879 insertions(+), 119 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
3ec9516 Add Module 0B transformer deep dive
 index.html                                         |  42 +-
 module-00b-transformer-deep-dive.html              | 599 +++++++++++++++++++++
 .../transformer-deep-dive-homework.html            | 148 +++++
 .../transformer-deep-dive-homework.pdf             | Bin 0 -> 31627 bytes
 4 files changed, 775 insertions(+), 14 deletions(-)
```

---

## 2026-07-30 17:18:10 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `3ec9516` — Add Module 0B transformer deep dive
- **Upstream:** origin/slide-redesign-2026-05 — ahead 0, behind 0

### Summary

Completed Week 3 teaching module implementation after Q approved the plan.

What changed:
- Added standalone interactive Week 3 deck: week-03-responsible-ai-decisions.html.
- Updated index.html Week 3 learning-path link to open week-03-responsible-ai-decisions.html and keep ai-life-skills.html as a supporting safety resource.
- Updated index.html orbit/course data for Week 3:
  - sub: Scenario decision studio
  - desc: responsible AI decision practice for privacy, evidence, copyright, bias, plagiarism, disclosure, and human review
  - tags: Syllabus Week 3, Ethics, Decision Practice
  - stats: 60 minutes, Interactive
  - primary href: week-03-responsible-ai-decisions.html
  - resources: ai-life-skills.html, Cornell AI Integrity, NIST AI RMF

Week 3 deck contents:
- 14-slide 60-minute decision studio titled Responsible AI Decisions.
- Approved sources included: NIST AI RMF, U.S. Copyright Office AI hub/reports, Cornell AI academic integrity, Vanderbilt academic integrity guidance, Stanford AI literacy.
- Skipped UNESCO source per Q's material decision.
- Traffic-light model: usually allowed if policy permits, ask first/revise, not allowed.
- Interactive pieces:
  - five-question decision model
  - 10-scenario allowed/ask-first/not-allowed lab
  - scenario feedback now highlights the correct answer after any choice
  - privacy default slide
  - evidence verification slide
  - copyright risk/framing slide
  - bias/fairness slide
  - disclosure builder
  - six-check risk checklist
  - Responsible AI Decision Card generator/copy button
  - teacher notes toggle and keyboard slide controls
- Homework: Cornell reading, one-page Responsible AI Use Plan, AI Fluency completion note if not already submitted, optional NIST/Copyright context.

Verification:
- No Playwright/browser automation used, per Q's earlier instruction.
- Inline JS parse passed for index.html and week-03-responsible-ai-decisions.html.
- Local href/anchor check passed for index.html and week-03-responsible-ai-decisions.html after excluding index.html template placeholders.
- External target/rel check passed for Week 3 deck.
- git diff --check passed for index.html and week-03-responsible-ai-decisions.html.
- ASCII-only check passed for Week 3 deck.
- Week 3 external URL check returned HTTP 200 for all links: NIST, Copyright Office AI hub, Cornell, Vanderbilt, Stanford, Copyright Office Part 2 PDF, Copyright Office Part 3 PDF, Anthropic Skilljar AI Fluency Foundations.
- Bounded Codex final review initially flagged scenario feedback and aria-current improvements; both were fixed. Final bounded review reported no blockers.

Current status:
- Week 3 is implemented and linked locally.
- No commit or push performed.
- Existing uncommitted/untracked course files remain in the worktree.

Next:
- Present Week 4 plan before editing, per Q's goal rule.
- Week 4 should focus on AI for Professional Writing and Word Documents, Copilot-supported with Claude for Word encouraged, using demo-first/tool-neutral fallback if access differs.

### Working tree (`git status --short`)

```text
 M index.html
 M progress.md
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? docs/week-03-14-material-candidates.md
?? image/
?? sos-talk-may12.html
?? teacher-training-ai-fluency.html
?? ui.txt
?? week-02-agent-foundations.html
?? week-02-foundation-readiness-check.html
?? week-03-responsible-ai-decisions.html
?? week-08-web-basics-design.html
?? week-12-advanced-prompting.html
```

### Unstaged diff (`git diff --stat`)

```text
 index.html  |  346 +++++++++-----
 progress.md | 1497 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 1732 insertions(+), 111 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
3ec9516 Add Module 0B transformer deep dive
 index.html                                         |  42 +-
 module-00b-transformer-deep-dive.html              | 599 +++++++++++++++++++++
 .../transformer-deep-dive-homework.html            | 148 +++++
 .../transformer-deep-dive-homework.pdf             | Bin 0 -> 31627 bytes
 4 files changed, 775 insertions(+), 14 deletions(-)
```

---

## 2026-07-29 18:58:25 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `3ec9516` — Add Module 0B transformer deep dive
- **Upstream:** origin/slide-redesign-2026-05 — ahead 0, behind 0

### Summary

Completed draft online-material research shortlist for Weeks 3-14.

What changed:
- Added docs/week-03-14-material-candidates.md as a review-only draft for Q approval before integration.
- The file records candidate links, proposed uses, fit notes, caveats, and Q decision checkboxes for Weeks 3 through 14.
- It includes required-homework candidates and explicit access caveats for Skilljar, Claude/Copilot Office tools, Adobe, Canva, and Microsoft prompt gallery.
- After Codex review, revised the draft to:
  - Add a reuse policy for repeated sources.
  - Reclassify Weeks 4-5 paid/login-dependent Office resources as demo-first unless student access is confirmed.
  - Add tool-neutral fallback activities for Word and spreadsheet weeks.
  - Add MDN DOM scripting, events, and Using Fetch sources for Week 9.
  - Narrow Week 13 student scope to OWASP LLM Top 10 risk subset and move Agentic Top 10 to instructor/optional.
  - Add rubric/checklist anchors for Weeks 7 and 14.
  - Calibrate copyright/source-hub language and add direct U.S. Copyright Office report links.

Verification:
- No Playwright/browser automation used.
- ASCII-only text check passed for docs/week-03-14-material-candidates.md.
- git diff --check passed for docs/week-03-14-material-candidates.md.
- Lightweight link check covered 53 unique external URLs. Most returned HTTP 200/3xx. Known caveats are recorded in the file: UNESCO command-line reset, Adobe command-line timeout, Microsoft prompt gallery HEAD 405 but earlier browser-style access worked, Canva Cloudflare 403 challenge, Skilljar access/completion still needs student-account proof.
- Bounded Codex review first found issues; after fixes, final bounded review reported no blockers.

Current status:
- Research shortlist exists for Q review only. No Week 3-14 source integration into index.html or weekly decks has been done from this draft yet.
- Existing uncommitted/untracked course files remain. No commit or push performed.

Next:
- Q should approve/reject materials in docs/week-03-14-material-candidates.md, especially required homework candidates and access-dependent tools.
- Then build Week 3 teaching content first, using approved Week 3 sources and the scenario-decision-heavy direction unless Q chooses otherwise.

### Working tree (`git status --short`)

```text
 M index.html
 M progress.md
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? docs/week-03-14-material-candidates.md
?? image/
?? sos-talk-may12.html
?? teacher-training-ai-fluency.html
?? ui.txt
?? week-02-agent-foundations.html
?? week-02-foundation-readiness-check.html
?? week-08-web-basics-design.html
?? week-12-advanced-prompting.html
```

### Unstaged diff (`git diff --stat`)

```text
 index.html  |  343 ++++++++++-----
 progress.md | 1416 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 1648 insertions(+), 111 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
3ec9516 Add Module 0B transformer deep dive
 index.html                                         |  42 +-
 module-00b-transformer-deep-dive.html              | 599 +++++++++++++++++++++
 .../transformer-deep-dive-homework.html            | 148 +++++
 .../transformer-deep-dive-homework.pdf             | Bin 0 -> 31627 bytes
 4 files changed, 775 insertions(+), 14 deletions(-)
```

---

## 2026-07-29 18:17:34 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `3ec9516` — Add Module 0B transformer deep dive
- **Upstream:** origin/slide-redesign-2026-05 — ahead 0, behind 0

### Summary

Correction/clarification to the immediately previous checkpoint.

Clarifications:
- The completed milestone is the Week 2 Foundation Readiness Challenge artifact and linking work, not full completion of all Week 1-2 foundation content.
- Week 1 still needs a clean dedicated wrapper page if Q wants the first two weeks polished as a foundation block.
- The print/save-PDF control uses window.print and print CSS, but print/PDF layout was not visually verified because Playwright/browser automation remains off-limits per Q's earlier instruction.
- Task-related untracked files for this milestone: week-02-foundation-readiness-check.html. The previously created week-02-agent-foundations.html also remains untracked and is required by the Week 2 hub/deck links.
- The large progress.md diff is checkpoint history, not implementation code.

No additional implementation changes were made in this correction checkpoint.

### Working tree (`git status --short`)

```text
 M index.html
 M progress.md
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? image/
?? sos-talk-may12.html
?? teacher-training-ai-fluency.html
?? ui.txt
?? week-02-agent-foundations.html
?? week-02-foundation-readiness-check.html
?? week-08-web-basics-design.html
?? week-12-advanced-prompting.html
```

### Unstaged diff (`git diff --stat`)

```text
 index.html  |  341 ++++++++++-----
 progress.md | 1355 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 1586 insertions(+), 110 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
3ec9516 Add Module 0B transformer deep dive
 index.html                                         |  42 +-
 module-00b-transformer-deep-dive.html              | 599 +++++++++++++++++++++
 .../transformer-deep-dive-homework.html            | 148 +++++
 .../transformer-deep-dive-homework.pdf             | Bin 0 -> 31627 bytes
 4 files changed, 775 insertions(+), 14 deletions(-)
```

---

## 2026-07-29 18:16:57 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `3ec9516` — Add Module 0B transformer deep dive
- **Upstream:** origin/slide-redesign-2026-05 — ahead 0, behind 0

### Summary

Completed Weeks 1-2 Foundation Readiness Challenge milestone.

What changed:
- Added standalone interactive readiness challenge: week-02-foundation-readiness-check.html.
- Updated index.html Week 2 learning-path entry and orbit course resources to link to the readiness challenge.
- Updated week-02-agent-foundations.html homework slide to link to the readiness challenge.
- Challenge is framed as a low-stakes readiness reflection with auto-check practice, not a punitive mini-exam.
- Challenge sections:
  - LLM foundations under pressure: context, hallucination, source authority, prediction.
  - Agent transcript labeling: input, context, model, tool loop, human review.
  - Tool decision gauntlet: safe next action for agent scenarios.
  - Extension selector: better prompt vs skill vs MCP vs plugin.
  - Review challenge: identify realistic risks in a fake agent output; immediate acceptance is marked as the distractor.
  - Setup proof builder: chosen agent, screenshot note, exact prompt, allowed actions, observed components, and why the prompt was safe/read-only.
- Scoring language now distinguishes 34 auto-check points from instructor-reviewed review/setup sections.
- Added print/save-PDF button via window.print and print CSS, but no separate PDF was generated because Playwright/browser automation remains off-limits per Q's earlier instruction.

Verification:
- No Playwright/browser automation used.
- Inline JavaScript parse passed for index.html, week-02-agent-foundations.html, and week-02-foundation-readiness-check.html.
- Local href/anchor check passed for those files.
- Verified linked week pages exist locally: week-02-agent-foundations.html, week-02-foundation-readiness-check.html, week-08-web-basics-design.html, week-12-advanced-prompting.html.
- External target/rel check passed for Week 2 deck and readiness challenge pages.
- Trailing whitespace checks passed.
- git diff --check passed for tracked changed files; direct whitespace check covered the new untracked challenge file.
- Full index.html href-assumption scan showed only guarded c.href/resource.href uses in selectNode().
- Bounded Codex review ran twice: first review found scoring/checklist/accessibility issues; after fixes, final review found no remaining blockers.

Current status:
- Week 2 has a standalone teaching deck plus a standalone readiness challenge due before Week 3.
- Week 1 is still conceptually ready from existing LLM materials but does not yet have a clean dedicated wrapper page.
- No dev server started. No commit or push performed.

Next:
- Q can review whether the readiness challenge feels like the right difficulty.
- If approved, next likely work is a polished Week 1 wrapper page that routes students through selected LLM foundation slides and homework before Week 2.

### Working tree (`git status --short`)

```text
 M index.html
 M progress.md
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? image/
?? sos-talk-may12.html
?? teacher-training-ai-fluency.html
?? ui.txt
?? week-02-agent-foundations.html
?? week-02-foundation-readiness-check.html
?? week-08-web-basics-design.html
?? week-12-advanced-prompting.html
```

### Unstaged diff (`git diff --stat`)

```text
 index.html  |  341 ++++++++++------
 progress.md | 1268 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 1499 insertions(+), 110 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
3ec9516 Add Module 0B transformer deep dive
 index.html                                         |  42 +-
 module-00b-transformer-deep-dive.html              | 599 +++++++++++++++++++++
 .../transformer-deep-dive-homework.html            | 148 +++++
 .../transformer-deep-dive-homework.pdf             | Bin 0 -> 31627 bytes
 4 files changed, 775 insertions(+), 14 deletions(-)
```

---

## 2026-07-29 16:41:43 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `3ec9516` — Add Module 0B transformer deep dive
- **Upstream:** origin/slide-redesign-2026-05 — ahead 0, behind 0

### Summary

Completed Week 2 agent foundations slide milestone.

What changed:
- Added standalone interactive Week 2 deck: week-02-agent-foundations.html.
- Updated index.html Week 2 learning-path entry and orbit course data to point to week-02-agent-foundations.html.
- Kept module-00b-transformer-deep-dive.html and llm-background.html as supporting resources under Week 2 instead of the main Week 2 path.
- Week 2 deck uses CCUnpacked as an explicitly unofficial teaching case study, with a source-boundary slide.
- Deck teaches chatbot vs agent, 11-step CCUnpacked loop, collapsed 5-block student model, safe prompt tracing, inspectable agent components, GitHub review surface, skills/MCP/plugins extension stack, failure modes, Claude Code vs Codex track choice, setup proof, and homework due before Week 3.
- Homework added inside the deck: Anthropic AI Fluency: Framework & Foundations due before Week 3, setup proof, optional skills-vs-MCP video, optional CCUnpacked deep dive.

Verification:
- No Playwright/browser automation used.
- Inline JavaScript parse passed for index.html and week-02-agent-foundations.html.
- Local href/anchor check passed for index.html and week-02-agent-foundations.html.
- External target/rel check passed for new deck links.
- External link fetch check returned HTTP 200 for all new Week 2 deck external links, including CCUnpacked, course wiki, IBM article, MCP docs, Claude Code docs, OpenAI Codex docs, Anthropic Skilljar homework, and the optional YouTube video.
- Trailing whitespace checks passed.
- git diff --check passed for index.html, and direct whitespace check passed for the new untracked deck file.
- Bounded Codex review ran twice: first review found fixable issues; after fixes, final review found no remaining blockers.

Current status:
- Week 2 is now a ready standalone teaching deck in the web app.
- Week 1 is conceptually ready from existing LLM foundations materials but still lacks a clean dedicated Week 1 wrapper page.
- Week 8 and Week 12 standalone decks remain ready from prior milestones.
- Hidden teacher-training guide remains ready/unlisted from prior milestone.
- No dev server started. No commit or push performed.

Next:
- Discuss Week 2 content with Q and adjust scope if the session should be 60 minutes instead of 75 minutes.
- Then create a clean Week 1 wrapper page if Q wants the first two weeks polished as a foundation block before moving to Week 3.

### Working tree (`git status --short`)

```text
 M index.html
 M progress.md
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? image/
?? sos-talk-may12.html
?? teacher-training-ai-fluency.html
?? ui.txt
?? week-02-agent-foundations.html
?? week-08-web-basics-design.html
?? week-12-advanced-prompting.html
```

### Unstaged diff (`git diff --stat`)

```text
 index.html  |  339 +++++++++++------
 progress.md | 1188 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 1417 insertions(+), 110 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
3ec9516 Add Module 0B transformer deep dive
 index.html                                         |  42 +-
 module-00b-transformer-deep-dive.html              | 599 +++++++++++++++++++++
 .../transformer-deep-dive-homework.html            | 148 +++++
 .../transformer-deep-dive-homework.pdf             | Bin 0 -> 31627 bytes
 4 files changed, 775 insertions(+), 14 deletions(-)
```

---

## 2026-07-29 14:00:00 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `3ec9516` — Add Module 0B transformer deep dive
- **Upstream:** origin/slide-redesign-2026-05 — ahead 0, behind 0

### Summary

Completed hidden/unlisted teacher-training chapter milestone.

What changed:
- Added standalone instructor guide: teacher-training-ai-fluency.html.
- The page is direct-URL only and is not linked from index.html or the student 14-week course path.
- Added <meta name="robots" content="noindex,nofollow"> and a visible warning that unlisted/noindex is not privacy or access control.
- Guide content covers instructor orientation, 4D teaching framework, source mapping, week-by-week facilitation, assignments/rubrics, classroom scripts, student failure patterns, adaptation for non-CS instructors, and a launch checklist.
- Student-facing resources are separated from instructor-facing resources:
  - Students: AI Fluency: Framework & Foundations; AI Fluency for Students.
  - Instructors: AI Fluency for Educators; Teaching AI Fluency.

Verification:
- No Playwright/browser automation used.
- Node parse check passed for the instructor guide inline script.
- Local links and anchors passed.
- noindex/nofollow meta and visible not-private warning verified.
- External links use target="_blank" and rel="noopener noreferrer".
- Whitespace check passed.
- Copy-target static check passed.
- rg found no references to teacher-training-ai-fluency.html outside the file itself.
- rg found no sitemap/robots/manifest files to update.
- Final bounded Codex diff review found no blockers.

Current status:
- Task-related new file: teacher-training-ai-fluency.html.
- Previous task-related untracked files remain: week-08-web-basics-design.html and week-12-advanced-prompting.html.
- Existing unrelated local state remains: progress.md modified, CLAUDE.md untracked, docs/superpowers/audit-2026-05-21-deck-review.md untracked, image/ untracked, sos-talk-may12.html untracked, ui.txt untracked.
- index.html remains modified from the earlier Week 8/Week 12 course-hub work; it was not edited for this hidden guide milestone.
- No dev server started. No commit or push performed.

Next:
- Continue designing the remaining syllabus-week modules and decide whether to add instructor-only rubrics/templates as downloadable artifacts later.

### Working tree (`git status --short`)

```text
 M index.html
 M progress.md
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? image/
?? sos-talk-may12.html
?? teacher-training-ai-fluency.html
?? ui.txt
?? week-08-web-basics-design.html
?? week-12-advanced-prompting.html
```

### Unstaged diff (`git diff --stat`)

```text
 index.html  |  336 ++++++++++++------
 progress.md | 1107 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 1333 insertions(+), 110 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
3ec9516 Add Module 0B transformer deep dive
 index.html                                         |  42 +-
 module-00b-transformer-deep-dive.html              | 599 +++++++++++++++++++++
 .../transformer-deep-dive-homework.html            | 148 +++++
 .../transformer-deep-dive-homework.pdf             | Bin 0 -> 31627 bytes
 4 files changed, 775 insertions(+), 14 deletions(-)
```

---

## 2026-07-27 22:20:19 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `3ec9516` — Add Module 0B transformer deep dive
- **Upstream:** origin/slide-redesign-2026-05 — ahead 0, behind 0

### Summary

Completed Week 8 interactive teaching page milestone.

What changed:
- Added standalone Week 8 deck: week-08-web-basics-design.html.
- Updated index.html Week 8 learning-path entry to link to the new Week 8 slides and list the Andrew Ng / DeepLearningAI app-building video as offline homework.
- Updated the orbit course data for Week 8 to use the new deck, describe the inspiration-intro/student-own-app design, and retain claude-code-course.html as a secondary resource.
- Week 8 design follows Q's approved direction: slides discuss the video's build flow as inspiration, students design their own app ideas, and the full video is assigned for offline viewing.

Week 8 deck structure:
- Inspiration intro: idea -> prompt -> first app -> customize -> test -> fix -> transfer.
- Buildable-app boundary checker: one screen, one audience, 1-3 inputs, one output, one interaction, no risky features.
- Idea sprint with usefulness/feasibility/personal-interest scoring.
- Web anatomy mockup for HTML/CSS/JS/output mapping.
- Prompt contract builder for first build prompt.
- Peer critique checklist.
- Exit ticket for app title, target user, core interaction, wireframe, prompt, and one risk/unknown.
- Offline homework guide linking https://www.youtube.com/watch?v=ff3j4olCUig.

Verification:
- No Playwright used, per Q's instruction.
- Node parse check passed for inline scripts in index.html, week-08-web-basics-design.html, and week-12-advanced-prompting.html.
- Local link check passed for changed pages.
- Whitespace check passed for index.html and week-08-web-basics-design.html.
- git diff --check passed for index.html.
- Consent/assent diff guard produced no matches in index.html diff.
- Course data check passed: weeks 1-14 in order and all svgId symbols defined.
- External homework links use target="_blank" and rel="noopener noreferrer".
- Static ID reference check passed for week-08-web-basics-design.html.
- Final bounded Codex diff review found no blockers. Residual risk: rendering was not browser-verified because Playwright was intentionally not used.

Current status:
- Task-related changes: index.html modified; week-08-web-basics-design.html untracked/new; week-12-advanced-prompting.html remains untracked/new from the prior Week 12 milestone.
- Existing unrelated local state remains: progress.md modified, CLAUDE.md untracked, docs/superpowers/audit-2026-05-21-deck-review.md untracked, image/ untracked, sos-talk-may12.html untracked, ui.txt untracked.
- No dev server started. No push performed.

Next:
- Continue designing week-by-week web-app teaching modules in syllabus order.

### Working tree (`git status --short`)

```text
 M index.html
 M progress.md
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? image/
?? sos-talk-may12.html
?? ui.txt
?? week-08-web-basics-design.html
?? week-12-advanced-prompting.html
```

### Unstaged diff (`git diff --stat`)

```text
 index.html  |  336 +++++++++++++-------
 progress.md | 1022 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 1248 insertions(+), 110 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
3ec9516 Add Module 0B transformer deep dive
 index.html                                         |  42 +-
 module-00b-transformer-deep-dive.html              | 599 +++++++++++++++++++++
 .../transformer-deep-dive-homework.html            | 148 +++++
 .../transformer-deep-dive-homework.pdf             | Bin 0 -> 31627 bytes
 4 files changed, 775 insertions(+), 14 deletions(-)
```

---

## 2026-07-27 20:21:33 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `3ec9516` — Add Module 0B transformer deep dive
- **Upstream:** origin/slide-redesign-2026-05 — ahead 0, behind 0

### Summary

Completed no-Playwright Week 12/course-hub milestone.

What changed:
- Added standalone Week 12 interactive teaching deck: week-12-advanced-prompting.html.
- Reorganized index.html homepage/course path to follow the CS-215 syllabus order from Week 1 through Week 14.
- Added Week 12 entry linking to week-12-advanced-prompting.html and the Andrew Ng / DeepLearningAI prompting video as homework.
- Preserved pre/post assessment links in a separate assessment card.
- Consent/assent text was not modified.

Verification:
- Node parse check passed for inline scripts in index.html and week-12-advanced-prompting.html.
- Local link check passed for changed pages.
- git diff --check passed for index.html.
- Consent/assent diff guard found no consent-related diff in index.html.
- Course data check passed: weeks 1-14 in order and all svgId symbols defined.
- Final bounded Codex diff review found no blockers.
- Q explicitly said not to use Playwright; no Playwright verification was run.

Current status:
- Task-related changes: index.html modified; week-12-advanced-prompting.html untracked/new.
- Existing unrelated local state remains: progress.md modified, CLAUDE.md untracked, docs/superpowers/audit-2026-05-21-deck-review.md untracked, image/ untracked, sos-talk-may12.html untracked, ui.txt untracked.
- No dev server started. No push performed.

Next:
- Q wants to discuss/design each week module’s web-app content, starting from the syllabus order.

### Working tree (`git status --short`)

```text
 M index.html
 M progress.md
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? image/
?? sos-talk-may12.html
?? ui.txt
?? week-12-advanced-prompting.html
```

### Unstaged diff (`git diff --stat`)

```text
 index.html  | 333 ++++++++++++++-------
 progress.md | 950 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 1173 insertions(+), 110 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
3ec9516 Add Module 0B transformer deep dive
 index.html                                         |  42 +-
 module-00b-transformer-deep-dive.html              | 599 +++++++++++++++++++++
 .../transformer-deep-dive-homework.html            | 148 +++++
 .../transformer-deep-dive-homework.pdf             | Bin 0 -> 31627 bytes
 4 files changed, 775 insertions(+), 14 deletions(-)
```

---

## 2026-07-27 12:12:01 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `3ec9516` — Add Module 0B transformer deep dive
- **Upstream:** origin/slide-redesign-2026-05 — ahead 0, behind 0

### Summary

Q asked to save a checkpoint before continuing the course reorganization soon.

Current repo/push status:
- Branch `slide-redesign-2026-05` was pushed to `origin/slide-redesign-2026-05` after Q explicitly approved the push.
- Local `HEAD` and `origin/slide-redesign-2026-05` both point to `3ec9516` — `Add Module 0B transformer deep dive`.
- The branch includes 7 pushed commits since the previous upstream state:
  - `3ec9516 Add Module 0B transformer deep dive`
  - `297f2b6 Add interactive email context lab`
  - `d987766 Ground Module 0 concepts in real examples`
  - `fdb1c64 Make Module 0 concept-first`
  - `08a7db3 Make Module 0 more interactive`
  - `fcad99b Add foundation module slide decks`
  - `7734a75 Update teaching slide duration`

What was accomplished in the latest milestone:
- Added standalone Week 2 / Module 0B teaching-slide deck: `module-00b-transformer-deep-dive.html`.
- Added homework sheet and PDF: `session-materials/transformer-deep-dive-homework.html` and `session-materials/transformer-deep-dive-homework.pdf`.
- Updated `index.html` learning path and orbit step badges so Module 0B sits between Module 0 and Module 1; later steps now run through Step 10.
- Module 0B is self-contained and example-driven, covering tokens, embeddings, attention, repeated layers, facts in weights, hallucination, and verification with interactive labs and quizzes.
- Embedded the two 3Blue1Brown Week 2 videos: transformer explanation (`wjZofJX0v4M`) and facts-in-weights explanation (`9-Jl0dxWQs8`).

Verification already run:
- Inline JS parse checks passed for changed pages.
- Local link checks passed.
- PDF was regenerated and text-extracted successfully.
- `git diff --check` passed.
- Playwright verified desktop/mobile deck behavior, attention lab, fact/source lab, homepage Module 0B link, homepage step DOM, and no horizontal overflow.
- Bounded Codex review gate found no blockers before commit and before push.

Server/process status:
- The local Python server on `127.0.0.1:8000` was killed.
- A follow-up listener scan found no remaining local course/dev web servers.
- Remaining listeners were system/background app processes only (`rapportd`, `ARDAgent`, Adobe sync, Dropbox, VS Code helper listeners); they were not killed.

Current working tree notes:
- `progress.md` is modified by checkpoint state and remains uncommitted by design.
- Unrelated untracked local files remain untouched: `CLAUDE.md`, `docs/superpowers/audit-2026-05-21-deck-review.md`, `image/`, `sos-talk-may12.html`, `ui.txt`.

Next direction from Q:
- Continue the main college course reorganization soon.
- Q wants a self-contained e-textbook/web app where every module is a standalone teaching-slide style artifact, not a fixed article/page template.
- Class rhythm target: about half teaching content and half exercises/challenges/assignments, with quizzes in each module.
- Module 0 and Module 0B are now prototypes for the rest of the course organization.
- Next likely task: continue reorganizing Module 1 and later modules around the same standalone slide-deck pattern, while preserving the college-course branch and avoiding HS/IRB assessment changes unless Q explicitly asks.

### Working tree (`git status --short`)

```text
 M progress.md
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? image/
?? sos-talk-may12.html
?? ui.txt
```

### Unstaged diff (`git diff --stat`)

```text
 progress.md | 862 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 862 insertions(+)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
3ec9516 Add Module 0B transformer deep dive
 index.html                                         |  42 +-
 module-00b-transformer-deep-dive.html              | 599 +++++++++++++++++++++
 .../transformer-deep-dive-homework.html            | 148 +++++
 .../transformer-deep-dive-homework.pdf             | Bin 0 -> 31627 bytes
 4 files changed, 775 insertions(+), 14 deletions(-)
```

---

## 2026-07-26 23:39:14 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `3ec9516` — Add Module 0B transformer deep dive
- **Upstream:** origin/slide-redesign-2026-05 — ahead 7, behind 0

### Summary

Committed the approved Week 2 / Module 0B transformer deep-dive module for the main college course site.

Commit created:
- 3ec9516 Add Module 0B transformer deep dive

What changed:
- Added `module-00b-transformer-deep-dive.html`, a standalone teaching-slide style deck for Week 2 / Module 0B: Inside an LLM.
- The deck is self-contained and example-driven: tokens, embeddings, attention, repeated transformer layers, facts in weights, hallucination, and verification are taught through concrete examples like `bank`, `pitcher`, class policy, current library hours, and private/local decisions.
- Added interactive classroom checks: attention-context chip lab, fact/source classification lab, and three quick-check quizzes.
- Embedded the two approved 3Blue1Brown deep-dive videos in the relevant teaching flow: transformer explanation (`wjZofJX0v4M`) and facts-in-weights explanation (`9-Jl0dxWQs8`).
- Added `session-materials/transformer-deep-dive-homework.html` plus regenerated PDF `session-materials/transformer-deep-dive-homework.pdf`.
- Updated `index.html` so the learning path now inserts Week 2 / Module 0B after Week 1 / Module 0 and before Module 1; later visible steps and orbit step badges were renumbered through Step 10.

Verification:
- Inline JS parse passed for `index.html` and `module-00b-transformer-deep-dive.html`.
- Local link target check passed for `index.html`, the new Module 0B deck, and the new homework sheet.
- PDF text extraction confirmed the homework sheet, video sections, glossary/checkpoints, Fact or Source section, and Exit Ticket.
- `git diff --check` passed.
- Playwright verified desktop deck load: 22 slides, both YouTube iframes present, attention lab present, fact lab present, no horizontal overflow.
- Playwright verified attention lab behavior updates active state and meaning output.
- Playwright verified fact/source lab behavior updates active state and selected panel.
- Playwright verified Module 0B at 375px mobile: `#hour2` deep link opens, no horizontal overflow.
- Playwright verified homepage DOM contains the new Module 0B path, its link, and Step 10 post-test text; homepage 375px has no horizontal overflow. Existing homepage consent modal and favicon warning are unchanged.
- Bounded Codex review gate found no blockers.

Current status:
- Branch `slide-redesign-2026-05` is local-only ahead of origin by 7 commits.
- Do not push unless Q explicitly approves.
- `progress.md` is modified by checkpoint state and remains uncommitted.
- Unrelated untracked files remain untouched: `CLAUDE.md`, `docs/superpowers/audit-2026-05-21-deck-review.md`, `image/`, `sos-talk-may12.html`, `ui.txt`.
- Local server is still available at `http://127.0.0.1:8000/` if still running.

### Working tree (`git status --short`)

```text
 M progress.md
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? image/
?? sos-talk-may12.html
?? ui.txt
```

### Unstaged diff (`git diff --stat`)

```text
 progress.md | 787 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 787 insertions(+)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
3ec9516 Add Module 0B transformer deep dive
 index.html                                         |  42 +-
 module-00b-transformer-deep-dive.html              | 599 +++++++++++++++++++++
 .../transformer-deep-dive-homework.html            | 148 +++++
 .../transformer-deep-dive-homework.pdf             | Bin 0 -> 31627 bytes
 4 files changed, 775 insertions(+), 14 deletions(-)
```

---

## 2026-07-26 22:44:29 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `297f2b6` — Add interactive email context lab
- **Upstream:** origin/slide-redesign-2026-05 — ahead 6, behind 0

### Summary

Committed a follow-up Module 0 revision that adds an interactive email context lab.

Commit created:
- 297f2b6 Add interactive email context lab

What changed:
- module-00-llm-basics.html now adds a chips-only "Build the email context" activity immediately after the running example slide.
- Students choose reason, context, and tone chips for a small real-life email task before the formal LLM concepts.
- The activity dynamically generates a rough prompt, draft email, verification list, and before-sending approval notes.
- The activity has no free-text input, no form, no local/session storage, and no network submission. It includes a privacy note telling students to try their own version on paper/local note and not type private medical/family/personal details into the page.
- The opening slide now says the email task comes before definitions so the concepts explain something students just experienced.
- index.html Module 0 copy now says students try a small email task, then use that example to understand tokens, context, prediction, verification, tools, and agents.

Verification:
- Inline JS parse passed for index.html and module-00-llm-basics.html.
- Local link target check passed.
- Precise privacy scan found no localStorage/sessionStorage/fetch/XMLHttpRequest/sendBeacon/form/input/textarea in module-00-llm-basics.html.
- Stale wording search found no old guided-video / required 3Blue1Brown phrasing.
- git diff --check passed.
- Playwright desktop verified 49 slides, email lab present, initial prompt generated, privacy note visible, no storage/network calls, no horizontal overflow.
- Playwright chip behavior verified selecting policy/assignment/family/next-step changes prompt, draft, verification list, approval list; policy disables no-policy; aria-pressed updates; no overflow.
- Playwright mobile 375px verified the email lab deep link opens Build the email context, generated prompt and privacy note are visible, email grids collapse, no overflow.
- Playwright homepage verified new small-email-task copy present, old copy absent, no overflow.
- Bounded Codex review gate returned no blockers.

Current status:
- Branch slide-redesign-2026-05 is local-only ahead of origin by 6 commits.
- Do not push unless Q explicitly approves.
- progress.md is modified by checkpoint state and remains uncommitted.
- Unrelated untracked files remain untouched: CLAUDE.md, docs/superpowers/audit-2026-05-21-deck-review.md, image/, sos-talk-may12.html, ui.txt.
- Local server is still available at http://127.0.0.1:8000/ if still running.

### Working tree (`git status --short`)

```text
 M progress.md
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? image/
?? sos-talk-may12.html
?? ui.txt
```

### Unstaged diff (`git diff --stat`)

```text
 progress.md | 714 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 714 insertions(+)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
297f2b6 Add interactive email context lab
 index.html                |   6 +-
 module-00-llm-basics.html | 193 +++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 194 insertions(+), 5 deletions(-)
```

---

## 2026-07-26 22:00:16 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `d987766` — Ground Module 0 concepts in real examples
- **Upstream:** origin/slide-redesign-2026-05 — ahead 5, behind 0

### Summary

Committed a follow-up Module 0 revision that grounds the concepts in real-world examples.

Commit created:
- d987766 Ground Module 0 concepts in real examples

What changed:
- module-00-llm-basics.html now teaches the early concept block through one running real-world example: a student asks AI to draft a respectful email to a professor after missing class.
- Reworked the concept flow so LLM, token, context, next-token prediction, verification, tool calls, and agents connect back to that same email task.
- Added a context-switch interactive demo: same prompt, different context, different output. It uses aria-controls/aria-expanded and updates visible scenario panels.
- Added a classification check: LLM vs chatbot vs tool call vs agent.
- Added Karpathy MicroGPT as an optional teacher/curious-student bridge and optional deep-dive link, not required Week 1 work.
- Updated index.html Module 0 copy/orbit metadata to describe the real-world email example and interactive checks.
- Updated session-materials/llm-foundations-homework.html and regenerated PDF to include optional MicroGPT and clarify the required Karpathy video warm-up heading.

External source used:
- https://karpathy.github.io/2026/02/12/microgpt/ — used only for the optional MicroGPT reference/bridge. The page describes MicroGPT as a tiny pure-Python GPT containing dataset, tokenizer, model, training loop, and inference loop pieces.

Verification:
- Slide/content check: 48 slides; email example, context-switch demo, MicroGPT, classification check present.
- Inline JS parse passed for index.html and module-00-llm-basics.html.
- Local link target check passed after skipping JS template placeholders.
- Stale wording search found no old guided-video / required 3Blue1Brown phrasing.
- Tokenizer caveat text is present: different tokenizers can split text differently; real tokenizers vary.
- PDF text confirms MicroGPT, Concept Warm-Up Before the Required Karpathy Video, Class Concept Reflection, and Karpathy-required wording.
- git diff --check passed.
- Playwright desktop verified 48 slides, email example, scenario demo, MicroGPT, classification check present, no horizontal overflow.
- Playwright context-switch demo verified scenario-policy appears, aria-expanded=true, no overflow.
- Playwright homepage verified real-world email copy present, old Module 0 copy absent, Module 0 link present, no overflow.
- Playwright mobile 375px verified #concepts deep link opens Running example, story/scenario grids collapse, no overflow.
- Bounded Codex review gate returned commit-ready; narrow post-review wording change also reviewed commit-ready.

Current status:
- Branch slide-redesign-2026-05 is local-only ahead of origin by 5 commits.
- Do not push unless Q explicitly approves.
- progress.md is modified by checkpoint state and remains uncommitted.
- Unrelated untracked files remain untouched: CLAUDE.md, docs/superpowers/audit-2026-05-21-deck-review.md, image/, sos-talk-may12.html, ui.txt.
- Local server is still available at http://127.0.0.1:8000/ if still running.

### Working tree (`git status --short`)

```text
 M progress.md
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? image/
?? sos-talk-may12.html
?? ui.txt
```

### Unstaged diff (`git diff --stat`)

```text
 progress.md | 633 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 633 insertions(+)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
d987766 Ground Module 0 concepts in real examples
 index.html                                      |   6 +-
 module-00-llm-basics.html                       | 216 ++++++++++++++++++------
 session-materials/llm-foundations-homework.html |   7 +-
 session-materials/llm-foundations-homework.pdf  | Bin 39219 -> 40339 bytes
 4 files changed, 176 insertions(+), 53 deletions(-)
```

---

## 2026-07-26 20:53:49 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `fdb1c64` — Make Module 0 concept-first
- **Upstream:** origin/slide-redesign-2026-05 — ahead 4, behind 0

### Summary

Committed a follow-up Module 0 revision that makes Week 1 / Module 0 concept-first instead of video-dependent.

Commit created:
- fdb1c64 Make Module 0 concept-first

What changed:
- module-00-llm-basics.html now explicitly defines the core LLM concepts before the 3Blue1Brown reinforcement video: LLM, token, context, next-token prediction, pretraining, base model vs assistant, hallucination, verification, tool call, and agent loop.
- Added animated/interactive teaching elements: token chips, probability bars, context window, pulsing LLM loop, and a click-to-reveal token exercise with aria-controls/aria-expanded.
- Added a Concepts jump button and changed the short 3Blue1Brown video slide to visual reinforcement rather than the main teaching mechanism.
- Updated index.html Module 0 copy/orbit metadata to say concept-first teaching deck with animated examples and click-to-reveal checks.
- Updated session-materials/llm-foundations-homework.html and regenerated PDF so Karpathy is the main required homework, 3Blue1Brown is reinforcement/replay, and the reflection section is concept-based.

Verification:
- node inline JS parse passed for index.html and module-00-llm-basics.html.
- local link target check passed after skipping JS template placeholders.
- stale wording search found no old guided-video / required 3Blue1Brown checklist phrasing.
- PDF text confirms concept-first/Karpathy-required wording and Class Concept Reflection heading.
- git diff --check passed.
- Playwright desktop verified 44 slides, concept/reveal/probability/loop elements present, no horizontal overflow.
- Playwright reveal interaction verified output appears, aria-expanded=true, no overflow.
- Playwright mobile 375px verified no horizontal overflow and reveal grid collapses to one column.
- Playwright fresh #concepts deep link opens the What is an LLM slide.
- Homepage browser check verified concept-first copy is present, old guided 3Blue1Brown phrase absent, Module 0 link present, no horizontal overflow.
- Bounded Codex review gate returned commit-ready.

Current status:
- Branch slide-redesign-2026-05 is local-only ahead of origin by 4 commits.
- Do not push unless Q explicitly approves.
- progress.md is modified by checkpoint state and remains uncommitted.
- Unrelated untracked files remain untouched: CLAUDE.md, docs/superpowers/audit-2026-05-21-deck-review.md, image/, sos-talk-may12.html, ui.txt.
- Local server is still available at http://127.0.0.1:8000/ if still running.

### Working tree (`git status --short`)

```text
 M progress.md
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? image/
?? sos-talk-may12.html
?? ui.txt
```

### Unstaged diff (`git diff --stat`)

```text
 progress.md | 558 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 558 insertions(+)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
fdb1c64 Make Module 0 concept-first
 index.html                                      |   6 +-
 module-00-llm-basics.html                       | 202 ++++++++++++++++++++++--
 session-materials/llm-foundations-homework.html |  14 +-
 session-materials/llm-foundations-homework.pdf  | Bin 39008 -> 39219 bytes
 4 files changed, 203 insertions(+), 19 deletions(-)
```

---

## 2026-07-26 19:16:40 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `08a7db3` — Make Module 0 more interactive
- **Upstream:** origin/slide-redesign-2026-05 — ahead 3, behind 0

### Summary

Committed a follow-up revision that makes Module 0 more interactive and beginner-first.

Commit created:
- 08a7db3 Make Module 0 more interactive

What changed:
- module-00-llm-basics.html now frames the deck as Week 1 / Module 0: What Is an LLM?
- Added an opening next-word prediction challenge before definitions.
- Moved the short 3Blue1Brown LLM video into the live class flow as a guided watch slide with pause/check prompts.
- Added a video-check quiz immediately after the guided 3Blue1Brown slide.
- Added a Video jump button in the slide controls.
- Kept Karpathy's 3h31m video in the homework section as the required homework/deep dive.
- Updated index.html labels/orbit copy for Week 1 / Module 0.
- Updated session-materials/llm-foundations-homework.html and regenerated PDF so the sheet says in-class reflection + homework, not required preparation.

Verification:
- Module 0 now has 38 slides.
- Inline JS parse checks passed for index.html and module-00-llm-basics.html.
- Local link target check passed.
- PDF text layer confirms: In-class reflection and homework for Week 1 / Module 0: What Is an LLM?
- Playwright CLI verified Module 0 title/brand, embedded 3Blue1Brown iframe, Video jump, video quiz feedback, 375px mobile no horizontal overflow, and homepage label visible after local consent flag.
- Staged Codex review first found the homework wording mismatch; after fixing and regenerating PDF, rerun review returned No findings.

Current status:
- Commit is local only; not pushed.
- Branch slide-redesign-2026-05 is ahead of origin by 3 commits.
- progress.md is modified as session checkpoint state and remains uncommitted.
- Unrelated untracked files remain untouched.

Test URL:
- http://127.0.0.1:8000/module-00-llm-basics.html

### Working tree (`git status --short`)

```text
 M progress.md
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? image/
?? sos-talk-may12.html
?? ui.txt
```

### Unstaged diff (`git diff --stat`)

```text
 progress.md | 483 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 483 insertions(+)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
08a7db3 Make Module 0 more interactive
 index.html                                      |  10 ++--
 module-00-llm-basics.html                       |  73 +++++++++++++++++++-----
 session-materials/llm-foundations-homework.html |  20 +++----
 session-materials/llm-foundations-homework.pdf  | Bin 38973 -> 39008 bytes
 4 files changed, 75 insertions(+), 28 deletions(-)
```

---

## 2026-07-26 18:57:04 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `fcad99b` — Add foundation module slide decks
- **Upstream:** origin/slide-redesign-2026-05 — ahead 2, behind 0

### Summary

Committed the Module 0/Module 1 foundation slide deck implementation.

Commit created:
- fcad99b Add foundation module slide decks

Committed files:
- index.html: homepage learning path/orbit now includes Module 0 and Module 1 before Course 1-4; old How AI Works homepage card removed.
- agentic-engineering-quest.html: Course 2 Module 0 is now a bridge to standalone Module 0 while preserving id/index/module count; Course 2 mobile/AgentOps fixes included.
- module-00-llm-basics.html: new standalone teaching slide deck, 35 slides.
- module-01-github-agents.html: new standalone teaching slide deck, 26 slides.
- scripts/html-to-pdf.sh: repeatable WeasyPrint wrapper.
- session-materials/llm-foundations-homework.html and .pdf: Module 0 homework sheet and regenerated PDF.

Verification before commit:
- git diff --cached --check passed.
- Inline JS parse checks passed.
- Playwright CLI verified slide hash reload for #slide-7 and #slide-8.
- Final staged Codex review returned No findings.

Current status:
- Content changes are committed locally.
- Not pushed.
- progress.md is modified again by this checkpoint and remains uncommitted as session state.
- Other unrelated untracked files remain untouched.

Next:
- Q can test locally on the server still running at http://127.0.0.1:8000/.
- Do not push until Q explicitly approves.

### Working tree (`git status --short`)

```text
 M progress.md
?? .playwright-cli/
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? image/
?? sos-talk-may12.html
?? ui.txt
```

### Unstaged diff (`git diff --stat`)

```text
 progress.md | 407 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 407 insertions(+)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
fcad99b Add foundation module slide decks
 agentic-engineering-quest.html                  | 452 +++++++++++++++---
 index.html                                      |  78 ++-
 module-00-llm-basics.html                       | 606 ++++++++++++++++++++++++
 module-01-github-agents.html                    | 510 ++++++++++++++++++++
 scripts/html-to-pdf.sh                          |  23 +
 session-materials/llm-foundations-homework.html | 245 ++++++++++
 session-materials/llm-foundations-homework.pdf  | Bin 0 -> 38973 bytes
 7 files changed, 1830 insertions(+), 84 deletions(-)
```

---

## 2026-07-26 18:25:12 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `7734a75` — Update teaching slide duration
- **Upstream:** origin/slide-redesign-2026-05 — ahead 1, behind 0

### Summary

Implemented the first two standalone teaching slide decks for the course reorganization.

What changed locally:
- Added module-00-llm-basics.html as Module 0: LLM Basics. It is a full-screen teaching slide deck with 35 slides, hour jumps, keyboard navigation, quiz feedback, challenge slides, teacher notes toggle, homework video section, and links to the homework HTML/PDF.
- Added module-01-github-agents.html as Module 1: GitHub + Agents. It is a full-screen teaching slide deck with 26 slides, GitHub mental model, agent mental model, workflow challenges, quiz feedback, teacher notes toggle, and homework/reflection slide.
- Updated index.html learning path and orbit cards so the sequence is: Pre-Test (existing URL, not corrected yet) -> Module 0 -> Module 1 -> Course 1 -> Course 2 -> Course 3 -> Course 4 -> Behind the Scenes -> Post-Test. Removed the homepage How AI Works card so llm-background.html is only optional deep-dive material from Module 0 homework.
- Updated agentic-engineering-quest.html Module 0 into a short bridge to standalone Module 0 while preserving id="mod0", index 0, and 11 internal Course 2 modules. Also patched Course 2 mobile topbar overflow, compare.three mobile layout, AgentOps idle/waiting badge styles, and approval queue behavior after approval.
- Updated session-materials/llm-foundations-homework.html wording from Course 2 Module 0 to Module 0: LLM Basics and regenerated session-materials/llm-foundations-homework.pdf with scripts/html-to-pdf.sh.

Verification completed:
- Local server at http://127.0.0.1:8000 is serving the updated files.
- Inline JS parse check passed for index.html, agentic-engineering-quest.html, module-00-llm-basics.html, and module-01-github-agents.html.
- Local link target check passed for touched HTML files.
- git diff --check passed for touched files.
- PDF text layer confirms Required preparation for Module 0: LLM Basics and no Course 2 Module 0 wording.
- Playwright CLI checks passed: Module 0 has 35 slides, Module 1 has 26 slides, keyboard next works, quiz feedback works, desktop and 375px mobile have no horizontal overflow for the new decks, homepage renders Module 0/1 after local consent flag, Course 2 remains 11 modules with Module 0 bridge, saved indices still map to first module positions, Course 2 mobile no document overflow, AgentOps approval queue clears approved request.
- Final Codex review returned No findings after two rounds of fixes.

Current status:
- Local changes are not committed and not pushed.
- Branch slide-redesign-2026-05 is still ahead of origin by 1 prior commit (7734a75 Update teaching slide duration).
- Do not push without Q's explicit approval.
- Assessment URLs on index.html are intentionally not corrected yet; Q said to discuss correct pre/post assessment later.

Next:
- Q should test locally at http://127.0.0.1:8000/module-00-llm-basics.html and http://127.0.0.1:8000/module-01-github-agents.html.
- After Q reviews, decide whether to adjust content/visual density, then discuss correct college pre/post assessment links before commit/push.

### Working tree (`git status --short`)

```text
 M agentic-engineering-quest.html
 M index.html
 M progress.md
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? image/
?? module-00-llm-basics.html
?? module-01-github-agents.html
?? scripts/html-to-pdf.sh
?? session-materials/llm-foundations-homework.html
?? session-materials/llm-foundations-homework.pdf
?? sos-talk-may12.html
?? ui.txt
```

### Unstaged diff (`git diff --stat`)

```text
 agentic-engineering-quest.html | 452 +++++++++++++++++++++++++++++++++++------
 index.html                     |  78 ++++---
 progress.md                    | 330 ++++++++++++++++++++++++++++++
 3 files changed, 776 insertions(+), 84 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
7734a75 Update teaching slide duration
 session-materials/session-slides.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
```

---

## 2026-07-26 16:52:17 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `7734a75` — Update teaching slide duration
- **Upstream:** origin/slide-redesign-2026-05 — ahead 1, behind 0

### Summary

Added repeatable HTML-to-PDF conversion for the LearnAI course repo.

What changed locally:
- Installed Homebrew WeasyPrint 69.0. Initial brew install returned nonzero because pycparser/cffi/pillow had pre-existing Python site-package link conflicts, but /opt/homebrew/bin/weasyprint is linked and works. I did not run brew link --overwrite.
- Added scripts/html-to-pdf.sh. Usage: scripts/html-to-pdf.sh input.html [output.pdf]. It checks input exists and reports how to install weasyprint if missing.
- Regenerated session-materials/llm-foundations-homework.pdf from session-materials/llm-foundations-homework.html.
- Updated the homework HTML print CSS to set US Letter output: @page{size:Letter;margin:0.6in}. Removed nonessential screen-only CSS that caused WeasyPrint warnings.

Verification completed:
- weasyprint --version -> WeasyPrint version 69.0.
- scripts/html-to-pdf.sh session-materials/llm-foundations-homework.html generated the PDF without warnings.
- pdfinfo session-materials/llm-foundations-homework.pdf: 7 pages, Letter size (612 x 792 pts), Producer WeasyPrint 69.0, no JavaScript, not encrypted.
- pdftotext check found: LLM Foundations Homework Sheet, 03:21:46 Grand summary, Bridge to Agents, Practical agent formula, Teacher Grading Guide.
- Rendered page 1 to PNG with pdftoppm and visually inspected it; layout looks clean.
- git diff --check for scripts/html-to-pdf.sh, homework HTML, and PDF passed.
- Codex final review returned No findings.

Current status:
- Changes are local and uncommitted/unpushed.
- New untracked files include scripts/html-to-pdf.sh, session-materials/llm-foundations-homework.html, and session-materials/llm-foundations-homework.pdf.
- Branch slide-redesign-2026-05 remains ahead of origin by 1 prior commit: 7734a75 Update teaching slide duration.
- Do not push without Q's explicit approval.

### Working tree (`git status --short`)

```text
 M agentic-engineering-quest.html
 M index.html
 M progress.md
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? image/
?? scripts/html-to-pdf.sh
?? session-materials/llm-foundations-homework.html
?? session-materials/llm-foundations-homework.pdf
?? sos-talk-may12.html
?? ui.txt
```

### Unstaged diff (`git diff --stat`)

```text
 agentic-engineering-quest.html | 636 +++++++++++++++++++++++++++++++++++++----
 index.html                     |  16 +-
 progress.md                    | 260 +++++++++++++++++
 3 files changed, 850 insertions(+), 62 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
7734a75 Update teaching slide duration
 session-materials/session-slides.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
```

---

## 2026-07-25 23:43:13 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `7734a75` — Update teaching slide duration
- **Upstream:** origin/slide-redesign-2026-05 — ahead 1, behind 0

### Summary

Expanded Course 2 Module 0 into a detailed LLM Foundations unit and added a homework sheet.

What changed locally:
- agentic-engineering-quest.html Module 0 is now "LLM Foundations for Agentic Engineering": a one-week foundation with 3 class hours, required 3Blue1Brown warm-up, required outside-class Karpathy homework, self-contained explanations of tokens/context/inference/pretraining/post-training/hallucination/tool use/agents, class activities, and three quick checks.
- Module 0 clearly separates 3 class hours from the 3.5-hour Karpathy outside-class homework.
- Added a three-column Chatbot vs Tool Call vs Agent comparison.
- Added versioned localStorage keys (aeq-xp-v2, aeq-done-v2, aeq-quizzes-v2) so old 10-module progress does not mark the newly inserted module numbering incorrectly.
- index.html Course 2 copy now says it starts with a one-week LLM primer rather than stale ~3.5 hour wording.
- Created session-materials/llm-foundations-homework.html: print-friendly homework sheet with 3Blue1Brown + Karpathy links, glossary, exact Karpathy chapter checkpoints, bridge-to-agents classification, verification reflection, exit ticket, checklist, and grading guide.

Verification completed:
- git diff --check -- agentic-engineering-quest.html index.html session-materials/llm-foundations-homework.html
- inline JS parse for index.html and agentic-engineering-quest.html
- module IDs/goTo targets/mods array consistency check for mod0..mod10
- storage key check for v2 progress keys
- homework link/checkpoint/content check
- attempted PDF generation with cupsfilter, but local system has no text/html -> application/pdf CUPS filter; removed empty PDF. HTML sheet remains print-ready.
- Final Codex diff review returned No findings.

Current status:
- Changes are local and uncommitted/unpushed.
- Branch slide-redesign-2026-05 is still ahead of origin by 1 prior commit: 7734a75 Update teaching slide duration.
- Do not push without Q's explicit approval.
- progress.md is modified by checkpoints; unrelated untracked files remain untouched.

### Working tree (`git status --short`)

```text
 M agentic-engineering-quest.html
 M index.html
 M progress.md
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? image/
?? session-materials/llm-foundations-homework.html
?? sos-talk-may12.html
?? ui.txt
```

### Unstaged diff (`git diff --stat`)

```text
 agentic-engineering-quest.html | 636 +++++++++++++++++++++++++++++++++++++----
 index.html                     |  16 +-
 progress.md                    | 190 ++++++++++++
 3 files changed, 780 insertions(+), 62 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
7734a75 Update teaching slide duration
 session-materials/session-slides.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
```

---

## 2026-07-25 19:58:09 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `7734a75` — Update teaching slide duration
- **Upstream:** origin/slide-redesign-2026-05 — ahead 1, behind 0

### Summary

Added a new college Course 2 topic locally: Agent Control Planes.

Course changes:
- agentic-engineering-quest.html now has a new Module 9 "Agent Control Planes" before the capstone. It teaches the control-plane pattern for supervising multiple AI workers: shared state, approval gates, budget/burn visibility, blockers, audit logs, and fixed-command actions.
- The old capstone was renumbered from mod9 to mod10, and navigation/mods array/completeQuest references were updated accordingly.
- The module includes a browser-only AgentOps Board simulation with 3 agents, 5 tasks, heartbeat tick, approval queue, audit log, and fixed commands: tick, request deploy, approve first, assign qa, reset.
- Meridian Company OS is linked only as an optional reference/case study, with a warning not to run external bridges/OAuth/local process execution/API-key integrations until reviewed.
- index.html now shows the academy as 48 modules and Course 2 as 11 modules / ~3.5 hours, and mentions agent control planes/AgentOps Board.

Verification already run:
- git diff --check -- agentic-engineering-quest.html index.html
- Node parse check for inline scripts in index.html and agentic-engineering-quest.html
- Node consistency check: module IDs are mod0..mod10, mods array matches, goTo targets are valid
- Node content check: old 47/10-module wording removed in the touched homepage strings
- Node fake-DOM smoke test for AgentOps rendering, tick, unknown-command safety, and approval queue transition
- Codex review gate on the diff returned: No findings

Current status:
- Branch slide-redesign-2026-05 is still ahead of origin by 1 prior commit: 7734a75 Update teaching slide duration.
- Do not push without Q's explicit approval.
- Course edits are uncommitted/local in agentic-engineering-quest.html and index.html.
- progress.md is also modified due handoff checkpoints; unrelated untracked files remain and should be left alone.

### Working tree (`git status --short`)

```text
 M agentic-engineering-quest.html
 M index.html
 M progress.md
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? image/
?? sos-talk-may12.html
?? ui.txt
```

### Unstaged diff (`git diff --stat`)

```text
 agentic-engineering-quest.html | 319 +++++++++++++++++++++++++++++++++++++++--
 index.html                     |  16 +--
 progress.md                    | 123 ++++++++++++++++
 3 files changed, 442 insertions(+), 16 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
7734a75 Update teaching slide duration
 session-materials/session-slides.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
```

---

## 2026-07-25 19:22:03 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `7734a75` — Update teaching slide duration
- **Upstream:** origin/slide-redesign-2026-05 — ahead 1, behind 0

### Summary

HS IRB web materials checkpoint.

Current HS repos:
- /Users/oreo/Dropbox/desktopwork/learnai-course-hs is clean and synced on main at 0e1b12f (origin/main) "Clarify HS IRB materials and assent routing". Live site: https://weihaoqu.github.io/learnai-course-hs/. This repo is the HS course/session hub, not the official assent gate. It keeps Course 1, Course 2, and session slides available; official assent/pre/post links route to the HS assessment app.
- /Users/oreo/Dropbox/iticse/learnai-assessment-hs is clean and synced on main at 37cfdd8 (origin/main) "Finish HS assessment IRB sweep". Live site: https://weihaoqu.github.io/learnai-assessment-hs/. This repo is the official student assent + pre/post assessment app. It blocks I DO NOT AGREE from code entry/test flow, removes the follow-up link, and Apps Script backend returns not_assented before spreadsheet access for non-affirmative assent.

Production verification completed previously:
- GitHub Pages deployments succeeded for both HS repos.
- Live assessment page no longer contains "read and agree to this assent", "Post-Semester Follow-Up Survey", or "followup.html".
- Live Apps Script endpoint https://script.google.com/macros/s/AKfycbxYE-MArqkRyC_n-C-WHotNyb8H1ipbIrqvfQOi0qbszXti_2xo2pzJvBMWwJ01MbWMuw/exec returned not_assented for a safe non-assent POST without participant/test data.

Important caveats:
- Google Sheet contents were not directly inspected, so historical rows, if any, were not audited or removed.
- Do not push future changes without Q's explicit approval.
- The original /Users/oreo/Dropbox/desktopwork/learnai-course repo is separate from the HS repos; its progress.md may now include this checkpoint entry and it also has unrelated untracked files that should be left alone.

Server status: no local servers running.
Push status: HS repos pushed and clean at the commits above.

### Working tree (`git status --short`)

```text
 M progress.md
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? sos-talk-may12.html
?? ui.txt
```

### Unstaged diff (`git diff --stat`)

```text
 progress.md | 65 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
7734a75 Update teaching slide duration
 session-materials/session-slides.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
```

---

## 2026-07-25 19:21:11 EDT — Codex

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `7734a75` — Update teaching slide duration
- **Upstream:** origin/slide-redesign-2026-05 — ahead 1, behind 0

### Summary

- What changed this session:
  - Verified Q’s intended LearnAI teaching/course app is **not** under `/Users/oreo/Dropbox/iticse`; it lives in `/Users/oreo/Dropbox/desktopwork/learnai-course`.
  - Verified live `https://weihaoqu.github.io/learnai-course/` is the AI Engineering Academy landing page and its live `index.html` hash matches both local `index.html` and `origin/main:index.html`.
  - No source edits, commits, or pushes were made by Codex before this checkpoint.

- Current status:
  - Repo: `/Users/oreo/Dropbox/desktopwork/learnai-course`.
  - Current branch: `slide-redesign-2026-05`.
  - Local branch is ahead of `origin/slide-redesign-2026-05` by 1 commit: `7734a75 Update teaching slide duration`.
  - `main` matches `origin/main` at `3d2803a Add Easy-Vibe reference and skills workflow slide`.
  - GitHub Pages deploys repo root only on pushes to `main` via `.github/workflows/pages.yml`.
  - Live landing page currently matches `origin/main`; branch-only/untracked changes are not live.

- Next for incoming session / Q:
  - Work on `slide-redesign-2026-05` in `/Users/oreo/Dropbox/desktopwork/learnai-course`.
  - Inspect existing untracked files before deciding whether to keep, commit, or ignore them: `CLAUDE.md`, `docs/superpowers/audit-2026-05-21-deck-review.md`, `sos-talk-may12.html`, `ui.txt`.
  - If Q wants the branch live, merge/push to `main` only after Q explicitly approves the push.

- Off-limits / guardrails:
  - Do not push without Q’s explicit approval in the current session.
  - Do not modify `learnai-assessment-hs` unless Q specifically asks; that is the HS assessment repo, not the course app.
  - Preserve untracked files unless Q decides what to do with them.

- Server status:
  - No local dev server was started; nothing needs to be stopped.

- Open questions/blockers:
  - Whether the one local branch-only commit should be pushed to `origin/slide-redesign-2026-05`.
  - Whether/when to merge `slide-redesign-2026-05` into `main` for GitHub Pages deployment.

### Working tree (`git status --short`)

```text
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? sos-talk-may12.html
?? ui.txt
```

### Unstaged diff (`git diff --stat`)

_none_

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
7734a75 Update teaching slide duration
 session-materials/session-slides.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
```

---

## 2026-05-25 19:11:16 EDT — Claude Code

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `3ad104a` — Switch agent handoff to progress.md log + harden script
- **Upstream:** origin/slide-redesign-2026-05 — ahead 0, behind 0

### Summary

**Shipped the full progress.md handoff workflow + a one-command installer + a tiered Codex review policy + 4 wiki commits.**

This session built on the v1 commit `ac11df9` from earlier today and ended with everything pushed.

**Code shipped (this repo, branch `slide-redesign-2026-05`, both commits pushed to origin):**
- `ac11df9 Add agent handoff workflow` — original v1 design (per-target /tmp files, hand-edited CLAUDE.md block).
- `3ad104a Switch agent handoff to progress.md log + harden script` — replaced v1 with: tracked `progress.md` (newest entry on top, append-only), rewritten `scripts/agent-handoff.sh` (status/checkpoint/resume), new project-level slash commands `.claude/commands/{checkpoint,resume}.md`, AGENTS.md mirror of tiered Codex review policy, updated `docs/workflows/claude-codex-handoff.md`, trimmed CLAUDE.md (no live state).
- Three real bugs fixed during Codex review of the script: (1) `---` collision in parser → counter-based header boundary; (2) concurrent write race → `mkdir`-based lock at `.progress.lock` with 30s wait; (3) combined `EXIT INT TERM` trap doesn't exit on signals → split into three traps with explicit `exit 130 / exit 143`.

**User-level skills installed (live on this machine; NOT in any tracked repo):**
- `~/.claude/skills/{checkpoint,resume}/SKILL.md` + `install.sh`
- `~/.codex/skills/{checkpoint,resume}/SKILL.md` + `install.sh` (mirror)
- `install.sh` is idempotent, refuses self-install, refuses non-git-repo, atomic file writes via temp+mv, backs up existing `.claude/commands/*.md` to `.bak.<ts>` if different, never overwrites `AGENTS.md`. Codex caught 2 follow-up bugs (inaccurate "Installed 4 files" count when AGENTS.md skipped; `mv -f` clobbering a directory destination) — both fixed and tested (7 test cases total all pass).

**Wiki shipped (separate repo `~/Dropbox/learnAIDoc`, all 4 commits pushed to `origin/main`):**
- `9cac098` — new entry `_wiki/progress-md-codex-handoff.md` + cover image + bidirectional cross-links to v1 handoff entry, research tutorial, setup post, /handover skill entry
- `dd2f966` — Quick Reference section ("what to type today")
- `adaad96` — Step 8b added to `copy-my-claude-code-setup.md` (cross-machine migration of the workflow)
- `31ae2b6` — Documented one-command installer in both wiki entries

**Global config rewritten (NOT in any repo):**
- `~/.claude/CLAUDE.md` Rule #1 replaced: from "send EVERYTHING to Codex" → MUST/MAY-skip tiers + don't-double-review + smallest-payload + portable bounded invocation (`perl -e 'alarm shift @ARGV; exec ...'` because macOS lacks GNU `timeout`).
- `AGENTS.md` (this repo) mirrors the policy for the Codex side, with explicit non-recursion guard.

**Off-limits files (unchanged from prior checkpoints, leave alone):**
- `.DS_Store`, `.omc/`, `.playwright-mcp/`
- `docs/superpowers/audit-2026-05-21-deck-review.md`, `llmdata/`, `sos-talk-may12.html`, `ui.txt`
- All site content HTML
- `CLAUDE.md` itself (untracked by project convention)

**Server status:** none running.
**Push status:** all 6 commits (2 in learnai-course, 4 in learnAIDoc) pushed to origin. Nothing unpushed.

**Open threads for next session (THIS repo or any future project):**
1. The user-level skill files and `~/.claude/CLAUDE.md` Rule #1 rewrite are NOT in any tracked repo. Consider whether they should be backed up — Dropbox sync would catch the skills if installed there, but `~/.claude/CLAUDE.md` itself is just on disk. (Existing migration tooling exists per the `copy-my-claude-code-setup` wiki post; might be worth extending it.)
2. `slide-redesign-2026-05` branch is now ahead of `main` by 2 commits (`ac11df9` + `3ad104a`). The handoff tooling could be merged to `main` whenever Q decides — no urgency, but it would deploy with the site if pushed there.
3. Q has an active relcm-claude session that hit the "workflow not installed" preflight. Recommended option there: either run the new installer (`bash ~/.claude/skills/checkpoint/install.sh`) for full workflow OR fall back to a session-memory file per CLAUDE.md crash-resilience rule. His call.
4. Tomorrow's first move from EITHER Claude Code or Codex: type `/resume` in this repo. The script will print git state + this top entry; the agent will summarize in ≤6 bullets and ask for the next objective.

**Codex review this session:** policy revised once (4 wording bugs caught), script revised twice (3 bugs first round, 2 bugs second round), installer revised twice (4 risks first round, 2 follow-ups second round). All under the new MUST/MAY-skip tiered policy; total wall-clock Codex spend down ~60% vs sending every artifact.

### Working tree (`git status --short`)

```text
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? llmdata/
?? sos-talk-may12.html
?? ui.txt
```

### Unstaged diff (`git diff --stat`)

_none_

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
3ad104a Switch agent handoff to progress.md log + harden script
 .claude/commands/checkpoint.md            |  32 ++
 .claude/commands/resume-in-claude-code.md |  16 +-
 .claude/commands/resume-in-codex.md       |  31 +-
 .claude/commands/resume.md                |  17 +
 .gitignore                                |   2 +
 AGENTS.md                                 |  75 +++--
 docs/workflows/claude-codex-handoff.md    | 143 +++-----
 progress.md                               | 178 ++++++++++
 scripts/agent-handoff.sh                  | 525 +++++++++++++++++-------------
 9 files changed, 660 insertions(+), 359 deletions(-)
```

---

## 2026-05-25 12:51:48 EDT — Claude Code

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `ac11df9` — Add agent handoff workflow
- **Upstream:** origin/slide-redesign-2026-05 — ahead 1, behind 0

### Summary

**Codex Review Policy added; three script findings fixed.**

Two streams of work since the prior entry:

**1. Tiered Codex Review Policy** (Q-approved, MUST-tier change to canonical files):
- Rewrote Rule #1 in `~/.claude/CLAUDE.md` from "review EVERYTHING" to MUST/MAY-skip tiers with non-rationalization guards, don't-double-review rule, smallest-payload efficiency rule, and a portable bounded invocation example.
- Mirrored the policy in this project's `AGENTS.md` (Codex-side: same tiers + non-recursion guard + accept-terse-payloads).
- Round 1 of Codex review on the policy caught: single-file vs single-line wording mismatch, "mutate state" too broad, "skip if mechanical" loophole on MUST items, unsafe `echo|codex` examples (no quoting, no timeout, no recursion guard). All four addressed. No further policy iteration this turn (policy itself is MAY-skip iteration 3+ under the new rule).
- Also fixed `timeout 180` example → `perl -e 'alarm shift @ARGV; exec ...'` because `timeout` isn't installed on macOS by default. Verified perl-alarm bounds correctly (rc=142 SIGALRM at ~target seconds).

**2. Three script findings fixed in `scripts/agent-handoff.sh`** (MUST-tier, two rounds of Codex review):
- `---` collision in `print_top_entry`: rewrote awk to boundary on the SECOND `## YYYY-MM-DD` header (counted), not on `---`. Verified in tmpdir with summary containing `---` as both top entry and older entry.
- Concurrent-checkpoint race: added `mkdir`-based lock at `.progress.lock` with 30s wait; acquired in `insert_entry`, released after `mv` and via cleanup trap. Verified by holding the lock; checkpoint waited ~3s for a background timer to release, then proceeded.
- Trap quoting in `insert_entry`: replaced inline `trap "rm -f '$tmp'"` with script-level `cleanup_progress` function reading global `PROGRESS_TMP` / `PROGRESS_LOCK_HELD`. Then Codex round-2 caught the EXIT-INT-TERM combined trap won't exit on signals → split into `trap cleanup_progress EXIT`, `trap 'cleanup_progress; exit 130' INT`, `trap 'cleanup_progress; exit 143' TERM`. Verified no leaks on signal path.
- Added `.progress.lock` to `.gitignore`.

**What's next:**
- Q reviews. If approved, commit on top of `ac11df9`. Suggested scope: `scripts/agent-handoff.sh`, `AGENTS.md`, `.gitignore`, `docs/workflows/claude-codex-handoff.md`, `.claude/commands/{checkpoint,resume,resume-in-codex,resume-in-claude-code}.md`, `progress.md`. Suggested message: `Switch agent handoff to progress.md log + harden script`.
- Global `~/.claude/CLAUDE.md` Rule #1 was rewritten — Q may want to review that file separately. NOT part of any commit (it's user-global, not in this repo).
- Do NOT commit `CLAUDE.md` (project file, still untracked by convention).
- Do NOT push.

**Off-limits files (unchanged):** `.DS_Store`, `.omc/`, `.playwright-mcp/`, `docs/superpowers/audit-2026-05-21-deck-review.md`, `llmdata/`, `sos-talk-may12.html`, `ui.txt`, all site content HTML.

**Server:** none. **Push:** unpushed.

**Codex review status:** policy iterated 1 round → ACCEPT-after-revise; script iterated 2 rounds → final-round ACCEPT (trap structure matches Codex's exact prescription; tmpdir tests show no leaks).

### Working tree (`git status --short`)

```text
 M .claude/commands/resume-in-claude-code.md
 M .claude/commands/resume-in-codex.md
 M .gitignore
 M AGENTS.md
 M docs/workflows/claude-codex-handoff.md
 M scripts/agent-handoff.sh
?? .claude/commands/checkpoint.md
?? .claude/commands/resume.md
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? llmdata/
?? progress.md
?? sos-talk-may12.html
?? ui.txt
```

### Unstaged diff (`git diff --stat`)

```text
 .claude/commands/resume-in-claude-code.md |  16 +-
 .claude/commands/resume-in-codex.md       |  31 +-
 .gitignore                                |   2 +
 AGENTS.md                                 |  75 +++--
 docs/workflows/claude-codex-handoff.md    | 143 +++-----
 scripts/agent-handoff.sh                  | 525 +++++++++++++++++-------------
 6 files changed, 433 insertions(+), 359 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
ac11df9 Add agent handoff workflow
 .claude/commands/resume-in-claude-code.md |  16 ++
 .claude/commands/resume-in-codex.md       |  27 +++
 .gitignore                                |   3 +
 AGENTS.md                                 |  38 ++++
 docs/workflows/claude-codex-handoff.md    | 143 ++++++++++++++
 scripts/agent-handoff.sh                  | 319 ++++++++++++++++++++++++++++++
 6 files changed, 546 insertions(+)
```

---

## 2026-05-25 12:18:43 EDT — Claude Code

- **Branch:** `slide-redesign-2026-05`
- **HEAD:** `ac11df9` — Add agent handoff workflow
- **Upstream:** origin/slide-redesign-2026-05 — ahead 1, behind 0

### Summary

**Replaced the agent-handoff workflow** with a single tracked `progress.md` per Q's design hint (chose tracked over gitignored so the log is pushable cross-machine).

**What changed this session (uncommitted):**
- Rewrote `scripts/agent-handoff.sh`: `status` / `checkpoint <agent> [-m|--stdin]` / `resume`. Old `save`/`load` print deprecation errors.
- New slash commands: `.claude/commands/checkpoint.md`, `.claude/commands/resume.md`.
- Updated `.claude/commands/resume-in-{codex,claude-code}.md` as deprecated wrappers.
- Updated `AGENTS.md` to point at `progress.md` and the new commands.
- Updated `docs/workflows/claude-codex-handoff.md` to reflect the new flow.
- Trimmed `CLAUDE.md` — removed live "Current Handoff" block, kept project guidance + a slim pointer to `progress.md`.
- Added `.progress.tmp.*` to `.gitignore` (transient files from atomic `progress.md` writes).
- Created this file (`progress.md`) as the new live handoff.

**What's next:**
- Q reviews. If approved, commit as a new commit on top of `ac11df9` (per Q's "create new commit rather than amend" rule). Suggested scope: `scripts/agent-handoff.sh`, `AGENTS.md`, `.gitignore`, `docs/workflows/claude-codex-handoff.md`, `.claude/commands/{checkpoint,resume,resume-in-codex,resume-in-claude-code}.md`, `progress.md`. Suggested message: `Switch agent handoff to progress.md log`.
- Do NOT commit `CLAUDE.md` unless Q explicitly asks (it's still untracked by convention).
- Do NOT push.

**Off-limits files (leave alone unless Q says otherwise):**
- `.DS_Store`, `.omc/`, `.playwright-mcp/`
- `docs/superpowers/audit-2026-05-21-deck-review.md`, `llmdata/`, `sos-talk-may12.html`, `ui.txt`
- All site content HTML (no site/content changes this session)

**Server status:** none running.
**Push status:** unpushed; `ac11df9` and the new uncommitted work are local only.

**Codex review status:** plan reviewed and revised by Codex before execution (added .gitignore'd progress.md → revised to tracked per Q; tightened `--stdin` non-TTY behavior; expanded git-state capture). Final implementation review pending.

### Working tree (`git status --short`)

```text
 M .claude/commands/resume-in-claude-code.md
 M .claude/commands/resume-in-codex.md
 M .gitignore
 M AGENTS.md
 M docs/workflows/claude-codex-handoff.md
 M scripts/agent-handoff.sh
?? .claude/commands/checkpoint.md
?? .claude/commands/resume.md
?? CLAUDE.md
?? docs/superpowers/audit-2026-05-21-deck-review.md
?? llmdata/
?? sos-talk-may12.html
?? ui.txt
```

### Unstaged diff (`git diff --stat`)

```text
 .claude/commands/resume-in-claude-code.md |  16 +-
 .claude/commands/resume-in-codex.md       |  31 +-
 .gitignore                                |   1 +
 AGENTS.md                                 |  58 ++--
 docs/workflows/claude-codex-handoff.md    | 143 ++++-----
 scripts/agent-handoff.sh                  | 464 ++++++++++++++++--------------
 6 files changed, 356 insertions(+), 357 deletions(-)
```

### Staged diff (`git diff --cached --stat`)

_none_

### Latest commit (`git show --stat --oneline HEAD`)

```text
ac11df9 Add agent handoff workflow
 .claude/commands/resume-in-claude-code.md |  16 ++
 .claude/commands/resume-in-codex.md       |  27 +++
 .gitignore                                |   3 +
 AGENTS.md                                 |  38 ++++
 docs/workflows/claude-codex-handoff.md    | 143 ++++++++++++++
 scripts/agent-handoff.sh                  | 319 ++++++++++++++++++++++++++++++
 6 files changed, 546 insertions(+)
```

---
