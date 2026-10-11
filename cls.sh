#!/usr/bin/env bash
# List class D3 artifacts per repo
set -u
cd "$1" || exit 1
for d in */; do
  if [ -d "${d}.git" ] || git -C "$d" rev-parse --git-dir >/dev/null 2>&1; then
    echo "--- ${d}"
    git -C "$d" ls-files -z | tr '\0' '\n' | grep -Ei '(^|/)(AGENTS\.md|agents\.md|\.github/copilot-instructions\.md)' | sort
  fi
done
