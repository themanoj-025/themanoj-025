# Old Tree → New Tree — themanoj-025

Restructure performed **2026-08-11** per the Principal Architect Enterprise
Repository Restructuring protocol (Phase 1–9). This is a documentation-focused repo;
the restructure relocated three root-level documents and completed the Phase 6
documentation suite. **No code, no logic, no entry points, no workflow paths changed.**

## Before (2026-08-10)

```
themanoj-025/
├── .github/workflows/{ci.yml, update-profile-art.yml}
├── AGENTS.md
├── Banner.png
├── contrib-heatmap.svg
├── data/contributions.json
├── docs/
│   ├── architecture.md            (STUB — 49 bytes)
│   ├── folder_structure.md        (STUB — 105 bytes)
│   ├── design/{AppFlow.md, Design.md}
│   ├── product/PRD.md
│   ├── project/{Tracker.md, RiskRegister.md, ImplementationPlan.md, Rules.md, analysis_report.md}
│   ├── reference/Glossary.md
│   └── technical/{API.md, Schema.md, TechSpec.md, Testing.md, Deployment.md, SecurityAndCompliance.md}
├── info-card.svg
├── manoj-ascii.svg
├── migration_summary.md           (root-level v5.0 record)
├── PORTFOLIO_ARCHITECTURE.md      (root-level, 621 lines)
├── PORTFOLIO_SUMMARY.md           (root-level, 300 lines)
├── PROJECT_ANALYSIS.md
├── PROJECT_OVERVIEW.md
├── README.md
├── Resume.pdf
├── scripts/{fetch_contributions.py, render_heatmap_svg.py, prep_photo.py,
│            make_ascii_svg.py, make_info_card.py, requirements.txt}
└── source-prepped.png
```

## After (2026-08-11)

```
themanoj-025/
├── .github/workflows/{ci.yml, update-profile-art.yml}
├── AGENTS.md
├── Banner.png                    (unchanged — flagged, see ledger)
├── contrib-heatmap.svg           (unchanged — README/CI contract)
├── data/contributions.json
├── docs/
│   ├── architecture.md           (REWRITTEN — real content)
│   ├── folder_structure.md       (REWRITTEN — real content)
│   ├── module_dependency.md      (NEW)
│   ├── startup_flow.md           (NEW)
│   ├── package_overview.md       (NEW)
│   ├── migration/
│   │   ├── migration_summary.md  (MOVED from root migration_summary.md)
│   │   ├── old_tree_to_new_tree.md (NEW — this file)
│   │   └── file_move_ledger.md   (NEW)
│   ├── portfolio/
│   │   ├── PORTFOLIO_ARCHITECTURE.md (MOVED from root)
│   │   └── PORTFOLIO_SUMMARY.md      (MOVED from root)
│   ├── design/{AppFlow.md, Design.md}
│   ├── product/PRD.md
│   ├── project/{Tracker.md, RiskRegister.md, ImplementationPlan.md, Rules.md, analysis_report.md}
│   ├── reference/Glossary.md
│   └── technical/{API.md, Schema.md, TechSpec.md, Testing.md, Deployment.md, SecurityAndCompliance.md}
├── info-card.svg                 (unchanged — README contract)
├── manoj-ascii.svg               (unchanged — README contract)
├── PROJECT_ANALYSIS.md
├── PROJECT_OVERVIEW.md
├── README.md
├── Resume.pdf                    (unchanged — README link contract)
├── scripts/                      (unchanged — CI invokes by these exact paths)
└── source-prepped.png            (unchanged — script default path)
```

## Summary of Changes

| Kind | Count |
| --- | --- |
| Files moved (`git mv`, history preserved) | 3 |
| Docs rewritten (stub → full) | 2 |
| Docs added | 5 |
| Files deleted | 0 |
| Business logic / entry points / workflow paths changed | 0 |
