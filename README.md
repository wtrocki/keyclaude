# aiskills

A personal repository of Claude Code skills, MCP/tool configurations, and growth documentation.

## Repository Structure

```
.
├── .claude/
│   └── skills/                 # Claude Code local skills (YAML front-matter + prompt)
│       ├── rewrite-inline.md   # Rewrite text for clarity and professionalism
│       └── growth-notes.md     # Turn feedback threads into growth notes
├── mcps/
│   └── README.md               # MCP server configs and planned integrations
└── docs/
    └── growth/
        └── README.md           # Performance & growth documentation
```

## Skills

| Skill | Description |
|-------|-------------|
| `rewrite-inline` | Rewrite selected text to be clearer, more professional, and outcome-focused while preserving meaning. |
| `growth-notes` | Turn feedback threads into concise growth notes aligned with MongoDB's Leadership Principles. |

## Using Skills with Claude Code

Place the `.claude/skills/` directory at the root of any project (or use this repo as a checkout source). Claude Code will automatically discover and expose skills defined here.

## Contributing

Add new skills as Markdown files in `.claude/skills/` with a YAML front-matter block containing at minimum `name` and `description` fields.
