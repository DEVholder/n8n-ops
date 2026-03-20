# REST Fallback

This file covers internal `/rest/*` endpoints used by the `n8n` editor UI.

## Status

These endpoints are not the stable Public API. Official docs for embed flows warn that internal REST endpoints may change at any time.

## When to use

Use `/rest/*` only when all of these are true:

- the user explicitly allows unstable internal endpoints
- the Public API cannot perform the needed read or write
- the benefit outweighs version-specific risk

## Typical fallback cases

- UI-only metadata retrieval not exposed in the Public API
- version-sensitive credential inspection workflows
- editor-specific operations

## Required warning

Before using `/rest/*`, state that:

- the endpoint is internal
- it may break across `n8n` upgrades
- the result should not be treated as a stable automation contract
