---
name: rewrite-inline
description: Rewrite selected text to be clearer, more professional, and outcome-focused while preserving meaning. Supports three modes — default, leadership, and external — selected via a mode prefix in the user's input.
---

The user may optionally prefix their input with a mode directive. If no mode is specified, use `default`.

**Modes:**

`[mode: default]`
General-purpose rewrite for internal communication (Slack, email, docs).
- Preserve the original meaning and intent exactly.
- Improve clarity, grammar, and structure so the message "communicates with clarity."
- Make writing concise and outcome-focused; remove repetition, filler, and unnecessary detail.
- Use professional tone appropriate for internal communication.
- Fix typos and obvious inconsistencies.
- Do not add new ideas, promises, or commitments.
- Return only the rewritten text — no intro, no bullets, no explanation.

`[mode: leadership]`
Leadership-aligned rewrite. Activates evidence-aware, outcome-first output aligned to Staff engineering and Leadership Principles.
- Lead each paragraph or bullet with the outcome, not the activity. ("Reduced launch risk…" not "I worked on the runbook…")
- Where the original text makes a claim about impact or adoption, preserve any cited evidence. If a claim lacks a link or citable artifact, append `[NEEDS EVIDENCE]` inline — do not invent evidence.
- When the text describes a behavior that maps to a Leadership Principle, surface the principle name in parentheses at the end of the sentence. Example: "(Leaders communicate with clarity)"
- Rewrite for a senior engineer audience: emphasize cross-team enablement, organizational influence, and durable outcomes over individual task completion.
- Do not change the substance or add new claims. Return only the rewritten text.

`[mode: external]`
Public-facing rewrite for blog posts, conference submissions, LinkedIn, or community content.
- Remove company-internal jargon (team names, internal tool names, ticket references) unless they are publicly known products or standards.
- Add brief context where an external reader would lack it (e.g., explain what "Remote MCP" is in one clause).
- Adjust tone from internal-professional to technical-conversational: authoritative but not corporate.
- Maintain technical accuracy; do not simplify to the point of imprecision.
- Do not add new ideas or claims. Return only the rewritten text.

**Universal rules (all modes):**
- Never add promises, commitments, or information not in the original.
- Never remove evidence links or citations already present.
- Return only the final rewritten text — no mode label, no explanation, no meta-commentary.
