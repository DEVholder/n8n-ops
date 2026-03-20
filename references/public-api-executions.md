# Public API Executions

Use executions to diagnose failures before changing workflows.

## Supported operations

- List executions: `GET /api/v1/executions`
- Get one execution: `GET /api/v1/executions/{id}`
- Delete an execution: `DELETE /api/v1/executions/{id}`
- Retry an execution: `POST /api/v1/executions/{id}/retry`

## Useful filters

- `status=error|success|running|waiting|canceled`
- `workflowId=<id>`
- `projectId=<id>`
- `includeData=true`
- `limit=<n>`
- `cursor=<cursor>`

## Diagnosis order

1. Find the latest failed execution for the workflow.
2. Fetch it with `includeData=true`.
3. Identify the failing node.
4. Classify the failure:
   - external API/auth
   - missing credential binding
   - expression resolution
   - malformed input/output mapping
   - timeout or rate limit
   - webhook payload mismatch
5. Fix the root cause before retrying.
6. Retry only when the failed input is still valid to replay.

## Retry note

The retry endpoint can use:

- `loadWorkflow=false`: retry with the workflow version saved with the execution
- `loadWorkflow=true`: retry with the current saved workflow

Use `loadWorkflow=true` only after confirming the workflow fix is saved.
