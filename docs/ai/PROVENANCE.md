# AI-Provenance Timeline

Human-readable timeline of AI-related milestones. Each entry is referenced to a
**real commit hash** or specific, verifiable path. No claim here is stronger than
the evidence that backs it.

---

## Timeline

### 2026-07-10 — `861c73a` — "Add `.gemini/` to `.gitignore`"

- Committed by Manoj.
- Change: `.gitignore` added `.gemini/` to the ignore list.
- **What this proves:** a Gemini interface was used on this repository between
  2026-07-10 and the next commit. It does **not** prove any source file was
  AI-written.

### 2026-07-25 — `c18ec30` — "feat: overhaul info-card.svg with modern
glassmorphism design and updated AI stack"

- Committed by Manoj.
- Changed `info-card.svg` and `scripts/make_info_card.py`.
- "Updated AI stack" reflects installed Python packages (`rembg[cpu]`,
  `opencv-python`, `numpy`, ...) and the AI/agent product set.
- **What this proves:** the product stack is AI/agent tooling. "AI stack" here =
  the software the product uses, not the origin of the code.

### 2026-07-31 — `33ae3f2` — "chore: delete AI memory and artifact summary
files"

- Committed by Manoj.
- Removed `docs/memory.md` (49 deletions).
- **What this proves:** an AI-derived artifact (memory/artifact summary) was
  generated for this repository and subsequently deleted. No generator was named.

---

## Gaps (need the user's confirmation — not guessed)

1. Which AI tool(s) produced the **source code** of AegisAI,
   Emotion-Lens, finsight-agent, Smart-Spam-Detector, etc.
2. The approximate date range and human reviewer for each.
3. The persisted conversation export, so a sanitized transcript can be checked
   in under `docs/ai/transcripts/`.

---

## Visibility proof

PROOF: the directory `docs/ai/` and all files inside it were validated with
`git check-ignore -v`. Every provenance path returned **nothing** (not ignored),
confirming the files will be visible to GitHub and any other viewer.
