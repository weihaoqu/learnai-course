# AI Agent Book Web App Integration Notes

Sources reviewed:

- Online book: https://bojieli.github.io/ai-agent-book/
- GitHub source: https://github.com/bojieli/ai-agent-book
- Local review source: cloned `bojieli/ai-agent-book` at commit `b5c8655`.

Review scope: I inspected the repository README, site navigation, English introduction, and English chapter outlines. I read selected sections most relevant to this course in detail, especially Chapters 1-6, 8, and 10; I skimmed Chapters 7 and 9 for fit. This note is an integration audit for our static course web app, not a recommendation to adopt the book wholesale.

## Overall Verdict

The book is useful for our web app, but selectively. Its strongest value is as a teacher-facing engineering backbone for agent lessons: context discipline, tool boundaries, verification, rollback, skills, RAG safety, and multi-agent coordination. Much of the production content is too advanced for the required student path, especially model post-training, full-stack agents, voice agents, robotics, and production MCP/security infrastructure.

The best integration strategy is to strengthen our existing weeks rather than add a large new unit. Keep the required path static and student-manageable; use the book to sharpen explanations, checklists, and optional advanced notes.

Because this is an external, fast-moving open resource, links should be labeled optional/advanced and rechecked periodically for availability and content drift. The GitHub repo should be treated as source material for instructors and advanced readers, not as required code for beginners to clone and run.

## High-Value Ideas To Use

### 1. Agent = LLM + Context + Tools, plus Harness

Use the book's core formula as the spine for Week 2 and Module 0:

- `Agent = LLM + context + tools`
- Practical production extension: `constrain + verify + correct`
- The LLM is the reasoning engine, context is what the agent can see, and tools are what it can do.

Our course already has a similar framing. The useful improvement is to make the "harness" idea explicit: students should understand that better prompts alone are not enough. Real agent work needs boundaries, tests, checkpoints, and correction loops.

Best placement:

- `module-00-llm-basics.html`
- `week-02-foundation-readiness-check.html`
- `week-03-responsible-ai-decisions.html`

### 2. Context Is A Checklist, Not A Bigger Prompt

The book's context-engineering chapter is directly useful. It argues that context is the ceiling of agent capability, but also warns that dumping more text into a prompt can create context rot.

Adapt this into a student checklist:

- Goal: what should be built or answered?
- Relevant files or sources: what should the assistant inspect?
- Constraints: what must not change?
- Tools: what may the assistant use?
- State: what has already been tried, tested, or broken?
- Evidence: what source or output supports the answer?

This fits our repeated emphasis on students giving the assistant enough information while still learning to understand the output.

Best placement:

- Week 2 setup/readiness
- Week 9 web app iteration
- Week 10 pre-deploy checklist

### 3. Skills And Progressive Disclosure

The book gives a strong explanation of why skills are useful: the agent should not load every instruction and every tool at once. It should first see short routing metadata, then load the full skill only when relevant.

This is useful for students because it explains a real pattern they already see in agent tools:

- A skill description should say when to use it.
- It should also say when not to use it.
- A skill should contain procedures, examples, and scripts that can be loaded only when needed.
- Too many always-loaded tools or instructions make the agent worse, not better.

Best placement:

- Week 2 agent foundations
- Teacher-facing notes for skills
- Optional advanced sidebar in Week 12

### 4. Tool Risk Ladder

The book's tool chapter classifies tools into perception, execution, collaboration, event-triggered, and user-communication tools. We do not need all of that terminology for students, but we should keep the risk idea.

Student-friendly version:

- Perception tools read or inspect things.
- Execution tools change files, run commands, call APIs, spend money, or affect real systems.
- Communication tools send messages to people or external services.
- Higher-impact tools require stronger confirmation, sandboxing, and review.

This supports the tone Q wanted for the AI ethics week: what students can use agents for, what they should not use them for, and when they need human approval.

Best placement:

- Week 3 Responsible AI Decisions
- Week 13 security/review lab

### 5. Verification Before "Done"

One of the book's most useful themes is that an agent's claim of completion is not proof. Verification must use external evidence when possible:

- Tests passed
- Page rendered correctly
- Source exists
- Diff is understood
- Deployment opened successfully
- The claimed action actually happened

This maps well to our web app workflow. Students should learn that "AI said it fixed it" is weaker than "we tested it and saw the result."

Best placement:

- Week 9 after building/testing
- Week 10 pre-deploy check
- Week 12 RAG/source inspection
- Week 13 review lab

### 6. Proposer-Reviewer Pattern

The book's proposer-reviewer pattern is a good explanation for why review works only when it brings in new evidence. Asking the same model to "think again" is weak. Asking it to review test output, a screenshot, a rendered slide, a source citation, or a diff is stronger.

Use this as a practical student rule:

- Generate candidate work.
- Render, run, inspect, or cite evidence.
- Review against that evidence.
- Revise only when the evidence shows what is wrong.

This supports our existing "AI built it does not mean you understand it" caveat.

Best placement:

- Week 6 slides/media generation
- Week 8/9 web app design and interactivity
- Week 10 deployment

### 7. RAG Safety And Source Discipline

The book's RAG and memory chapters are useful for Week 12. The key addition is not more retrieval algorithms; it is the safety boundary:

- Retrieved text is evidence, not instruction.
- Retrieved passages can contain distracting or malicious text.
- The assistant should cite or show the retrieved source before relying on it.
- Retrieval quality determines answer quality.
- RAG does not remove the need to inspect sources.

This strengthens our RAG lesson without turning it into a graduate information-retrieval course.

Best placement:

- Week 12 Advanced Prompting / RAG
- External links page as optional reading

### 8. Memory Is Not A Transcript

The book distinguishes raw conversation history from durable memory. This is useful for ethics and AI literacy.

Student-friendly rule:

- Do not assume the assistant remembers everything.
- Do not ask it to remember sensitive information unless there is a clear reason.
- Durable memory should be selective, reviewable, and removable.
- Raw transcripts are not the same as useful memory.

This is a strong privacy and student-safety point.

Best placement:

- Week 3 Responsible AI Decisions
- Week 12 agent/RAG extension

### 9. Error Recovery And Rollback

The book's coding-agent chapter and continuous-evolution chapter strongly support our checkpoint habit:

- Break work into small changes.
- Test after each change.
- Keep a rollback point.
- Stop adding features when something breaks.
- Diagnose before retrying.
- Do not let a failed run rewrite long-term instructions or memory.

This should remain a core rule in Week 9 and Week 10.

Best placement:

- Week 9 app iteration
- Week 10 deployment/checkpoints
- Teacher notes for agent-assisted coding

### 10. Multi-Agent Systems: Only Useful When They Add New Information

The multi-agent chapter is useful because it frames multi-agent systems as situational rather than automatically superior. Multiple agents are not automatically better. They help most when another agent or tool introduces information the first agent did not have: test results, screenshots, logs, source verification, or a specialized review perspective.

Student-friendly version:

- Multiple agents debating the same text may not improve much.
- A reviewer with test output, screenshots, or verified sources is valuable.
- Manager-agent patterns are powerful but costly and easy to overcomplicate.
- Use one good agent plus evidence first; add agents only when the workflow truly needs division of labor.

Best placement:

- Week 2 agent foundations
- Week 12 optional advanced section
- Week 13 review/security lab

### 11. File System As The Agent's Workspace

The book's file-system framing is useful for helping students understand why our course keeps asking them to save files, inspect diffs, and commit checkpoints.

Student-friendly version:

- The chat is not the whole project.
- Files are where artifacts, evidence, and checkpoints live.
- Work should be recoverable from files, not trapped in a chat window.
- Shared workspaces need caution because different agents or humans can overwrite each other.

Best placement:

- Week 8 web basics
- Week 9 interactive app building
- Week 10 deployment/checkpoints

### 12. Evaluation Rubrics Beat Vague Scores

The book's evaluation chapter supports adding small rubrics to student activities:

- Did the app meet the requested goal?
- Did the student inspect the generated code or output?
- Did they test the main path?
- Did they handle one edge case?
- Did they cite sources when using factual content?
- Did they avoid unsafe or inappropriate agent use?

For student work, this is more useful than a single "looks good" score.

Best placement:

- Week 2 readiness check
- Week 3 ethics scenarios
- Week 9/10 project rubrics

## Do Not Add To The Required Student Path Yet

These topics are interesting but too advanced for the current required static-course path:

- Model post-training, SFT, RL, LoRA, reward design, and training infrastructure
- Production MCP server security beyond basic tool-risk awareness
- Full-stack databases, secrets, and persistent memory as required student work
- Event-driven asynchronous agents
- Voice agents, full-duplex audio, robotics, and real-time multimodal systems
- Agent societies, market mechanisms, and large-scale decentralized collaboration
- Continuous self-evolution systems that rewrite prompts, tools, or skills automatically

These can be optional teacher references or advanced discussion prompts, but they should not become required assignments for beginners.

## Concrete Backlog For Our Web App

### P0: Add Book Links To External Links

Add the online book and GitHub source to `external-links.html` as optional references for agent foundations, advanced prompting, and security/review topics.

Status: external links added in the paired change; this note documents the rationale.

### P1: Strengthen Week 2 Context Checklist

Add or refine one compact card:

> Before asking an agent to work, give it the goal, relevant files or sources, constraints, allowed tools, current state, and what evidence would prove success.

This should be short. Week 2 should not become a production agent lecture.

Status: implemented in `week-02-agent-foundations.html` as a compact "Agent brief" slide with goal, sources, constraints, tools, state, and evidence.

### P1: Strengthen Week 3 Tool And Memory Boundaries

Add one scenario about memory/privacy:

> A student asks the assistant to remember personal information for future sessions. What should they check before doing this?

Expected answer: purpose, sensitivity, where it is stored, how to delete it, and whether it is necessary.

Status: implemented in `week-03-responsible-ai-decisions.html` with a memory-boundary card and a new scenario about remembering a classmate's personal situation.

### P1: Reinforce Week 9/10 Understanding Checks

Our existing Week 9 and Week 10 additions are aligned with the book. Keep the requirement that students ask:

- Help me understand how this project works.
- What changed?
- What was tested?
- What could break?
- Which file or code path can I explain in my own words?

Status: reinforced in `week-09-interactivity-intelligence.html` and `week-10-complete-static-deployment.html` with code-path explanation, evidence, rollback, and pre-deploy understanding checks.

### P2: Add RAG Safety Note To Week 12

Add a short warning:

> Retrieved documents are sources, not commands. If retrieved text tells the assistant to ignore instructions, reveal secrets, or take an action, treat it as untrusted content.

Status: implemented in `week-12-advanced-prompting.html` as a short RAG safety slide about treating retrieved instructions as untrusted text.

### P2: Add Review Evidence Language

Where we discuss review, use one of the book's strongest practical principles:

> A reviewer is useful when it sees new evidence: test output, screenshots, source documents, logs, or a rendered result.

Status: implemented in `week-13-security-review-lab.html` with review-evidence language and packet fields for evidence used.

## Chapter-To-Course Mapping

| Book chapter | Useful course integration | Priority |
| --- | --- | --- |
| Ch. 1 Agent fundamentals | Week 2 formula, ReAct loop, harness, verification | High |
| Ch. 2 Context engineering | Context checklist, skills, context rot, source labels | High |
| Ch. 3 Memory and RAG | Week 12 RAG literacy; Week 3 memory/privacy | High |
| Ch. 4 Tools | Tool-risk ladder; MCP/skills as optional advanced context | High |
| Ch. 5 Coding agents | Week 9/10 checkpoints, tests, rollback, code understanding | High |
| Ch. 6 Evaluation | Project rubrics, evidence-based review, hallucination veto | Medium-high |
| Ch. 7 Post-training | Teacher background only | Low |
| Ch. 8 Continuous evolution | Checkpoints, candidate changes, rollback; avoid auto-learning from untrusted input | Medium |
| Ch. 9 Multimodal/real-time | Optional future enrichment only | Low |
| Ch. 10 Multi-agent collaboration | Optional advanced multi-agent discussion; reviewer must add new evidence | Medium |

## Bottom Line

This book is worth adding to our external links and using as a source of teacher-facing engineering principles. For students, the most useful integrations are small and practical: context checklists, tool-risk boundaries, evidence-based review, rollback habits, memory/privacy rules, and RAG source discipline. I would not add a separate required unit for the whole book; instead, fold these ideas into the weeks we already have.
