# Contributing to themanoj-025

Thanks for your interest in this profile repository! This repo powers the GitHub profile README and automated contribution visualizations.

## What This Repo Contains

- **README.md** — The profile page displayed on the GitHub profile
- **SVG assets** — Auto-generated contribution heatmap, info card, and ASCII art
- **scripts/** — Python scripts that generate profile artwork from contribution data
- **data/** — Contribution data (auto-updated daily via GitHub Actions)
- **docs/** — Internal portfolio architecture and project documentation

## How to Contribute

### Reporting Issues

If you spot broken images, outdated links, or rendering issues on the profile page, please open an issue with:

- A screenshot of the problem (if visual)
- The browser and device you're using
- Expected vs. actual behavior

### Suggesting Improvements

For suggestions about the profile layout, artwork, or documentation:

1. Open an issue describing the improvement
2. Explain the expected impact on the profile presentation

### Making Changes

1. Fork the repository
2. Create a feature branch: `git checkout -b improve-profile`
3. Make your changes
4. Ensure the CI passes (conflict markers, Python syntax, secrets scan)
5. Submit a pull request with a clear description

## Development Setup

### Prerequisites

- Python 3.11+
- pip

### Local Development

```bash
# Install script dependencies
pip install -r scripts/requirements.txt

# Regenerate contribution data
python scripts/fetch_contributions.py

# Regenerate SVG artwork
python scripts/render_heatmap_svg.py
python scripts/make_ascii_svg.py
python scripts/make_info_card.py
```

### CI Validation

The CI workflow (`ci.yml`) runs on every push and PR:

- Checks for unresolved merge conflict markers
- Validates Python syntax
- Scans for hardcoded secrets
- Checks for oversized files (>5MB)

## Automation

The `update-profile-art.yml` workflow runs daily at ~06:17 UTC to:

1. Fetch fresh contribution data from GitHub
2. Re-render the animated contribution heatmap SVG
3. Auto-commit the updated artwork

## Code Style

- Python scripts follow PEP 8
- Use `ruff` for linting (config in `pyproject.toml` if present)
- Keep scripts self-contained and well-documented

## License

By contributing, you agree that your contributions will be licensed under the same license as this repository.
