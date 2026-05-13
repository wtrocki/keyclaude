# KeyClaude

![KeyClaude Logo](slides/examples/data/logo.png)

**Engineering Personal Assistant**

A personal productivity layer for engineers that uses keyboard shortcuts to trigger Claude Code agents directly from the desktop. Agents perform scheduled tasks, weekly planning, and message rewriting — without breaking your flow.

---

## Why KeyClaude

Engineers spend significant time on two things that shouldn't require much effort:

**Writing.** Slack messages, PR replies, doc comments — you write a draft, it's rough, and you either spend five minutes polishing it or send it rough. KeyClaude lets you select any text, hit a key, and get a rewritten version in your clipboard in seconds, from any app.

**Context switching.** Fetching relevant data before replying, pulling up last week's notes before a meeting, surfacing what matters before a 1:1 — each lookup is a small tax that compounds. KeyClaude agents do the fetch automatically, injecting context before you act.

---

## Core Capabilities

### Smart Message Rewriting
Keyboard shortcuts invoke agents to rewrite Slack messages with correct style and formatting. Writing insights surface inline so you improve over time — not just in this message.

### Native Mac Shortcuts
Agent skills are bound to system-level shortcuts for low-friction access from any app. Select text, hit the key, get the result. No alt-tabbing, no copy-paste workflow.

### Raycast Integration
Extensions expose agent skills as Raycast actions, composable with existing Raycast workflows. Use KeyClaude skills anywhere Raycast is already in your muscle memory.

### Context-Aware Enrichment
Skills can fetch and inject relevant data from MCP servers (Glean, GitHub, Slack, and others) before sending. Your messages arrive with the right context already attached.

### Scheduled Learning Sessions
Agents deliver scheduled lessons based on user-triggered sessions — coaching that adapts to your cadence and what you're actually working on.

### Slide Deck Creator
Type `/slides <topic>` in Claude Code to generate a complete reveal.js presentation. The skill writes a Markdown source file and builds a standalone HTML deck via pandoc. Includes a MongoDB-branded CSS theme; works with any reveal.js theme. Edit the Markdown and rebuild with the printed pandoc command.

---

## Quick Start

### 3 Daily Actions

| Action | When | How |
|--------|------|-----|
| **Rewrite** | Before sending anything important | Select text → `⌃⌥R` (or copy → Raycast) |
| **Leadership feedback** | After a notable thread, review, or decision | `pbpaste \| bin/leadership-feedback` |
| **Weekly** | Monday to create, Friday to review | `bin/weekly-init` / `bin/weekly-review` |

NOTE: Lefership feedback and Weekly are advanced features. 

### Install

```bash
# 1. Clone
git clone https://github.com/wtrocki/keyclaude.git
cd keyclaude

# 2. Run the installer (installs pandoc, sets up GROWTH_REPO, installs macOS shortcuts)
./install.sh

# 3. Activate shortcuts — pick one:
#    macOS Services: assign keys in System Settings → Keyboard → Shortcuts → Services → Text
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
| `slides` | Generate a reveal.js slide deck from a topic: `/slides <topic>` — outputs editable Markdown + standalone HTML |

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

`keyclaude` is the **engine**: skills, agents, bin scripts, and shortcuts. No personal data lives here.

Your data directory (`$GROWTH_REPO`) is the **data layer**: weekly notes, leadership log, and work-specific context. The engine reads from it and writes back to it.

```
keyclaude/                    $GROWTH_REPO/
  bin/weekly-init      ──writes──▶   weekly/YYYY-WNN.md
  bin/weekly-review    ──reads ──▶   weekly/YYYY-WNN.md
                       ──writes──▶   weekly/YYYY-WNN.md (## Weekly Review appended)
  bin/leadership-feedback ─reads──▶  (stdin)
                       ──writes──▶   leadership-log.md
  bin/rewrite          ──writes──▶   writing-insights.md
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
- [ ] Deeper MCP integration for context enrichment (Glean, GitHub, Slack)
- [ ] Custom data source injection for domain-specific workflows
- [ ] Expanded Raycast extension surface

Contributions and feedback welcome.
