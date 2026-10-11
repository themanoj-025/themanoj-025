#!/usr/bin/env bash
# B2 + class-B2-items: untrack disclosure kits and agent instruction files
# (AGENTS.md, .github/copilot-instructions.md, .gitmessage, AI_DISCLOSURE.md,
#  ai-provenance.json, docs/ai/). Files stay on disk. Index is cleaned.
set -u

REPO_ROOT="/f/GITHUB"
REPO_DIRS=(
  "AI-Telegram-News-Bot" "Book-Tale" "Credit Card Fraud Detection"
  "Dabba" "Emotion-Lens" "finsight-agent" "Institute-Management-System"
  "Match-Mind" "Next-Gen-Reco" "Price-My-Car" "sentinel-review"
  "Smart-Spam-Detector" "Statlas" "Tamasha" "themanoj-025"
  "UNION-BANK-" "Veridoc"
)

for repo in "${REPO_DIRS[@]}"; do
  d="$REPO_ROOT/$repo"
  mapfile -t PATHS < <(git -C "$d" ls-files \
    -- 'AGENTS.md' '.github/copilot-instructions.md' '.gitmessage' \
    'AI_DISCLOSURE.md' 'ai-provenance.json' 'docs/ai/' 'docs/ai/README.md' 'docs/ai/PROVENANCE.md' 'docs/ai/AI_DISCLOSURE.md' 'docs/ai/ai-provenance.json' 'docs/ai/PROMPTS.md' 2>/dev/null)
  if [ "${#PATHS[@]}" -eq 0 ]; then
    echo "  $repo: no B2 tracked"
    continue
  fi
  git -C "$d" rm -r --cached -q -- "${PATHS[@]}"
  echo "  $repo: untracked ${#PATHS[@]} B2 file(s): ${PATHS[*]}"
done
echo "done."
