# Bilinear Diffie–Hellman (BDH / DBDH)

**Proposed by:** Dan Boneh & Matthew Franklin (2001); groundwork by Antoine Joux (2000), Sakai–Ohgishi–Kasahara (2000)
**Category:** Pairing-based

## Mathematical form

Let $\mathbb{G}, \mathbb{G}_T$ be groups of prime order $q$ with an efficiently computable, non-degenerate bilinear map $e : \mathbb{G} \times \mathbb{G} \to \mathbb{G}_T$, i.e., $e(g^a, g^b) = e(g,g)^{ab}$. (Asymmetric variants use $e : \mathbb{G}_1 \times \mathbb{G}_2 \to \mathbb{G}_T$, e.g., BLS12-381.)

**Computational BDH.** For every PPT $\mathcal{A}$:

$$\Pr\left[ a, b, c \leftarrow \mathbb{Z}_q ;\; \mathcal{A}(g, g^a, g^b, g^c) = e(g, g)^{abc} \right] \leq \varepsilon(n).$$

**Decisional BDH (DBDH).** $(g, g^a, g^b, g^c, e(g,g)^{abc}) \approx_c (g, g^a, g^b, g^c, e(g,g)^{z})$ for random $z \leftarrow \mathbb{Z}_q$.

## Best known attacks

Discrete log in $\mathbb{G}$ or in $\mathbb{G}_T$ (the latter is a finite-field DLP — the "tower NFS" attacks of Kim–Barbulescu 2016 forced parameter increases, e.g., BN254 → BLS12-381). Quantum-broken via Shor.

## Importance

- **Boneh–Franklin IBE** (CRYPTO 2001, >12,000 citations) — the first practical identity-based encryption, launching pairing-based cryptography.
- DBDH underlies Waters IBE (2005), and **attribute-based encryption** (Goyal–Pandey–Sahai–Waters 2006, >6000 citations; Bethencourt–Sahai–Waters 2007, >6000 citations).
- Related pairing assumptions power **BLS signatures** (Boneh–Lynn–Shacham 2001, co-CDH; deployed in Ethereum proof-of-stake, Chia, drand randomness beacon) and **KZG commitments** ([[q-sdh]]).
