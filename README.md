# n8n-ops

[한국어](./README.ko.md)

Portable `n8n` operations skill and reference kit for self-hosted instances.

This repository keeps human-facing repository docs at the root and the actual skill payload in the nested [n8n-ops](./n8n-ops) directory so the skill folder can be copied into different agent ecosystems without pulling repository metadata into the skill itself.

## Layout

```text
n8n-ops/
├── README.md
├── README.ko.md
└── n8n-ops/
    ├── SKILL.md
    ├── agents/
    ├── references/
    └── scripts/
```

## What this skill does

- Inspect and update self-hosted `n8n` workflows through the official Public API
- Debug failed executions and retry them safely
- Guide credential work through documented credential schemas
- Help expose workflows through `n8n` MCP and explain when MCP should be used
- Provide an explicitly gated fallback path for unstable `/rest/*` endpoints

## Design principles

- `Public API` is the source of truth for workflow and execution operations
- `MCP` is a companion surface for exposed workflow discovery and execution
- `/rest/*` is treated as unstable and opt-in only
- Secrets should not be echoed back unless strictly necessary

## Install

Copy the inner [n8n-ops](./n8n-ops) folder to the agent-specific skills location:

- Codex: `~/.codex/skills/n8n-ops`
- Claude Code: `.claude/skills/n8n-ops`
- Gemini CLI / OpenCode: `.agents/skills/n8n-ops`

## Basic usage

Set environment variables before using the bundled scripts or following the documented API workflows:

```bash
export N8N_BASE_URL="https://n8n.example.com"
export N8N_API_KEY="your-api-key"
```

Example script usage:

```bash
./n8n-ops/scripts/list_workflows.sh '?limit=10'
./n8n-ops/scripts/get_workflow.sh WORKFLOW_ID
./n8n-ops/scripts/list_failed_executions.sh '?status=error&limit=10'
./n8n-ops/scripts/get_credential_schema.sh googleDriveOAuth2Api
```

## Example prompts

Use these as starting points with your agent after installing the inner skill folder.

- `Use $n8n-ops to inspect workflow VP7vIk5u_lZXpvNWx5yew and tell me why it fails.`
- `Use $n8n-ops to compare the latest failed execution with the saved workflow and suggest a minimal fix.`
- `Use $n8n-ops to check whether this webhook workflow is ready to be exposed through MCP.`

## Repository notes

- [README.md](./README.md) is for repository readers
- [n8n-ops](./n8n-ops) is the actual portable skill root
- The skill content itself intentionally avoids extra repository-only files such as a nested README
