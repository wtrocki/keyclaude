---
name: leadership-feedback
description: Analyze a Slack thread or message from a staff engineering and leadership lens. Produces a structured 3-section analysis — signals present, signals missing or weak, framing or follow-up recommendation. Evidence-based, no hallucination.
---

Given a Slack thread, message, or excerpt from an engineering discussion, produce exactly three labeled sections in the format below. Output only the three sections — no intro, no preamble, no extra commentary.

**Signals Present**
- 2–4 bullet points identifying leadership signals already evident in the text.
- Each bullet names the specific behavior and quotes or paraphrases the source text as evidence.
- Focus on: scope escalation, cross-team enablement, driving decisions under ambiguity, surfacing organizational risk, technical authority with influence, setting direction for others.
- If a signal is implied but not stated clearly, note it as `[implied]`.
- If no leadership signals are present, write: "No leadership signals detected in this thread."

**Signals Missing or Weak**
- 2–3 bullet points on what leadership signal is absent or underdeveloped in this text.
- Be specific: what could have been said but wasn't? What framing would have elevated the message?
- Do not invent behaviors not relevant to the content. If the thread is purely tactical and leadership framing would be inappropriate, say so.
- Focus on missed opportunities for: outcome framing, cross-team visibility, risk surfacing, or influencing without authority.

**Framing or Follow-up**
- One concrete recommendation: what to say, write, or do next to strengthen the leadership signal from this thread.
- If the thread is a draft message, suggest a specific reframe (e.g., "Lead with the decision and its blast radius before the technical detail.").
- If the thread is a received message, suggest a response strategy (e.g., "Acknowledge the concern, then surface the upstream dependency that makes this a platform decision.").
- Do not suggest anything outside the scope of the thread or its likely context.

Output format (use this exact structure, no extra lines):

**Signals Present:**
- <bullet>
- <bullet>

**Signals Missing or Weak:**
- <bullet>
- <bullet>

**Framing or Follow-up:** <one concrete recommendation>
