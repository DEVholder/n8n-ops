#!/usr/bin/env bash
set -euo pipefail

: "${N8N_BASE_URL:?Set N8N_BASE_URL}"
: "${N8N_API_KEY:?Set N8N_API_KEY}"

id="${1:?usage: retry_execution.sh <execution-id> [loadWorkflow:true|false]}"
load_workflow="${2:-false}"

curl -fsS \
  -X POST \
  -H "accept: application/json" \
  -H "content-type: application/json" \
  -H "X-N8N-API-KEY: $N8N_API_KEY" \
  -d "{\"loadWorkflow\":$load_workflow}" \
  "$N8N_BASE_URL/api/v1/executions/$id/retry"
