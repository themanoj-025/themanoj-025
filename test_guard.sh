#!/usr/bin/env bash
# Test the re-add guard per repo using a throwaway GIT_INDEX_FILE.
ROOT="/f/GITHUB"
for d in AI-Telegram-News-Bot Book-Tale "Credit Card Fraud Detection" Dabba Emotion-Lens finsight-agent "Institute-Management-System" Match-Mind Next-Gen-Reco "Price-My-Car" sentinel-review Smart-Spam-Detector Statlas Tamasha themanoj-025 "UNION-BANK-" Veridoc; do
  cd "$ROOT/$d" || continue
  if [ ! -d .git ]; then echo "$d: not a git repo"; continue; fi
  probe=".cleanup-audit/probe_$$.txt"
  # probe a path that IS ignored by T2 managed block
  ignore_probe=".cleanup-audit/.claude/probe_$$.txt"
  mkdir -p ".cleanup-audit/.claude"
  echo "probe" > "$ignore_probe"
  echo "  [guard] probe=$(pwd)/$ignore_probe"
  mkdir -p ".cleanup-audit"
  echo "probe" > "$probe"

  tmp_index=$(mktemp)
  cp .git/index "$tmp_index" 2>/dev/null || : > "$tmp_index"
  # force-add the probe into the temp index
  git add -f -- "$ignore_probe" 2>/dev/null
  GIT_INDEX_FILE="$tmp_index" sh .git/hooks/pre-commit
  pc_exit=$?
  rm -f "$tmp_index" "$probe"
  echo "$d | guard-exit=$pc_exit (want 1 to block a force-added ignored path)"
done
