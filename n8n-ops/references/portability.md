# Portability

This skill is written to be mostly agent-neutral.

## Core portable assets

- `SKILL.md`
- `references/*.md`
- `scripts/*.sh`

These can be reused in agents that support `Agent Skills` style layouts such as:

- Codex-style skills under `~/.codex/skills/`
- Claude Code skills under `.claude/skills/`
- Gemini CLI and OpenCode style skills under `.agents/skills/`

## Porting guidance

- Keep workflow and API procedures in `references/`, not in agent-specific metadata.
- Keep shell helpers in `scripts/`.
- Treat `agents/openai.yaml` as Codex-specific metadata only.
- If another agent requires a different install path, copy the same `n8n-ops/` folder without changing the core documents.
