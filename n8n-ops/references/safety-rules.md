# Safety Rules

Apply these rules on every live `n8n` task.

## Secrets

- Never echo API keys, OAuth tokens, webhook secrets, or raw credential `data` unless the user explicitly asks and the exposure is necessary.
- Prefer redacted examples in messages.
- Treat `N8N_API_KEY` as sensitive input. Do not repeat it back in output.

## Workflow changes

- Before any `PUT /workflows/{id}`, fetch the current workflow JSON first.
- Change the smallest possible part of the workflow.
- Re-read the workflow after update to confirm the server accepted the change.
- If a workflow is active, remember that the Public API documents that an update will reactivate the updated version automatically.

## Execution debugging

- Prefer reading execution data before retrying.
- Do not retry blindly when the failure is clearly caused by missing credentials, invalid expressions, or a broken external dependency.

## Credentials

- Use schema lookup before creating or updating credentials.
- Prefer having the user enter or rotate sensitive values in the `n8n` UI when the risk of exposure is high.
- Do not assume credential listing or raw credential reads are supported by the stable Public API.

## Unstable endpoints

- `/rest/*` is internal and may change without notice.
- Only use `/rest/*` when the user explicitly accepts that risk.
- If `/rest/*` is used, call out that the behavior is version-sensitive.
