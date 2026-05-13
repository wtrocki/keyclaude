---
name: weekly-review
description: Synthesize a weekly note into four structured bullets — Focus Check, Cross-team Quality, Priority Shift, and Priority Judgment — for weekly self-reflection and 1:1 preparation.
---

Given a weekly note (a `weekly/YYYY-WNN.md` file or free-form weekly summary), produce exactly four labeled bullets in the format specified below. Output only the four bullets — no intro, no extra text, no explanation.

**Focus Check**
- One sentence: did the work this week align with the declared week priorities?
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

**Priority Judgment**
- One sentence: given the planned items for this week, flag anything that appears out of scope or low-impact relative to the declared priorities.
- If an item from the Planned or Done section appears disconnected from stated priorities, name it explicitly.
- If Impact Items are listed in the note, assess whether any warrant moving to next week's Planned list.
- If all planned work appears on-scope, write: "All planned work aligns with stated priorities — no scope flag." Append `[no scope flag]`.
- Otherwise append `[scope flag: <item name>]`.

Output format (use this exact structure, no extra lines):

**Focus Check:** <sentence> [DRIFT if applicable]
**Cross-team Quality:** <sentence> [cross-team signal | no cross-team signal]
**Priority Shift:** <sentence>
**Priority Judgment:** <sentence> [scope flag: <item name> | no scope flag]
