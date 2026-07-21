# Cryptographic Hardness Assumptions

An open, crowd-sourced log of attempts to resolve the hardness assumptions that modern
cryptography rests on — to break them or to prove them — alongside a catalogue of the
assumptions themselves. Live site: **https://namasikanam.github.io/crypto-hardness/**

Inclusion bar for a assumption: it underlies a system deployed today, **or** a paper with
≥ 1000 citations relies on it.

## Layout

```
crypto-hardness/
├── index.html              # the page (renders both tables client-side, KaTeX for math)
├── data/
│   ├── attempts.md         # the crowd-sourced proof-attempt log — a plain Markdown table
│   └── assumptions.md      # the catalogue — a plain Markdown table, human-editable
└── assumptions/            # one file per assumption, the precise mathematical statement
    ├── lwe.md
    ├── rsa-assumption.md
    └── … (35 files)
```

The site has **no build step and no dependencies to install** — `index.html` fetches the two
`data/*.md` files at load time, parses the Markdown tables, and renders them (KaTeX is pulled
from a CDN for the `$…$` math). Editing a `.md` file and reloading is all it takes.

## Contributing a proof attempt

An attempt is any serious effort to resolve a assumption — to break it (an algorithm/attack)
or to prove it (a hardness/lower-bound argument). Everyone is welcome. Two ways:

1. **One click (easiest):** open the site and press **“＋ Add an attempt”**. That opens
   `data/attempts.md` in GitHub's web editor; add a row, and GitHub creates the fork + pull
   request for you.
2. **Locally:** edit `data/attempts.md`, add one row to the table, open a PR.

### The row format

```
| Assumption | Model | Agent | Operator | Time | Duration | Result | Conversation |
```

| Column | What to put |
|---|---|
| **Assumption** | The hardness assumption you worked on. Match a **Name** from `data/assumptions.md` (e.g. `LWE`, `RSA assumption`) so it auto-links. |
| **Model** | The model / system used, e.g. `Claude Opus 4.8`, `GPT-5`. |
| **Agent** | The scaffold / harness, e.g. `Claude Code`, `AIDER`, `manual`. |
| **Operator** | The person who steered the AI: your name or handle, ideally linked (`[name](https://…)`). Use `—` for fully autonomous runs. |
| **Time** | ISO start date, `YYYY-MM-DD`. |
| **Duration** | Wall-clock length, e.g. `2h`, `35 min`, `3 days`. |
| **Result** | Outcome. Suggested tags: `no-progress`, `partial`, `novel-idea`, `reproduced-known-result`, `SOLVED`. The site color-codes these. |
| **Conversation** | A public link to the transcript/log: `[link](https://…)`. |

Please keep entries truthful. If you claim any progress, state the target's exact parameters
in the linked conversation. The point of the log is an honest record of how these assumptions
hold up under machine- and human-driven analysis — not marketing.

## Editing the catalogue

`data/assumptions.md` is likewise a Markdown table (columns
`Category | Name | Importance | File | Author | Difficulty | Note`). The **File** cell links to
a `assumptions/<slug>.md` describing the math. To add a assumption, add a row and a matching
detail file. Keep `$…$` math free of raw/escaped pipe characters so the table parses cleanly.
