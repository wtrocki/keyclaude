# 10gen/agent-skills
## MongoDB's internal skill library for AI coding assistants

## What Are Skills?

- Reusable instruction sets loaded into AI coding assistants
- Work across Claude Code, Cursor, and Gemini CLI
- Invoked on demand: `/brainstorming`, `/jira-cli`, `/presentations`
- Installed via: `claude plugin install <skill>@mongodb-internal`

## Why agent-skills?

- One place for all MongoDB AI workflow automation
- Skills are versioned, validated, and discoverable
- Contributions welcome from any team
- CI enforces quality: structure, token count, trigger uniqueness

## Skill Lifecycle

- **Before you code** — brainstorm, plan, dispatch parallel agents
- **While you code** — debug systematically, follow Go patterns
- **Before you merge** — verify completion, receive review feedback
- **Tooling** — Jira, git, Evergreen, Confluence, Graphite, and more

## Before You Code

- `brainstorming` — ideate features and designs with structured prompts
- `writing-plans` — turn a spec into a step-by-step implementation plan
- `dispatching-parallel-agents` — run independent tasks simultaneously
- `executing-plans` — drive a written plan to completion task by task

## While You Code

- `systematic-debugging` — diagnose any bug or test failure methodically
- `subagent-driven-development` — parallelise implementation with agents
- `go-patterns` — enforce MongoDB Go idioms and conventions

## Before You Merge

- `verification-before-completion` — checklist before claiming work done
- `receiving-code-review` — structured approach to acting on feedback
- `finishing-a-development-branch` — clean up, PR, and merge safely

## Tooling Skills

- `jira-cli` / `jira-ticket-creation` — create and update Jira issues
- `git-workflows` — worktrees, gh CLI, stacked PRs via Graphite
- `evergreen-cicd` — patches, CI monitoring, fix broken builds
- `edit-confluence` / `read-confluence` — wiki automation via MCP

## More Tooling

- `pull-request-guidelines` — consistent PR descriptions
- `pr-review-loop` — babysit a PR until CI is green
- `survey-builder` — build Qualtrics developer surveys
- `presentations` — generate slide decks from Markdown via pandoc
- `threat-model-analyst` — STRIDE-A analysis for any repository

## Contributing a Skill

- Add `SKILL.md` under `.agents/skills/<category>/<skill>/skills/<skill>/`
- Required frontmatter: `name`, `description`, `source`, `license`, `mongodb.*`
- Supporting files go in `references/` (text) or `assets/` (binary)
- Register in `plugin.json`, `marketplace.json`, and `CATALOG.md`
- CI runs `skill-validator --strict` on every PR

## Pruning Policy

- Skills unused for 90 days (zero Honeycomb events) are removed
- Owner gets a 2-week notice email before removal
- Keep your skill active: teach your team to use it

## Questions?

- Repo: `10gen/agent-skills`
- Owner: DevProd BV team
- Install: `claude plugin install <skill>@mongodb-internal`
