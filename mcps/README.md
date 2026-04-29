# MCPs & Tools

This directory holds configurations and references for Model Context Protocol (MCP) servers and tools used alongside Claude Code skills.

## Structure

```
mcps/
└── README.md       # This file — overview and planned MCP integrations
```

## Planned MCPs / Tools

| Name | Purpose | Status |
|------|---------|--------|
| GitHub MCP | Interact with GitHub issues, PRs, and repos | Planned |
| Slack MCP | Read Slack threads for use with `growth-notes` skill | Planned |
| MongoDB Atlas MCP | Query Atlas clusters directly from Claude | Planned |

## Adding a New MCP

1. Create a subfolder named after the MCP (e.g., `mcps/github/`).
2. Add a `config.json` or `README.md` describing setup steps and available tools.
3. Update the table above.
