# Syndrome Decoding / Decoding Random Linear Codes

**Proposed by:** Robert McEliece (1978); NP-hardness by Berlekamp, McEliece & van Tilborg (1978)
**Category:** Code-based / post-quantum

## Mathematical form

**Syndrome Decoding Problem (SDP).** Given a uniformly random parity-check matrix $H \leftarrow \mathbb{F}_2^{(n-k) \times n}$, a syndrome $s \in \mathbb{F}_2^{n-k}$, and a weight bound $w$, find $e \in \mathbb{F}_2^n$ with

$$He^\top = s \quad \text{and} \quad \mathrm{wt}(e) \leq w.$$

**Assumption.** For $w$ around the Gilbert–Varshamov bound, no PPT (or polynomial-time quantum) algorithm solves random instances with non-negligible probability. Equivalent formulation: given a random generator matrix $G$ and $y = mG + e$ with $\mathrm{wt}(e) \leq w$, recover $m$ (decoding random linear codes).

**McEliece assumption (additional):** a scrambled Goppa-code generator matrix is computationally indistinguishable from a uniformly random one.

## Hardness evidence and best attacks

- Worst-case **NP-hard** (BMvT 1978); average-case hardness is the assumption.
- Best attacks: Information-Set Decoding — Prange (1962) through Stern, MMT, **BJMM (2012)**, May–Ozerov — all time $2^{c n (1+o(1))}$ with only the constant $c$ improving over 60 years. Quantum ISD (Bernstein 2010) gives roughly a square-root-type speedup, still exponential.

## Importance

- McEliece (1978, >3000 citations) — the first code-based cryptosystem; parameters from 1978 remain unbroken.
- **Classic McEliece:** NIST PQC round-4 KEM, ISO standardization track; already deployable in conservative high-security settings.
- BIKE and **HQC** (NIST selected HQC for standardization in 2025) rely on quasi-cyclic variants of SDP.
- Fiat–Shamir signatures from SDP (Stern protocol; modern MPC-in-the-head schemes, e.g., SDitH in the NIST signature on-ramp). Also underlies [[lpn]].
