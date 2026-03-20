# Public API Credentials

Treat credentials conservatively.

## Supported stable operations

- List credentials: `GET /api/v1/credentials`
- Get a specific credential: `GET /api/v1/credentials/{id}`
- Create credential: `POST /api/v1/credentials`
- Update credential: `PATCH /api/v1/credentials/{id}`
- Delete credential: `DELETE /api/v1/credentials/{id}`
- Get credential schema by type: `GET /api/v1/credentials/schema/{credentialTypeName}`

## Important considerations

While listing and reading credentials is now supported, the Public API returns metadata (name, type, etc.) but **never** returns sensitive secrets or the raw `data` values.

This skill focuses on:

- schema-driven credential creation
- targeted credential updates when the ID is known
- workflow node reference auditing by reading workflow JSON and credential metadata

## Safe workflow for credential work

1. Determine the credential type needed by the node.
2. Fetch the schema for that credential type.
3. Ask the user to provide or enter sensitive values safely.
4. Create or update the credential with the smallest necessary payload.
5. Rebind the workflow node to the credential by `id` and `name`.
6. Test through workflow execution.

## Partial update behavior

The documented update request supports:

- `isPartialData=true`: merge with existing redacted data
- `isPartialData=false`: replace the entire `data` object

Prefer `isPartialData=true` when rotating or adding only a subset of fields.
