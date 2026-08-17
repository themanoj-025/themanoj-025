# Startup Flow — themanoj-025

Because this is a **static profile repository**, there are two "startups":

1. **Render flow** — what happens whenever someone opens the profile.
2. **Refresh flow** — the scheduled pipeline that keeps the artwork fresh.

---

## 1. Render Flow (on every profile view — instant, stateless)

```
1. GitHub resolves themanoj-025/themanoj-025@main
2. GitHub renders README.md (markdown → HTML)
3. Embedded assets are served from the repo itself:
     ./contrib-heatmap.svg  (contribution grid)
     ./manoj-ascii.svg      (ASCII avatar)
     ./info-card.svg        (identity card)
4. Remote badges render client-side from shields.io / vercel-hosted stats services
5. Page is "ready to serve" — no app boot, no network beyond badge fetches
```

No dependencies to install, no environment variables, no process lifecycle.

---

## 2. Refresh Flow (scheduled / on-demand)

Triggered by `update-profile-art.yml`:

| Step | Action | Command | Effect |
| --- | --- | --- | --- |
| 0 | Trigger | cron `17 6 * * *` UTC, `workflow_dispatch`, or push to `main` | workflow starts |
| 1 | Checkout | `actions/checkout@v4` | clean tree on `main` |
| 2 | Python | `actions/setup-python@v5` (3.11) | runtime ready |
| 3 | Install | `pip install -r scripts/requirements.txt` | `requests`, `bs4`, `Pillow` |
| 4 | Fetch | `python scripts/fetch_contributions.py` | writes `data/contributions.json` |
| 5 | Render | `python scripts/render_heatmap_svg.py` | writes `contrib-heatmap.svg` |
| 6 | Commit | `stefanzweifel/git-auto-commit-action@v5` | commits both files, `[skip ci]` |

**Failure modes**: if step 4/5 fail (network, upstream markup change), the workflow
fails loudly in CI and the last committed artwork remains — the profile is never
broken because rendering depends only on committed files.

---

## 3. Local Regeneration (developer flow)

```bash
pip install -r scripts/requirements.txt
python scripts/fetch_contributions.py      # → data/contributions.json
python scripts/render_heatmap_svg.py       # → contrib-heatmap.svg
# after changing the source photo:
python scripts/prep_photo.py <input.jpg>   # → source-prepped.png
python scripts/make_ascii_svg.py           # → manoj-ascii.svg
python scripts/make_info_card.py           # → info-card.svg
```

---

## 4. Validation Flow (push / PR)

`ci.yml` runs on push/PR to `main`: `.gitignore` present → no conflict markers →
`py_compile` every `.py` → secret-pattern scan → oversized-file warning. Non-failing
warnings are informational.
