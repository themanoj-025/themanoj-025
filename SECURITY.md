# Security Policy

## Supported Versions

| Version | Supported |
| ------- | --------- |
| main    | :white_check_mark: |

## Reporting a Vulnerability

Report privately to `code.me.025@gmail.com` with reproduction steps, affected
commits, and impact assessment. Initial triage within 48 hours; fix or
workaround within 15 business days.

## Security Audit Artifacts

AI/agent product provenance lives in `docs/ai/` (`AI_DISCLOSURE.md`,
`PROVENANCE.md`, `ai-provenance.json`, `PROMPTS.md`, `transcripts/README.md`).
CI (`ci.yml`) scans for hardcoded `AKIA`/`ghp_`/`AIza`/`xox`/`sk-` patterns.
Only documented `GITHUB_TOKEN` references appear in `PROJECT_OVERVIEW.md` and
`docs/architecture.md`; CI itself uses `contents: write` for the schedule-driven
profile-art workflow.
