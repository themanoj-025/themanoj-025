# RiskRegister — themanoj-025: Known Risks & Mitigations

| Field | Value |
| --- | --- |
| Version | v0.1 |
| Last Updated | 2026-08-06 |
| Owner | Manoj (profile owner) |
| Status | Approved |

| ID | Risk | Likelihood | Impact | Score | Mitigation | Owner | Status |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R-01 | External badge/stats service outage | High | Medium | 8 | Monthly link check; fallback services; static alternatives | Owner | Open |
| R-02 | Profile goes stale (skills/repos outdated) | Medium | Medium | 6 | Quarterly review checklist (REQ-031) | Owner | Open |
| R-03 | Featured repo becomes private/deleted | Low | Medium | 3 | Link check catches 404s; rotate slots | Owner | Open |
| R-04 | Rendering regression (broken markdown/HTML) | Medium | Medium | 6 | PR preview + markdown lint gate | Owner | Open |
| R-05 | Email harvested by spammers | High | Low | 4 | Dedicated inbox; accept residual spam | Owner | Accepted |
| R-06 | Secret accidentally committed | Low | High | 5 | gitleaks scan; rotation runbook (SecurityAndCompliance §6) | Owner | Open |
| R-07 | Stats cards leak private repo info | Low | Medium | 3 | Only public repo stats requested; review card config | Owner | Open |
| R-08 | Typing SVG hero service flakes (Heroku) | Medium | Low | 3 | Static subtitle fallback already present | Owner | Mitigated |

## Risk Matrix

```mermaid
quadrantChart
    title Risk Prioritization
    x-axis Low Likelihood --> High Likelihood
    y-axis Low Impact --> High Impact
    quadrant-1 Watch: R-03, R-07
    quadrant-2 Manage: R-04, R-06, R-08
    quadrant-3 Avoid: R-05
    quadrant-4 Critical: R-01, R-02
```

## Top 3 Focus Risks

1. **R-01 Service outage** — the most likely failure; mitigated by fallbacks + monthly check.
2. **R-02 Staleness** — undermines credibility; mitigated by quarterly cadence.
3. **R-04 Render regression** — mitigated by preview + lint gates before merge.

## Related Documents

| Document | Relationship |
| --- | --- |
| [PRD.md](../product/PRD.md) | Top risk summary (Section 10) |
| [SecurityAndCompliance.md](../technical/SecurityAndCompliance.md) | R-06 detail |
| [Testing.md](../technical/Testing.md) | Link checks mitigating R-01/R-03 |
