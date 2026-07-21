## Proof Attempts

<!--
  ┌────────────────────────────────────────────────────────────────────────────┐
  │  HOW TO CONTRIBUTE — everyone is welcome.                                    │
  │  Add ONE new row to the table below and open a pull request.                 │
  │  (Easiest: click the "＋ Add an attempt" button on the website, which opens  │
  │   GitHub's web editor and creates the PR for you.)                           │
  │                                                                              │
  │  An attempt is any serious effort to resolve a assumption — to break it (an  │
  │  algorithm/attack) or to prove it (a hardness/lower-bound argument).         │
  │                                                                              │
  │  Columns (keep this order, keep it on one line):                             │
  │    Assumption — the hardness assumption you worked on (e.g. "LWE", "RSA").   │
  │                 Match a Name from data/assumptions.md so it auto-links.      │
  │    Model      — the LLM / system used (e.g. "Claude Opus 4.8", "GPT-5").     │
  │    Agent      — the agent scaffold / harness (e.g. "Claude Code", "manual"). │
  │    Operator   — who steered the AI: your name/handle, ideally linked         │
  │                 ([name](https://...)). Use "—" for fully autonomous runs.    │
  │    Time       — ISO date the attempt started, YYYY-MM-DD.                    │
  │    Duration   — wall-clock length (e.g. "2h", "35 min", "3 days").           │
  │    Result     — outcome. Suggested tags: no-progress / partial / novel-idea  │
  │                 / reproduced-known-result / SOLVED.                          │
  │    Conversation — a public link to the transcript/log ([link](https://...)). │
  │                                                                              │
  │  Please keep entries truthful. Cite the target's exact parameters in the     │
  │  linked conversation if you claim any progress.                              │
  └────────────────────────────────────────────────────────────────────────────┘
-->

| Assumption | Model | Agent | Operator | Time | Duration | Result | Conversation |
|---|---|---|---|---|---|---|---|
| Phi-hiding | GPT-5 | Codex | [namasikanam](https://github.com/namasikanam) | 2026-07-21 | ~11 h | partial — summary corrected; exact-loss restatement disproved and Lean-verified | [write-up + Lean](attempts/phi-hiding/) |
