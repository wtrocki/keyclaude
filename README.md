# aiskills

A personal repository of Claude Code skills, agent profiles, MCP configurations, and growth documentation for an engineer at MongoDB.

## Repository Structure

```
.
├── .claude/
│   ├── skills/                       # Claude Code local skills (YAML front-matter + prompt)
│   │   ├── growth-notes.md           # Turn feedback threads into growth notes
│   │   ├── bragsheet-entry.md        # Convert high-impact signals into bragsheet rows
│   │   ├── weekly-review.md          # Synthesize a weekly note into 3 focus bullets
│   │   └── rewrite-inline.md         # Rewrite text (default / P&G / external modes)
│   └── profiles/                     # Agent profiles (skills + MCPs + system prompt)
│       ├── growth-agent.yaml         # Growth capture — Slack, GitHub, GDocs
│       ├── reviewer-agent.yaml       # Code/design reviewer — GitHub
│       └── pg-sync-agent.yaml        # P&G sync — bragsheet → dev plan
├── bin/                              # CLI scripts (wrappers around `claude`)
│   ├── growth-capture                # Pipe input → growth-notes + bragsheet-entry
│   ├── weekly-init                   # Create a new YYYY-WNN.md from template
│   ├── bragsheet-rollup              # Extract bragsheet rows from weekly notes
│   ├── pg-sync                       # Draft P&G self-reflection from bragsheet + cycle notes
│   └── review-agent                  # Run a high-impact code/design review
├── docs/
│   ├── bragsheet.md                  # Running bragsheet table, organized by P&G cycle
│   ├── weekly/                       # Weekly notes (YYYY-WNN.md)
│   │   └── README.md                 # Template and weekly workflow
│   └── growth/
│       ├── README.md                 # P&G and growth documentation overview
│       ├── signals.md                # Impact signal taxonomy and evidence guide
│       └── cycles/                   # Per-review-cycle growth notes
└── mcps/
    ├── README.md                     # MCP overview
    ├── glean/config.json             # Glean MCP (covers Slack + all company resources)
    ├── slack/config.json             # Redirects to Glean
    ├── github/config.json            # GitHub MCP setup
    └── gdocs/config.json             # Google Drive MCP setup (for writing/updating docs)
```

## Skills

| Skill | Description |
|-------|-------------|
| `growth-notes` | Turn feedback threads into 6-section growth notes with high-impact signal detection and cross-team tagging. |
| `bragsheet-entry` | Convert a growth input into a single bragsheet table row, or output a no-signal comment. |
| `weekly-review` | Synthesize a weekly note into 3 bullets: Focus Check, Cross-team Quality, Priority Shift. |
| `rewrite-inline` | Rewrite text for clarity (default), P&G self-reflection (pg), or public content (external). |

## Agent Profiles

| Profile | Skills | MCPs |
|---------|--------|------|
| `growth-agent` | growth-notes, bragsheet-entry, weekly-review, rewrite-inline | glean, gdocs |
| `reviewer-agent` | rewrite-inline | — (uses `gh` CLI) |
| `pg-sync-agent` | rewrite-inline, bragsheet-entry | glean |

## Bin Scripts

| Script | Usage |
|--------|-------|
| `bin/growth-capture` | `pbpaste \| bin/growth-capture` — pipe a growth input through growth-notes and bragsheet-entry |
| `bin/weekly-init` | `bin/weekly-init [YYYY-WNN]` — create a new weekly note from template |
| `bin/bragsheet-rollup` | `bin/bragsheet-rollup [--since YYYY-WNN]` — collect bragsheet rows from weekly notes |
| `bin/pg-sync` | `bin/pg-sync [--cycle YYYY-QN] [--output-file file.md]` — draft P&G self-reflection |
| `bin/review-agent` | `bin/review-agent --pr 1234` or `--file path.md` — run a high-impact review |

## Workflows

### Weekly capture
```bash
bin/weekly-init                         # create this week's note
# ... work through the week ...
pbpaste | bin/growth-capture            # capture a Slack thread, feedback, or incident
```

### Cycle rollup
```bash
bin/bragsheet-rollup --append-file docs/bragsheet.md
bin/pg-sync --output-file docs/growth/cycles/2026-Q2.md
```

### Code or design review
```bash
bin/review-agent --pr 1234
bin/review-agent --file docs/design.md --output-file review.md
```

## MongoDB Leadership Principles

- **Act Like Owners** — end-to-end responsibility; long-term thinking
- **Communicate with Clarity** — precise, structured, audience-aware
- **Focus on Outcomes** — impact over activity; define success first
- **Never Stop Learning** — seek feedback, reflect, improve continuously
- **Build Extraordinary Teams** — hire, develop, and create inclusive environments

## Setup

1. Clone this repo.
2. Run `chmod +x bin/*` to make scripts executable.
3. Configure MCPs using the setup steps in `mcps/*/config.json` and add them to your Claude Code MCP settings.
4. Run `bin/weekly-init` to create your first weekly note.
