# themanoj-025 — Documentation Index

Single home for all themanoj-025 documentation. This repository is the GitHub
profile & personal-brand platform, including the portfolio-wide architecture
and modernization summaries covering all sibling projects.

**Start here:** [architecture.md](architecture.md) (system map) →
[folder_structure.md](folder_structure.md) (repo tree) →
[technical/TechSpec.md](technical/TechSpec.md) (build details).

## Structure

```
docs/
├── README.md                      ← this index
├── architecture.md                system architecture
├── folder_structure.md            repository + docs tree
├── module_dependency.md           dependency graph
├── package_overview.md            module inventory
├── startup_flow.md                boot + runtime flows
├── portfolio/
│   ├── PORTFOLIO_ARCHITECTURE.md  portfolio-wide architecture diagrams
│   └── PORTFOLIO_SUMMARY.md       portfolio modernization summary
├── design/
│   ├── AppFlow.md                 app screens / states / flows
│   └── Design.md                  design decisions
├── product/
│   └── PRD.md                     product requirements
├── project/
│   ├── analysis_report.md         repo inventory & classification
│   ├── ImplementationPlan.md      implementation plan
│   ├── RiskRegister.md            risks & mitigations
│   ├── Rules.md                   engineering rules
│   └── Tracker.md                 status tracker
├── reference/
│   └── Glossary.md                terminology
├── technical/
│   ├── API.md                     endpoint reference
│   ├── Deployment.md              deployment guide
│   ├── Schema.md                  data model
│   ├── SecurityAndCompliance.md   security baseline
│   ├── TechSpec.md                technical spec
│   └── Testing.md                 test strategy
├── migration/
│   ├── migration_summary.md       modernization record
│   ├── old_tree_to_new_tree.md    restructure before/after
│   └── file_move_ledger.md        file-move ledger
└── audit/
    ├── cleanup-audit-2026-08-13.md  previous cleanup audit
    └── cleanup-audit-2026-08-15.md  docs de-LLM-ification audit
```

## Guidance

| You want... | Read |
|---|---|
| How the platform works end-to-end | [architecture.md](architecture.md) |
| Portfolio overview | [portfolio/PORTFOLIO_SUMMARY.md](portfolio/PORTFOLIO_SUMMARY.md) |
| Portfolio architecture | [portfolio/PORTFOLIO_ARCHITECTURE.md](portfolio/PORTFOLIO_ARCHITECTURE.md) |
| Where everything lives | [folder_structure.md](folder_structure.md) |
| What's shipped / next | [project/Tracker.md](project/Tracker.md) |
| Risks & follow-ups | [project/RiskRegister.md](project/RiskRegister.md) |
