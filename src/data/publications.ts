// The publication list. To add a paper, append an entry to the right year
// (or start a new year group at the top) — the homepage renders everything here.

export type Outcome = "rej" | "maj" | "min" | "acc";

export interface Author {
  name: string;
  /** Highlight as the site owner. */
  self?: boolean;
  /** Render a trailing * (e.g. co-first-authorship). */
  star?: boolean;
}

export interface Publication {
  title: string;
  /** Venue string shown after the title, e.g. "SP 2024." */
  venue?: string;
  /** Highlighted award note shown in parentheses after the venue. */
  award?: string;
  links?: { label: string; href: string }[];
  authors: Author[];
  /** Note after the author list, e.g. "(alphabetical order)". */
  authorNote?: string;
  /** The full submission history, in order. */
  history?: { venue: string; outcome: Outcome }[];
}

export const outcomeSymbols: Record<Outcome, { symbol: string; label: string }> = {
  rej: { symbol: "✗", label: "reject" },
  maj: { symbol: "◐", label: "major revision" },
  min: { symbol: "◑", label: "minor revision" },
  acc: { symbol: "✓", label: "accept" },
};

const me = { name: "Xingyu Xie", self: true };

export const publicationsByYear: { year: number; publications: Publication[] }[] = [
  {
    year: 2026,
    publications: [
      {
        title: "(Dis) Proving Spectre Security with Speculation-Passing Style.",
        links: [{ label: "paper", href: "https://arxiv.org/abs/2510.11573" }],
        authors: [
          { name: "Santiago Arranz-Olmos" },
          { name: "Gilles Barthe" },
          { name: "Lionel Blatter" },
          me,
          { name: "Zhiyuan Zhang" },
        ],
        authorNote: "(alphabetical order)",
        history: [
          { venue: "OOPSLA 2026", outcome: "min" },
          { venue: "OOPSLA 2026", outcome: "acc" },
        ],
      },
      {
        title: "Modular Verification of Probabilistic Constant-Time.",
        venue: "PriSC 2026.",
        authors: [me],
      },
    ],
  },
  {
    year: 2024,
    publications: [
      {
        title:
          "GAuV: A Graph-based Automated Verification Framework for Perfect Semi-honest Security of Multiparty Computation Protocols.",
        venue: "SP 2024.",
        links: [
          { label: "paper", href: "/papers/sp24.pdf" },
          { label: "slides", href: "/slides/sp24.pdf" },
          { label: "talk", href: "https://www.youtube.com/watch?v=LnvewUHWM7U" },
          { label: "code", href: "https://github.com/leefige/gauv" },
        ],
        authors: [
          { ...me, star: true },
          { name: "Yifei Li", star: true },
          { name: "Wei Zhang" },
          { name: "Tuowei Wang" },
          { name: "Shizhen Xu" },
          { name: "Jun Zhu" },
          { name: "Yifan Song" },
        ],
        authorNote: "(* co-first-author)",
        history: [
          { venue: "SP 2023", outcome: "maj" },
          { venue: "SP 2024", outcome: "acc" },
        ],
      },
      {
        title:
          "Superoptimization with the aid of formal verification and large language models.",
        venue: "Master's Thesis.",
        links: [{ label: "thesis (in Chinese)", href: "/papers/master-thesis.pdf" }],
        authors: [me],
      },
    ],
  },
  {
    year: 2023,
    publications: [
      {
        title:
          "On Lightweight Hoare Logic of Probabilistic Programs: A Bound Tighter than the Union Bound.",
        venue: "PLDI SRC 2023.",
        links: [{ label: "poster", href: "/posters/pldi2023.pdf" }],
        authors: [me],
      },
    ],
  },
  {
    year: 2022,
    publications: [
      {
        title: "Mastery: Shifted-code-aware Structured Merging.",
        venue: "SETTA 2022",
        award: "Awarded Best Paper, Invited to JSA",
        links: [
          { label: "paper", href: "/papers/setta2022.pdf" },
          { label: "slides", href: "/slides/setta2022.pdf" },
          { label: "talk", href: "https://lcs.ios.ac.cn/setta2022/talks/xingyu_xie.mp4" },
          { label: "code", href: "https://github.com/thufv/mastery" },
        ],
        authors: [
          { name: "Fengmin Zhu", star: true },
          { ...me, star: true },
          { name: "Dongyu Feng" },
          { name: "Na Meng" },
          { name: "Fei He" },
        ],
        authorNote: "(* co-first-author)",
        history: [
          { venue: "OOPSLA 2020", outcome: "rej" },
          { venue: "ICSE 2021", outcome: "rej" },
          { venue: "FSE 2021", outcome: "rej" },
          { venue: "ICSE 2022", outcome: "rej" },
          { venue: "SETTA 2022", outcome: "acc" },
          { venue: "JSA", outcome: "min" },
          { venue: "JSA", outcome: "min" },
          { venue: "JSA", outcome: "acc" },
        ],
      },
    ],
  },
];
