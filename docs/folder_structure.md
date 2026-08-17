# Folder Structure — themanoj-025

Annotated tree of the **current (post-restructure)** layout, one-line purpose per entry.

```
themanoj-025/
├── .github/
│   └── workflows/
│       ├── ci.yml                 # Push/PR validation gates (syntax, secrets, conflicts)
│       └── update-profile-art.yml # Daily/on-push profile-art refresh (cron)
├── .gitignore                     # Standard ignore set incl. .ruff_cache/, .gemini/, .cursorrules
├── .vscode/
│   └── settings.json              # Editor settings (tracked)
├── AGENTS.md                      # Agent operating instructions (v6.0 universal prompt)
├── PROJECT_ANALYSIS.md            # Root project analysis document
├── PROJECT_OVERVIEW.md            # Root project overview (structure, env, run book)
├── README.md                      # The rendered GitHub profile page (entry artifact)
├── Banner.png                     # Legacy banner asset (unreferenced by README; flagged)
├── contrib-heatmap.svg            # Contribution heatmap — README-embedded, CI-committed (contract)
├── data/
│   └── contributions.json         # Cached contribution data (pipeline input)
├── docs/
│   ├── architecture.md            # High-level architecture (this repo's "system")
│   ├── folder_structure.md        # Annotated tree (this file)
│   ├── module_dependency.md       # Script ⇄ data ⇄ asset ⇄ workflow dependencies
│   ├── startup_flow.md            # Render + refresh pipeline, step by step
│   ├── package_overview.md        # Inventory of every module/script/asset
│   ├── migration/
│   │   ├── migration_summary.md   # v5.0 modernization record
│   │   ├── old_tree_to_new_tree.md# Before/after diff of the restructure
│   │   └── file_move_ledger.md    # Per-file move ledger (this restructure)
│   ├── portfolio/
│   │   ├── PORTFOLIO_ARCHITECTURE.md # Portfolio-wide architecture diagrams
│   │   └── PORTFOLIO_SUMMARY.md      # Portfolio-wide modernization summary
│   ├── design/                    # Design docs (AppFlow, Design)
│   ├── product/                   # Product docs (PRD)
│   ├── project/                   # Project mgmt (Tracker, RiskRegister, ImplementationPlan, Rules)
│   ├── reference/                 # Reference (Glossary)
│   └── technical/                 # Technical (API, Schema, TechSpec, Testing, Deployment, Security)
├── info-card.svg                  # "Who am I" card — README-embedded (contract)
├── manoj-ascii.svg                # ASCII avatar — README-embedded (contract)
├── Resume.pdf                     # Resume — README-linked (contract)
├── scripts/
│   ├── fetch_contributions.py     # Fetch contribution data → data/contributions.json
│   ├── render_heatmap_svg.py      # contributions.json → contrib-heatmap.svg
│   ├── prep_photo.py              # Photo → source-prepped.png (grayscale, bg removed)
│   ├── make_ascii_svg.py          # source-prepped.png → manoj-ascii.svg
│   ├── make_info_card.py          # Static info card → info-card.svg
│   └── requirements.txt           # Python deps for the scripts (used by CI)
└── source-prepped.png             # Preprocessed photo input for make_ascii_svg.py (contract)
```

## Top-level folder purposes

| Path | Purpose |
| --- | --- |
| `.github/workflows/` | All CI/CD automation (validation + scheduled refresh). |
| `data/` | Cached/derived data consumed by scripts. |
| `docs/` | Single documentation home, categorized. |
| `scripts/` | Operational Python toolchain for profile-art generation. |
| `*` (root files) | Canonical repo metadata + the profile artifacts that form the
  README's rendering contract (must stay at root — see `docs/architecture.md` §2). |
