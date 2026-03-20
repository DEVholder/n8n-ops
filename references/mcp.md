# MCP

Use MCP as a complement to the Public API, not a replacement.

## What MCP is good for

- Discovering exposed workflows
- Reading MCP-facing metadata for those workflows
- Executing workflows through MCP clients

## Exposure requirements

For a workflow to be usable through instance-level MCP:

- the workflow must be active
- `settings.availableInMCP` must be enabled
- the workflow must contain an active Webhook node

## Limits to remember

- MCP is not the primary editing surface for workflow JSON
- binary input is not supported by instance-level MCP
- long-running or human-in-the-loop flows have practical limits
- instance-level MCP has a timeout budget; keep it in mind for debugging

## Recommended combined pattern

1. Use the Public API to inspect and update the workflow.
2. Activate the workflow and enable `availableInMCP` if needed.
3. Use MCP to discover and run the workflow from AI tooling.
4. Use executions and workflow reads to debug the result.
