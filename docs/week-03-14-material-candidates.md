# Week 3-14 Online Material Candidates

Research date: 2026-07-29
Purpose: candidate online materials for Q to review before we integrate them into the LearnAI web app.
Status: draft research list only. No hub/deck integration has been done from this file yet.

## Verification Notes

- Basic Markdown checks passed: ASCII-only text, no trailing-whitespace diff errors.
- Lightweight link check returned HTTP 200 for most external URLs.
- UNESCO and Adobe pages were visible through browser/web search results but reset or timed out during command-line link checks. Treat them as valid candidates, but recheck in a normal browser before assigning.
- Microsoft 365 Copilot Prompts Gallery returned HTTP 405 to a HEAD request in the concise link check but was reachable in the earlier browser-style check.
- Canva returned a Cloudflare 403 challenge to command-line link checks. Keep it optional unless Q verifies normal browser access.
- Skilljar course pages returned HTTP 200 in link checks, but completion proof still needs a student-account test.

## Approval Legend

- Core teaching candidate: likely worth using in class or in slides.
- Homework candidate: likely suitable for students to complete, read, or watch outside class.
- Instructor reference: useful for building our content, but probably too long, technical, legal, or login-dependent for direct student assignment.
- Optional enrichment: useful for interested students or extra-credit paths.
- Use carefully: good source, but needs framing, access check, or selective extraction.

## High-Level Fit

The strongest source pattern is:

1. Use standards and university guidance for Week 3 responsible use.
2. Use official Microsoft, Anthropic, OpenAI, MDN, GitHub, OWASP, and Google resources for tool and web-development weeks.
3. Use already approved Andrew Ng / DeepLearningAI videos for Week 8 and Week 12 homework.
4. Keep Week 7 and Week 14 mostly course-internal, with external materials used only for assessment framing, peer feedback, and reflection.

## Reuse Policy

Some sources repeat across weeks on purpose:

- Stanford AI Literacy is a broad framing source for ethics, assessment, and research/career reflection.
- Purdue AI citation guidance is a practical reference for any week where students submit AI-assisted writing or research.
- Google PAIR is a design lens for deciding whether AI adds value, not a technical web tutorial.
- Microsoft prompt guidance is a transferable office-work prompt pattern, but it should not make the course Microsoft-specific.
- Anthropic Skilljar courses should be required only after student-account access and completion proof are confirmed.

## Week 3: Ethics, Privacy, Copyright, Bias, and Plagiarism

### 1. NIST AI Risk Management Framework

- Link: https://www.nist.gov/itl/ai-risk-management-framework
- Proposed use: Core teaching candidate.
- Brief discussion: Strong source for turning "AI ethics" into a concrete risk-management mindset. In class, we can simplify NIST's trustworthiness/risk language into a student activity: identify harms, affected people, evidence needed, and human safeguards.
- Fit: Excellent for privacy, bias, reliability, and risk discussion.
- Caveat: Too formal for direct student reading unless heavily excerpted.
- Q decision: [ y] use [ ] optional [ ] skip

### 2. UNESCO AI Competency Frameworks for Students and Teachers

- Link: https://www.unesco.org/en/articles/what-you-need-know-about-unescos-new-ai-competency-frameworks-students-and-teachers
- Proposed use: Core teaching candidate or instructor reference.
- Brief discussion: Useful for framing AI literacy around human agency, ethics, AI applications, and system design. This matches the course's move from "using tools" to "responsible co-creation."
- Fit: Good conceptual opening for Week 3.
- Caveat: Use selected ideas only. The full UNESCO framework is broad and policy-oriented.
- Q decision: [ ] use [ ] optional [ y] skip

### 3. U.S. Copyright Office: Copyright and Artificial Intelligence

- Link: https://www.copyright.gov/ai/
- Proposed use: Core teaching candidate, with simplified scenarios.
- Brief discussion: Official source hub for U.S. Copyright Office AI reports. Good for a "Can I use this image/text/code?" decision exercise.
- Fit: Strong for copyright and authorship.
- Caveat: Legal material must be framed as literacy, not legal advice.
- Direct report links:
  - Part 2, copyrightability: https://www.copyright.gov/ai/Copyright-and-Artificial-Intelligence-Part-2-Copyrightability-Report.pdf
  - Part 3, generative AI training, pre-publication: https://www.copyright.gov/ai/Copyright-and-Artificial-Intelligence-Part-3-Generative-AI-Training-Report-Pre-Publication-Version.pdf
- Q decision: [y ] use [ ] optional [ ] skip

### 4. Cornell Center for Teaching Innovation: AI and Academic Integrity

- Link: https://teaching.cornell.edu/generative-artificial-intelligence/ai-academic-integrity
- Proposed use: Core teaching candidate.
- Brief discussion: Practical source for classroom policy, disclosure, and why AI detectors should not be treated as definitive evidence. This is valuable for building a balanced Week 3 message: responsible AI use is not "trust detectors" or "ban everything."
- Fit: Excellent for plagiarism, disclosure, academic integrity, and fairness.
- Caveat: Institution-specific language should be adapted to our course policy.
- Q decision: [y ] use [ ] optional [ ] skip

### 5. Vanderbilt: Academic Integrity and Generative AI

- Link: https://www.vanderbilt.edu/generative-ai/academic-integrity/
- Proposed use: Instructor reference.
- Brief discussion: Useful checklist-style questions for designing class policy: what uses are allowed, how students disclose AI use, what counts as misconduct, and how assignment-specific rules differ.
- Fit: Good for drafting Week 3 discussion prompts and assignment policy language.
- Caveat: We should not copy a university policy. Use as structure only.
- Q decision: [ y] use [ ] optional [ ] skip

### 6. Stanford Teaching Commons: Understanding AI Literacy

- Link: https://teachingcommons.stanford.edu/teaching-guides/artificial-intelligence-teaching-guide/understanding-ai-literacy
- Proposed use: Instructor reference or optional enrichment.
- Brief discussion: Offers a four-domain AI literacy model: functional, ethical, rhetorical, and pedagogical. It can help us make Week 3 feel connected to Week 1-2 instead of a separate ethics lecture.
- Fit: Good bridge source.
- Caveat: Teacher-facing, not student-facing by default.
- Q decision: [y ] use [ ] optional [ ] skip

## Week 4: AI for Professional Writing and Word Documents

### 1. LearnAI Wiki: Claude for Word Office Integration

- Link: https://weihaoqu.github.io/learnAIDoc/wiki/claude-for-word-office-integration/
- Proposed use: Demo-first core teaching candidate, after Q review.
- Brief discussion: This is already prepared in Q's knowledge base and fits the week well: Word, tracked changes, reviewable edits, document workflow, and agentic office work. It can become the anchor case for "AI edits must stay reviewable."
- Fit: Very strong for Week 4.
- Caveat: Some market-impact claims and version-specific details should be treated as instructor notes, not required student facts, unless rechecked close to class.
- Q decision: [y ] use [ ] optional [ ] skip

### 2. Anthropic Help Center: Use Claude for Word

- Link: https://support.claude.com/en/articles/14465370-use-claude-for-word
- Proposed use: Demo-first core teaching candidate until student access is confirmed.
- Brief discussion: Official source for Claude for Word capabilities, tracked changes, limitations, data handling, human review, and prompt-injection risks in documents.
- Fit: Excellent for demonstrating the difference between "AI draft" and "reviewable document workflow."
- Caveat: It is beta and plan-dependent. Confirm student access before assigning setup.
- Q decision: [y ] use [ ] optional [ ] skip

### 3. Microsoft Support: Welcome to Copilot in Word

- Link: https://support.microsoft.com/en-us/word/welcome-to-copilot-in-word
- Proposed use: Demo-first comparison material until student access is confirmed.
- Brief discussion: Official Microsoft source for drafting, rewriting, summarizing, and document collaboration in Word. Good for comparing Copilot-in-Word with Claude-for-Word as two office-agent patterns.
- Fit: Strong if students have Microsoft 365 access.
- Caveat: License and campus account availability matter.
- Q decision: [ ] use [ y] optional [ ] skip

### 4. Microsoft Support: Get Started Writing Prompts in Microsoft 365 Copilot

- Link: https://support.microsoft.com/en-us/microsoft-365-copilot/get-started-writing-prompts-in-microsoft-365-copilot
- Proposed use: Short in-class prompt template; homework only if access is smooth.
- Brief discussion: The goal, context, expectations, and source pattern maps nicely to our prompt-contract approach. It can be reused in Word, Excel, PowerPoint, and Outlook weeks.
- Fit: Strong cross-week prompt structure.
- Caveat: Copilot-specific examples should be generalized for students using Claude or ChatGPT.
- Q decision: [ ] use [y ] optional [ ] skip

### 5. Purdue Libraries: How to Cite AI-Generated Content

- Link: https://guides.lib.purdue.edu/c.php?g=1371380&p=10135074
- Proposed use: Homework candidate or Week 3/4 bridge.
- Brief discussion: One practical academic-library guide for citing AI-generated content. Useful when students use AI in writing assignments. Students can submit a short AI-use disclosure and citation note with a revised document.
- Fit: Good for academic writing and transparency.
- Caveat: Citation norms are not universal. Align final student requirements to Q's course policy and recheck before final syllabus release.
- Q decision: [ y] use [ ] optional [ ] skip

### 6. Tool-Neutral Fallback: Reviewable Writing Workflow

- Link: https://support.microsoft.com/en-us/microsoft-365-copilot/get-started-writing-prompts-in-microsoft-365-copilot
- Proposed use: Core teaching activity, built by us.
- Brief discussion: If students do not have Claude for Word or Copilot in Word, we can still teach the workflow with a sample document, a normal AI chat tool, and manual tracked changes or comments. The learning target is not "use one paid add-in"; it is "make AI assistance reviewable."
- Fit: Strong fallback for Week 4.
- Caveat: We need to provide the sample document and submission format.
- Q decision: [ y] use [ ] optional [ ] skip

## Week 5: AI for Data, Excel, and Administrative Workflows

### 1. Microsoft Support: Get Started with Copilot in Excel

- Link: https://support.microsoft.com/en-us/excel/copilot/get-started-with-copilot-in-excel
- Proposed use: Demo-first core teaching candidate until student access is confirmed.
- Brief discussion: Official source for workbook editing, formulas, charts, PivotTables, chat, plan mode, and review-before-editing workflows. It directly supports an "inspect, plan, then edit" lesson for spreadsheets.
- Fit: Very strong for Week 5.
- Caveat: Requires appropriate Microsoft access. We should offer non-Copilot alternatives if students lack access.
- Q decision: [ y] use [ ] optional [ ] skip

### 2. Microsoft Support: Get Data Insights with Copilot in Excel

- Link: https://support.microsoft.com/en-us/excel/copilot/data-insights-with-copilot-in-excel
- Proposed use: Demo-first core teaching candidate until student access is confirmed.
- Brief discussion: Good for a lab where students ask natural-language questions about a small dataset, then verify formulas, charts, and summary rows manually.
- Fit: Strong for data interpretation and verification.
- Caveat: Use a clean, non-private dataset.
- Q decision: [ y] use [ ] optional [ ] skip

### 3. Microsoft Support: Analyze Data in Excel

- Link: https://support.microsoft.com/en-us/excel/analyze-data-in-excel
- Proposed use: Core teaching candidate.
- Brief discussion: Useful baseline because it is a more traditional Excel analysis feature. Students can compare "Excel built-in insight" versus "LLM-generated explanation" and ask which one is easier to verify.
- Fit: Good for avoiding over-reliance on generative AI.
- Caveat: Interface may differ by Excel version.
- Q decision: [ y] use [ ] optional [ ] skip

### 4. Microsoft Learn: Craft Effective Prompts for Microsoft 365 Copilot

- Link: https://learn.microsoft.com/en-us/training/paths/craft-effective-prompts-copilot-microsoft-365/
- Proposed use: Optional enrichment or homework for students with Microsoft accounts.
- Brief discussion: Covers real-world scenarios across Word, Excel, PowerPoint, Teams, Outlook, and OneNote. It could serve as an optional certificate-style activity if access is smooth.
- Fit: Good office productivity extension.
- Caveat: Microsoft login/access may make it too heavy for required homework.
- Q decision: [ y] use [ ] optional [ ] skip

### 5. Microsoft 365 Copilot Prompts Gallery

- Link: https://m365.cloud.microsoft/copilot-prompts
- Proposed use: Optional enrichment.
- Brief discussion: Useful as a prompt idea bank for administrative tasks, but it should not replace our own assignments. Students can critique prompts and rewrite them into safer, more specific versions.
- Fit: Good prompt-rewrite exercise.
- Caveat: Web page and access behavior may change frequently.
- Q decision: [y ] use [ ] optional [ ] skip

### 6. Tool-Neutral Fallback: Spreadsheet Verification Lab

- Link: https://support.microsoft.com/en-us/excel/analyze-data-in-excel
- Proposed use: Core teaching activity, built by us.
- Brief discussion: If Copilot in Excel is unavailable, students can use a provided CSV or spreadsheet, ask any approved AI chat tool for formula/chart suggestions, then manually build and verify the result in Excel, Google Sheets, or Numbers.
- Fit: Strong fallback for Week 5.
- Caveat: We need to provide the dataset and answer key.
- Q decision: [ y] use [ ] optional [ ] skip

## Week 6: AI-Powered Media Generation

### 1. Adobe Firefly: Writing Effective Text Prompts

- Link: https://helpx.adobe.com/firefly/web/work-with-images/generate-images/writing-effective-text-prompts.html
- Proposed use: Core teaching candidate.
- Brief discussion: Good low-code source for image prompt structure: specificity, style, iteration, and revision. It supports a classroom lab where students generate or plan a visual asset for a presentation.
- Fit: Strong for prompt-to-image practice.
- Caveat: Tool access and generative credits may vary.
- Q decision: [ ] use [ ] optional [ y] skip

### 2. OpenAI Cookbook: GPT Image Generation Models Prompting Guide

- Link: https://developers.openai.com/cookbook/examples/multimodal/image-gen-models-prompting-guide
- Proposed use: Instructor reference.
- Brief discussion: Strong technical and production-oriented reference for image prompting, style control, editing, layouts, and fidelity. Best used to build our own student-friendly examples rather than assigning the full page.
- Fit: Strong for instructor slide design.
- Caveat: Too technical and model-specific for most students.
- Q decision: [ y] use [ ] optional [ ] skip

### 3. OpenAI Developers: Image Generation

- Link: https://developers.openai.com/learn/imagegen
- Proposed use: Instructor reference or optional enrichment.
- Brief discussion: Central OpenAI developer landing page for image-generation guides and videos. Useful if we later build an advanced branch where students create image assets programmatically.
- Fit: Good future extension.
- Caveat: API-oriented, not necessary for the main Week 6 class.
- Q decision: [ y] use [ ] optional [ ] skip

### 4. C2PA: Verifying Media Content Sources

- Link: https://c2pa.org/
- Proposed use: Core teaching candidate.
- Brief discussion: Gives a concrete way to discuss provenance and authenticity. Week 6 should not only teach "make cool images"; it should also teach how to disclose, label, and inspect AI-generated media.
- Fit: Excellent ethics bridge from Week 3 to media generation.
- Caveat: The technical standard is too detailed for students. Use the basic concept and pair it with a student-facing verification tool.
- Q decision: [ y] use [ ] optional [ ] skip

### 5. Content Credentials: Verify Media Authenticity

- Link: https://contentcredentials.org/
- Proposed use: Core teaching candidate.
- Brief discussion: More student-facing than the C2PA standards page. Useful for a short activity where students inspect whether media carries content credentials and discuss what provenance can and cannot prove.
- Fit: Strong for media transparency.
- Caveat: Verification support depends on whether the sample media actually contains credentials.
- Q decision: [ y] use [ ] optional [ ] skip

### 6. Canva: How to Convert Text to Images with AI

- Link: https://www.canva.com/learn/how-to-convert-text-images-ai-magic/
- Proposed use: Optional enrichment.
- Brief discussion: Practical, student-friendly example of text-to-image use and disclosure concerns. Useful if Q wants a low-barrier tool option alongside Adobe or ChatGPT.
- Fit: Good for beginners and presentation graphics.
- Caveat: Commercial product page, account requirements, and tool availability may change.
- Q decision: [ ] use [ y] optional [ ] skip

## Week 7: Midterm Studio

Week 7 should use a course-created rubric/checklist as the core material. External materials below are for framing, remediation, or rubric design, not for replacing our own midterm.

### 1. Anthropic AI Fluency: Framework and Foundations

- Link: https://anthropic.skilljar.com/ai-fluency-framework-foundations
- Proposed use: Homework candidate before Week 3, then review material for Week 7.
- Brief discussion: Q already wanted this as required homework before Week 3. For Week 7, students can reuse the course vocabulary to explain what they did well or poorly in their foundation challenge.
- Fit: Good midterm reflection source.
- Caveat: Skilljar may require account setup. Verify student access and certificate behavior before making completion mandatory.
- Q decision: [ y] use [ ] optional [ ] skip

### 2. Anthropic AI Fluency for Students

- Link: https://anthropic.skilljar.com/ai-fluency-for-students
- Proposed use: Optional enrichment or make-up path.
- Brief discussion: More student-facing than the general foundations course. It may be a good option for students who need extra support before the midterm studio.
- Fit: Good remediation/enrichment path.
- Caveat: I could verify search metadata, but full Skilljar page access may require login. Check from a student account before requiring it.
- Q decision: [ y] use [ ] optional [ ] skip

### 3. Stanford Teaching Commons: Understanding AI Literacy

- Link: https://teachingcommons.stanford.edu/teaching-guides/artificial-intelligence-teaching-guide/understanding-ai-literacy
- Proposed use: Instructor reference.
- Brief discussion: Useful for mapping the midterm to functional, ethical, and rhetorical literacy rather than just tool completion.
- Fit: Good assessment framing.
- Caveat: Teacher-facing.
- Q decision: [y ] use [ ] optional [ ] skip

### 4. Day of AI Curriculum Resources

- Link: https://dayofai.org/curriculum-resources
- Proposed use: Optional enrichment.
- Brief discussion: Useful if we want short, approachable AI literacy and responsible-use activities. It is especially helpful if Q wants a lighter midterm review activity.
- Fit: Good for younger or mixed-background students.
- Caveat: Some content may feel K-12 oriented; select carefully.
- Q decision: [ ] use [ y] optional [ ] skip

### 5. Internal Course Materials

- Link: ../week-02-foundation-readiness-check.html
- Proposed use: Core teaching candidate.
- Brief discussion: The midterm studio should mostly assess our own Week 1-6 outcomes. The Week 2 readiness challenge is a strong pattern for a Week 7 foundation check: scenario decisions, trace labeling, safe tool use, and reflection.
- Fit: Very strong, but local rather than online.
- Caveat: Not an online source; included here because Week 7 should not be driven mainly by external materials.
- Q decision: [ y] use [ ] optional [ ] skip

### 6. NC State DELTA: Rubric Best Practices, Examples, and Templates

- Link: https://teaching-resources.delta.ncsu.edu/rubric_best-practices-examples-templates/
- Proposed use: Instructor reference.
- Brief discussion: Useful for writing a clear midterm rubric with criteria and performance levels, but the actual criteria should come from our Week 1-6 outcomes.
- Fit: Good assessment-design support.
- Caveat: We should create our own rubric instead of importing a generic one.
- Q decision: [y ] use [ ] optional [ ] skip

## Week 8: Web Basics and Design

### 1. Andrew Ng / DeepLearningAI App-Building Video

- Link: https://www.youtube.com/watch?v=ff3j4olCUig
- Proposed use: Homework candidate.
- Brief discussion: Current searched title: "Build Your Own App In Just 30 Minutes! Full Course with Andrew Ng." Q already approved this as an inspiring intro and offline homework. The learning outcome is to see a beginner-friendly idea-to-app flow, then use our Week 8 slides to scope the student's own app rather than copy the video.
- Fit: Already integrated in Week 8.
- Caveat: Keep as homework, not a full in-class video screening.
- Q decision: [y ] use [ ] optional [ ] skip

### 2. MDN: Getting Started Modules

- Link: https://developer.mozilla.org/en-US/docs/Learn_web_development/Getting_started
- Proposed use: Core teaching candidate or homework reference.
- Brief discussion: Strong beginner-friendly source for environment setup, first website, web standards, and basic workflow. Good support for students who need vocabulary for HTML, CSS, JavaScript, files, and browser behavior.
- Fit: Very strong for Week 8.
- Caveat: Students should not be assigned the entire MDN path at once.
- Q decision: [ y] use [ ] optional [ ] skip

### 3. web.dev: Learn HTML

- Link: https://web.dev/learn/html
- Proposed use: Optional enrichment.
- Brief discussion: Useful as a structured HTML reference for students who want more detail after the Week 8 app design studio.
- Fit: Good follow-up.
- Caveat: More reading than needed for a one-hour design-focused class.
- Q decision: [y ] use [ ] optional [ ] skip

### 4. Google PAIR Guidebook: People + AI Guidebook

- Link: https://pair.withgoogle.com/guidebook-v2/
- Proposed use: Instructor reference.
- Brief discussion: Useful for teaching "when should this app use AI?" and "how much control should the user keep?" It helps Week 8 avoid becoming only page layout.
- Fit: Good design-thinking support.
- Caveat: More product-design oriented than beginner web.
- Q decision: [ y] use [ ] optional [ ] skip

## Week 9: Adding Interactivity and Intelligence

Week 9 needs two layers: beginner JavaScript interactivity first, then AI/API architecture and key safety. Students should understand buttons, events, DOM updates, state, and requests before discussing AI services.

### 1. MDN: DOM Scripting Introduction

- Link: https://developer.mozilla.org/en-US/docs/Learn_web_development/Core/Scripting/DOM_scripting
- Proposed use: Core teaching candidate.
- Brief discussion: Beginner-friendly source for changing page structure and content with JavaScript. It gives Week 9 the missing bridge from static pages to interactive pages.
- Fit: Very strong for Week 9.
- Caveat: Use small examples only.
- Q decision: [ y] use [ ] optional [ ] skip

### 2. MDN: Introduction to Events

- Link: https://developer.mozilla.org/en-US/docs/Learn_web_development/Core/Scripting/Events
- Proposed use: Core teaching candidate.
- Brief discussion: Good source for teaching click handlers and event-driven behavior. Students need this before they ask an agent to "make the app interactive."
- Fit: Very strong for Week 9.
- Caveat: Keep the lab to buttons, inputs, and simple state changes.
- Q decision: [y] use [ ] optional [ ] skip

### 3. MDN: Fetch API

- Link: https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API
- Proposed use: Core teaching candidate.
- Brief discussion: Official reference for browser requests and responses. Week 9 can use this to teach the difference between local interactivity and calling an external service.
- Fit: Strong for adding intelligence to a web page.
- Caveat: Students need simplified examples. Full MDN API detail is too much.
- Q decision: [y ] use [ ] optional [ ] skip

### 4. MDN: Using the Fetch API

- Link: https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch
- Proposed use: Core teaching candidate.
- Brief discussion: More tutorial-like than the Fetch API reference. Useful for a short lab where a page requests sample JSON and renders it.
- Fit: Strong for beginner request/response practice.
- Caveat: Use public, non-authenticated sample data.
- Q decision: [ y] use [ ] optional [ ] skip

### 5. OpenAI API: Production Best Practices

- Link: https://developers.openai.com/api/docs/guides/production-best-practices
- Proposed use: Core teaching candidate for safety, instructor reference for implementation.
- Brief discussion: Strong source for API key safety. The main Week 9 rule should be clear: do not put private API keys directly in client-side code or public repositories. If an app needs an AI API, students should understand the pattern "browser client -> server/serverless proxy -> AI provider."
- Fit: Essential for "access-key safety."
- Caveat: API-oriented. We should translate into a simple static-web-app rule set.
- Q decision: [ y] use [ ] optional [ ] skip

### 6. GitHub Docs: Push Protection

- Link: https://docs.github.com/en/code-security/concepts/secret-security/push-protection
- Proposed use: Core teaching candidate or homework mini-check.
- Brief discussion: Practical source for why secrets should not enter GitHub history. Good support for a lab where students inspect a fake leaked-key scenario and decide what to do.
- Fit: Strong for Week 9 and Week 13.
- Caveat: Some features differ by account/repository type.
- Q decision: [y ] use [ ] optional [ ] skip

### 7. OWASP GenAI: LLM Top 10 2025

- Link: https://genai.owasp.org/llm-top-10/
- Proposed use: Instructor reference in Week 9, core teaching in Week 13.
- Brief discussion: Use lightly in Week 9 to introduce prompt injection, sensitive information disclosure, and excessive agency. Save the full security framing for Week 13.
- Fit: Good bridge to security.
- Caveat: Too many risks for Week 9 if taught fully.
- Q decision: [ ] use [ y] optional [ ] skip

### 8. Anthropic Claude for Word Prompt-Injection Risk Section

- Link: https://support.claude.com/en/articles/14465370-use-claude-for-word
- Proposed use: Instructor reference.
- Brief discussion: The prompt-injection section is a concrete example of hidden instructions inside documents. It can help students understand that "AI reads content" creates a security boundary.
- Fit: Good cross-week example from office agents to web agents.
- Caveat: Office-specific, so use as an analogy.
- Q decision: [ y] use [ ] optional [ ] skip

## Week 10: Building a Complete Web Project

### 1. MDN: Web Storage API

- Link: https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API
- Proposed use: Core teaching candidate.
- Brief discussion: Good source for localStorage/sessionStorage, which fits a static web app course. Students can save preferences, notes, form state, or project data without a backend.
- Fit: Strong for simple data persistence.
- Caveat: Discuss privacy: local browser storage is not secure storage for sensitive data.
- Q decision: [ y] use [ ] optional [ ] skip

### 2. MDN: Window localStorage

- Link: https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage
- Proposed use: Core teaching candidate or code reference.
- Brief discussion: More focused than the Web Storage overview. Useful for a short "save and load app state" lab.
- Fit: Very practical for Week 10.
- Caveat: Use only non-sensitive sample data.
- Q decision: [ ] use [y ] optional [ ] skip

### 3. Google PAIR Codelab: Building Trusted AI Products

- Link: https://codelabs.developers.google.com/codelabs/pair-guidebook
- Proposed use: Instructor reference.
- Brief discussion: Useful for a complete project because it walks through user needs, AI fit, trust calibration, explainability, user control, and failure recovery.
- Fit: Strong for moving from prototype to complete product.
- Caveat: Some implementation details are too advanced. Use the design questions, not the whole codelab.
- Q decision: [ ] use [y ] optional [ ] skip

### 4. Google PAIR Guidebook

- Link: https://pair.withgoogle.com/guidebook-v2/
- Proposed use: Core teaching candidate or instructor reference.
- Brief discussion: Good source for AI product-design patterns: whether AI adds value, how to explain model behavior, how to support users when something goes wrong, and how much control users should keep.
- Fit: Strong for complete project design.
- Caveat: Requires adaptation into student-friendly checklists.
- Q decision: [ y] use [ ] optional [ ] skip

### 5. MDN: Learn Web Development

- Link: https://developer.mozilla.org/en-US/docs/Learn_web_development
- Proposed use: Optional enrichment.
- Brief discussion: Broad learning path for students who want to keep improving their web skills after the three-week web-app block.
- Fit: Good reference library.
- Caveat: Too broad for required Week 10 homework.
- Q decision: [ y] use [ ] optional [ ] skip

## Week 11: Knowledge Acquisition and Career Development

### 1. Digital Inquiry Group: Teaching Lateral Reading

- Link: https://cor.inquirygroup.org/curriculum/collections/teaching-lateral-reading/
- Proposed use: Core teaching candidate.
- Brief discussion: Strong source for source checking and information evaluation. Students can practice leaving a page, checking what other sources say, and tracing claims before accepting AI-generated research summaries.
- Fit: Excellent for research retrieval and synthesis.
- Caveat: Some materials require free account sign-in.
- Q decision: [ y] use [ ] optional [ ] skip

### 2. NACE: Career Readiness Competencies

- Link: https://naceweb.org/career-readiness/competencies/career-readiness-defined
- Proposed use: Core teaching candidate.
- Brief discussion: Good external framework for career reflection. Students can map their AI-assisted project evidence to communication, critical thinking, technology, professionalism, and career/self-development.
- Fit: Strong for resume and interview work.
- Caveat: Do not overdo the full competency list. Select 3-4 competencies.
- Q decision: [ y] use [ ] optional [ ] skip

### 3. Purdue Libraries: How to Cite AI-Generated Content

- Link: https://guides.lib.purdue.edu/c.php?g=1371380&p=10135074
- Proposed use: Core teaching candidate.
- Brief discussion: Supports research transparency and source disclosure. In Week 11, students can submit an "AI research log" that separates sources they found, AI help they used, and claims they personally verified.
- Fit: Strong for citations and academic integrity.
- Caveat: Recheck citation formats before final use.
- Q decision: [y ] use [ ] optional [ ] skip

### 4. Anthropic AI Fluency for Students

- Link: https://anthropic.skilljar.com/ai-fluency-for-students
- Proposed use: Optional enrichment or homework if access is smooth.
- Brief discussion: Fits learning, career planning, and responsible AI collaboration. It may be useful as an optional certificate students can cite in a portfolio.
- Fit: Good career-development extension.
- Caveat: Verify full access and completion proof from a student account.
- Q decision: [ y] use [ ] optional [ ] skip

### 5. Stanford Teaching Commons: Understanding AI Literacy

- Link: https://teachingcommons.stanford.edu/teaching-guides/artificial-intelligence-teaching-guide/understanding-ai-literacy
- Proposed use: Instructor reference.
- Brief discussion: Useful for connecting research, writing, and career use to broader AI literacy instead of treating Week 11 as only job-search tips.
- Fit: Good instructor framing.
- Caveat: Teacher-facing.
- Q decision: [ y] use [ ] optional [ ] skip

## Week 12: Advanced Prompting Strategies

### 1. Andrew Ng / DeepLearningAI Prompting Video

- Link: https://www.youtube.com/watch?v=8ib4Qnh2HFE
- Proposed use: Homework candidate.
- Brief discussion: Current searched title: "Full AI Prompting Course with Andrew Ng." Q already approved this for Week 12 homework. The learning outcome is to move from casual prompting to stronger task framing, richer context, and reviewable output. Our in-class Week 12 deck is standalone and uses interactive prompt strategy practice rather than replaying the video.
- Fit: Already integrated in Week 12.
- Caveat: Keep as homework reference.
- Q decision: [ y] use [ ] optional [ ] skip

### 2. OpenAI API: Prompt Engineering

- Link: https://developers.openai.com/api/docs/guides/prompt-engineering
- Proposed use: Core teaching candidate or instructor reference.
- Brief discussion: Official OpenAI source for prompt engineering as writing effective instructions to get consistent model behavior. Good support for our Week 12 prompt-contract model.
- Fit: Strong for Codex/OpenAI track students.
- Caveat: API-oriented, so examples should be converted to classroom tasks.
- Q decision: [ y] use [ ] optional [ ] skip

### 3. Anthropic Claude Docs: Prompt Engineering Overview

- Link: https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/overview
- Proposed use: Core teaching candidate or instructor reference.
- Brief discussion: Strong because it begins with success criteria and empirical testing before prompt tweaking. This supports our course stance that prompting is task design plus verification.
- Fit: Strong for Claude track students.
- Caveat: Developer-facing, so assign selected parts only.
- Q decision: [y ] use [ ] optional [ ] skip

### 4. Anthropic GitHub: Prompt Engineering Interactive Tutorial

- Link: https://github.com/anthropics/prompt-eng-interactive-tutorial
- Proposed use: Optional enrichment.
- Brief discussion: Good deeper practice for students who want a structured Claude prompting tutorial. It covers prompt structure, failure modes, and common use cases.
- Fit: Good advanced homework option.
- Caveat: May be longer and more technical than our one-hour class.
- Q decision: [ y] use [ ] optional [ ] skip

### 5. Microsoft Support: Get Started Writing Prompts in Microsoft 365 Copilot

- Link: https://support.microsoft.com/en-us/microsoft-365-copilot/get-started-writing-prompts-in-microsoft-365-copilot
- Proposed use: Optional cross-tool comparison.
- Brief discussion: Useful to show that prompt contracts transfer across tools: goal, context, expectations, and source remain useful outside ChatGPT/Claude.
- Fit: Good synthesis source.
- Caveat: Do not let Week 12 become Microsoft-specific.
- Q decision: [ ] use [y ] optional [ ] skip

## Week 13: AI-Powered Security and Vulnerability Management

### 1. OWASP GenAI: LLM Top 10 2025

- Link: https://genai.owasp.org/llm-top-10/
- Proposed use: Core teaching candidate.
- Brief discussion: Strong central source for LLM application risks. For one class, teach 3-4 risks through student artifacts: prompt injection, secret leakage, unsafe output handling, and excessive agency.
- Fit: Very strong for Week 13.
- Caveat: Use a subset. All ten risks are too much for one class unless framed as a checklist activity.
- Q decision: [ y] use [ ] optional [ ] skip

### 2. OWASP Top 10 for Agentic Applications 2026

- Link: https://genai.owasp.org/resource/owasp-top-10-for-agentic-applications-for-2026/
- Proposed use: Instructor reference or optional enrichment.
- Brief discussion: Strong match for this course because students use agents throughout the semester. It covers risks for systems that plan, act, and use tools across workflows.
- Fit: Very strong for agent-based course safety.
- Caveat: More advanced than the broad Week 13 class. Use selected ideas only after students understand agents, tool permissions, and review workflows.
- Q decision: [ ] use [ y] optional [ ] skip

### 3. GitHub Docs: Push Protection

- Link: https://docs.github.com/en/code-security/concepts/secret-security/push-protection
- Proposed use: Core teaching candidate.
- Brief discussion: Concrete, practical security lesson: secrets should be blocked before they enter a repository. Good for an agent-generated-code review lab.
- Fit: Strong for vulnerability management.
- Caveat: Account/repo settings may differ.
- Q decision: [y ] use [ ] optional [ ] skip

### 4. MITRE ATLAS

- Link: https://atlas.mitre.org/
- Proposed use: Instructor reference or optional enrichment.
- Brief discussion: Useful for explaining that AI security has adversarial tactics and techniques, not just generic "be careful" advice. It can inform a threat-modeling slide.
- Fit: Good instructor framing.
- Caveat: Too advanced for most students as required reading.
- Q decision: [ ] use [y ] optional [ ] skip

### 5. OpenAI API: Safety Best Practices

- Link: https://developers.openai.com/api/docs/guides/safety-best-practices
- Proposed use: Instructor reference.
- Brief discussion: Useful for moderation, misuse prevention, and responsible app behavior if students add AI features.
- Fit: Good security/safety extension.
- Caveat: API-oriented and more relevant if Week 9-10 apps call external AI APIs.
- Q decision: [ y] use [ ] optional [ ] skip

## Week 14: Final Presentation

### 1. Stanford d.school: How to Give Feedback

- Link: https://dschool.stanford.edu/tools/how-to-give-feedback
- Proposed use: Core teaching candidate.
- Brief discussion: Good structure for peer critique that stays constructive. We can adapt it into a final showcase feedback protocol: what works, what needs improvement, what next experiment would help.
- Fit: Strong for final presentation day.
- Caveat: Use the method, not the full assignment unchanged.
- Q decision: [ ] use [y ] optional [ ] skip

### 2. Google PAIR Guidebook

- Link: https://pair.withgoogle.com/guidebook-v2/
- Proposed use: Core teaching candidate or final reflection prompt.
- Brief discussion: Good final-project lens: user needs, whether AI adds value, user control, explainability, and failure handling. Students can use it to explain design choices in their presentation.
- Fit: Strong for final AI app reflection.
- Caveat: Need a short rubric, not the whole guidebook.
- Q decision: [y ] use [ ] optional [ ] skip

### 3. NACE Career Readiness Competencies

- Link: https://naceweb.org/career-readiness/competencies/career-readiness-defined
- Proposed use: Core teaching candidate for reflection.
- Brief discussion: Students can connect their final project to career-ready skills: communication, technology, critical thinking, professionalism, and self-development.
- Fit: Strong for "AI in my field of study" reflection.
- Caveat: Select a small subset of competencies.
- Q decision: [ y] use [ ] optional [ ] skip

### 4. NC State DELTA: Rubric Best Practices, Examples, and Templates

- Link: https://teaching-resources.delta.ncsu.edu/rubric_best-practices-examples-templates/
- Proposed use: Instructor anchor for rubric design.
- Brief discussion: Useful for designing the Week 14 final project rubric with clear criteria and achievement levels. The actual final rubric should be internal and should assess working artifact, responsible AI use, source verification, limitations, and presentation clarity.
- Fit: Good for instructor-facing assessment design.
- Caveat: We should write our own rubric aligned to the syllabus and our weekly artifacts.
- Q decision: [ ] use [ y] optional [ ] skip

### 5. Internal Final AI App Rubric

- Link: ../index.html
- Proposed use: Core teaching artifact, built by us.
- Brief discussion: Week 14 should have a course-specific rubric/checklist. Proposed rows: working app demo, user problem and audience, responsible AI/data choices, source verification, known limitations, human review, and next-step reflection.
- Fit: Essential for final presentation.
- Caveat: This still needs to be created as a standalone Week 14 page or handout.
- Q decision: [y ] use [ ] optional [ ] skip

### 6. Google PAIR Codelab: Building Trusted AI Products

- Link: https://codelabs.developers.google.com/codelabs/pair-guidebook
- Proposed use: Optional final reflection source.
- Brief discussion: Students can use selected questions from the codelab to explain how their final app handles user needs, trust, explainability, control, errors, and feedback.
- Fit: Strong for capstone reflection.
- Caveat: Use only selected questions. The codelab itself is too long for final-week homework.
- Q decision: [ y] use [ ] optional [ ] skip

## Proposed Required Homework Candidates

These are the few materials I would consider requiring, not just listing:

1. Before Week 3: Anthropic AI Fluency Framework and Foundations
   Link: https://anthropic.skilljar.com/ai-fluency-framework-foundations
   Reason: Q already approved this direction; certificate/completion can be used as proof if student access works.

2. Week 3: Cornell AI and Academic Integrity plus a short AI-use policy reflection
   Link: https://teaching.cornell.edu/generative-artificial-intelligence/ai-academic-integrity
   Reason: Better student outcome than a generic ethics reading.

3. Week 4: Claude for Word official help page, only if access is available
   Link: https://support.claude.com/en/articles/14465370-use-claude-for-word
   Reason: Directly matches Q's office-agent week and shows tracked changes plus limitations.

4. Week 5: Copilot in Excel official guide, only if access is available
   Link: https://support.microsoft.com/en-us/excel/copilot/get-started-with-copilot-in-excel
   Reason: Direct match for Excel/data workflows. If access fails, use screenshots/demo only and assign a verification worksheet.

5. Week 8: Andrew Ng app-building video
   Link: https://www.youtube.com/watch?v=ff3j4olCUig
   Reason: Q already approved it as inspiration/homework.

6. Week 11: Digital Inquiry Group lateral reading lesson
   Link: https://cor.inquirygroup.org/curriculum/collections/teaching-lateral-reading/
   Reason: Strong practical method for verifying sources before using AI summaries.

7. Week 12: Andrew Ng prompting video
   Link: https://www.youtube.com/watch?v=8ib4Qnh2HFE
   Reason: Q already approved it as homework for Week 12.

8. Week 13: OWASP LLM Top 10, adapted into a one-page student checklist
   Link: https://genai.owasp.org/llm-top-10/
   Reason: Strongest security backbone for AI-generated apps.

## Materials I Would Not Require Without Access Testing

- Anthropic Skilljar courses beyond the already approved AI Fluency Foundations.
- Microsoft 365 Copilot training modules and prompt gallery.
- Claude for Word hands-on setup.
- Copilot in Excel hands-on setup.
- Adobe Firefly/Canva hands-on image generation.

Reason: these may depend on student accounts, paid plans, organizational settings, credits, or changing product availability.

## Next Approval Questions For Q

1. Should Week 3 be policy-heavy, case-study-heavy, or scenario-decision-heavy?     secnario-decision heavy.

2. For Weeks 4-5, do students definitely have access to Microsoft 365 Copilot or Claude for Word/Excel, or should we design demo-first labs with optional hands-on?
   they should have copilot as students, and i will encourge them to use claude for word and excel.

3. Should Week 6 use one required creative tool, or let students choose among ChatGPT image generation, Adobe Firefly, Canva, or another approved tool?
  let the use chatgpt image.

4. Should Week 13 be mostly "security concepts for all students" or a practical code-review lab for final web apps?
yes, practical code review lab for final web app.