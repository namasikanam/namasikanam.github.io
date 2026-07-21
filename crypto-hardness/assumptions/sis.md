# Short Integer Solution (SIS)

**Proposed by:** Miklós Ajtai (1996)
**Category:** Lattice / post-quantum

## Mathematical form

Parameters: dimension $n$, modulus $q$, width $m = \mathrm{poly}(n)$, norm bound $\beta < q$.

**Assumption (SIS$_{n,q,m,\beta}$).** For every PPT algorithm $\mathcal{A}$:

$$\Pr\left[ A \leftarrow \mathbb{Z}_q^{n \times m} ;\; z \leftarrow \mathcal{A}(A) \;:\; Az \equiv 0 \pmod q \;\wedge\; 0 < \|z\| \leq \beta \right] \leq \varepsilon(n).$$

I.e., finding a short nonzero vector in the random q-ary lattice $\Lambda^\perp(A) = \{ z \in \mathbb{Z}^m : Az \equiv 0 \bmod q \}$ is hard. The **ISIS** (inhomogeneous) variant asks for short $z$ with $Az \equiv u$; Ring-SIS/Module-SIS replace $\mathbb{Z}_q$ by $R_q = \mathbb{Z}_q[X]/(X^d + 1)$.

## Worst-case connection

Ajtai (1996): solving SIS on average is at least as hard as solving worst-case SIVP$_{\tilde{O}(\beta\sqrt{n})}$ ([[lattice-worst-case]]) — the first worst-case to average-case reduction in cryptography.

## Best known attacks

Lattice reduction (BKZ) on $\Lambda^\perp(A)$: time $2^{\Theta(n \log q / \log^2 \beta)}$ roughly; concretely estimated via the core-SVP methodology. No quantum speedup beyond sieving constants.

## Importance

- Ajtai's paper (STOC 1996, >2500 citations) founded lattice-based cryptography.
- Collision-resistant hashing (SWIFFT), Micciancio–Peikert trapdoors, GPV signatures (2008, >2000 citations).
- **Deployed:** Module-SIS (with Module-LWE) underpins the unforgeability of **ML-DSA / CRYSTALS-Dilithium (FIPS 204)**, the primary NIST post-quantum signature.
