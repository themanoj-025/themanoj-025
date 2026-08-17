# Architecture — themanoj-025

> GitHub profile repository: a **static, documentation-only** repo that renders as the
> GitHub profile page of an AI Systems Engineer. There is no server, no database, and
> no application runtime — the "product" is the rendered `README.md` plus the
> auto-generated profile artwork.

---

## 1. System Overview

```
┌──────────────────────────────────────────────────────────────────────────┐
│                          themanoj-025 (profile repo)                     │
│                                                                          │
│   PRESENTATION  README.md  ── embeds ──►  contrib-heatmap.svg            │
│       │                                   manoj-ascii.svg                │
│       │                                   info-card.svg                  │
│       │                                   Resume.pdf (link)              │
│       │                                                                  │
│   PIPELINE      scripts/  (Python art-generation toolchain)              │
│       │            │                                                     │
│       │            ├─ fetch_contributions.py  ──►  data/contributions.json
│       │            ├─ render_heatmap_svg.py   ──►  contrib-heatmap.svg   │
│       │            ├─ prep_photo.py           ──►  source-prepped.png    │
│       │            ├─ make_ascii_svg.py       ──►  manoj-ascii.svg       │
│       │            └─ make_info_card.py       ──►  info-card.svg         │
│       │                                                                  │
│   ORCHESTRATION  .github/workflows/ (GitHub Actions)                     │
│                      ├─ update-profile-art.yml  (daily refresh, cron)    │
│                      └─ ci.yml                  (validation on push)     │
│                                                                          │
│   CONTENT        docs/  ── documentation suite (architecture, design,    │
│                          product, project, reference, technical,         │
│                          migration, portfolio)                           │
└──────────────────────────────────────────────────────────────────────────┘
```

## 2. Major Components

| Component | Location | Responsibility |
| --- | --- | --- |
| Profile README | `README.md` | The rendered profile page: featured projects, technical arsenal, GitHub stats, contact links. References the generated SVG assets and `Resume.pdf` by **root-relative path** (e.g. `./contrib-heatmap.svg`) — these paths are a deployment contract. |
| Art assets | `contrib-heatmap.svg`, `manoj-ascii.svg`, `info-card.svg`, `source-prepped.png`, `Banner.png`, `Resume.pdf` | Static presentation artifacts embedded by the README or produced/consumed by the pipeline. |
| Art pipeline | `scripts/` | Five standalone Python scripts (stdlib + `requests`/`bs4`/`Pillow`/`opencv`/`rembg`) that fetch contribution data and render the profile SVGs. Each writes to a fixed path relative to the repo root. |
| Cached data | `data/contributions.json` | Raw GitHub contribution days plus derived stats, produced by `fetch_contributions.py`, consumed by `render_heatmap_svg.py`. |
| Scheduled refresh | `.github/workflows/update-profile-art.yml` | Daily (`17 6 * * *` UTC) and on-push refresh: fetch → render → auto-commit `data/contributions.json` + `contrib-heatmap.svg`. |
| Validation | `.github/workflows/ci.yml` | Push/PR gates: `.gitignore` presence, conflict markers, Python syntax (`py_compile`), secret-pattern scan, oversized-file warning. |
| Documentation | `docs/` | Full documentation suite (see `docs/folder_structure.md`). |

## 3. Data Flow

1. **Refresh (scheduled / manual)** — `update-profile-art.yml` installs `scripts/requirements.txt`,
   runs `fetch_contributions.py` (writes `data/contributions.json`), then
   `render_heatmap_svg.py` (writes `contrib-heatmap.svg`), then commits both via
   `git-auto-commit-action` with `[skip ci]`.
2. **Render** — GitHub renders `README.md`; the embedded SVGs are served from the repo
   (no CDN, no runtime).

## 4. Key Architectural Properties

- **Zero runtime** — no services, no entry point to keep alive; CI + cron are the only actors.
- **Fixed-path contract** — pipeline scripts compute output paths relative to the repo
  root (`os.path.join(HERE, "..", ...)`), so script *locations* can change without
  breaking outputs, but *output locations* are part of the contract with README/CI.
- **External dependencies** — contribution data and stats badges come from third-party
  services (GitHub API, shields/vercel-hosted badges); the heatmap data source is
  scraped without auth.

## 5. Cross-cutting Concerns

- **Secrets**: `GITHUB_TOKEN` used by the refresh workflow (repo-scoped, `contents: write`).
- **Observability**: none required for a static repo; CI logs are the only telemetry.
- **Security**: profile is public by design; CI scans for accidental secrets in `.md/.py/.yml`.

See also: `docs/module_dependency.md`, `docs/startup_flow.md`, `docs/package_overview.md`,
`docs/migration/old_tree_to_new_tree.md`.
