# aiskills

A personal AI operating layer for a Staff engineer — version-controlled skills, agent profiles, and keyboard shortcuts that reduce friction in writing and career tracking.

## Why this exists

Two problems eat engineer time quietly:

**Writing.** Slack messages, PR replies, design doc comments, performance review bullets — you write a draft, it's rough, you spend five minutes fixing it or you send it rough. Neither is great. The shortcuts in this repo let you select any text, hit a key, and get a polished version in your clipboard in seconds — without leaving the app you're in.

**Career tracking.** High-impact work is invisible if you don't capture it. A Slack thread where you unblocked three teams, an incident where your decision mattered, a review that changed the design — these events fade fast. The growth tools here turn raw input (paste a thread, paste a feedback note) into structured bragsheet rows and weekly signals automatically, so P&G and performance review prep become a rollup rather than an excavation.

## What's here

- **Mac shortcuts** — four Quick Actions via macOS Services or Raycast (copy text → refined version in clipboard) for internal writing, P&G bullets, public content, and PR replies
- **Growth capture** — pipe any Slack thread or feedback note through Claude to extract career signals and append bragsheet rows
- **Weekly notes** — templated weekly notes with automatic bragsheet signal extraction
- **P&G sync** — synthesize weeks of notes into a self-reflection draft aligned to MongoDB Leadership Principles
- **Review agent** — Staff-level framing for PR and design doc reviews

Everything is a bash script or a markdown file. No framework, no dependencies beyond the `claude` CLI and standard macOS tools.

## Skills

| Skill | Description |
|-------|-------------|
| `growth-notes` | Turn feedback threads into 6-section growth notes with high-impact signal detection and cross-team tagging. |
| `bragsheet-entry` | Convert a growth input into a single bragsheet table row, or output a no-signal comment. |
| `weekly-review` | Synthesize a weekly note into 3 bullets: Focus Check, Cross-team Quality, Priority Shift. |
| `rewrite-inline` | Rewrite text for clarity (default), P&G self-reflection (pg), or public content (external). |

## Agent Profiles

| Profile | Purpose |
|---------|---------|
| `growth-agent` | Growth notes, bragsheet, weekly review |
| `reviewer-agent` | Polish your own PR/doc comment replies |
| `pg-sync-agent` | P&G self-reflection drafting |

## Bin Scripts

| Script | Usage |
|--------|-------|
| `bin/growth-capture` | `pbpaste \| bin/growth-capture` — pipe a growth input through growth-notes and bragsheet-entry |
| `bin/weekly-init` | `bin/weekly-init [YYYY-WNN]` — create a new weekly note from template |
| `bin/bragsheet-rollup` | `bin/bragsheet-rollup [--since YYYY-WNN]` — collect bragsheet rows from weekly notes |
| `bin/pg-sync` | `bin/pg-sync [--cycle YYYY-QN] [--output-file file.md]` — draft P&G self-reflection |
| `bin/review-agent` | `bin/review-agent --pr 1234` or `--file path.md` — run a high-impact review |
| `bin/rewrite` | `echo "text" \| bin/rewrite [default\|pg\|external]` — rewrite text, copy to clipboard |
| `bin/rewrite-reply` | `echo "text" \| bin/rewrite-reply` — polish a PR/doc reply, copy to clipboard |

---

## Mac Shortcuts (Quick Actions)

Four macOS Services that work in **any app** — select text, hit a key, get the result in your clipboard with a sound + notification.

| Shortcut | Script | When to use |
|----------|--------|-------------|
| **Rewrite: Default** | `bin/rewrite default` | Slack messages, emails, internal docs |
| **Rewrite: P&G** | `bin/rewrite pg` | Self-reflection bullets, P&G doc entries |
| **Rewrite: External** | `bin/rewrite external` | Blog posts, LinkedIn, conference submissions |
| **Rewrite: Reply** | `bin/rewrite-reply` | Your own PR/doc comment replies (paste just your reply, or the full thread + reply) |

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
| Rewrite: P&G | `⌃⌥P` |
| Rewrite: External | `⌃⌥E` |
| Rewrite: Reply | `⌃⌥Y` |

### 3. Test each shortcut

Copy the example text below into any editor (Notes, TextEdit, VS Code), select it, trigger the shortcut, then paste (`⌘V`) to see the result.

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

**Rewrite: P&G** `⌃⌥P`

Use for: P&G self-reflection bullets, bragsheet entries, performance review text — anything where you need to lead with outcome and show leadership signal.

```
I worked on improving the MCP server setup and helped a few other teams get it
running. I also wrote some documentation and joined a couple of cross-team meetings
to answer questions about how it works.
```

Expected: leads with impact ("Reduced onboarding time…"), tags a Leadership Principle in parentheses, `[NEEDS EVIDENCE]` where a claim lacks a citable artifact.

---

**Rewrite: External** `⌃⌥E`

Use for: LinkedIn posts, blog drafts, conference CFPs — anything going outside MongoDB where internal names and Jira refs mean nothing.

```
At MongoDB we used our internal Remote MCP gateway (tracked in CLOUDP-99812) to
connect Claude Code to Atlas and internal tooling. The DX team and DevProd worked
together to ship this as part of our AI developer experience initiative.
```

Expected: Jira ref removed, internal team names dropped or replaced with "our team", "Remote MCP" explained briefly for an external audience.

---

**Rewrite: Reply** `⌃⌥Y`

Use for: your draft reply in a GitHub PR thread, a Notion/Google Doc comment, or a design review. Select your reply alone, or the full thread + your reply — it handles both.

```
[Thread context]
Why are we scanning the full collection here instead of using an index? This will
degrade badly at scale.

[Your draft reply]
yeah thats a fair point, we do have an index on that field but its not being used
because of the query shape. i can add a hint or restructure the query, not sure
which is better, probably the hint is easier but restructuring would be cleaner
long term. will take a look
```

Select everything above, trigger `⌃⌥Y`. Expected: only your reply comes back, tightened — the thread context is used for understanding but not included in output.

> Select just your reply (without the thread) if you don't need the model to see the context.

### Troubleshooting

| Symptom | Fix |
|---------|-----|
| Shortcuts don't appear in Services menu | Re-run `shortcuts/install.sh`; log out and back in |
| No sound / no notification | Check that `bin/rewrite` is executable: `chmod +x bin/rewrite bin/rewrite-reply` |
| Empty clipboard after trigger | Run `echo "test" \| bin/rewrite` in terminal to see the error |
| `claude: command not found` | Add `~/.local/bin` to PATH in your shell profile |

---

## Raycast Shortcuts (Alternative)

Raycast Script Commands are a simpler alternative to macOS Services — no Info.plist, no cache flushing. Scripts live in `shortcuts/raycast/` and are loaded directly by Raycast.

**Flow difference:** Raycast commands read from clipboard rather than selected text. Copy the text you want to rewrite, then trigger the shortcut. The result lands back in your clipboard.

| Command | Key | Script |
|---------|-----|--------|
| Rewrite: Default | `⌃⌥R` | `rewrite-default.sh` |
| Rewrite: Reply | `⌃⌥Y` | `rewrite-reply.sh` |
| Rewrite: P&G | `⌃⌥P` | `rewrite-png.sh` |
| Rewrite: External | `⌃⌥E` | `rewrite-external.sh` |

### Setup

1. [Install Raycast](https://www.raycast.com/) if you haven't already.
2. Open Raycast → **Settings → Extensions → Script Commands**.
3. Click **Add Directories** and select `shortcuts/raycast/` inside this repo.
4. The four "Rewrite:" commands appear immediately — keyboard shortcuts are pre-configured in the script headers.

> Raycast picks up file changes live — pulling this repo automatically updates the commands.

### Troubleshooting

| Symptom | Fix |
|---------|-----|
| Commands not appearing | Confirm the `shortcuts/raycast/` directory is added in Raycast Settings → Extensions → Script Commands |
| Permission denied | Run `chmod +x shortcuts/raycast/*.sh` |
| Empty clipboard after trigger | Run `pbpaste \| bin/rewrite default` in terminal to see the error |
| `claude: command not found` | Add `~/.local/bin` and `/opt/homebrew/bin` to PATH in your shell profile |

---

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

## Setup

1. Clone this repo.
2. Activate shortcuts — pick one:
   - **macOS Services:** run `shortcuts/install.sh`, then log out/in, then assign keys in System Settings → Keyboard → Shortcuts → Services → Text
   - **Raycast:** add `shortcuts/raycast/` as a Script Commands directory in Raycast Settings
3. Run `bin/weekly-init` to create your first weekly note.

### Separate data repo (optional)

All bin scripts read and write to `$GROWTH_REPO` when set, falling back to `docs/` inside this repo.

To keep personal notes in a separate repository:

```bash
# in your shell profile (~/.zshrc)
export GROWTH_REPO=~/Projects/growth-notes/docs
```

Expected layout of the data repo:
```
growth-notes/
  docs/
    bragsheet.md
    weekly/
    growth/
      cycles/
      signals.md
    slack-notes/
```

No changes to any script needed — set the env var and the tools follow.
