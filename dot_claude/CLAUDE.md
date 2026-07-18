# Git conventions

- Branch names: `<type>/<short-kebab-topic>` using conventional-commit types —
  `feat/`, `fix/`, `chore/`, `docs/`, `refactor/`. Example: `feat/ghostty-config`.
  If a repo's own CLAUDE.md specifies a different scheme (e.g. `curtis/<topic>`
  on shared team remotes), that wins.
- Commits: conventional commits (`feat: ...`, `fix: ...`, `chore: ...`).
- Once work is done and verified, commit and push on feature branches without
  asking. Always ask before pushing to master/main.

# Workflow

- Nontrivial implementation: plan first (plan mode, strong model), then hand
  the approved brief to the Sonnet `implementer` agent via /handoff and review
  its diff. Small/mechanical changes don't need the ceremony.

# Tooling

- Language runtimes via mise — never brew or system installs.
- JS: prefer bun/bunx over npm/npx.
- Ruby/Rails: RSpec for tests, RuboCop with autocorrect, conventional Rails
  patterns.
- Python: uv for envs and packages, ruff for lint + format, pytest for tests.

# Style

- Be concise by default; elaborate only when asked.
