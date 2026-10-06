# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| main    | :white_check_mark: |

## Reporting a Vulnerability

If you discover a security vulnerability in this repository, please report it
privately so it can be handled responsibly. Do **not** open a public issue.

- Email: `code.me.025@gmail.com`
- Include: reproduction steps, affected files/commits, impact assessment, and
  (if relevant) a suggested fix.

Response SLA:

- Acknowledgement within **48 hours**
- Initial triage and severity rating within **5 business days**
- Fix or workaround communicated within **15 business days** (depending on
  severity)

## Security Audit Artifacts

This repository documents an AI/agent product portfolio in
`docs/ai/` (`AI_DISCLOSURE.md`, `PROVENANCE.md`, `ai-provenance.json`,
`PROMPTS.md`, `transcripts/README.md`). Secret scanning in CI (`ci.yml`)
looks for hardcoded `AKIA`/`ghp_`/`AIza`/`xox`/`sk-`/`password=`/`secret=`
patterns. Only documented `GITHUB_TOKEN` references appear in
`PROJECT_OVERVIEW.md` and `docs/architecture.md`; CI itself uses
`contents: write` for the schedule-driven profile-art workflow.
