# Design — themanoj-025: Design System & Visual Identity

| Field | Value |
| --- | --- |
| Version | v0.1 |
| Last Updated | 2026-08-06 |
| Owner | Manoj (profile owner) |
| Status | Approved |

---

## 1. Design Principles

1. **Identity first** — hero communicates role/positioning before anything else.
2. **Proof over claims** — showcase real repos, real stats, real metrics.
3. **Dark-mode native** — the profile is designed dark-first; light mode is acceptable degradation.
4. **Scannable hierarchy** — badges and tables beat prose.
5. **Truthful representation** — never show skills/roles that don't match reality.

## 2. Brand & Visual Identity

- **Persona:** "AI Systems Engineer" — production LLM infrastructure, agentic systems, retrieval pipelines.
- **Tone:** technical, confident, approachable.
- **Logo motif:** terminal prompt (`manoj@github ~ $`) — developer-native identity.
- **Imagery:** custom SVGs (ASCII art, info card, contribution heatmap) instead of photos.

## 3. Color System (dark theme tokens)

| Token | Hex | Usage | Contrast |
| --- | --- | --- | --- |
| bg-deep | #0D1117 | Canvas (GitHub dark) | — |
| bg-panel | #1E293B | Buttons/panels | — |
| text-primary | #FFFFFF | Headlines/body | ≥ 7:1 |
| text-muted | #9CA3AF | Secondary text | ≥ 4.5:1 |
| accent-cyan | #22D3EE | Hero/typing/headers | ≥ 4.5:1 |
| accent-blue | #3B82F6 | Secondary accents, stats | ≥ 4.5:1 |
| accent-purple | #A855F7 | "Open for roles" badge | ≥ 4.5:1 |
| accent-green | #16A34A | Resume CTA | ≥ 4.5:1 |
| accent-indigo | #6366F1 | Followers badge | ≥ 4.5:1 |

## 4. Typography Scale

| Token | Font | Size | Weight | Usage |
| --- | --- | --- | --- | --- |
| hero-name | Fira Code / monospace | ~32px | 700 | `manoj@github` header |
| section-title | default | 24px | 600 | "Featured Engineering Work" |
| body | default | 16px | 400 | Descriptions |
| chip-text | default | 12–13px | 500 | Badges/tech chips |
| caption | monospace | 12px | 400 | Terminal lines, subtext |

## 5. Spacing & Grid

- Base 4px; generous vertical rhythm (24–48px section gaps).
- Featured work grid: 2 columns × 3 rows on desktop (table layout).
- Badge rows: wrap naturally; order by category.

## 6. Component Library

### 6.1 Hero Block

```
┌────────────────────────────────────────────┐
│ manoj@github ~ $ ./contributions.sh       │
│  ┌───────────────────────┐                │
│  │  contribution heatmap │                │
│  └───────────────────────┘                │
│ manoj@github ~ $ whoami                   │
│  ┌───────────┐   ┌──────────┐             │
│  │ ascii art │   │ info card│             │
│  └───────────┘   └──────────┘             │
└────────────────────────────────────────────┘
```

### 6.2 Typing SVG

- Cycles 4 taglines (AI Systems Engineer; Production LLM & Agentic Architect; GraphRAG & Vector Search Specialist; Local SLM Fine-Tuning & vLLM Serving).
- Color: accent-cyan; monospace; caret blinks.

### 6.3 CTA Buttons (shields.io style)

| CTA | Color | Action |
| --- | --- | --- |
| View My Work | #1E293B | GitHub profile link |
| Contact Me | #2563EB | mailto |
| Resume | #16A34A | raw Resume.pdf |
| Open for Roles | #9333EA | mailto w/ subject |

### 6.4 Featured Project Card

| Element | Spec |
| --- | --- |
| Title | Linked heading with emoji |
| Description | 1–2 sentences |
| Tech chips | 3–4 shields.io flat-square badges |

### 6.5 Arsenal Category Row

- Category label (e.g., "Agentic Frameworks & GraphRAG") followed by badges.
- Badges: `for-the-badge` style, dark backgrounds.

## 7. Iconography & Imagery

- Source: emoji + shields.io badges + custom SVGs. No external icon fonts.
- Sizes: badges auto-scale; SVGs fixed width (860px heatmap, 370/490px cards).

## 8. Accessibility Standards

- WCAG 2.1 AA for text contrast on all badge/button colors.
- Alt text on every image (GitHub shows broken-image fallback with alt).
- No reliance on color alone: role text always present alongside colors.
- `prefers-color-scheme` respected via theme-aware SVG services.

## 9. Responsive Behavior

| Breakpoint | Behavior |
| --- | --- |
| Desktop | Two-column feature grid + side-by-side whoami cards |
| Mobile | Stacked single column; badges wrap |
| All | Heatmap scales to width (GitHub img behavior) |

## 10. Motion & Micro-interactions

- Only motion: typing SVG caret + fade of typing text (external service).
- No custom animations on static content (GitHub renders static).

## 11. Dark Mode / Theming

- Primary theme: dark (bg-deep #0D1117).
- Light mode: badges/cards use `labelColor`/`color` params tuned for both; theme-aware stats cards use `<picture>` with source/media prefers-color-scheme.

## 12. Related Documents

| Document | Relationship |
| --- | --- |
| [AppFlow.md](AppFlow.md) | Sections consuming these components |
| [PRD.md](../product/PRD.md) | Brand goals |
| [Rules.md](../project/Rules.md) | Editing conventions |
