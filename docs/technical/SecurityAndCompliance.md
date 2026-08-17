# SecurityAndCompliance — themanoj-025: Disclosure & Privacy Policy

| Field | Value |
| --- | --- |
| Version | v0.1 |
| Last Updated | 2026-08-06 |
| Owner | Manoj (profile owner) |
| Status | Approved |

---

## 1. Threat Model

| Threat | Asset | Mitigation |
| --- | --- | --- |
| Credential leak in README/assets | Secrets | pre-commit secret scan + never commit env files |
| Email harvesting | Public mailto | Accept residual spam; use dedicated inbox |
| Impersonation | Profile identity | Verified GitHub account; links to verified LinkedIn |
| Malicious badge/image URL | Visitor device | Only well-known image services; HTTPS only |
| Stale/misleading content | Reputation | Quarterly review cadence (REQ-031) |

## 2. Data Disclosure Policy

| Data | Status | Rationale |
| --- | --- | --- |
| Email (code.me.025@gmail.com) | Public by choice | Primary contact CTA |
| LinkedIn profile | Public by choice | Professional identity |
| Resume PDF | Public by choice | Recruiting signal |
| Phone / home address | NEVER published | Privacy boundary |
| Personal photos of family | NEVER published | Privacy boundary |

## 3. Data Classification

| Class | Examples | Handling |
| --- | --- | --- |
| Public (intended) | email, resume, projects, skills | Rendered in README |
| Public (GitHub-native) | repos, stats, activity | Fetched by services |
| Secret | tokens, keys, passwords | Must never appear in repo history |
| Private | personal address, contacts | Never in repo |

## 4. Compliance Notes

- **GitHub ToS:** profile repo is public content; third-party services must comply with GitHub's guidelines on external images (no user tracking pixels).
- **GDPR/CCPA:** applies to visitors only if the profile collected data — it does not (komarev counts views anonymously, no personal data retained by owner).
- **Resume data:** holder of the data is the owner; visitors who access the resume do so voluntarily.

## 5. Secret Management Rules

- Never commit `.env`, tokens, or keys — if one is committed: rotate immediately, `git filter-repo` history scrub if public, and revoke.
- CI secret scanning (gitleaks) on every PR.
- Personal Access Tokens used by any automation must use least-privilege scopes and short expiry.

## 6. Incident Response (Outline)

1. **Detect:** notification from GitHub secret scanning, or security alert.
2. **Triage:** determine exposure (commit, branch, or PR only).
3. **Mitigate:** rotate/revoke credential; purge commit + history if needed.
4. **Recover:** verify no forks retained the secret; document in ../project/Tracker.md changelog.
5. **Postmortem:** add preventive control (scan rule) within 48h.

## 7. Related Documents

| Document | Relationship |
| --- | --- |
| [Rules.md](../project/Rules.md) | Security baseline (Section 6) |
| [RiskRegister.md](../project/RiskRegister.md) | R-05 disclosure risk |
| [Tracker.md](../project/Tracker.md) | Incident log location |
