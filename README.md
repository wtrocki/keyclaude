# aiskills

A personal AI operating layer for staff engineering — skills, agents, and keyboard shortcuts that reduce friction in communication and leadership development.

## Why this exists

Two problems eat engineer time quietly:

**Writing.** Slack messages, PR replies, design doc comments — you write a draft, it's rough, you spend five minutes fixing it or you send it rough. Neither is great. The shortcuts here let you select any text, hit a key, and get a polished version in your clipboard in seconds — without leaving the app you're in.

**Leadership visibility.** Staff-level work is invisible if you don't frame it correctly. A Slack thread where you unblocked three teams, an incident where your decision changed the outcome, a review that shifted the design direction — these are leadership moments most engineers don't surface. The tools here help identify, frame, and amplify those signals before they fade.

## 3 Daily Actions

| Action | When | How |
|--------|------|-----|
| **Rewrite** | Before sending anything important | Select text → `⌃⌥R` (or copy → Raycast) |
| **Leadership feedback** | After a notable Slack thread, review, or decision | `pbpaste \| bin/leadership-feedback` |
| **Weekly** | Monday to create, Friday to review | `bin/weekly-init` / `bin/weekly-review` |

## Skills

Skills are stateless — they transform input into structured output. No session state, no context.

| Skill | What it does |
|-------|-------------|
| `rewrite-inline` | Rewrite text in three modes: `default` (internal comms), `leadership` (outcome-first, evidence-flagged), `external` (public-facing) |
| `leadership-feedback` | Analyze a thread or message: signals present, signals missing, one concrete follow-up recommendation |
| `weekly-review` | Synthesize a weekly note into four bullets: Focus Check, Cross-team Quality, Priority Shift, Priority Judgment |

## Agent Profiles

Agents are coaching contexts — they hold a persona and use skills for deeper analysis.

| Profile | Purpose |
|---------|---------|
| `leadership-agent` | Staff engineering coaching: analyzes notes and threads, identifies leadership signals, coaches toward staff engineering patterns |

Run interactively:

```bash
claude --profile .claude/profiles/leadership-agent.yaml
```

Paste a weekly note, a Slack thread, or a design doc excerpt. The agent coaches on what leadership signals are present, what's missing, and how to reframe.

## Bin Scripts

| Script | Usage |
|--------|-------|
| `bin/rewrite` | `echo "text" \| bin/rewrite [default\|leadership\|external]` — rewrite text, copy to clipboard |
| `bin/leadership-feedback` | `pbpaste \| bin/leadership-feedback` — analyze a thread, copy result to clipboard |
| `bin/weekly-init` | `bin/weekly-init [YYYY-WNN]` — create a new weekly note from template |
| `bin/weekly-review` | `bin/weekly-review [YYYY-WNN]` — synthesize the week's note into four bullets |

## Mac Shortcuts (Quick Actions)

Four macOS Services that work in **any app** — select text, hit a key, get the result in your clipboard with a sound + notification.

| Shortcut | Script | When to use |
|----------|--------|-------------|
| **Rewrite: Default** | `bin/rewrite default` | Slack messages, emails, internal docs |
| **Rewrite: Leadership** | `bin/rewrite leadership` | Self-reflection bullets, impact framing |
| **Rewrite: External** | `bin/rewrite external` | Blog posts, LinkedIn, conference submissions |

### 1. Install

```bash
shortcuts/install.sh
```

This symlinks all four `shortcuts/*.workflow` into `~/Library/Services/`. The repo is the source of truth — pull and re-run to update.

All shortcuts are installed but **inert until you assign a key** in System Settings — so there's no risk of accidental triggering.

### 2. Map keyboard shortcuts

1. Open **System Settings → Keyboard → Keyboard Shortcuts → Services → Text**
2. Find the four "Rewrite:" entries and double-click to assign keys

Suggested bindings:

| Action | Key |
|--------|-----|
| Rewrite: Default | `⌃⌥R` |
| Rewrite: Leadership | `⌃⌥P` |
| Rewrite: External | `⌃⌥E` |

### 3. Test each shortcut

Copy the example text below into any editor, select it, trigger the shortcut, then paste (`⌘V`) to see the result.

---

**Rewrite: Default** `⌃⌥R`

Use for: Slack messages, internal emails, doc comments — anything you wrote quickly and want to tighten before sending.

```
hey so i wanted to flag that the latency issue we saw last week is probably related
to the connection pool config. i think maybe we should look at increasing the max
connections but i'm not 100% sure, could be something else too. let me know what
you think and if you want i can take a look at it more next week
```

Expected: one or two clear sentences, hedges removed, action item surfaced.

---

**Rewrite: Leadership** `⌃⌥P`

Use for: self-reflection bullets, impact framing, performance review text — anything where you need to lead with outcome and show leadership signal.

```
I worked on improving the MCP server setup and helped a few other teams get it
running. I also wrote some documentation and joined a couple of cross-team meetings
to answer questions about how it works.
```

Expected: leads with impact ("Reduced onboarding time…"), `[NEEDS EVIDENCE]` where a claim lacks a citable artifact, Leadership Principle in parentheses.

---

**Rewrite: External** `⌃⌥E`

Use for: LinkedIn posts, blog drafts, conference CFPs — anything going outside your organization.

```
At our company we used our internal tool to connect Claude Code to internal tooling.
The DX team and DevProd worked together to ship this as part of our AI developer
experience initiative.
```

Expected: internal team names dropped or replaced, internal tool names explained briefly for an external audience.

### Troubleshooting

| Symptom | Fix |
|---------|-----|
| Shortcuts don't appear in Services menu | Re-run `shortcuts/install.sh`; log out and back in |
| No sound / no notification | Check that `bin/rewrite` is executable: `chmod +x bin/rewrite` |
| Empty clipboard after trigger | Run `echo "test" \| bin/rewrite` in terminal to see the error |
| `claude: command not found` | Add `~/.local/bin` to PATH in your shell profile |

---

## Raycast Shortcuts (Alternative)

Raycast Script Commands read from clipboard rather than selected text. Copy the text you want to rewrite, then trigger the shortcut. The result lands back in your clipboard.

| Command | Key | Script |
|---------|-----|--------|
| Rewrite: Default | `⌃⌥R` | `rewrite-default.sh` |
| Rewrite: Leadership | `⌃⌥P` | `rewrite-leadership.sh` |
| Rewrite: External | `⌃⌥E` | `rewrite-external.sh` |

### Setup

1. [Install Raycast](https://www.raycast.com/) if you haven't already.
2. Open Raycast → **Settings → Extensions → Script Commands**.
3. Click **Add Directories** and select `shortcuts/raycast/` inside this repo.
4. The four "Rewrite:" commands appear immediately — keyboard shortcuts are pre-configured in the script headers.

### Troubleshooting

| Symptom | Fix |
|---------|-----|
| Commands not appearing | Confirm the `shortcuts/raycast/` directory is added in Raycast Settings |
| Permission denied | Run `chmod +x shortcuts/raycast/*.sh` |
| Empty clipboard after trigger | Run `pbpaste \| bin/rewrite default` in terminal to see the error |
| `claude: command not found` | Add `~/.local/bin` and `/opt/homebrew/bin` to PATH in your shell profile |

---

## Daily Workflows

### Communication rewrite
```bash
echo "rough draft" | bin/rewrite              # default: tighten for internal comms
pbpaste | bin/rewrite leadership              # outcome-first, evidence-flagged
pbpaste | bin/rewrite external               # strip internals, add context
```

### Leadership feedback on a thread
```bash
pbpaste | bin/leadership-feedback            # result → clipboard + saved to engineering-notes/leadership-log.md
```

### Weekly cadence
```bash
bin/weekly-init                              # Monday: create this week's note in engineering-notes
# ... fill in Planned, Done, Impact Items as the week unfolds ...
bin/weekly-review                            # Friday: synthesize + append ## Weekly Review to the note
bin/weekly-review 2026-W19                  # or specify a week explicitly
```

---

## Coaching Layer

The `leadership-agent` profile provides interactive AI coaching toward a staff engineering profile. Run it directly:

```bash
claude --profile .claude/profiles/leadership-agent.yaml
```

Paste a weekly note, a Slack thread, a design doc excerpt, or a message draft. The agent:
- Identifies which leadership signals are present and which are missing
- Coaches on how to reframe work to show scope and organizational impact
- Uses the `rewrite-inline` skill to polish specific messages on request
- Can search across your notes and Slack history via the Glean MCP

For longer-term coaching, the agent can be given context from your `engineering-notes` repo — growth opportunities, past decisions, and patterns across weeks. Set `$GROWTH_REPO` and point the agent at specific files for richer analysis.

---

## Two-repo model

This repo (`aiskills`) is the **engine**: skills, agents, bin scripts, and shortcuts. It contains no personal data.

Your `engineering-notes` repo is the **data layer**: weekly notes, leadership log, MongoDB-specific context, and anything work-specific. The engine reads from it and writes back to it — every action that produces output contributes back.

```
aiskills/                          engineering-notes/data/
  bin/weekly-init      ──writes──▶   weekly/YYYY-WNN.md
  bin/weekly-review    ──reads ──▶   weekly/YYYY-WNN.md
                       ──writes──▶   weekly/YYYY-WNN.md  (## Weekly Review appended)
  bin/leadership-feedback ─reads──▶  (stdin)
                       ──writes──▶   leadership-log.md
```

Set `$GROWTH_REPO` once and all scripts follow:

```bash
# in your shell profile (~/.zshrc)
export GROWTH_REPO=~/Projects/engineering-notes/data
```

Expected layout of the data repo:

```
engineering-notes/
  data/
    weekly/              # weekly notes (created by weekly-init)
    leadership-log.md    # timestamped leadership feedback entries (created on first use)
```

## Setup

1. Clone this repo.
2. Set `$GROWTH_REPO` in your shell profile (see above).
3. Activate shortcuts — pick one:
   - **macOS Services:** run `shortcuts/install.sh`, then log out/in, then assign keys in System Settings → Keyboard → Shortcuts → Services → Text
   - **Raycast:** add `shortcuts/raycast/` as a Script Commands directory in Raycast Settings
4. Run `bin/weekly-init` to create your first weekly note.
