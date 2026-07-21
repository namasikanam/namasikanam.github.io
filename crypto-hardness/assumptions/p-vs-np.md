# P ≠ NP

**Proposed by:** Stephen Cook (1971), Leonid Levin (1973); anticipated by Gödel's 1956 letter to von Neumann
**Category:** Complexity-theoretic foundation

## Mathematical form

Let $\mathsf{P} = \bigcup_{k \geq 1} \mathsf{DTIME}(n^k)$ be the class of languages decidable in deterministic polynomial time, and let

$$\mathsf{NP} = \{ L \subseteq \{0,1\}^* : \exists \text{ poly-time verifier } V, \text{ polynomial } p, \; x \in L \iff \exists w \in \{0,1\}^{p(|x|)}, V(x, w) = 1 \}.$$

**Assumption.** $\mathsf{P} \neq \mathsf{NP}$; equivalently, no NP-complete language (e.g., SAT) admits a polynomial-time decision algorithm.

## Relation to cryptography

- $\mathsf{P} \neq \mathsf{NP}$ is **necessary** for essentially all of complexity-based cryptography: if $\mathsf{P} = \mathsf{NP}$, one-way functions do not exist (inverting any efficiently computable function is an NP-search problem).
- It is **not known to be sufficient**: cryptography needs *average-case* hardness, and worst-case NP-hardness does not imply it (Impagliazzo's "five worlds"). Even $\mathsf{NP} \not\subseteq \mathsf{BPP}$ is not known to yield one-way functions.

## Status

Open since 1971; one of the Clay Millennium Problems. Known barriers: relativization (Baker–Gill–Solovay), natural proofs (Razborov–Rudich), algebrization (Aaronson–Wigderson).
