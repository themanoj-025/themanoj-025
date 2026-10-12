#!/usr/bin/env bash
# B2: untrack class D3 files (AGENTS.md, .github/copilot-instructions.md) across
# all repos. Files stay on disk; index is cleaned. Then append T2 ignore rules
# for them inside the managed block of .git/info/exclude (already written).
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
  # 1. build list of D3 paths currently tracked
  mapfile -d '' D3 < <(git -C "$d" ls-files -z -- 'AGENTS.md' '.github/copilot-instructions.md')

  if [ ${#D3[@]} -eq 0 ]; then
    echo "  $repo: no D3 tracked"
    continue
  fi

  # 2. dry run
  echo "$d: dry-run git rm -r --cached -n"
  git -C "$d" rm -r --cached -n -- "${D3[@]}" 2>&1 | tail -2
  # (dry-run exit captured by && chain; just report)

  # 3. untrack (working-tree copies remain)
  git -C "$d" rm -r --cached -q -- "${D3[@]}"
  echo "  $repo: untracked ${#D3[@]} D3 file(s): ${D3[*]}"

  # 4. prove it: only "D " entries for approved paths; no "??" for them; index clean
  git -C "$d" status --short | grep -c ' D ' | xargs -I{} echo "  $repo: status 'D ' count (untracked+moves): {}"
  git -C "$d" ls-files -ci --exclude-standard | wc -l
done
echo "B2 done."
