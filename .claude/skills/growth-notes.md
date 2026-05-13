---
name: growth-notes
description: Turn feedback threads into concise growth notes aligned with MongoDB's Leadership Principles, with impact signal detection and cross-team impact tagging.
---

Given a thread (e.g., Slack, email, doc comments, 1:1 notes, or incident reports) that evaluates the user's work, updates, or handling of a situation, produce content ready to append to their growth notes.

Output all six sections below in order:

1) Summary (3–6 sentences)
- Briefly describe the context of the thread, what the user did, and how they handled the situation.
- Highlight key outcomes and decisions rather than every detail.
- Note which teams or stakeholders beyond the user's immediate squad were involved or affected.

2) Strengths (bulleted list)
- List concrete strengths demonstrated in the thread.
- For each bullet, explicitly reference at least one Leadership Principle by name (e.g., "Leaders act like owners," "Leaders communicate with clarity," "Leaders focus on outcomes," "Leaders never stop learning and growing," "Leaders build extraordinary teams").
- Tag any strength that involved cross-team impact with [cross-team], technical authority with [tech-authority], mentorship with [mentorship], operational excellence with [ops-excellence], or external storytelling with [external].

3) Growth opportunities (bulleted list)
- List specific, behavioral growth opportunities grounded in signals from the thread.
- Tie each item to one or more Leadership Principles where relevant.
- Be specific about the gap: distinguish between "did not do X" vs. "did X but without Y artifact or evidence."

4) Next cycle focus (3–5 bullets)
- Convert the most important growth opportunities into actionable, forward-looking behaviors.
- Each bullet should name the behavior, the context where it applies, and the Leadership Principle it serves.
- Example: "In future design reviews, summarize tradeoffs and decision rationale in writing — 'communicate with clarity' + 'focus on outcomes'."

5) Impact signal
- Assess whether this thread contains evidence of high-impact contribution. Use exactly one of:
  - STRONG: Clear evidence of cross-team enablement, organizational influence, technical authority where others deferred to this engineer's judgment, or durable adoption of an artifact/pattern.
  - MODERATE: Evidence of cross-team contribution, but outcome or adoption is unclear or incomplete.
  - WEAK: Primarily individual task completion; no cross-team or organizational signal present.
- If STRONG or MODERATE: write one bragsheet-ready sentence in this format:
  `[Action verb] + [artifact or decision] + [who benefited] + [measurable or observable outcome]`
  Example: "Established the Remote MCP operational runbook adopted by the IAM team, reducing launch preparation risk across future SSO rollouts."
- If WEAK: write `<!-- no bragsheet signal — individual task completion only -->`

6) Evidence quality
- Rate the evidence in the thread as one of:
  - Strong — citable artifacts exist (PR links, doc links, recordings, metrics, Slack permalinks).
  - Moderate — outcomes described but not linked; paraphrase only.
  - Weak — anecdotal; no citable artifact. Flag with: `[NEEDS EVIDENCE: add a link or cite a specific artifact before using this in a P&G review]`

Guidelines:
- Be specific and evidence-based; never infer motivation or add feedback not present in the source.
- Use neutral, developmental language that reinforces ownership, high standards, and continuous learning.
- Emphasize what to keep doing, start doing, or do differently — not just what went wrong.
- Output only the six sections with no meta-explanation or commentary before or after.
