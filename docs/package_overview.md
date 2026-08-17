# Package Overview — themanoj-025

Inventory of every module in the repository. This repo has **no Python package** —
the only executable units are the five standalone scripts under `scripts/`.

## 1. Scripts (`scripts/`)

| Module | Responsibility | Entry point | Side effects |
| --- | --- | --- | --- |
| `fetch_contributions.py` | Scrape the user's GitHub contribution grid (no auth) and derive stats | `python scripts/fetch_contributions.py` | Writes `data/contributions.json`; network call |
| `render_heatmap_svg.py` | Render `contributions.json` as a GitHub-style box heatmap SVG | `python scripts/render_heatmap_svg.py` | Writes `contrib-heatmap.svg` |
| `prep_photo.py` | Background-remove, CLAHE-contrast, and grayscale a source photo | `python scripts/prep_photo.py <input.jpg> [output]` | Writes `source-prepped.png` |
| `make_ascii_svg.py` | Convert the prepped grayscale photo into an ASCII-art SVG | `python scripts/make_ascii_svg.py` | Writes `manoj-ascii.svg` |
| `make_info_card.py` | Generate the static identity-card SVG (roles, contact) | `python scripts/make_info_card.py` | Writes `info-card.svg` |
| `requirements.txt` | Dependency manifest for the above (CI installs this) | — | — |

**Framework coupling**: none — pure scripts (stdlib + small data libs). All are invoked
by absolute path from the workflow (e.g. `python scripts/fetch_contributions.py`), so
their location under `scripts/` is a CI contract.

## 2. Data (`data/`)

| File | Responsibility |
| --- | --- |
| `contributions.json` | Cached per-day contribution counts + derived stats; pipeline hand-off artifact. |

## 3. Workflows (`.github/workflows/`)

| Workflow | Responsibility |
| --- | --- |
| `ci.yml` | Validation gates on push/PR (syntax, conflicts, secrets). |
| `update-profile-art.yml` | Scheduled + on-push art regeneration with auto-commit. |

## 4. Documentation (`docs/`)

| Area | Files | Responsibility |
| --- | --- | --- |
| Root docs | `architecture.md`, `folder_structure.md`, `module_dependency.md`, `startup_flow.md`, `package_overview.md` | This Phase-6 documentation suite |
| `migration/` | `migration_summary.md`, `old_tree_to_new_tree.md`, `file_move_ledger.md` | Restructure records |
| `portfolio/` | `PORTFOLIO_ARCHITECTURE.md`, `PORTFOLIO_SUMMARY.md` | Portfolio-wide context |
| `design/` | `AppFlow.md`, `Design.md` | Design docs |
| `product/` | `PRD.md` | Product requirements |
| `project/` | `Tracker.md`, `RiskRegister.md`, `ImplementationPlan.md`, `Rules.md`, `analysis_report.md` | Project management |
| `reference/` | `Glossary.md` | Vocabulary |
| `technical/` | `API.md`, `Schema.md`, `TechSpec.md`, `Testing.md`, `Deployment.md`, `SecurityAndCompliance.md` | Technical docs |

## 5. Root Artifacts

| File | Responsibility | Contract? |
| --- | --- | --- |
| `README.md` | Rendered profile page | Entry artifact |
| `contrib-heatmap.svg`, `manoj-ascii.svg`, `info-card.svg` | README-embedded art | **Yes — must stay at root** |
| `source-prepped.png` | Pipeline intermediate (read by `make_ascii_svg.py`) | **Yes — script default path** |
| `Resume.pdf` | Resume linked from README | **Yes — README link** |
| `Banner.png` | Legacy/unreferenced banner asset | No — **flagged** (see RiskRegister follow-up) |

## 6. Test Coverage

**None** — documented as N/A by design (no runtime logic worth unit-testing; CI covers
syntax + secrets). See `docs/technical/Testing.md` for the repo's testing stance.
