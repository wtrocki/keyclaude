---
name: bragsheet-entry
description: >
  Convert a SMART goal completion, weekly note, growth feedback note, or incident
  summary into a single bragsheet table row using high-impact framing. If the input
  does not contain high-impact signal evidence, outputs a no-signal comment instead.
---

Given any growth-related input (SMART goal, weekly note, feedback note, incident
summary, or meeting transcript), assess whether it contains a high-impact impact
signal and produce exactly one of the two outputs below.

**high-impact signal criteria — ALL of the following qualify:**
- Cross-team enablement: an artifact, pattern, or decision you produced was adopted
  or acted upon by a team other than your own squad.
- Technical authority: others deferred to your technical judgment in a visible decision;
  you set the direction, not just contributed an option.
- Organizational influence: you changed a process, standard, or workflow that affects
  people beyond your immediate assignment.
- Operational excellence at scale: you created a runbook, guideline, or recovery pattern
  that is now reusable and referenced by others.
- External storytelling: you published, presented, or represented MongoDB publicly in
  a way that builds technical credibility (conference, blog, RFC, community).
- Mentorship with outcome: a mentee made a better decision or grew visibly because of
  your direct coaching — and you can describe the outcome.

**Individual task completions do NOT qualify**, even if the task was complex or took
long time (e.g., "implemented feature X," "fixed bug Y," "attended review Z").

---

**Output A — Signal present:**

Produce exactly one Markdown table row in this format. Do not produce the table header.

```
| YYYY-MM-DD | <type> | <Leadership Principle> | <impact sentence> | <evidence> |
```

Field rules:
- `YYYY-MM-DD`: Use the date from the input. If no date is present, write `YYYY-MM-DD`
  as a placeholder.
- `<type>`: Exactly one of: `cross-team` | `tech-authority` | `ops-excellence` |
  `external` | `mentorship`
- `<Leadership Principle>`: Exactly one of MongoDB's five principles, by name:
  `Act Like Owners` | `Communicate with Clarity` | `Focus on Outcomes` |
  `Never Stop Learning` | `Build Extraordinary Teams`
- `<impact sentence>`: One sentence, 20 words max. Structure:
  `[Action verb] + [artifact or decision] + [who benefited] + [observable outcome]`.
  Use past tense. Do not start with "I".
  Good: "Established IAM runbook adopted by Remote MCP team, reducing launch prep risk."
  Bad: "I worked on the runbook and shared it with the IAM team."
- `<evidence>`: If a URL or artifact is present in the input, use `[link text](url)`.
  If no URL exists, write `none — add link`.

**Output B — No signal present:**

```
<!-- no bragsheet signal — individual task completion; no cross-team or organizational impact detected -->
```

---

Output only the table row or the comment. No explanation, no header, no extra text.
