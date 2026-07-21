# Knowledge-of-Exponent Assumption (KEA) and Knowledge Assumptions

**Proposed by:** Ivan Damgård (1991); extended by Hada–Tanaka (1998), Bellare–Palacio (2004), Groth (2010, 2016)
**Category:** Non-falsifiable / knowledge assumption (group-based)

## Mathematical form

Let $\mathbb{G} = \langle g \rangle$ be of prime order $q$.

**Assumption (KEA1).** For every PPT adversary $\mathcal{A}$ there exists a PPT **extractor** $\mathcal{E}_\mathcal{A}$ such that for random $\alpha \leftarrow \mathbb{Z}_q$:

$$\Pr\left[ (h, \hat{h}) \leftarrow \mathcal{A}(g, g^\alpha; r) ;\; \hat{h} = h^\alpha \;\wedge\; \mathcal{E}_\mathcal{A}(g, g^\alpha; r) \neq \log_g h \right] \leq \varepsilon(n).$$

Informally: the *only way* to output a pair $(h, h^\alpha)$ given $(g, g^\alpha)$ is to pick a known $x$ and set $h = g^x$ — formalized by demanding an extractor that recovers $x$ from the adversary's coins. Generalizations (q-PKE, q-power knowledge of exponent) extract polynomials from power-tuples $\left(g^{\tau^i}, g^{\alpha\tau^i}\right)_{i \leq q}$.

## Nature of the assumption

- **Non-falsifiable** (Naor 2003): there is no efficient challenge game to refute it — inherently required for succinct non-interactive arguments (SNARKs) by the Gentry–Wichs (2011) barrier.
- The **Algebraic Group Model** (Fuchsbauer–Kiltz–Loss 2018) is the modern idealized alternative used to justify the same constructions.

## Importance

- **Groth16** (EUROCRYPT 2016, >3000 citations) — the most widely deployed zk-SNARK: **Zcash** shielded transactions, Ethereum zk-rollups, Filecoin proofs (largest SNARK deployment in existence), Semaphore/anonymous voting.
- Pinocchio/GGPR (2013, >2000 citations) and the entire practical-SNARK line rest on q-PKE-style knowledge assumptions or the AGM.
