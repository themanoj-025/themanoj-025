# AI-Provenance Prompts

Key prompts that materially shaped the AI-stack portfolio. Only **sanitized**
(prompt text with no secrets, no personal data, no internal hostnames) prompts
are stored here. Raw, unredacted AI chat exports are deliberately not tracked —
see `transcripts/README.md`.

---

## Prompt 1 — Node integration scaffolding (Gemini)

- **Date (commit):** 2026-07-10 (`861c73a`, authored by Manoj)
- **Tool:** Gemini
- **Purpose:** Select an AI interface and keep machine-local AI config out of
  version control.
- **Outcome:** `.gitignore` was updated (negation block reviewed) so `.gemini/`
  is ignored and `docs/ai/` is re-included so provenance files remain visible.

---

## Prompt 2 — AI artifact workflow (Gemini)

- **Date (commit):** 2026-07-31 (`33ae3f2`, authored by Manoj)
- **Tool:** Gemini (inferred from `.gitignore` handling of `.gemini/`)
- **Purpose:** Generate a short "AI memory and artifact summary" for the repo.
- **Outcome:** `docs/memory.md` was produced, then **deleted** (`D docs/memory.md`)
  because it contained unredacted content.

---

## Prompt 3 — "Updated AI stack" for the profile info card

- **Date (commit):** 2026-07-25 (`c18ec30`, authored by Manoj)
- **Tool:** Not an AI; a human-authored feature commit.
- **Purpose:** Reflect installed Python/SVG tooling (rembg, opencv, numpy) in
  `info-card.svg` "AI stack" banner.
- **Outcome:** `info-card.svg` + `scripts/make_info_card.py` modified. No AI in
  the generated code.

---

## Prompt � Portfolio architecture documentation (Gemini)

- **Date (commit):** 2026-07-10 (`861c73a`, authored by Manoj)
- **Tool:** Gemini
- **Purpose:** Select an AI interface and keep machine-local AI config out of
  version control.
- **Outcome:** `.gitignore` was updated (negation block reviewed) so `.gemini/`
  is ignored and `docs/ai/` is re-included so provenance files remain visible.


> **Note on sibling repos:** AegisAI, Emotion-Lens, finsight-agent,
> Smart-Spam-Detector, UNION-BANK-, etc. are separate git repositories, each with
> its own history and tooling. Prompts that shaped those projects live inside
> those repos and are not copied here. A project's described AI stack (GraphRAG,
> vector DB, vLLM, agentic router) is the **application using AI**, which is a
> different fact from this project being built with AI assistance.
