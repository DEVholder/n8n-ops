---
name: n8n-ops
description: Use when working with a self-hosted n8n instance through the official Public API, MCP exposure, and execution debugging. Covers workflow inspection and updates, execution triage and retry, credential schema-driven setup, and cautious fallback to unstable /rest endpoints only when explicitly allowed.
---

# n8n Ops

Use this skill for self-hosted `n8n` administration and debugging.

Keep the core split clear:

- `Public API` is the source of truth for reading and updating workflows, listing executions, retrying executions, and working with variables, projects, and credential schemas.
- `MCP` is for discovering and executing workflows that have been explicitly exposed through `availableInMCP`.
- `/rest/*` is not a stable public contract. Only use it when the user explicitly accepts the risk and the Public API cannot do the job.

## Required safety rules

Read [references/safety-rules.md](./references/safety-rules.md) first for any task that touches a live instance.

## Routing

- Workflow inspection, export, JSON patching, activation, deactivation:
  Read [references/public-api-workflows.md](./references/public-api-workflows.md)
- Execution failure analysis, execution data inspection, retry:
  Read [references/public-api-executions.md](./references/public-api-executions.md)
- Credential setup, schema lookup, reference auditing:
  Read [references/public-api-credentials.md](./references/public-api-credentials.md)
- MCP exposure, discovery, and execution behavior:
  Read [references/mcp.md](./references/mcp.md)
- When the Public API is insufficient and the user explicitly allows unstable internal endpoints:
  Read [references/rest-fallback.md](./references/rest-fallback.md)
- For common error patterns and diagnosis order:
  Read [references/troubleshooting.md](./references/troubleshooting.md)
- For portability to other agents:
  Read [references/portability.md](./references/portability.md)

## Environment

Prefer these environment variables:

```bash
export N8N_BASE_URL="https://n8n.example.com"
export N8N_API_KEY="..."
```

All bundled scripts use those variables and send:

```bash
curl -H "X-N8N-API-KEY: $N8N_API_KEY"
```

## Default operating sequence

1. Identify whether the task is workflow edit, execution triage, credential setup, or MCP exposure.
2. Use the Public API first.
3. Before changing a workflow, fetch and save the current definition.
4. Make the smallest defensible change.
5. Re-read the workflow or execution state after the change.
6. Use MCP only for exposed workflow discovery and execution, not as a replacement for workflow editing.

## Script map

- `scripts/list_workflows.sh`
- `scripts/get_workflow.sh`
- `scripts/list_failed_executions.sh`
- `scripts/get_execution.sh`
- `scripts/retry_execution.sh`
- `scripts/get_credential_schema.sh`

## Notes

- The official Public API does not provide a stable `GET /credentials` listing surface in the current public contract.
- Credential secrets should not be printed back to the user unless strictly necessary.
- For destructive or high-impact actions on a live instance, summarize the exact change before performing it.
