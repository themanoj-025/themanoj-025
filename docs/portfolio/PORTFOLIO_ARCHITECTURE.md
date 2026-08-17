# 🏗️ Portfolio Architecture Diagram

> Visual representation of all 17 projects, their relationships, shared technologies, and architectural patterns.

---

## Table of Contents

- [High-Level Portfolio Overview](#high-level-portfolio-overview)
- [Technology Ecosystem Map](#technology-ecosystem-map)
- [Project Category Diagrams](#project-category-diagrams)
- [Data Flow Architectures](#data-flow-architectures)
- [Infrastructure & Deployment](#infrastructure--deployment)

---

## High-Level Portfolio Overview

```mermaid
mindmap
  root((themanoj-025<br/>Portfolio))
    AI/ML Projects
      AegisAI
        FastAPI
        Anthropic Claude
        GitHub API
      AI-Telegram-News-Bot
        python-telegram-bot
        OpenAI
        Web Scraping
      Credit Card Fraud Detection
        XGBoost/LightGBM
        SHAP
        FAISS
        Streamlit
      Dabba
        scikit-learn
        PyTorch
        MLflow
        Streamlit
      Emotion-Lens
        PyTorch
        OpenCV
        Streamlit
      finsight-agent
        Anthropic Claude
        FastAPI
      Next-Gen-Reco
        scikit-learn
        PyTorch
      Price-My-Car
        XGBoost
        Streamlit
      sentinel-review
        FastAPI
        AST Parsing
      Smart-Spam-Detector
        XGBoost/LightGBM
        Streamlit
    Web Applications
      Book-Tale
        Flask
        SQLAlchemy
        PostgreSQL
        Redis
      Institute-Management-System
        FastAPI
        SQLAlchemy
        Celery
      UNION-BANK-
        React
        Next.js
        Node.js
        Solidity
    Creative/Media
      Tamasha
        FastAPI
        PostgreSQL
      Veridoc
        FastAPI
        PostgreSQL
    Personal
      themanoj-025
        Profile README
```

---

## Technology Ecosystem Map

```mermaid
graph TB
    subgraph "Languages"
        Python[Python]
        TypeScript[TypeScript]
        JavaScript[JavaScript]
        Solidity[Solidity]
    end

    subgraph "ML/AI Libraries"
        sklearn[scikit-learn]
        PyTorch[PyTorch]
        XGBoost[XGBoost]
        LightGBM[LightGBM]
        SHAP[SHAP]
        FAISS[FAISS]
        Transformers[Transformers]
    end

    subgraph "Web Frameworks"
        FastAPI[FastAPI]
        Flask[Flask]
        Streamlit[Streamlit]
        Express[Express.js]
        NextJS[Next.js]
        React[React]
    end

    subgraph "Databases"
        PostgreSQL[PostgreSQL]
        SQLite[SQLite]
        MongoDB[MongoDB]
        Redis[Redis]
    end

    subgraph "Cloud & DevOps"
        Docker[Docker]
        GitHubActions[GitHub Actions]
        Kubernetes[Kubernetes]
        AWS[AWS]
    end

    subgraph "External APIs"
        Claude[Anthropic Claude]
        OpenAI[OpenAI]
        Twilio[Twilio]
        Kaggle[Kaggle]
    end

    Python --> FastAPI
    Python --> Flask
    Python --> Streamlit
    TypeScript --> Express
    TypeScript --> NextJS
    TypeScript --> React

    Python --> sklearn
    Python --> PyTorch
    Python --> XGBoost
    Python --> LightGBM
    Python --> SHAP
    Python --> FAISS

    FastAPI --> PostgreSQL
    Flask --> PostgreSQL
    Express --> MongoDB
    NextJS --> MongoDB

    Docker --> GitHubActions
    Docker --> Kubernetes
    Docker --> AWS
```

---

## Project Category Diagrams

### 🤖 AI/ML Projects Architecture

```mermaid
graph LR
    subgraph "Data Sources"
        Kaggle[Kaggle Datasets]
        API[External APIs]
        Stream[Real-time Streams]
    end

    subgraph "ML Pipeline"
        Load[Data Loading]
        Clean[Cleaning]
        Feature[Feature Engineering]
        Train[Model Training]
        Eval[Evaluation]
        Deploy[Deployment]
    end

    subgraph "Models"
        XGB[XGBoost]
        LGB[LightGBM]
        RF[Random Forest]
        PT[PyTorch Neural Nets]
        IF[Isolation Forest]
    end

    subgraph "Serving"
        FastAPI2[FastAPI]
        Streamlit2[Streamlit]
        Docker2[Docker]
    end

    subgraph "Monitoring"
        SHAP2[SHAP Explanations]
        MLflow[MLflow Tracking]
        Drift[Drift Detection]
    end

    Kaggle --> Load
    API --> Load
    Stream --> Load

    Load --> Clean --> Feature --> Train --> Eval --> Deploy

    Train --> XGB
    Train --> LGB
    Train --> RF
    Train --> PT
    Train --> IF

    Deploy --> FastAPI2
    Deploy --> Streamlit2
    Deploy --> Docker2

    Eval --> SHAP2
    Train --> MLflow
    Deploy --> Drift
```

### 🌐 Web Applications Architecture

```mermaid
graph TB
    subgraph "Client"
        Browser[Web Browser]
        Mobile[Mobile App]
    end

    subgraph "Frontend"
        Jinja2[Jinja2 Templates]
        React2[React]
        NextJS2[Next.js]
    end

    subgraph "Backend"
        Flask2[Flask]
        FastAPI3[FastAPI]
        Express2[Express.js]
        Node[Node.js]
    end

    subgraph "Services"
        Auth[Authentication]
        Business[Business Logic]
        Notifications[Notifications]
        Jobs[Background Jobs]
    end

    subgraph "Data Layer"
        ORM[SQLAlchemy ORM]
        Redis2[Redis Cache]
        Queue[RQ Queue]
    end

    subgraph "Database"
        PG[PostgreSQL]
        SQLite2[SQLite]
        Mongo[MongoDB]
    end

    subgraph "Real-time"
        SocketIO[Socket.IO]
        WebSocket[WebSocket]
    end

    Browser --> Jinja2
    Browser --> React2
    Browser --> NextJS2
    Mobile --> React2

    Jinja2 --> Flask2
    React2 --> FastAPI3
    NextJS2 --> Express2
    NextJS2 --> Node

    Flask2 --> Auth
    Flask2 --> Business
    FastAPI3 --> Auth
    FastAPI3 --> Business
    Express2 --> Auth
    Express2 --> Business

    Auth --> ORM
    Business --> ORM
    Business --> Redis2
    Business --> Queue

    ORM --> PG
    ORM --> SQLite2
    ORM --> Mongo

    Business --> SocketIO
    Business --> WebSocket
    SocketIO --> Browser
    WebSocket --> Browser
```

---

## Data Flow Architectures

### ML Model Training Pipeline

```mermaid
flowchart TD
    A[Raw Data] --> B[Data Loading]
    B --> C[Cleaning & Preprocessing]
    C --> D[Feature Engineering]
    D --> E{Resampling Strategy}
    E -->|SMOTE| F[Oversampled Data]
    E -->|ADASYN| F
    E -->|None| G[Original Data]
    F --> H[Model Training]
    G --> H
    H --> I[Cross Validation]
    I --> J{HPO Enabled?}
    J -->|Yes| K[Optuna Optimization]
    J -->|No| L[Default Hyperparams]
    K --> M[Model Comparison]
    L --> M
    M --> N{Best Model Selection}
    N -->|XGBoost| O[XGBoost Model]
    N -->|LightGBM| P[LightGBM Model]
    N -->|RandomForest| Q[RF Model]
    O --> R[Model Registry]
    P --> R
    Q --> R
    R --> S[SHAP Explainability]
    R --> T[MLflow Logging]
    R --> U[Deployment]
```

### Real-time Prediction Flow

```mermaid
sequenceDiagram
    participant C as Client
    participant A as API (FastAPI)
    participant M as ML Model
    participant E as SHAP Explainer
    participant L as LLM (Claude)
    participant DB as Database
    participant R as Redis Cache

    C->>A: POST /predict
    A->>R: Check cache
    alt Cache Hit
        R-->>A: Return cached result
    else Cache Miss
        A->>M: Predict transaction
        M-->>A: Prediction + Probability
        A->>E: Generate SHAP values
        E-->>A: Feature importance
        A->>R: Cache result
    end
    A-->>C: Prediction + Explanation

    opt User requests narrative
        C->>A: POST /chat
        A->>L: Send context
        L-->>A: Narrative
        A-->>C: Analyst-friendly summary
    end

    opt User requests similar cases
        C->>A: POST /similar
        A->>DB: Search FAISS index
        DB-->>A: Similar cases
        A-->>C: Historical precedents
    end
```

---

## Infrastructure & Deployment

### Docker Architecture

```mermaid
graph TB
    subgraph "Development"
        DevApp[App Container]
        DevDB[PostgreSQL]
        DevRedis[Redis]
        DevWorker[Worker]
    end

    subgraph "Production"
        ProdApp[App Container]
        ProdDB[PostgreSQL]
        ProdRedis[Redis]
        ProdWorker[Worker]
        ProdNginx[Nginx]
        ProdMLflow[MLflow]
    end

    subgraph "CI/CD"
        GitHub[GitHub Actions]
        Build[Build]
        Test[Test]
        Deploy2[Deploy]
    end

    GitHub --> Build
    Build --> Test
    Test --> Deploy2

    DevApp --> DevDB
    DevApp --> DevRedis
    DevWorker --> DevRedis

    ProdApp --> ProdDB
    ProdApp --> ProdRedis
    ProdWorker --> ProdRedis
    ProdNginx --> ProdApp
    ProdMLflow --> ProdDB
```

### Multi-Service Deployment

```mermaid
graph LR
    subgraph "Load Balancer"
        LB[Nginx/HAProxy]
    end

    subgraph "Application Tier"
        App1[App Instance 1]
        App2[App Instance 2]
        App3[App Instance N]
    end

    subgraph "Worker Tier"
        Worker1[RQ Worker 1]
        Worker2[RQ Worker 2]
    end

    subgraph "Data Tier"
        PG[(PostgreSQL)]
        Redis3[(Redis)]
        MLflow3[MLflow Server]
    end

    subgraph "Monitoring"
        Prometheus[Prometheus]
        Grafana[Grafana]
        Jaeger[Jaeger]
    end

    LB --> App1
    LB --> App2
    LB --> App3

    App1 --> PG
    App2 --> PG
    App3 --> PG

    App1 --> Redis3
    App2 --> Redis3
    App3 --> Redis3

    App1 --> Worker1
    App1 --> Worker2

    Worker1 --> PG
    Worker2 --> PG

    App1 --> Prometheus
    Prometheus --> Grafana
    App1 --> Jaeger
```

---

## Shared Technology Patterns

### Common Architecture Patterns

```mermaid
graph TB
    subgraph "Pattern 1: FastAPI + Streamlit (ML Projects)"
        FAPI1[FastAPI Backend]
        ST1[Streamlit Dashboard]
        ML1[ML Models]
        DB1[(Database)]
        FAPI1 --> ML1
        FAPI1 --> DB1
        ST1 --> FAPI1
    end

    subgraph "Pattern 2: Flask + SQLAlchemy (Web Apps)"
        FLASK1[Flask Backend]
        SQLA1[SQLAlchemy ORM]
        DB2[(PostgreSQL)]
        REDIS1[Redis]
        FLASK1 --> SQLA1
        SQLA1 --> DB2
        FLASK1 --> REDIS1
    end

    subgraph "Pattern 3: Next.js + Node.js (TypeScript)"
        NEXT1[Next.js Frontend]
        NODE1[Node.js Backend]
        DB3[(MongoDB)]
        NEXT1 --> NODE1
        NODE1 --> DB3
    end

    subgraph "Pattern 4: FastAPI + PostgreSQL (API Projects)"
        FAPI2[FastAPI Backend]
        DB4[(PostgreSQL)]
        FAPI2 --> DB4
    end
```

### ML Model Serving Architecture

```mermaid
graph TB
    subgraph "Training Pipeline"
        Data[Raw Data]
        Preprocess[Preprocessing]
        Train[Training]
        Evaluate[Evaluation]
        Register[Model Registry]
    end

    subgraph "Serving Infrastructure"
        API[FastAPI Server]
        Cache[Redis Cache]
        LoadBalancer[Load Balancer]
    end

    subgraph "Monitoring"
        Metrics[Prometheus Metrics]
        Logging[Structured Logging]
        Tracing[OpenTelemetry]
        Drift[Drift Detection]
    end

    subgraph "Client Applications"
        Dashboard[Streamlit Dashboard]
        Mobile[Mobile App]
        ThirdParty[Third-party Apps]
    end

    Data --> Preprocess --> Train --> Evaluate --> Register
    
    Register --> API
    API --> Cache
    LoadBalancer --> API
    
    API --> Metrics
    API --> Logging
    API --> Tracing
    API --> Drift
    
    Dashboard --> API
    Mobile --> API
    ThirdParty --> API
```

---

## Visual Summary

### Portfolio at a Glance

```
┌─────────────────────────────────────────────────────────────────────────┐
│                        themanoj-025 Portfolio                          │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐        │
│  │   AI/ML (10)    │  │  Web Apps (4)   │  │  Creative (2)   │        │
│  │                 │  │                 │  │                 │        │
│  │ • AegisAI       │  │ • Book-Tale     │  │ • Tamasha       │        │
│  │ • AI-News-Bot   │  │ • Institute-Mgmt│  │ • Veridoc       │        │
│  │ • Fraud Detection│ │ • Match-Mind    │  │                 │        │
│  │ • Dabba         │  │ • UNION-BANK-   │  │                 │        │
│  │ • Emotion-Lens  │  │                 │  │                 │        │
│  │ • FinSight      │  │                 │  │                 │        │
│  │ • Next-Gen-Reco │  │                 │  │                 │        │
│  │ • Price-My-Car  │  │                 │  │                 │        │
│  │ • Sentinel      │  │                 │  │                 │        │
│  │ • Spam-Detector │  │                 │  │                 │        │
│  └─────────────────┘  └─────────────────┘  └─────────────────┘        │
│                                                                         │
├─────────────────────────────────────────────────────────────────────────┤
│  Languages: Python (14) │ TypeScript (2) │ JavaScript (1) │ Solidity  │
├─────────────────────────────────────────────────────────────────────────┤
│  ML: scikit-learn, PyTorch, XGBoost, LightGBM, SHAP, FAISS            │
│  Web: FastAPI, Flask, Streamlit, Express.js, Next.js, React            │
│  DB: PostgreSQL, SQLite, MongoDB, Redis                                 │
│  DevOps: Docker, GitHub Actions, Kubernetes                            │
│  AI: Anthropic Claude, OpenAI                                          │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## How to Read These Diagrams

1. **Mind Map** — High-level categorization of all projects
2. **Technology Ecosystem** — Relationships between technologies
3. **Category Diagrams** — Architecture patterns for each project type
4. **Data Flow** — How data moves through ML pipelines
5. **Infrastructure** — Deployment and scaling patterns
6. **Sequence Diagrams** — Real-time prediction flows

---

*Architecture diagrams generated: August 8, 2026*
