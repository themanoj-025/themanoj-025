#!/usr/bin/env bash
# Full artifact discovery per repo
set -u
cd "$1" || exit 1
for d in */; do
  if [ -d "${d}.git" ] || git -C "$d" rev-parse --git-dir >/dev/null 2>&1; then
    echo "================================================================"
    echo "== REPO: ${d}"
    echo "================================================================"
    # D3 shareable instructions
    echo "[D3]"
    git -C "$d" ls-files -z | tr '\0' '\n' | grep -Ei '(^|/)(AGENTS\.md|agents\.md|\.github/copilot-instructions\.md|\.github/instructions/|\.github/prompts/|\.github/agents/|\.github/skills/)' | sort || true
    # D2 credential-bearing local configs
    echo "[D2]"
    git -C "$d" ls-files -z | tr '\0' '\n' | grep -E '(^|/)(\.claude/settings\.local\.json|\.cursor/mcp\.json|\.mcp\.json|\.vscode/mcp\.json|\.clinerules)' | sort || true
    # D1 private data dirs
    echo "[D1]"
    git -C "$d" ls-files -o -i --exclude-standard -z | tr '\0' '\n' | grep -E '(^|/)\.(claude|cursor|windsurf|codeium|continue|codex|gemini|agents|aiassistant|junie|amazonq|kiro|trae|roo|kilocode|augment|cody|sourcegraph|openhands|goose|crush|opencode|qwen|factory|specify|taskmaster|bmad-core|rulesync|bolt)(/|$)' | sort || true
    git -C "$d" ls-files -o -i --exclude-standard -z | tr '\0' '\n' | grep -E '(\.session\.json|*chat-export*|repomix-output\.*|memory-bank|cline_docs|ai-scratch)' | sort || true
    # B2 voluntary disclosures
    echo "[B2]"
    git -C "$d" ls-files -z | tr '\0' '\n' | grep -Ei '(^|/)(AI_(DISCLOSURE|USAGE)\.md|ai-provenance\.json|PROMPTS\.md|docs/ai/|\.gitmessage|docs/ai/)' | sort || true
    # G automation / review bots
    echo "[G]"
    git -C "$d" ls-files -z | tr '\0' '\n' | grep -E '(^|/)\.github/workflows/(claude[^/]*|copilot-setup-steps|coderabbit|pr_agent)\.ya?ml' | sort || true
    git -C "$d" ls-files -z | tr '\0' '\n' | grep -E '(^|/)\.(coderabbit|pr_agent)\.ya?ml' | sort || true
    # Tool dirs present on disk (untracked)
    echo "[TOOLDIRS]"
    git -C "$d" ls-files -o -i --exclude-standard --directory -z | tr '\0' '\n' | grep -E '(^|/)\.(claude|cursor|windsurf|codeium|continue|codex|gemini|agents|aiassistant|junie|amazonq|kiro|trae|roo|kilocode|augment|cody|sourcegraph|openhands|goose|crush|opencode|qwen|factory|specify|taskmaster|bmad-core|rulesync|bolt)(/|$)' | sort || true
    # ignore files present at root
    echo "[IGNORE]"
    for f in .gitignore .gitattributes .git-blame-ignore-revs .git/info/exclude; do
      if [ -f "$d/$f" ]; then echo "  $f (tracked: $(git -C "$d" ls-files --error-unmatch "$f" >/dev/null 2>&1 && echo YES || echo no))"; fi
    done
  fi
done
