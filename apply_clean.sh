#!/usr/bin/env bash
# Clean re-apply of B2 (untrack D3 + disclosure kits, keep on disk), B3
# (quarantine status/health.log), B4 (negation removal) to the reset state.
set -u
REPO_ROOT="/f/GITHUB"
REPO_DIRS=(
  "AI-Telegram-News-Bot" "Book-Tale" "Credit Card Fraud Detection"
  "Dabba" "Emotion-Lens" "finsight-agent" "Institute-Management-System"
  "Match-Mind" "Next-Gen-Reco" "Price-My-Car" "sentinel-review"
  "Smart-Spam-Detector" "Statlas" "Tamasha" "themanoj-025"
  "UNION-BANK-" "Veridoc"
)

# --- B2: untrack D3 files ---
for repo in "${REPO_DIRS[@]}"; do
  d="$REPO_ROOT/$repo"
  git -C "$d" rm -r --cached -q -- 'AGENTS.md' '.github/copilot-instructions.md' '.gitmessage' \
    'AI_DISCLOSURE.md' 'ai-provenance.json' 'docs/ai/' 'docs/ai/README.md' \
    'docs/ai/PROVENANCE.md' 'docs/ai/AI_DISCLOSURE.md' 'docs/ai/ai-provenance.json' 'docs/ai/PROMPTS.md' 2>/dev/null
  echo "  $repo: D3+disclosure untracked"
done

# --- B3: quarantine status/health.log (finsight-agent) ---
SRC="finsight-agent/status/health.log"
if [ -f "$REPO_ROOT/$SRC" ]; then
  QD="/tmp/fcleanup-quarantine-$(date +%Y%m%d%H%M%S)"
  mkdir -p "$QD/$(dirname "$SRC")"
  cp -a "$REPO_ROOT/$SRC" "$QD/$SRC"
  (cd "$QD" && sha256sum -c <(sha256sum "$REL_SRC")) 2>/dev/null || true
  git -C "$REPO_ROOT/finsight-agent" rm -r --cached -q "$SRC"
  rm -f -- "$REPO_ROOT/$SRC"
  echo "  finsight-agent: B3 quarantine status/health.log (quarantined=$QD)"
fi

# --- B4: remove shadowing provenance-negation lines from root .gitignore ---
for repo in "${REPO_DIRS[@]}"; do
  d="$REPO_ROOT/$repo"
  if [ -f "$d/.gitignore" ]; then
    # remove the KEEP-negation block (from '# KEEP: AI provenance' to end of file)
    if grep -q '^# KEEP: AI provenance' "$d/.gitignore" 2>/dev/null; then
      head -n "$(grep -n '^# KEEP: AI provenance' "$d/.gitignore" | cut -d: -f1)" "$d/.gitignore" > "$d/.gitignore.fixed"
      mv "$d/.gitignore.fixed" "$d/.gitignore"
      echo "  $repo: B4 negation block removed from .gitignore"
    else
      # remove specific shadowing negation lines
      sed -i -E '/^!AGENTS[.]md$/d; /^!github/copilot-instructions[.]md$/d; /^!CLAUDE[.]md$/d; /^!GEMINI[.]md$/d; /^!AI_DISCLOSURE[.]md$/d; /^!AI_USAGE[.]md$/d; /^!PROMPTS[.]md$/d; /^!docs/ai[$]/d; /^!docs/ai[*][*]$/d' "$d/.gitignore"
      echo "  $repo: B4 shadowing negations removed"
    fi
  fi
done
echo "apply_clean done."
