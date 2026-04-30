# Impact Signal Taxonomy

A reference for identifying, tagging, and recording high-impact evidence in growth notes and bragsheet entries.

## Signal Types

| Type | Tag | Definition | Example Evidence |
|------|-----|------------|-----------------|
| Cross-team enablement | `cross-team` | An artifact, pattern, or decision you produced was adopted or acted upon by a team other than your own squad. | PR merged into another team's repo; runbook referenced by another team; design doc adopted as a standard. |
| Technical authority | `tech-authority` | Others deferred to your technical judgment in a visible decision; you set the direction, not just contributed an option. | Architecture ADR signed off by multiple teams; technical spike that resolved a cross-team blocker. |
| Organizational influence | `ops-excellence` | You changed a process, standard, or workflow that affects people beyond your immediate assignment. | New onboarding doc adopted org-wide; incident process change that reduced MTTR across teams. |
| Operational excellence at scale | `ops-excellence` | A runbook, guideline, or recovery pattern you created is reusable and referenced by others. | Runbook linked from another team's on-call rotation; post-mortem template adopted by EM. |
| External storytelling | `external` | You published, presented, or represented MongoDB publicly in a way that builds technical credibility. | Conference talk, blog post, RFC, open source contribution, community Q&A. |
| Mentorship with outcome | `mentorship` | A mentee made a better decision or grew visibly because of your direct coaching — and you can describe the outcome. | Mentee led a design review independently; report unblocked a cross-team dependency after your coaching session. |

## What Does NOT Qualify

Individual task completions do not qualify as impact signals, even when:
- The task was technically complex.
- The task took a long time or was on the critical path.
- You were the only person who could complete it.

The question is not "was this hard?" — it is "did this change how others work?"

## Signal Strength

| Strength | Criteria |
|----------|----------|
| STRONG | Outcome is complete, observable, and citable. Artifact exists. Another team or person visibly changed behavior because of it. |
| MODERATE | Cross-team contribution is evident, but adoption or outcome is unclear or still in progress. |
| WEAK | Primarily individual; cross-team interaction exists but produced no durable artifact or behavior change. |

## Evidence Quality

Bragsheet entries without citable evidence are flagged `[NEEDS EVIDENCE]`. Strong evidence types:

- PR link or commit reference
- Design doc or ADR URL
- Slack permalink showing adoption or acknowledgment by another team
- Metrics showing before/after change (incident count, latency, error rate)
- Calendar invite or recording from a cross-team session you led

## Leadership Principles Mapping

| Principle | Most Common Signal Types |
|-----------|-------------------------|
| Act Like Owners | `cross-team`, `ops-excellence` — end-to-end responsibility across team boundaries |
| Communicate with Clarity | `external`, `tech-authority` — producing precise artifacts others can act on without follow-up |
| Focus on Outcomes | `cross-team`, `ops-excellence` — measurable change in how others work, not just activity completed |
| Never Stop Learning | `mentorship`, personal cycle notes — seeking feedback and acting on it visibly |
| Build Extraordinary Teams | `mentorship`, `cross-team` — raising the capability of people around you |
