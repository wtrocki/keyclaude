# KeyClaude

![](data/logo.png){width=320}

**Engineering Personal Assistant**

## The Problem: Writing

Engineers write dozens of messages a day.

- Slack messages, PR comments, doc updates, status notes
- You write a draft — it's rough
- You either **spend 5 minutes polishing** or **send it rough**
- Neither is good. Both waste time.

## The Problem: Context Switching

Every lookup before replying is a small tax.

- Pull up last week's notes before a 1:1
- Fetch relevant data before answering a thread
- Surface what matters before a decision
- Each lookup interrupts flow — and they **compound**

## The Problem: AI is Right There, But...

AI tools exist. The friction is the workflow.

- Open a new tab → paste text → copy result back
- Switch apps, break focus, lose context
- No integration with your actual writing surface
- Works for one-off tasks, not for dozens of micro-writes a day

## Sound Familiar?

![](data/GAP.jpeg){width=80%}

## What KeyClaude Does

**Invoke AI from any app. Without leaving it.**

```
Select text  →  hit a key  →  rewritten text in clipboard
```

- Bound to system-wide macOS shortcuts
- Works in Slack, email, docs, terminal — anywhere
- Result in clipboard before you notice you pressed the key

## Demo 1: Rewrite a Message

Three modes, one shortcut family:

| Shortcut | Mode | Best for |
|----------|------|---------|
| `⌃⌥R` | Default | Slack, email, PR comments |
| `⌃⌥P` | Leadership | Status updates, staff reviews |
| `⌃⌥E` | External | Blog posts, LinkedIn, conference |

Select text → hit shortcut → Glass sound → paste

## What Leadership Mode Actually Does

Transforms activity-framing into outcome-framing:

> *"I worked on the runbook and updated the deployment steps"*

becomes:

> *"Reduced launch risk by standardising the deployment runbook (communicates with clarity)*
> *[NEEDS EVIDENCE for adoption claim]"*

Flags missing evidence. Tags leadership behaviors inline.

## Demo 2: Writing Insights

Every rewrite also coaches you — silently, in the background.

```
bin/rewrite runs  →  result to clipboard
                  →  2–3 writing patterns logged to writing-insights.md
```

Not "here's what changed." But: **"here's a habit you repeat that weakens your writing."**

Patterns accumulate. You improve over weeks, not just in this message.

## Demo 2: Leadership Feedback

Analyze any Slack thread or message:

```bash
pbpaste | bin/leadership-feedback
```

Returns in seconds:

- **Signals Present** — leadership behaviors already visible, with evidence
- **Signals Missing** — what framing was absent, and why it mattered
- **Follow-up** — one concrete recommendation for what to say or do next

Result lands in clipboard + appended to `leadership-log.md`.

## Demo 2: Weekly Review

Cap the week in one command:

```bash
bin/weekly-init    # Monday: create structured note
bin/weekly-review  # Friday: synthesize into 4 bullets
```

**Focus Check** · **Cross-team Quality** · **Priority Shift** · **Priority Judgment**

Appended back to the weekly note. No separate tool. No extra tab.

## What You Get

| Without KeyClaude | With KeyClaude |
|-------------------|----------------|
| Rough messages sent | Polished in seconds |
| 5 min manual editing | Shortcut + paste |
| No feedback on writing | Habits logged per rewrite |
| Thread analysis = manual | `pbpaste \| bin/leadership-feedback` |
| Weekly review = skipped | 4 bullets in one command |

## How It Works

```
keyclaude/  (engine)        $GROWTH_REPO/  (your data)
  bin/rewrite       ──▶   writing-insights.md
  bin/weekly-*      ──▶   weekly/YYYY-WNN.md
  bin/leadership    ──▶   leadership-log.md
```

- Engine: skills, shortcuts, agents — no personal data, open source
- Data: your notes, logs, context — stays local, out of version control

## Install

```bash
git clone https://github.com/wtrocki/keyclaude
cd keyclaude
./install.sh
```

Assign keys: **System Settings → Keyboard → Shortcuts → Services → Text**

Or add `shortcuts/raycast/` as a Script Commands directory in Raycast.

## What's Next

- Scheduled agent sessions — coaching on your cadence
- MCP context injection — Glean, GitHub, Slack data before you act
- Custom data sources per project
- Expanded Raycast surface

## Questions?
