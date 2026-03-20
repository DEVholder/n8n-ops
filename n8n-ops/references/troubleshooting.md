# Troubleshooting

Use this order when a workflow is failing.

1. Identify the workflow and latest failed execution.
2. Read execution data with `includeData=true`.
3. Find the first failing node, not just the final failed status.
   - *Tip:* Use `jq` to filter large execution results (e.g., `jq '.data.resultData.runData'`).
4. Check the node's credential binding in the workflow JSON.
5. Check expressions in the failing node parameters.
6. Check whether upstream nodes actually returned the fields the node expects.
7. Check external dependency state:
   - token expired
   - wrong scope
   - missing file or folder ID
   - webhook payload changed
   - rate limiting
8. Only after the cause is understood, patch the workflow or credential.
9. Re-run through retry or the normal trigger path.

## Common patterns

- `401/403`: credential expired, wrong scope, or wrong credential bound
- `404`: missing remote object, stale ID, or wrong project/base/folder
- expression errors: wrong JSON path, missing item, wrong node name
- empty downstream input: broken `connections` or node returned no items
- webhook-trigger issues: wrong HTTP method, wrong path, wrong payload structure
