# n8n-ops

Portable `n8n` operations skill and reference kit for self-hosted instances.

This repository keeps human-facing repository docs at the root and the actual skill payload in the nested [n8n-ops](./n8n-ops) directory so the skill folder can be copied into different agent ecosystems without pulling repository metadata into the skill itself.

## Layout

```text
n8n-ops/
├── README.md
└── n8n-ops/
    ├── SKILL.md
    ├── agents/
    ├── references/
    └── scripts/
```

## What the skill covers

- Self-hosted `n8n` workflow inspection and updates via the official Public API
- Execution debugging and retry workflows
- Credential schema-driven setup guidance
- MCP exposure and execution guidance
- Explicitly gated fallback guidance for unstable `/rest/*` endpoints

## Install targets

Copy the inner [n8n-ops](./n8n-ops) folder to the agent-specific skills location:

- Codex: `~/.codex/skills/n8n-ops`
- Claude Code: `.claude/skills/n8n-ops`
- Gemini CLI / OpenCode: `.agents/skills/n8n-ops`

## Notes

- `README.md` is for repository readers and should not be treated as part of the skill payload.
- The inner `n8n-ops/` directory is the actual portable skill root.
