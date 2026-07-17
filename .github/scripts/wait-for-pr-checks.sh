#!/usr/bin/env bash
set -euo pipefail

# ---- Config -----------------------------------------------------------
# Name of the current job's check, as it appears in `gh pr checks`.
# This is what we exclude to avoid waiting on ourselves.
# Defaults to the GITHUB_JOB env var GitHub Actions sets automatically;
# override with SELF_CHECK_NAME if the displayed check name differs
# (e.g. "workflow / job" style names).
SELF_CHECK_NAME="${SELF_CHECK_NAME:-${GITHUB_JOB:-}}"

# PR number or URL. Defaults to the PR that triggered this workflow run.
PR="${PR:-${GITHUB_EVENT_PULL_REQUEST_NUMBER:-}}"

POLL_INTERVAL="${POLL_INTERVAL:-15}"   # seconds between polls
TIMEOUT="${TIMEOUT:-1800}"             # overall timeout in seconds
# -------------------------------------------------------------------------

if [[ -z "$PR" ]]; then
  # Fall back to letting gh infer the PR from the current branch/repo context.
  PR_ARGS=()
else
  PR_ARGS=("$PR")
fi

echo "Waiting on checks for PR ${PR:-<inferred>} (excluding check: '${SELF_CHECK_NAME:-none}')"

start_time=$(date +%s)

while true; do
  now=$(date +%s)
  elapsed=$(( now - start_time ))
  if (( elapsed > TIMEOUT )); then
    echo "::error::Timed out after ${TIMEOUT}s waiting for checks to complete."
    exit 1
  fi

  # Pull current checks as JSON, excluding our own check by name.
  checks_json=$(gh pr checks "${PR_ARGS[@]}" --json name,state,bucket,link \
    --jq "[.[] | select(.name != \"${SELF_CHECK_NAME}\")]")

  total=$(jq 'length' <<<"$checks_json")

  if (( total == 0 )); then
    echo "No other checks found on this PR."
    exit 0
  fi

  pending=$(jq '[.[] | select(.bucket == "pending" or .state == "IN_PROGRESS" or .state == "QUEUED")] | length' <<<"$checks_json")
  failed=$(jq '[.[] | select(.bucket == "fail")]' <<<"$checks_json")
  failed_count=$(jq 'length' <<<"$failed")

  echo "[$(date -u +%H:%M:%S)] ${total} check(s) tracked, ${pending} still pending, ${failed_count} failed so far."

  # Fail fast as soon as any check reports a failure — no need to wait
  # for the rest to finish.
  if (( failed_count > 0 )); then
    echo "::error::One or more checks failed:"
    jq -r '.[] | "  - \(.name): \(.state) (\(.link))"' <<<"$failed"
    exit 1
  fi

  if (( pending == 0 )); then
    echo "All checks completed successfully."
    exit 0
  fi

  sleep "$POLL_INTERVAL"
done
