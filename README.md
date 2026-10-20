<div align="center">

<img src="contrib-heatmap.svg" width="860" alt="Contribution heatmap across repositories" />

<br><br>

<table>
  <tr>
    <td valign="top"><img src="manoj-ascii.svg" width="370" alt="Terminal avatar" /></td>
    <td valign="top"><img src="info-card.svg" width="490" alt="Terminal information card" /></td>
  </tr>
</table>

</div>

---

## About Me

I design and build software systems where reliability, auditability, and latency matter. My engineering portfolio spans 17 production-grade codebases covering autonomous multi-agent pipelines, ACID-compliant banking ledgers, explainable machine learning systems, and full-stack real-time web applications.

Every repository in this portfolio is built with strict evidence-ledgered engineering: verified test suites, reproducible benchmarks, strict typed interfaces, and zero ungrounded claims.

---

## Portfolio Index

A comprehensive catalog of all 17 open-source systems developed across enterprise infrastructure, machine learning, and web domains.

| Repository | Focus Domain | Key Stack | Test Verification |
| --- | --- | --- | --- |
| [Match-Mind](https://github.com/themanoj-025/Match-Mind) | Real-Time Sports Analytics Monorepo | React 19, Express 5, Socket.IO, BullMQ, Claude API | 194 Vitest tests |
| [UNION-BANK-](https://github.com/themanoj-025/UNION-BANK-) | ACID Core Banking & Ledger API | FastAPI, PostgreSQL, SQLAlchemy 2, React 19 | 733 pytest tests |
| [AegisAI](https://github.com/themanoj-025/AegisAI) | Autonomous Pull Request Security Reviewer | FastAPI, Redis RQ, Semgrep SAST, LLMs | 195 pytest tests |
| [sentinel-review](https://github.com/themanoj-025/sentinel-review) | Code Quality & SAST Pipeline Orchestrator | Django 5.1, Celery, Redis, Semgrep, PostgreSQL | 352 pytest tests |
| [Statlas](https://github.com/themanoj-025/Statlas) | Transparent Football Scouting Platform | Next.js 16, FastAPI, PostgreSQL, scikit-learn | 894 pytest tests |
| [Veridoc](https://github.com/themanoj-025/Veridoc) | Local Grounded RAG with Faithfulness Check | Next.js 16, FastAPI, ChromaDB, BM25, Ollama | 322 pytest tests |
| [finsight-agent](https://github.com/themanoj-025/finsight-agent) | Agentic Finance Advisor & Risk Benchmark | Streamlit, FastAPI, LightGBM, Isolation Forest | 302 pytest tests |
| [Smart-Spam-Detector](https://github.com/themanoj-025/Smart-Spam-Detector) | Spam Classifier & Phishing URL Scanner | FastAPI, Streamlit, scikit-learn, SHAP | 164 pytest tests |
| [Credit Card Fraud Detection](https://github.com/themanoj-025/Credit%20Card%20Fraud%20Detection) | Financial Fraud Detection Pipeline | FastAPI, Streamlit, XGBoost, TreeSHAP | 457 pytest tests |
| [Emotion-Lens](https://github.com/themanoj-025/Emotion-Lens) | Real-Time Facial Emotion Vision Platform | TensorFlow, OpenCV, Grad-CAM, FastAPI, Streamlit | 245 pytest tests |
| [Next-Gen-Reco](https://github.com/themanoj-025/Next-Gen-Reco) | Hybrid E-Commerce Recommendation Engine | FastAPI, Streamlit, Cosine Similarity, TruncatedSVD | 388 pytest tests |
| [Price-My-Car](https://github.com/themanoj-025/Price-My-Car) | Vehicle Valuation & Deal Scoring Engine | FastAPI, Streamlit, XGBoost, LightGBM, SHAP | 285 pytest tests |
| [Tamasha](https://github.com/themanoj-025/Tamasha) | Bollywood Intelligence & Chemistry Networks | FastAPI, Streamlit, NetworkX, scikit-learn | 180 pytest tests |
| [Book-Tale](https://github.com/themanoj-025/Book-Tale) | Collaborative Audio Literature Hub | Flask, Socket.IO, Redis RQ, Rich CLI | 579 pytest tests |
| [Institute-Management-System](https://github.com/themanoj-025/Institute-Management-System) | Institutional ERP & Academic Analytics | FastAPI, React 19, SQLite, scikit-learn | 463 pytest tests |
| [Dabba](https://github.com/themanoj-025/Dabba) | Corporate Lunch Logistics & Routing | FastAPI, Streamlit, SQLite, Haversine Engine | 364 pytest tests |
| [AI-Telegram-News-Bot](https://github.com/themanoj-025/AI-Telegram-News-Bot) | Automated AI News Aggregator & Summarizer | Python, Telegram API, Google Gemini, APScheduler | 143 pytest tests |

---

## Featured Systems

### 1. Match-Mind — Real-Time Sports Analytics Platform

A production monorepo coordinating real-time sports intelligence, live streaming chat, and AI reasoning.
- **Backend Architecture**: Node 22, Express 5, Socket.IO clustered rooms, BullMQ background queues, and Redis distributed locking.
- **Frontend Architecture**: React 19, Vite, TanStack Query, Tailwind CSS, Lucide icons, and responsive desktop/mobile viewports.
- **AI Synthesis**: Anthropic Claude API integration generating context-aware game summaries and tactical match analysis.

### 2. UNION-BANK- — Concurrent-Safe Banking Core API

A high-concurrency core banking system engineered around Domain-Driven Design (DDD) principles.
- **Transaction Safety**: Atomic database transfers guarded by row-level locks (`SELECT ... FOR UPDATE`), strictly preventing race conditions and double-spending.
- **Security Posture**: Asymmetric RS256 JWT authentication, RFC 6238 TOTP two-factor authentication, and encrypted audit trails.
- **Full-Stack Implementation**: FastAPI asynchronous backend paired with a modern React 19 administrative portal.

### 3. AegisAI — Autonomous Security Code Reviewer

An LLM-orchestrated pull request security auditing agent that intercepts security flaws before merge.
- **Hybrid Inspection**: Combines AST-based deterministic analysis and Semgrep rules with context-aware LLM agents.
- **Reliability Engineering**: Redis RQ task queue with Dead Letter Queue (DLQ) isolation, rate-limit retry backoffs, and automated secret redaction.

### 4. Statlas — Transparent Football Analytics

A football scouting and analytics platform built on the principle of *analytics that shows its work*.
- **Methodology-as-Code**: Every metric formula, position weight, and threshold is locked in versioned JSON registries.
- **Unsupervised Archetypes**: Discovers natural player archetypes via k-means clustering across multi-dimensional per-90 metrics.
- **Full-Stack Delivery**: Next.js 16 App Router frontend with proportional pitch coordinate maps and a FastAPI backend.

### 5. Veridoc — Local-First Grounded RAG Platform

A zero-cloud document intelligence engine that eliminates hallucinations through explicit provenance.
- **Hybrid Retrieval**: Fuses BM25 lexical keyword matching with dense embeddings (`all-MiniLM-L6-v2`) via Reciprocal Rank Fusion (RRF).
- **Cross-Encoder Precision**: Reranks top candidates using `ms-marco-MiniLM-L-6-v2` prior to local Ollama generation.
- **Faithfulness Gate**: An automated judge checks generated assertions against source chunks before streaming to the client.

---

## Technical Arsenal

### Languages & Frameworks
- **Languages**: Python (3.11, 3.12), TypeScript, JavaScript (Node.js 22), SQL, Bash
- **Backend Frameworks**: FastAPI, Express 5, Django 5.1, Flask, Uvicorn, Celery, ARQ, BullMQ
- **Frontend Frameworks**: React 19, Next.js 16, Vite, Tailwind CSS, Zustand, Redux Toolkit, Radix UI

### Machine Learning & Data Systems
- **ML / Deep Learning**: PyTorch, TensorFlow, scikit-learn, XGBoost, LightGBM, CatBoost, OpenCV
- **Explainability & NLP**: SHAP (TreeSHAP, KernelSHAP), Grad-CAM, NLTK VADER, sentence-transformers, Cross-Encoders
- **Databases & Vector Stores**: PostgreSQL 16, Redis, ChromaDB, SQLite, SQLAlchemy 2, Prisma ORM

### Infrastructure & Engineering Practices
- **DevOps & Containers**: Docker, Docker Compose, Linux, GitHub Actions CI/CD
- **Testing Suites**: pytest, Vitest, Playwright E2E, Hypothesis property testing, Locust load testing
- **Observability**: Prometheus metrics, OpenTelemetry instrumentation, structured JSON logging

---

## Verification Standards

Across all 17 portfolio repositories, code quality and architectural integrity are verified through automated continuous integration:
- **Comprehensive Automated Tests**: Over 5,500 total automated tests verifying unit behavior, integration paths, and boundary conditions.
- **Zero Hallucination Metrics**: All benchmark results (MAE, RMSE, accuracy, latency) are grounded in held-out test splits with reproducible scripts.
- **Strict Linting & Static Typing**: Enforced across every codebase using Ruff, Black, Mypy, ESLint, and strict TypeScript configurations.

---

## Connect

- **Email**: [code.me.025@gmail.com](mailto:code.me.025@gmail.com)
- **LinkedIn**: [linkedin.com/in/themanoj-025](https://linkedin.com/in/themanoj-025)
- **GitHub**: [github.com/themanoj-025](https://github.com/themanoj-025)
- **Resume**: [Download Resume](Resume.pdf)
