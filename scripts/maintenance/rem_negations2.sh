#!/usr/bin/env bash
# Remove committed negations that shadow the T2 managed block (B4, 5A.12).
# Idempotent: removes only lines matching the D3/D2/B2 basename patterns.
set -u
cd "$1" || exit 1
repo="${1##*/}"

# Patterns to remove (anchored to start of line; re-additions of these files
# would shadow the T2 managed ignore rules).
patterns=$'!AGENTS\\.md$\n!.github/copilot-instructions\\.md$\n!CLAUDE\\.md$\n!GEMINI\\.md$\n!AI_DISCLOSURE\\.md$\n!AI_USAGE\\.md$\n!PROMPTS\\.md$\n!docs/ai/$\n!docs/ai/\\*\\*$\n!.ai/'

if grep -qE "$patterns" .gitignore; then
  # Remove matching lines exactly, preserving the rest of the file.
  sed -i -E "/^!AGENTS[.]md$/d; /^!.github/copilot-instructions[.]md$/d; /^!CLAUDE[.]md$/d; /^!GEMINI[.]md$/d; /^!AI_DISCLOSURE[.]md$/d; /^!AI_USAGE[.]md$/d; /^!PROMPTS[.]md$/d; /^!docs/ai[$]/d; /^!docs/ai[*][*]$/d; /^!.ai[$]/d" .gitignore
  # Also drop the bare "====" separator comment that sat directly above them,
  # since it is now orphaned.
  sed -i '/^# =\{1,\}$/d' .gitignore
  echo "  $repo: removed shadowing negations"
else
  echo "  $repo: no shadowing negations present (already clean)"
fi
