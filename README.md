# ClaudeSnip

**Engineering Personal Enterprise Assistant** — *Idea, In Progress*

A personal productivity layer for engineers that uses keyboard shortcuts to trigger Claude Code agents directly from the desktop. Agents perform scheduled tasks, weekly planning, and message rewriting — without breaking your flow.

---

## Why ClaudeSnip

Engineers spend significant time on two things that shouldn't require much effort:

**Writing.** Slack messages, PR replies, doc comments — you write a draft, it's rough, and you either spend five minutes polishing it or send it rough. ClaudeSnip lets you select any text, hit a key, and get a rewritten version in your clipboard in seconds, from any app.

**Context switching.** Fetching relevant data before replying, pulling up last week's notes before a meeting, surfacing what matters before a 1:1 — each lookup is a small tax that compounds. ClaudeSnip agents do the fetch automatically, injecting context before you act.

---

## Core Capabilities

### Smart Message Rewriting
Keyboard shortcuts invoke agents to rewrite Slack messages with correct style and formatting. Writing insights surface inline so you improve over time — not just in this message.

### Native Mac Shortcuts
Agent skills are bound to system-level shortcuts for low-friction access from any app. Select text, hit the key, get the result. No alt-tabbing, no copy-paste workflow.

### Raycast Integration
Extensions expose agent skills as Raycast actions, composable with existing Raycast workflows. Use ClaudeSnip skills anywhere Raycast is already in your muscle memory.

### Context-Aware Enrichment
Skills automatically fetch and inject relevant data from cloud.mongodb.com, MCP servers, and Glean before sending. Your messages arrive with the right context already attached.

### Scheduled Learning Sessions
Agents deliver scheduled lessons based on user-triggered sessions — coaching that adapts to your cadence and what you're actually working on.

---

## Quick Start

### 3 Daily Actions

| Action | When | How |
|--------|------|-----|
| **Rewrite** | Before sending anything important | Select text → `⌃⌥R` (or copy → Raycast) |
| **Leadership feedback** | After a notable thread, review, or decision | `pbpaste \| bin/leadership-feedback` |
| **Weekly** | Monday to create, Friday to review | `bin/weekly-init` / `bin/weekly-review` |

### Install

```bash
# 1. Clone
git clone https://github.com/wtrocki/claudesnip.git
cd claudesnip

# 2. Set your data repo path
echo 'export GROWTH_REPO=~/Projects/engineering-notes/data' >> ~/.zshrc

# 3. Activate shortcuts — pick one:
#    macOS Services
shortcuts/install.sh
#    then: System Settings → Keyboard → Shortcuts → Services → Text → assign keys

#    Raycast: add shortcuts/raycast/ as a Script Commands directory in Raycast Settings
```

Suggested key bindings:

| Action | Key |
|--------|-----|
| Rewrite: Default | `⌃⌥R` |
| Rewrite: Leadership | `⌃⌥P` |
| Rewrite: External | `⌃⌥E` |

---

## Skills

Skills are stateless — they transform input into structured output.

| Skill | What it does |
|-------|-------------|
| `rewrite-inline` | Rewrite text: `default` (internal comms), `leadership` (outcome-first), `external` (public-facing) |
| `leadership-feedback` | Analyze a thread: signals present, signals missing, one concrete recommendation |
| `weekly-review` | Synthesize a weekly note into four bullets: Focus, Cross-team Quality, Priority Shift, Priority Judgment |

## Agents

Agents are coaching contexts — they hold a persona and invoke skills for deeper analysis.

| Profile | Purpose |
|---------|---------|
| `leadership-agent` | Staff engineering coaching: analyzes notes and threads, identifies leadership signals, coaches toward staff patterns |

```bash
claude --profile .claude/profiles/leadership-agent.yaml
```

---

## Architecture

### Two-repo model

`claudesnip` is the **engine**: skills, agents, bin scripts, and shortcuts. No personal data lives here.

Your `engineering-notes` repo is the **data layer**: weekly notes, leadership log, and work-specific context. The engine reads from it and writes back to it.

```
claudesnip/                        engineering-notes/data/
  bin/weekly-init      ──writes──▶   weekly/YYYY-WNN.md
  bin/weekly-review    ──reads ──▶   weekly/YYYY-WNN.md
                       ──writes──▶   weekly/YYYY-WNN.md (## Weekly Review appended)
  bin/leadership-feedback ─reads──▶  (stdin)
                       ──writes──▶   leadership-log.md
```

### Bin Scripts

| Script | Usage |
|--------|-------|
| `bin/rewrite` | `echo "text" \| bin/rewrite [default\|leadership\|external]` |
| `bin/leadership-feedback` | `pbpaste \| bin/leadership-feedback` |
| `bin/weekly-init` | `bin/weekly-init [YYYY-WNN]` — create a new weekly note |
| `bin/weekly-review` | `bin/weekly-review [YYYY-WNN]` — synthesize into four bullets |

---

## Status

This project is in active development. Planned work includes:

- [ ] Scheduled agent sessions (lesson delivery, weekly prompts)
- [ ] Deeper Glean and MCP integration for context enrichment
- [ ] cloud.mongodb.com data injection for MongoDB-specific workflows
- [ ] Expanded Raycast extension surface
- [ ] Open source release with general availability

Contributions and feedback welcome once the project opens.

---

*Will be open sourced and generally available.*
