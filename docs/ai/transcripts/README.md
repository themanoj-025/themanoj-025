# Transcripts & Redaction Policy

`docs/ai/transcripts/` is reserved for **sanitized** AI conversation exports
only. The policy below governs what may be placed here, what is removed, and how
to add a new export.

## Redaction policy

For any exported chat log, memory, or artifact summary before it is copied into
this folder, remove **all** of the following:

| Category | Examples to redact |
|---|---|
| API keys & tokens | `sk-...`, `xox...`, `AIza...`, GitHub tokens, `Authorization: Bearer ...`, `.env` values |
| Personal data of other people | Names, emails, phone numbers, mailing addresses |
| Private URLs / internal hostnames | Internal services, machine names, non-public dashboards |
| Account IDs that are not the author | `ghu_`/`gho_`/`ghp_`/`ghs_`/`ghr_` source values |
| Secrets referenced anywhere | `password=`, `passwd=`, `secret=`, `credentials.json` contents, `service-account*.json` contents |

Never copy a full secret value into a transcript. Mask as
`sk-ab12************` (first 4–6 characters) if a shortened value must be
shown for referential purposes — and never into a new file or commit message.

## What we do NOT track

- Raw, unredacted AI chat exports (`*.chat-export.raw.json`, `.aider.chat.history.md`, etc.) are intentionally **not** tracked.
- Machine-local AI config (`.claude/settings.local.json`, `.gemini/cache/`,
  `.cursor/logs/`, `.copilot/cache/`, etc.) is ignored by `.gitignore`.

## Adding a new sanitized transcript

1. Save the raw export to `docs/ai/transcripts/<date>-<source>.raw.jsonl`
   **without** committing it, or
2. Strip the above categories with a script, then commit the sanitized file to
   `docs/ai/transcripts/<date>-<short-source>.jsonl`, and
3. Record the date, tool, and one-line purpose in `docs/ai/PROMPTS.md`.

## Verification

Run from the repository root to confirm no raw log or machine-local AI config is
tracked and that the permitted `docs/ai/` provenance files ARE tracked:

```bash
# Every provenance path must be tracked and not ignored:
git ls-files | grep -E "docs/ai/(AI_DISCLOSURE|PROMPTS|PROVENANCE).*"
git ls-files | grep "ai-provenance.json"

# Every private/local AI file must be ignored:
git check-ignore -v .claude/settings.local.json .gemini/cache/ .cursor/logs/ .aider.chat.history.md 2>/dev/null
```
