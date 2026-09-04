import { defineCollection } from "astro:content";
import { glob } from "astro/loaders";

// The precise mathematical statements of the crypto-hardness catalogue.
// The .md sources stay at crypto-hardness/assumptions/ (outside src/) so the
// GitHub-web-editor contribution flow keeps its stable paths.
const assumptions = defineCollection({
  loader: glob({ pattern: "*.md", base: "./crypto-hardness/assumptions" }),
});

// Blog posts, one .md per post at posts/.
const posts = defineCollection({
  loader: glob({ pattern: "*.md", base: "./posts" }),
});

export const collections = { assumptions, posts };
