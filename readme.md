# namasikanam.github.io

Personal homepage, built with [Astro](https://astro.build) and deployed to GitHub Pages
by `.github/workflows/deploy.yml` on every push to `main`.

```
src/
├── pages/
│   ├── index.astro                     # the homepage
│   ├── posts/[slug].astro              # renders posts/*.md
│   └── crypto-hardness/                # the hardness-assumptions sub-site
├── data/
│   ├── publications.ts                 # edit to add a paper
│   └── teaching.ts                     # edit to add a course
├── components/                         # Fold (collapsible section), Publication
├── layouts/Base.astro                  # shared <head> + Dune-theme container
└── lib/markdownTable.ts                # build-time parser for crypto-hardness tables
public/                                 # served as-is: styles.css (Dune theme), papers/, slides/, …
posts/                                  # blog posts, one .md per post
crypto-hardness/                        # data + assumption statements (see its README)
```

Local development:

```
npm install
npm run dev        # http://localhost:4321
npm run build      # static site into dist/
```
