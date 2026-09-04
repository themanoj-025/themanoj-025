"""
Build a modern info card SVG for GitHub profile.
Background set to transparent (no background rect) so it merges 100% seamlessly with GitHub's background color (#0d1117).
"""

import html
import os
import structlog

logger = structlog.get_logger("make_info_card")

HERE = os.path.dirname(os.path.abspath(__file__))
OUT = os.path.join(HERE, "..", "info-card.svg")
STATIC = bool(os.environ.get("STATIC"))

W, H = 480, 376
PAD = 20
TITLEBAR_H = 30


def esc(s):
    return html.escape(s)


def rise(inner, i):
    """fade + slight upward slide, staggered by row index."""
    if STATIC:
        return f"<g>{inner}</g>"
    delay = 0.12 + i * 0.05
    return (
        f'<g opacity="0" transform="translate(0,5)">{inner}'
        f'<animate attributeName="opacity" from="0" to="1" begin="{delay:.2f}s" dur="0.4s" fill="freeze"/>'
        f'<animateTransform attributeName="transform" type="translate" from="0 5" to="0 0" '
        f'begin="{delay:.2f}s" dur="0.4s" fill="freeze" calcMode="spline" keySplines="0.2 0.8 0.2 1"/></g>'
    )


parts = [
    (f'<svg xmlns="http://www.w3.org/2000/svg" width="{W}" height="{H}" viewBox="0 0 {W} {H}" '
    f"font-family=\"ui-monospace, SFMono-Regular, 'Fira Code', 'JetBrains Mono', Menlo, Consolas, monospace\">"),
    "<defs>",
    '  <filter id="glow" x="-20%" y="-20%" width="140%" height="140%">',
    '    <feGaussianBlur stdDeviation="2" result="blur"/>',
    '    <feComposite in="SourceGraphic" in2="blur" operator="over"/>',
    "  </filter>",
    "</defs>",
    "<!-- Window Controls (macOS Dots) -->",
    f'<circle cx="{PAD}" cy="{TITLEBAR_H / 2}" r="5" fill="#ff5f56"/>',
    f'<circle cx="{PAD + 16}" cy="{TITLEBAR_H / 2}" r="5" fill="#ffbd2e"/>',
    f'<circle cx="{PAD + 32}" cy="{TITLEBAR_H / 2}" r="5" fill="#27c93f"/>',
    "<!-- Header Title -->",
    f'<text x="{W / 2}" y="{TITLEBAR_H / 2 + 4}" fill="#7d8590" font-size="12" font-weight="600" text-anchor="middle">manoj@github: ~$ neofetch</text>',
    "<!-- Live Status Indicator -->",
    f'<g transform="translate({W - 85}, 7)">',
    '  <rect x="0" y="0" width="68" height="15" rx="7.5" fill="#064e3b" fill-opacity="0.3" stroke="#059669" stroke-width="0.8"/>',
    '  <circle cx="9" cy="7.5" r="3" fill="#34d399" filter="url(#glow)">',
    '    <animate attributeName="opacity" values="1;0.3;1" dur="2s" repeatCount="indefinite"/>',
    "  </circle>",
    '  <text x="17" y="11" fill="#34d399" font-size="8.5" font-weight="700" letter-spacing="0.5">ONLINE</text>',
    "</g>",
]

ROWS = [
    ("host",),
    ("kv", "Role", "AI Systems Engineer & Agentic Architect", "#f8fafc", "700"),
    ("kv", "Focus", "Production LLM Infra, GraphRAG & Vector Search", "#cbd5e1", "500"),
    (
        "kv",
        "Mindset",
        "Learn deeply. Build consistently. Ship intelligently.",
        "#94a3b8",
        "400",
        True,
    ),
    ("gap", 0.35),
    ("sec", "TECH ARSENAL"),
    ("kv", "AI / Agent", "PyTorch, LangGraph, GraphRAG, LlamaIndex", "#c9d1d9", "500"),
    ("kv", "LLM Infra", "vLLM, Ollama, Unsloth, QLoRA, AWQ/GGUF", "#c9d1d9", "500"),
    ("kv", "Backend", "FastAPI, PostgreSQL, Redis, Qdrant, Neo4j", "#c9d1d9", "500"),
    ("kv", "Cloud", "Docker, AWS, GitHub Actions, Linux", "#c9d1d9", "500"),
    ("gap", 0.35),
    ("sec", "FEATURED WORK"),
    ("bul", "Match-Mind", "Real-time sports AI platform (Claude + BullMQ)"),
    ("bul", "AegisAI", "Agentic security code reviewer for GitHub PRs"),
    ("bul", "Union Bank API", "Concurrent-safe API (RS256 JWT & 2FA)"),
    ("bul", "Spam Detector", "98.7% accuracy ML Stacking ensemble + SHAP"),
]

LINE_H = 19.0
KEY_X = PAD
VAL_X = PAD + 94
y = TITLEBAR_H + 28

for i, row in enumerate(ROWS):
    kind = row[0]
    if kind == "gap":
        y += LINE_H * row[1]
        continue

    if kind == "host":
        inner = (
            f'<text x="{KEY_X}" y="{y:.1f}" font-size="14" font-weight="700">'
            f'<tspan fill="#3fb950">manoj</tspan><tspan fill="#7d8590">@</tspan>'
            f'<tspan fill="#22d3ee">github</tspan></text>'
            f'<line x1="{KEY_X + 110}" y1="{y - 4:.1f}" x2="{W - PAD}" y2="{y - 4:.1f}" stroke="none"/>'
        )
    elif kind == "sec":
        title = esc(row[1])
        inner = (
            f'<text x="{KEY_X}" y="{y:.1f}" fill="#58a6ff" font-size="12" font-weight="700">'
            f"&#8212; {title}</text>"
            f'<line x1="{KEY_X + 110}" y1="{y - 4:.1f}" x2="{W - PAD}" y2="{y - 4:.1f}" stroke="none"/>'
        )
    elif kind == "kv":
        key = esc(row[1])
        val = esc(row[2])
        color = row[3] if len(row) > 3 else "#c9d1d9"
        weight = row[4] if len(row) > 4 else "400"
        italic = ' font-style="italic"' if len(row) > 5 and row[5] else ""

        key_color = "#ffa657"
        if key in ["Role", "Focus", "Mindset"]:
            key_color = "#ffa657"

        inner = (
            f'<text x="{KEY_X}" y="{y:.1f}" fill="{key_color}" font-size="12.5" font-weight="700">{key}</text>'
            f'<text x="{VAL_X}" y="{y:.1f}" fill="{color}" font-size="12" font-weight="{weight}"{italic}>{val}</text>'
        )
    elif kind == "bul":
        proj = esc(row[1])
        desc = esc(row[2])
        inner = (
            f'<circle cx="{KEY_X + 3}" cy="{y - 4:.1f}" r="2.5" fill="#3fb950"/>'
            f'<text x="{KEY_X + 14}" y="{y:.1f}" fill="#c9d1d9" font-size="12.5" font-weight="700">{proj}</text>'
            f'<text x="{KEY_X + 122}" y="{y:.1f}" fill="#8b949e" font-size="11.5">{desc}</text>'
        )
    else:
        continue

    parts.append(rise(inner, i))
    y += LINE_H

parts.append("</svg>")
svg = "".join(parts)

with open(OUT, "w", encoding="utf-8") as f:
    f.write(svg)

logger.info("generated", path=OUT, size=len(svg), width=W, height=H)
