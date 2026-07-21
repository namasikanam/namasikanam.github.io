# Class-Group Assumptions (CL-DLP, Unknown Order)

**Proposed by:** Johannes Buchmann & Hugh Williams (1988); revived by Castagnos–Laguillaumie (2015), Wesolowski (2019)
**Category:** Number-theoretic (groups of unknown order)

## Mathematical form

Let $\mathrm{Cl}(\Delta)$ be the ideal class group of the imaginary quadratic order of discriminant $\Delta < 0$; for random large $|\Delta|$ its order $h(\Delta)$ is unknown and believed infeasible to compute.

**CL-DLP.** Given $\mathfrak{g}, \mathfrak{h} = \mathfrak{g}^x \in \mathrm{Cl}(\Delta)$, find $x$.

**Order / root problem (unknown-order assumption).** Given random $\mathfrak{g} \in \mathrm{Cl}(\Delta)$, it is hard to find (any multiple of) $\mathrm{ord}(\mathfrak{g})$, and hard to compute $\ell$-th roots — the **adaptive root assumption** — and $\mathfrak{g}^{2^T}$ requires $T$ sequential squarings (cf. [[sequential-squaring]]).

**CL framework (DDH-CL / HSM).** In class groups engineered to contain a subgroup where DL is *easy*, a DDH/hidden-subgroup-membership assumption in the full group yields linearly homomorphic encryption modulo a prime $q$.

## Best known attacks

- Computing $h(\Delta)$ / class-group DL: subexponential $L_{|\Delta|}[1/2]$ (Hafner–McCurley, Biasse) — worse than GNFS for factoring, allowing smaller parameters than RSA groups.
- **Quantum: broken** — class-group computation is polynomial-time on a quantum computer (Biasse–Song 2016).

## Importance

- The trustless replacement for RSA groups (no secret factorization needed):
  **Wesolowski VDF** (2019, deployed in the **Chia blockchain** proof-of-time) and transparent accumulators/integer commitments (Boneh–Bünz–Fisch 2019).
- **CL homomorphic encryption** (Castagnos–Laguillaumie) is used in modern threshold-ECDSA protocols adopted by MPC wallet vendors — bandwidth-efficient alternative to Paillier ([[dcr]]).
- Buchmann–Williams key exchange (1988) — historical origin.
