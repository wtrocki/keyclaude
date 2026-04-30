---
name: weekly-review
description: Synthesize a weekly note into three structured bullets — Focus Check, Cross-team Quality, Priority Shift — for use in 1:1s and P&G cycles.
---

Given a weekly note (a `docs/weekly/YYYY-WNN.md` file or free-form weekly summary), produce exactly three labeled bullets in the format specified below. Output only the three bullets — no intro, no extra text, no explanation.

**Focus Check**
- One sentence: did the work this week align with the declared cycle priorities?
- Reference specific tasks or themes from the note. If no priorities are stated, infer from the work described.
- If more than half the work was unplanned or off-priority, append `[DRIFT]` at the end.

**Cross-team Quality**
- One sentence: were there cross-team interactions, and did they produce a durable artifact or outcome?
- Name the other team(s) if mentioned in the note.
- Append exactly one tag inline: `[cross-team signal]` if a high-impact interaction is evident; `[no cross-team signal]` if the week was primarily squad-internal.

**Priority Shift**
- One sentence: what, if anything, should change next week — stop, start, or continue — based on the week's evidence?
- Ground the shift in a specific signal from the note (e.g., a blocked dependency, a recurring theme, a missed outcome).
- If no shift is warranted, write: "Continue current trajectory — no adjustment needed."

Output format (use this exact structure, no extra lines):

**Focus Check:** <sentence> [DRIFT if applicable]
**Cross-team Quality:** <sentence> [cross-team signal | no cross-team signal]
**Priority Shift:** <sentence>
