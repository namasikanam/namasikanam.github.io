# Multivariate Quadratic (MQ) Problem

**Proposed by:** Cryptographic use by Tsutomu Matsumoto & Hideki Imai (1988); Jacques Patarin (1996); NP-hardness classical (Garey–Johnson)
**Category:** Multivariate / post-quantum

## Mathematical form

**MQ Problem.** Given $m$ quadratic polynomials $p_1, \ldots, p_m \in \mathbb{F}_q[x_1, \ldots, x_n]$,

$$p_k(x) = \sum_{i \leq j} a^{(k)}_{ij} x_i x_j + \sum_i b^{(k)}_i x_i + c^{(k)},$$

find $x \in \mathbb{F}_q^n$ with $p_k(x) = 0$ for all $k$.

**Assumption.** For **random** systems with $m \approx n$ (the hardest regime), no polynomial-time classical or quantum algorithm solves MQ with non-negligible probability. Worst-case MQ is NP-hard even over $\mathbb{F}_2$.

Trapdoor schemes hide a structured (invertible) central map $F$ as $P = S \circ F \circ T$ for secret affine $S, T$; their security additionally needs this **IP/EIP structure** to be hard to uncover — historically the weak point.

## Best known attacks

- Gröbner-basis methods (F4/F5, Faugère), XL family; complexity exponential in $n$ for random square systems, governed by the degree of regularity.
- Structured schemes repeatedly broken: HFE (Kipnis–Shamir), Oil-and-Vinegar balanced (Kipnis–Shamir), SFLASH (Dubois et al. 2007), **Rainbow (Beullens 2022)** — but random MQ itself and well-parameterized UOV remain intact.
- No significant quantum speedup known beyond Grover-type factors.

## Importance

- Matsumoto–Imai (1988) and Patarin's HFE (1996) each ~1000+ citations; Kipnis–Patarin–Goubin UOV (1999) is the basis of current designs.
- **Current relevance:** UOV, MAYO, and QR-UOV are leading candidates in the NIST additional-signature on-ramp (2023–), attractive for very short signatures; MQ-based identification (Sakumoto et al.) feeds MPC-in-the-head signatures.
