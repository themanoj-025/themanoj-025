# AGENTS.md — themanoj-025

> Canonical project instructions. Pointers like `CLAUDE.md` or
> `.github/copilot-instructions.md` should say "See AGENTS.md".

---

## Project overview

**themanoj-025** — the maintainer's personal portfolio / AI product
showcase repository. Core components:

- **Portfolio** — personal profile, AI stack cards, contributions.
- **AI products** — sibling repos: Emotion-Lens, finsight-agent,
  Smart-Spam-Detector, Price-My-Car, and others.
- **Docs** — architecture, migration, audit records, `docs/ai/` provenance
  and transcripts.

Stack: HTML/CSS/JS · Python · Node · various sibling project stacks.

---

## Exact commands

```bash
# Install (per-repo — depends on the product)
# e.g. cd Emotion-Lens && python -m venv .venv && source .venv/bin/activate
# Install the specific dependency set in each repo.

# Lint / typecheck / test
# Run per-repo.

# Run portfolio
# Serve the static site via the configured web server.
```

---

## Folder map

| Path | Purpose |
|------|---------|
| `docs/` | Architecture, migration, audit records |
| `docs/ai/` | AI provenance + transcripts + prompts |
| `docs/audit/` | Per-repo audit reports |
| `.github/workflows/` | CI |
| `docs/portfolio/` | Portfolio assets |

## Do / don't

- **Do** point tooling at the upstream sibling repo `AGENTS.md` files,
  not at root-only copies.
- **Do not** commit PII or personal data.
- **Do not** commit unredacted transcripts.

## Security rules

- No secrets in the repository; `gitleaks` CI gate gates on hits.
- PII and personal data must be masked before any file leaves the
  sandbox.

## AI-assistance convention

Commits authored by AI must carry the trailer:

```text
AI-Assisted: yes | no | partial
```

See `.gitmessage` for the template. Do not rewrite historic commits
retroactively.

> **Note:** themanoj-025's AI provenance lives in `docs/ai/` (directory
> layout with `PROVENANCE.md`, `PROMPTS.md`, `transcripts/`). Root-level
> copies of `AGENTS.md`, `.gitmessage`, `AI_DISCLOSURE.md`, and
> `ai-provenance.json` are the canonical per-repo files added to this
> repo in the same style.
