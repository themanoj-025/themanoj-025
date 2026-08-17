# themanoj-025 — AI Systems Engineer Portfolio

> GitHub profile repository showcasing AI Systems Engineering work — production LLM infrastructure, agentic systems, GraphRAG, and vector search.

[![Python](https://img.shields.io/badge/Python-3776AB.svg)](https://python.org)
[![TypeScript](https://img.shields.io/badge/TypeScript-3178C6.svg)](https://typescriptlang.org)
[![GitHub](https://img.shields.io/badge/GitHub-181717.svg)](https://github.com/themanoj-025)

---

## Table of Contents

- [1. Executive Summary](#1-executive-summary)
- [2. Tech Stack & Core Technologies](#2-tech-stack--core-technologies)
- [3. Complete Folder Structure Tree](#3-complete-folder-structure-tree)
- [4. Exhaustive File-by-File & Folder-by-Folder Breakdown](#4-exhaustive-file-by-file--folder-by-folder-breakdown)
- [5. Configuration & Environment Variables](#5-configuration--environment-variables)
- [6. Build, Run & Deployment Instructions](#6-build-run--deployment-instructions)
- [7. Known Issues, Technical Debt & Assumptions](#7-known-issues-technical-debt--assumptions)
- [8. Glossary](#8-glossary)

---

## 1. Executive Summary

**themanoj-025** is a GitHub profile README repository that serves as a professional portfolio for an AI Systems Engineer. It showcases featured engineering work, technical skills, GitHub statistics, and contact information.

**Target visitors**: Hiring managers, engineering teams, and collaborators looking for AI/ML engineering talent.

**What it demonstrates**: A curated collection of production-grade projects spanning agentic systems, LLM infrastructure, real-time analytics, security-focused code review, banking APIs, spam detection, Telegram bots, and computer vision.

**Why it exists**: To provide a single, visually compelling entry point to the developer's body of work, with direct links to each featured project.

*Note: This is a profile README repository, not a software project. It contains documentation and visual assets only.*

---

## 2. Tech Stack & Core Technologies

### Featured Projects

| Project | Stack | Description |
|---------|-------|-------------|
| **Match-Mind** | React 19, TypeScript 6, Node/Express 5, Redis/BullMQ, Claude API | Real-time sports analytics with AI insights |
| **AegisAI** | FastAPI, Redis RQ, LLMs | Automated security-focused code review |
| **UNION-BANK-** | FastAPI, PostgreSQL, React 19 | Concurrent-safe banking API |
| **Smart Spam Detector** | scikit-learn, Streamlit, SHAP | Production-grade email classifier |
| **AI Daily Telegram Bot** | Python, Telegram API, Gemini | Curated AI news delivery |
| **EmotionLens** | TensorFlow, Streamlit, OpenCV | Real-time facial emotion detection |

### Technical Arsenal

- **Agentic Frameworks**: LangGraph, AutoGen, CrewAI, LangChain, LlamaIndex
- **Vector Databases**: Qdrant, ChromaDB, FAISS, Weaviate, pgvector, Neo4j
- **Local LLM Serving**: vLLM, Ollama, Unsloth, HuggingFace, LoRA/QLoRA
- **ML/DL**: PyTorch, TensorFlow, scikit-learn, XGBoost, LightGBM, CatBoost, SHAP
- **Languages**: Python, TypeScript, JavaScript, SQL, Bash
- **Backend**: FastAPI, Node.js, Express, NestJS, WebSockets
- **Frontend**: React 19, Next.js, TailwindCSS, Framer Motion, Three.js
- **Databases**: PostgreSQL, Redis, MySQL, SQLite
- **Cloud/DevOps**: Docker, AWS, Cloudflare R2, GitHub Actions, Linux, WSL

---

## 3. Complete Folder Structure Tree

```
themanoj-025/
├── .github/
│   └── workflows/
│       ├── ci.yml
│       └── update-profile-art.yml
├── .gitignore
├── .vscode/
│   └── settings.json
├── AGENTS.md
├── data/
│   └── contributions.json
├── docs/
│   ├── design/
│   │   ├── AppFlow.md
│   │   └── Design.md
│   ├── product/
│   │   └── PRD.md
│   ├── project/
│   │   ├── ImplementationPlan.md
│   │   ├── RiskRegister.md
│   │   ├── Rules.md
│   │   └── Tracker.md
│   ├── reference/
│   │   └── Glossary.md
│   └── technical/
│       ├── API.md
│       ├── Deployment.md
│       ├── Schema.md
│       ├── SecurityAndCompliance.md
│       ├── TechSpec.md
│       └── Testing.md
├── PROJECT_ANALYSIS.md
├── PROJECT_OVERVIEW.md
├── README.md
└── scripts/
    ├── fetch_contributions.py
    ├── make_ascii_svg.py
    ├── make_info_card.py
    ├── prep_photo.py
    ├── render_heatmap_svg.py
    └── requirements.txt
```

---

## 4. Exhaustive File-by-File & Folder-by-Folder Breakdown

### Root Files

#### `themanoj-025/README.md`
- **Purpose**: GitHub profile README. Features: ASCII art contribution heatmap, "whoami" card with role descriptions, featured engineering work (6 projects in a table), technical arsenal (7 skill categories with badge images), GitHub stats (followers, stars, streak, activity graph, top languages), and contact links.

### `themanoj-025/scripts/` — Profile Art Generation

| Script | Purpose |
|--------|---------|
| `fetch_contributions.py` | Fetches GitHub contribution data via API |
| `make_ascii_svg.py` | Generates ASCII art SVG from contribution data |
| `make_info_card.py` | Creates info card SVG with role descriptions |
| `prep_photo.py` | Prepares profile photo assets |
| `render_heatmap_svg.py` | Renders contribution heatmap as SVG |
| `requirements.txt` | Python dependencies for scripts |

### `themanoj-025/data/`

#### `contributions.json`
- **Purpose**: Cached GitHub contribution data used by the art generation scripts.

### `themanoj-025/.github/workflows/`

| Workflow | Purpose |
|----------|---------|
| `ci.yml` | CI pipeline (lint, validation) |
| `update-profile-art.yml` | Automated profile art regeneration |

---

## 5. Configuration & Environment Variables

| Variable | Purpose | Required |
|----------|---------|----------|
| `GITHUB_TOKEN` | GitHub API access for contribution fetching | Yes (for scripts) |

---

## 6. Build, Run & Deployment Instructions

```bash
# Install script dependencies
pip install -r scripts/requirements.txt

# Generate profile art
python scripts/fetch_contributions.py
python scripts/render_heatmap_svg.py
python scripts/make_info_card.py
```

---

## 7. Known Issues, Technical Debt & Assumptions

### Known Issues

1. **No tests**: This is a documentation-only repository.
2. **Art generation requires GitHub token**: Scripts need API access to fetch contribution data.

### Assumptions

1. **Profile art is auto-generated**: Workflows update artifacts on schedule.
2. **External badge services**: GitHub stats rely on third-party badge services.

---

## 8. Glossary

| Term | Definition |
|------|-----------|
| **GraphRAG** | Graph-based Retrieval Augmented Generation |
| **SLM** | Small Language Model |
| **vLLM** | High-throughput LLM serving engine |
| **LoRA/QLoRA** | Low-Rank Adaptation for efficient fine-tuning |

---

*This document was generated as part of a comprehensive project documentation effort. Last updated: August 8, 2026.*
