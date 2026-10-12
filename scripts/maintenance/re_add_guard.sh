#!/usr/bin/env bash
# Tool-agnostic re-add guard (per ULTRA MASTER PROMPT §5A.13).
# Blocks NEWLY ADDED paths that match ignore rules (e.g. `git add -f` of a
# contained AI-tool file). Reuses the repo's own ignore rules; no tool names.
set -u
bad=$(git diff --cached --name-only -z --diff-filter=ACR \
  | git check-ignore --no-index --stdin -z | tr '\0' '\n')
if [ -n "$bad" ]; then
  printf 'pre-commit: blocked - staged paths match ignore rules (forced add?):\n%s\n' "$bad" >&2
  printf 'Unstage with: git restore --staged -- <path>\n' >&2
  exit 1
fi
exit 0
