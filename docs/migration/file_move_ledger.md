# File Move Ledger — themanoj-025

Restructure date: **2026-08-11** · Method: `git mv` (rename tracking, history preserved)
· Branch: `main` (local commits, no push).

## Moved Files

| # | Old Path | New Path | Category | Reason | Risk | Verified? |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | `migration_summary.md` | `docs/migration/migration_summary.md` | Meta → Docs | Consolidate migration records under `docs/migration/` per protocol Phase 6 | Low (no references anywhere) | ✅ grep 0 refs |
| 2 | `PORTFOLIO_ARCHITECTURE.md` | `docs/portfolio/PORTFOLIO_ARCHITECTURE.md` | Meta → Docs | Declutter root to canonical metadata; portfolio-scope doc belongs in docs | Low (no references anywhere) | ✅ grep 0 refs |
| 3 | `PORTFOLIO_SUMMARY.md` | `docs/portfolio/PORTFOLIO_SUMMARY.md` | Meta → Docs | Same as #2 | Low (no references anywhere) | ✅ grep 0 refs |

## Files Rewritten (content only — same path)

| Path | Reason |
| --- | --- |
| `docs/architecture.md` | Was a 49-byte stub → full architecture document |
| `docs/folder_structure.md` | Was a 105-byte stub → full annotated tree |

## Files Created

| Path | Reason |
| --- | --- |
| `docs/module_dependency.md` | Protocol Phase 6 deliverable |
| `docs/startup_flow.md` | Protocol Phase 6 deliverable |
| `docs/package_overview.md` | Protocol Phase 6 deliverable |
| `docs/migration/old_tree_to_new_tree.md` | Protocol Phase 6 deliverable |
| `docs/migration/file_move_ledger.md` | Protocol Phase 6 deliverable (this file) |

## Files Deliberately NOT Moved (contract analysis)

| Path | Why it stays | Risk if moved |
| --- | --- | --- |
| `contrib-heatmap.svg` | Embedded by `README.md`; committed by `update-profile-art.yml` `file_pattern` | High — breaks profile render + CI auto-commit |
| `manoj-ascii.svg`, `info-card.svg` | Embedded by `README.md` | High — breaks profile render |
| `source-prepped.png` | Default input path of `scripts/make_ascii_svg.py` | Medium — breaks script default run |
| `Resume.pdf` | Linked from `README.md` (raw URL) | High — breaks resume link |
| `scripts/*.py` | Invoked by exact path in `update-profile-art.yml` (`python scripts/...`) | Medium — would require CI + README update in lockstep |
| `README.md` | Entry artifact of the repo | — |

## Flagged (not deleted — needs human review)

| Path | Flag |
| --- | --- |
| `Banner.png` | Unreferenced by README and scripts; possibly a legacy/alternate asset. Keep unless confirmed dead. |
| Root `.env`/`PORTFOLIO_*` duplicates | The repo's `PORTFOLIO_*` docs now live in `docs/portfolio/`; the identical-named files at the portfolio root (`F:\GITHUB\PORTFOLIO_*.md`) are out of this repo's scope. |

## Deletions

None in this restructure.
