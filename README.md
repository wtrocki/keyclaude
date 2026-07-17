# KeyClaude

![KeyClaude Logo](slides/examples/data/logo.png)

**Engineering Personal Assistant**

A personal productivity layer for engineers that uses keyboard shortcuts to trigger AI agents directly from the desktop. Agents perform scheduled tasks, weekly planning, and message rewriting — without breaking your flow.

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
Type `/slides <topic>` in your AI CLI to generate a complete reveal.js presentation. The skill writes a Markdown source file and builds a standalone HTML deck via pandoc. Includes a MongoDB-branded CSS theme; works with any reveal.js theme. Edit the Markdown and rebuild with the printed pandoc command.

---

## Quick Start

### 3 Daily Actions

| Action | When | How |
|--------|------|-----|
| **Rewrite** | Before sending anything important | Select text → `⌃⌥R` (or copy → Raycast) |
| **Growth capture** | After a 1:1, review, or notable discussion | Select text → `⌃⌥G` (or `pbpaste \| bin/growth-capture`) |
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

The bin scripts use **opencode** by default and fall back to **Claude Code** if opencode isn't found.

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
| `weekly-review` | Synthesize a weekly note into five bullets: Focus, Cross-team Quality, Priority Shift, Priority Judgment, Mentorship Signal |
| `growth-capture` | Extract growth opportunities from any input (discussion, feedback, or development plan) — logs dated entries tied to leadership principles |
| `monthly-review` | Aggregate a period's weekly notes against the monthly plan into a snapshot: Impact Stories by North Star + LP tag, What Closed/Shipped, Major/Minor/Elective draft plan, backlog delta. Reads `growth/leadership-principles.md` + `growth/signals.md` as evaluation context — seed examples in [`examples/growth/`](examples/growth/) |
| `slides` | Generate a reveal.js slide deck from a topic: `/slides <topic>` — outputs editable Markdown + standalone HTML |

## Agents

Agents are coaching contexts — they hold a persona and invoke skills for deeper analysis.

| Profile | Purpose |
|---------|---------|
| `leadership-agent` | Staff engineering coaching: analyzes notes and threads, identifies leadership signals, coaches toward staff patterns |

```bash
# Requires an AI CLI that supports agents (e.g., opencode, claude)
# opencode:  opencode --agent .claude/profiles/leadership-agent.yaml
# claude:    claude --profile .claude/profiles/leadership-agent.yaml
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
  bin/growth-capture   ──reads ──▶   (stdin or file)
                       ──writes──▶   growth-log.md
  bin/monthly-review   ──reads ──▶   growth/*EDP*.md, growth/backlog.md, weekly/*.md
                       ──writes──▶   growth/reviews/YYYY-MM-DD.md
```

### Bin Scripts

| Script | Usage |
|--------|-------|
| `bin/rewrite` | `echo "text" \| bin/rewrite [default\|leadership\|external]` |
| `bin/leadership-feedback` | `pbpaste \| bin/leadership-feedback` |
| `bin/growth-capture` | `pbpaste \| bin/growth-capture` or `bin/growth-capture /path/to/plan.md` |
| `bin/weekly-init` | `bin/weekly-init [YYYY-WNN]` — create a new weekly note |
| `bin/weekly-review` | `bin/weekly-review [YYYY-WNN]` — synthesize into five bullets |
| `bin/monthly-review` | `bin/monthly-review [YYYY-MM-DD]` — snapshot the period since the last cutoff into `growth/reviews/<cutoff>.md` |

---

## Status

This project is in active development. Planned work includes:

- [ ] Scheduled agent sessions (lesson delivery, weekly prompts)
- [ ] Deeper MCP integration for context enrichment (Glean, GitHub, Slack)
- [ ] Custom data source injection for domain-specific workflows
- [ ] Expanded Raycast extension surface

Contributions and feedback welcome.
