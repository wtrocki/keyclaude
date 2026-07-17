# Growth reference examples (MongoDB-specific)

Seed reference docs the `monthly-review` skill reads as evaluation context:

- `leadership-principles.md` — MongoDB's five Leadership Principles + signal-type mapping.
- `signals.md` — impact-signal taxonomy (what qualifies, strength, evidence quality).

These are **examples**, not engine code. `bin/monthly-review` injects them from `$GROWTH_REPO/growth/`, so copy them into your data repo and adapt to your org's framework:

```bash
mkdir -p "$GROWTH_REPO/growth"
cp examples/growth/*.md "$GROWTH_REPO/growth/"
```

The skill references both files by name; keep the filenames if you want tagging to work without editing `SKILL.md`.
