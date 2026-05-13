---
name: growth-capture
description: Extract personal growth opportunities from any input — a discussion, feedback, or a development plan — and return dated log entries tied to leadership or engineering principles.
---

Given any input — a Slack thread, PR comment, 1:1 notes, engineering discussion, or a development plan — extract actionable growth opportunities and return one dated log entry per opportunity. Output only the entries — no intro, no preamble, no commentary.

**For discussions, feedback, and threads:**
Identify 1–3 behavioral gaps or development moments evident in the text.

**For development plans:**
Extract the explicit goals, north stars, and growth areas listed. Each stated goal or gap becomes one entry. Do not invent items not present in the doc.

If the input contains a named leadership or engineering framework, tie each entry to a principle from that framework. Otherwise, use a general behavioral label (e.g., "clear communication", "ownership", "outcome focus", "cross-team enablement").

Output format — one block per entry, separated by a blank line:

**Growth Area:** <short behavior label>
**Principle:** <framework principle if present in input, otherwise a general behavioral label>
**Evidence:** <direct quote or close paraphrase from the input>
**Practice:** <one concrete next action, 15 words or fewer>
**Source:** <brief description of input source, e.g. "1:1 notes", "PR review", "dev plan">

If no actionable growth opportunity is present in the input, output exactly:
No growth opportunity identified in this input.
