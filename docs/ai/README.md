# 📁 docs/ai/ — AI assistance provenance
This folder is the human-readable + machine-readable audit trail for how this
repository was produced and what AI tools were involved.

## Contents
| File | Purpose |
|---|---|
| `AI_DISCLOSURE.md` | Human-readable narrative: what AI did, what humans did, date. |
| `ai-provenance.json` | Machine-readable provenance (strict JSON, machine-validated). |
| `PROMPTS.md` | Key prompts that materially shaped the repository (sanitized). |
| `PROVENANCE.md` | Timeline of major AI-assisted milestones, each linked to a commit. |
| `transcripts/README.md` | Redaction policy for the conversation transcripts below. |
| `transcripts/` | SANITIZED conversation exports (API keys/tokens/personal data stripped). |

## Usage
- Maintainers update the files here as the project evolves.
- Do NOT commit unredacted chat logs or raw exports. The `transcripts/` folder
  must only contain sanitised copies.
- `ai-provenance.json` is validated on every push by `.github/workflows/ai-disclosure-check.yml`.
