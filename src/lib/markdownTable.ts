// Build-time parsing/rendering of the crypto-hardness Markdown tables
// (crypto-hardness/data/*.md). The .md files remain the human-editable
// source of truth; this module turns them into HTML at build time.

import katex from "katex";

export interface MarkdownTable {
  header: string[];
  body: string[][];
}

/** Parse a GitHub-flavored markdown table out of a document string. */
export function parseMarkdownTable(text: string): MarkdownTable | null {
  const lines = text.split(/\r?\n/).map((l) => l.trim());
  const rows = lines.filter((l) => l.startsWith("|"));
  if (rows.length < 2) return null;
  const SENT = "\u0001"; // sentinel standing in for an escaped '\|'
  const splitRow = (line: string) => {
    const protectedLine = line.replace(/\\\|/g, SENT);
    let cells = protectedLine.split("|");
    cells = cells.slice(1, -1); // drop empty ends from leading/trailing '|'
    return cells.map((c) => c.replaceAll(SENT, "|").trim());
  };
  const header = splitRow(rows[0]!);
  const isSep = (l: string) => /^\|[\s:|-]+\|$/.test(l) && l.includes("-");
  const body = rows
    .slice(1)
    .filter((l) => !isSep(l))
    .map(splitRow)
    .filter((cells) => cells.length === header.length);
  return { header, body };
}

export const escapeHtml = (s: string): string =>
  s.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");

/**
 * Render a single markdown table cell to HTML: math ($..$), links, bold, code.
 * Relative links to assumptions/<slug>.md are rewritten to the rendered pages.
 */
export function renderCell(raw: string): string {
  // 1. protect $...$ math spans
  const math: string[] = [];
  let s = raw.replace(/\$([^$]+)\$/g, (_, tex: string) => {
    math.push(tex);
    return " M" + (math.length - 1) + " ";
  });
  // 2. escape HTML in the remaining prose
  s = escapeHtml(s);
  // 3. links [text](url) — rewrite relative assumption .md links to their pages
  s = s.replace(/\[([^\]]+)\]\(([^)]+)\)/g, (_, text: string, url: string) => {
    const href = resolveLink(url.trim());
    const attrs = /^https?:\/\//.test(href) ? ' target="_blank" rel="noopener"' : "";
    return `<a href="${href}"${attrs}>${text}</a>`;
  });
  // 4. bold, inline code
  s = s.replace(/\*\*([^*]+)\*\*/g, "<strong>$1</strong>");
  s = s.replace(/`([^`]+)`/g, "<code>$1</code>");
  // 5. restore math, rendered by KaTeX
  s = s.replace(/ M(\d+) /g, (_, i: string) => {
    try {
      return katex.renderToString(math[+i]!, { throwOnError: false });
    } catch {
      return "$" + math[+i] + "$";
    }
  });
  return s;
}

/** Rewrite a link target from the .md source to its URL on the site. */
export function resolveLink(href: string): string {
  const m = href.match(/^assumptions\/([\w-]+)\.md$/);
  if (m) return `/crypto-hardness/assumptions/${m[1]}/`;
  return href;
}
