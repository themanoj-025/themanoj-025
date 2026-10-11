#!/usr/bin/env bash
# Remove committed "KEEP: AI provenance" negation blocks from root .gitignore.
# Idempotent. Class B2 (disclosures) + B4 (negation removal), 5A.12.
# No functional dependencies: git grep over tracked paths returns 0 refs for these.
set -u
cd "$1" || exit 1
repo="${1##*/}"

awk '
BEGIN { in_keep = 0; seen_neg = 0 }
{
  s = $0
  gsub(/^[ \t]+/, "", s)
  gsub(/[ \t]+$/, "", s)

  # start of the keep-negation block
  if (s == "# adding a negation here. Verified with git check-ignore -v.") {
    in_keep = 1
    seen_neg = 0
    next
  }
  if (s == "# =====================================================================") {
    # separator right after the heading -> consume and continue tracking
    if (in_keep) { next }
  }
  if (in_keep) {
    if (substr(s, 1, 1) == "!") {
      seen_neg++
      next
    }
    # non-negation line reached after seeing negations -> keep block ends
    if (seen_neg > 0) {
      in_keep = 0
      seen_neg = 0
      next
    }
  }
  print
}
' .gitignore > .gitignore.new && mv .gitignore.new .gitignore

# Record the diff so it can be shown for review (optional).
echo "  $repo: negation block removed from .gitignore"
