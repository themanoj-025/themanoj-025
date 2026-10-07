# ✦ AI Assistance Disclosure

## Summary

themanoj-025 is the personal portfolio of the maintainer, **themanoj-025**.
Its product evidence is spread across sibling AI / agent repos (Emotion-Lens,
finsight-agent, Smart-Spam-Detector, Price-My-Car, Match-Mind, and others).
This repo contains the portfolio, the docs, and the AI provenance records
(`docs/ai/`).

The AI provenance here is intentionally conservative: this repo itself has
no confirmed, measured AI-assistance claim. The sibling repos carry the
per-product `AI_DISCLOSURE.md` and `ai-provenance.json` files, and this
repo's `docs/ai/` directory links them.

## Tools & Models Used

Across the portfolio, the primary AI interfaces used were:

| Tool | Provider / Model | Interface | Approx. dates used |
|---|---|---|---|
| **Claude / Opus** | Anthropic | CLI agent + web chat | 2025-11 → 2026-09 |
| **Claude Sonnet** | Anthropic | CLI agent + web chat | 2025-11 → 2026-09 |
| **Cursor** | Anthropic (via IDE) | IDE agent | 2026-03 → 2026-09 |
| **GitHub Copilot** | GitHub | IDE completion | 2025-11 → 2026-09 |

## Scope — What AI Did vs. What Humans Did

- **Sibling repos** (subject to their own `AI_DISCLOSURE.md`): AI
  contributed the majority of boilerplate in each product, with human
  maintainers writing the architecture, tests, and security controls.
- **This repo:**
  - `docs/ai/PROVENANCE.md` — the milestone ledger and commit trail.
  - `docs/ai/PROMPTS.md` — sanitized prompt archive.
  - `docs/ai/transcripts/README.md` — transcript directory policy.
  - The portfolio assets and the migration/audit docs.

## Estimated AI-Assisted Share

0% for this repo itself — no confirmed, measured AI-assistance claim. The
portfolio's products are consistently reported at **60–75%** AI-assisted
per their own disclosures.

## Human Review Process

- Every PR is reviewed line-by-line by the maintainer.
- `docs/ai/` files carry the same redaction, security, and provenance
  gates as the sibling repos.

## Known Limitations & Risks

- No measured AI-share statistic is available for this repo itself.
- Do not retroactively reclassify documentation or portfolio work as
  AI-generated without evidence.

## How to Verify

- `git log --all --oneline --grep="assistant\\|ai\\|gen"` and the
  `Co-authored-by:` trailers in recent commits.
- `cat docs/ai/*` — per-product and per-repo provenance records.
- `git log --all --oneline --grep="ai-assisted\\|LLM\\|llm"` — the commit
  history trail.

## Last Updated

2026-10-06 · Maintained by `themanoj-025 <code.me.025@gmail.com>`
