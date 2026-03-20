#!/usr/bin/env bash
set -euo pipefail

: "${N8N_BASE_URL:?Set N8N_BASE_URL}"
: "${N8N_API_KEY:?Set N8N_API_KEY}"

type_name="${1:?usage: get_credential_schema.sh <credential-type-name>}"

curl -fsS \
  -H "accept: application/json" \
  -H "X-N8N-API-KEY: $N8N_API_KEY" \
  "$N8N_BASE_URL/api/v1/credentials/schema/$type_name"
