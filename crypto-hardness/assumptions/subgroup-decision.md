# Composite-Order Subgroup Decision Assumptions

**Proposed by:** Dan Boneh, Eu-Jin Goh & Kobbi Nissim (2005); variants by Katz–Sahai–Waters (2008, "KSW1/KSW2"), Lewko–Waters (2010)
**Category:** Pairing-based (composite order)

## Mathematical form

Let $\mathbb{G}$ be a bilinear group of composite order $N = pq$ (or $N = p_1 p_2 p_3$) with pairing $e : \mathbb{G} \times \mathbb{G} \to \mathbb{G}_T$, and let $\mathbb{G}_p \leq \mathbb{G}$ be the subgroup of order $p$. The factorization of $N$ is secret.

**Subgroup Decision (SD).** The distributions

$$\{ x \leftarrow \mathbb{G} \} \quad \text{and} \quad \{ x \leftarrow \mathbb{G}_p \}$$

are computationally indistinguishable given $(N, \mathbb{G}, \mathbb{G}_T, e)$ and a generator of $\mathbb{G}_q$. Generalizations (KSW assumptions, Lewko–Waters assumptions over $N = p_1p_2p_3$) give the adversary various subgroup elements and ask to decide membership of mixed-subgroup elements.

## Relations and attacks

- Factoring $N$ breaks SD (project onto subgroups) — so SD implies [[factoring]]; hence pairing parameters need RSA-size $N$ (slow). Quantum-broken via Shor.
- Freeman (2010) and the $k$-Lin-based "dual pairing vector space" framework simulate these assumptions in prime-order groups ([[dlin]]), which is how modern instantiations avoid composite order.

## Importance

- **BGN "evaluating 2-DNF formulas on ciphertexts"** (TCC 2005, >1500 citations) — somewhat-homomorphic encryption (one multiplication), private queries.
- **Katz–Sahai–Waters predicate/inner-product encryption** (EUROCRYPT 2008, >1500 citations).
- **Dual-system encryption** (Waters 2009; Lewko–Waters 2010, each ~1000+ citations) — the proof technique behind the first fully secure (H)IBE and ABE under static assumptions, shaping a decade of pairing-based literature.
