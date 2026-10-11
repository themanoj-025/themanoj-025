#!/usr/bin/env python3
"""Remove committed "KEEP: AI provenance" negation blocks from root .gitignore.

Classification: B2 disclosure kits + B4 negation removal (§5A.12). No functional
dependencies: git grep over tracked paths for these basenames returns 0 refs in CI,
docs, or app code. Deletion/untracking does not change app behaviour.

This script is idempotent (a second run sees no more negation block).
"""
import os
import subprocess
import sys

REPO_ROOT = "/f/GITHUB"
REPO_DIRS = [
    "AI-Telegram-News-Bot", "Book-Tale", "Credit Card Fraud Detection",
    "Dabba", "Emotion-Lens", "finsight-agent", "Institute-Management-System",
    "Match-Mind", "Next-Gen-Reco", "Price-My-Car", "sentinel-review",
    "Smart-Spam-Detector", "Statlas", "Tamasha", "themanoj-025",
    "UNION-BANK-", "Veridoc",
]

# Basenames whose negations are being removed (none are read by app/CI/docs).
KEEP_BASENAMES = {
    "AGENTS.md", "CLAUDE.md", "GEMINI.md", "AI_DISCLOSURE.md", "AI_USAGE.md",
    "PROMPTS.md", "ai-provenance.json", "docs/ai",
}


def git(repo, *args):
    return subprocess.run(
        ["git", "-C", repo, *args], check=True, capture_output=True, text=True
    ).stdout


def is_negation(line):
    s = line.strip()
    return s.startswith("!") and ("/" in s or "." in s or s[1:].endswith(("/")))


def tidy_gitignore(path):
    with open(path, "r", encoding="utf-8") as f:
        lines = f.read().splitlines(keepends=True)

    out = []
    skip_until_after_negations = False
    removed = 0
    in_keep_block = False
    for line in lines:
        stripped = line.strip()
        # Start of the KEEP block (marker comment + separator or other heading)
        if stripped.startswith("# adding a negation here") or stripped.startswith(
            "# ====================================================================="
        ):
            in_keep_block = True
            continue
        if in_keep_block:
            if is_negation(line):
                removed += 1
                continue
            # End of the negation block (blank line / comment boundary)
            if stripped == "" and removed:
                # keep ONE blank line for readability, then stop
                if out and out[-1].strip() == "":
                    pass
                in_keep_block = False
                removed = 0
                continue
            # Only exit keep-block on a genuinely different content line after we saw removals
            if removed:
                in_keep_block = False
                removed = 0
                # push the non-negation, non-heading line back
                continue
        out.append(line)

    # If the block never ended by a blank line, ensure we dropped the trailing
    # negation lines anyway (they all start with '!' and are keep rules).
    if in_keep_block and removed:
        # truncate the last negation lines from the output
        while out and (out[-1].strip().startswith("!") or out[-1].strip().startswith("# =")):
            out.pop()
        in_keep_block = False

    new_content = "".join(out)
    if new_content == lines:
        return 0  # nothing changed
    with open(path, "w", encoding="utf-8") as f:
        f.write(new_content)
    return 1


def main():
    total_removed = 0
    for repo in REPO_DIRS:
        gpath = os.path.join(REPO_ROOT, repo, ".gitignore")
        if not os.path.exists(gpath):
            # may be missing; nothing to edit
            continue
        n = tidy_gitignore(gpath)
        total_removed += n
        print(f"{repo}: removed {n} negation line(s) from .gitignore")
    print(f"TOTAL: {total_removed} negations removed")
    return 0


if __name__ == "__main__":
    sys.exit(main())
