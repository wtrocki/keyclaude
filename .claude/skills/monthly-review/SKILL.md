---
name: monthly-review
description: Aggregate a period's weekly notes against the P&G Employee Development Plan into a snapshot — Impact Stories grouped by North Star theme and tagged with a Leadership Principle, What Closed/Shipped, a Major/Minor/Elective draft plan for the next period, and a backlog delta. Follows MongoDB's P&G review process.
disable-model-invocation: true
---

Given a bundled input containing (in this order, each under a `===== FILE: <path> =====` banner): the Employee Development Plan (EDP), the current `backlog.md`, one or more weekly notes for the period, and the `leadership-principles.md` + `signals.md` reference docs — produce one **P&G period snapshot** in the exact structure below. Output only the snapshot Markdown — no intro, no preamble, no commentary.

Rules for the whole snapshot:
- Consolidate achievements from the weekly notes' `## Results / Impact`, `## Done`, and `## Bragsheet Signal ⭐` sections. Do not invent work that is not in the weeklies.
- An item is an **Impact Story** only if it changed how others work (see `signals.md` — individual task completion does NOT qualify). Group stories under the **EDP North Star themes** (the `### ...` headings under `## North Stars for This Period`). Put a story under the theme it best advances.
- Tag every Impact Story with a **Leadership Principle** from `leadership-principles.md` (map via the signal-type tables). This is the "Both" convention: North Star theme = grouping, LP = signal tag.
- Where a claim lacks citable evidence (link, PR, doc, metric), append `[NEEDS EVIDENCE]` — never fabricate a link.
- The period range is provided in the input as `PERIOD: <last cutoff> → <this cutoff>`. Use it verbatim in the header.
- The **Draft Plan** is decomposed from: EDP `## North Stars` + `## New Period Goals`, still-open items in `backlog.md`, and the `## Planned` intents in the weekly notes. Respect the ~50/25/15 Major/Minor/Elective split.
- The **Backlog Delta** lists concrete edits to make in `backlog.md`: items to check off (shipped this period) and new items surfaced in the weeklies. Do not restate the whole backlog.

Output format (use this exact structure):

## Period Review — <last cutoff> → <this cutoff>

> Snapshot generated <this cutoff>. Impact stories consolidated from weekly notes; grouped by North Star, tagged by Leadership Principle.

### Impact Stories

#### <North Star theme name>

**<n>. <Impact story title>**
- <what was owned/delivered, cross-team collaboration, adoption>
- Evidence: <links or descriptions | [NEEDS EVIDENCE]>
- LP signal: **<Leadership Principle>** (<signal-type tag>, <STRONG|MODERATE|WEAK>)

<repeat stories; repeat theme headings for each North Star with stories this period>

### What Closed / Shipped

- [x] <shipped item>
- [ ] <open item> — **carried forward**

### Draft Plan — Next Period

#### Planned Major (~50%)
- [ ] <goal decomposed from North Stars / backlog / weekly intents>

#### Planned Minor (~25%)
- [ ] <goal>

#### Planned Elective (~15%)
- [ ] <goal>

### Backlog Delta

**Check off (shipped this period):**
- <backlog item now done>

**Add (surfaced this period):**
- <new open item> — <aspiration group it belongs to>

<!-- END SNAPSHOT -->

The literal first line of your output must be the `## Period Review` heading and the literal last line must be `<!-- END SNAPSHOT -->`. Emit nothing before or after those markers.

If no weekly notes fall in the period, output exactly:
No weekly notes found for this period — nothing to snapshot.
