# Public API Workflows

Use the official Public API for workflow inspection and edits.

## Supported operations

- List workflows: `GET /api/v1/workflows`
- Get one workflow: `GET /api/v1/workflows/{id}`
- Create a workflow: `POST /api/v1/workflows`
- Update a workflow: `PUT /api/v1/workflows/{id}`
- Delete a workflow: `DELETE /api/v1/workflows/{id}`
- Activate: `POST /api/v1/workflows/{id}/activate`
- Deactivate: `POST /api/v1/workflows/{id}/deactivate`
- Get a specific version: `GET /api/v1/workflows/{id}/{versionId}`
- Manage tags: `GET/PUT /api/v1/workflows/{id}/tags`

## Recommended edit loop

1. List or fetch the target workflow.
2. Save a local backup of the current workflow JSON.
3. Inspect `nodes`, `connections`, `settings`, and `credentials` references.
4. Build a minimal replacement payload.
5. `PUT` the updated workflow.
6. Fetch the workflow again to verify the result.
7. Activate or deactivate only when needed.

## Guardrails

- Keep node IDs and names stable unless there is a reason to change them.
- When fixing connections, change only the affected edge set.
- Preserve unrelated nodes and settings.
- Check `settings.availableInMCP` separately from activation. Both matter for MCP use.
- **Tag Updates**: `PUT /api/v1/workflows/{id}/tags` replaces the entire tag set. To append a tag, fetch existing tags first, then include them in the `PUT` payload.

## Useful query parameters

- `active=true|false`
- `name=<workflow name>`
- `tags=a,b`
- `projectId=<id>`
- `excludePinnedData=true`
- `limit=<n>`
- `cursor=<cursor>`

## Typical repair targets

- Broken `connections`
- Missing or wrong `credentials` references on nodes
- Empty node parameters such as IDs, sheet names, or folder IDs
- Wrong expressions in `parameters`
- Missing `availableInMCP` when the workflow should be exposed via MCP
