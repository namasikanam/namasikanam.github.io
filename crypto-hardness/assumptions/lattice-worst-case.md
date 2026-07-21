# Worst-Case Lattice Problems (GapSVP, SIVP)

**Proposed by:** Studied since Gauss/Minkowski; cryptographic relevance by Miklós Ajtai (1996); assumptiond quantum-hard
**Category:** Lattice / post-quantum (worst-case foundation)

## Mathematical form

A lattice is $\mathcal{L}(B) = \{ Bz : z \in \mathbb{Z}^n \}$ for a basis $B \in \mathbb{R}^{n \times n}$. Let $\lambda_1(\mathcal{L})$ be the length of its shortest nonzero vector, $\lambda_i$ the successive minima.

**GapSVP$_\gamma$.** Given $(B, d)$, decide whether $\lambda_1(\mathcal{L}(B)) \leq d$ or $\lambda_1(\mathcal{L}(B)) > \gamma(n) \cdot d$.

**SIVP$_\gamma$.** Given $B$, find $n$ linearly independent vectors of length $\leq \gamma(n) \cdot \lambda_n(\mathcal{L}(B))$.

**Assumption.** For $\gamma(n) = \mathrm{poly}(n)$ (e.g., $\tilde{O}(n)$), no polynomial-time algorithm — **classical or quantum** — solves GapSVP$_\gamma$ or SIVP$_\gamma$ in the worst case.

## Best known algorithms

- Exact/near-exact SVP: $2^{\Theta(n)}$ time (sieving: $2^{0.292n}$ classical, $2^{0.257n}$ quantum heuristic).
- Poly-factor approximation: LLL achieves $2^{O(n)}$ factors in poly time; BKZ interpolates (block size $\beta$ gives $\approx \beta^{n/\beta}$ factor in $2^{\Theta(\beta)}$ time).
- NP-hard for constant $\gamma$ (Ajtai, Micciancio, Khot); poly $\gamma$ regime is NOT NP-hard (in $\mathsf{NP} \cap \mathsf{coNP}$ for $\gamma \geq \sqrt{n}$) — hardness is a genuine assumption.
- Notably **no quantum speedup** beyond generic ones is known — the basis of post-quantum confidence.

## Importance

The unique selling point of lattice cryptography: **worst-case to average-case reductions**. Ajtai (1996) reduces worst-case SIVP to [[sis]]; Regev (2005) reduces worst-case GapSVP/SIVP *quantumly* to [[lwe]]. Thus breaking the average-case schemes below breaks *every instance* of these lattice problems.
