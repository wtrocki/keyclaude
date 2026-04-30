# Weekly Notes

Weekly planning and reflection notes. Each week has a separate Markdown file named `YYYY-WNN.md` (ISO week format, e.g., `2026-W18`).

## Creating a New Week

```bash
bin/weekly-init            # auto-detects current ISO week
bin/weekly-init 2026-W19   # specify week explicitly
```

## Template Structure

Each weekly note must follow this structure to be parseable by `bin/bragsheet-rollup`:

```markdown
# Week YYYY-WNN

> Cycle priorities: <!-- your current cycle goals -->

## Planned
## Done
## Blockers / Risks
## Cross-team
## Notes

## Bragsheet Signal ⭐

> <!-- paste bragsheet-entry output here, or run: pbpaste | bin/growth-capture -->
```

The `## Bragsheet Signal ⭐` section is a machine-parseable anchor. `bragsheet-rollup` extracts lines starting with `|` from this section and nothing else. **Do not rename this heading.**

## Weekly Workflow

1. `bin/weekly-init` — run at the start of the week.
2. Fill in **Planned** before Monday standup.
3. Update **Done**, **Blockers**, and **Cross-team** throughout the week.
4. On Friday: if you have a high-impact input (Slack thread, feedback, incident), run `pbpaste | bin/growth-capture` and paste the resulting table row into `## Bragsheet Signal ⭐`.
5. At cycle end: `bin/bragsheet-rollup --append-file docs/bragsheet.md` to collect all signals.
