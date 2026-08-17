# Module Dependency — themanoj-025

There is no runtime import graph (no package); dependencies here are **pipeline and
reference dependencies**. All are acyclic — no circular dependencies exist.

## 1. Pipeline Chain (data flow)

```
GitHub contribution data (web)
        │  scripts/fetch_contributions.py   [writes]
        ▼
data/contributions.json ──────────────► scripts/render_heatmap_svg.py   [writes]
        │                                        │
        │                                        ▼
        │                                 contrib-heatmap.svg  ──►  README.md (embeds)
        │
source photo (manual) ──► scripts/prep_photo.py   [writes]
        │                                        │
        ▼                                        ▼
source-prepped.png ──────────────────► scripts/make_ascii_svg.py   [writes]
                                                 │
                                                 ▼
                                          manoj-ascii.svg  ──►  README.md (embeds)

scripts/make_info_card.py  ──────────────────────────────►  info-card.svg  ──► README.md (embeds)
```

## 2. Dependency Matrix

| Module | Reads | Writes | Depends on | Consumed by |
| --- | --- | --- | --- | --- |
| `scripts/fetch_contributions.py` | GitHub public contribution pages (network) | `data/contributions.json` | `requests`, `bs4` | `update-profile-art.yml` |
| `scripts/render_heatmap_svg.py` | `data/contributions.json` | `contrib-heatmap.svg` | stdlib | `update-profile-art.yml`, README |
| `scripts/prep_photo.py` | source photo (CLI arg) | `source-prepped.png` | `cv2`, `numpy`, `PIL`, `rembg` | `make_ascii_svg.py` (indirect) |
| `scripts/make_ascii_svg.py` | `source-prepped.png` | `manoj-ascii.svg` | `PIL` | README |
| `scripts/make_info_card.py` | — (static content) | `info-card.svg` | stdlib | README |
| `README.md` | — | — | all root SVGs + `Resume.pdf` (path contract) | GitHub profile renderer |
| `data/contributions.json` | `fetch_contributions.py` | — | — | `render_heatmap_svg.py` |
| `.github/workflows/update-profile-art.yml` | — | commits `data/contributions.json` + `contrib-heatmap.svg` | `scripts/requirements.txt` | repo history |
| `.github/workflows/ci.yml` | — | CI logs | repo content | — |
| `docs/**` | — | — | — | humans |

## 3. Why This Shape

- **Scripts are leaf modules**: each has a single input/output pair and no internal
  imports of one another — keeping them independent makes the cron pipeline trivially
  debuggable and re-runnable.
- **Root SVG files are the integration seam**: README and CI both reference them by
  root-relative path, so they must remain at root. Moving them would break rendering
  and the auto-commit `file_pattern`.
- **No cycles**: the only shared artifact is `data/contributions.json`, which flows
  strictly one way (fetch → render).

## 4. Change Warnings

- If a script's **output path** changes, update `README.md` and the
  `update-profile-art.yml` `file_pattern` in the same commit.
- If `scripts/requirements.txt` changes, the cron job installs from it — keep it minimal.
