# NTRU Assumption

**Proposed by:** Jeffrey Hoffstein, Jill Pipher & Joseph Silverman (1996/1998)
**Category:** Lattice / post-quantum (structured)

## Mathematical form

Let $R_q = \mathbb{Z}_q[X]/(X^d - 1)$ (original) or $\mathbb{Z}_q[X]/(X^d + 1)$ (modern). Sample $f, g \in R$ with small coefficients (e.g., ternary), $f$ invertible in $R_q$, and set

$$h = g \cdot f^{-1} \bmod q.$$

**NTRU key-recovery problem.** Given $h$, find any small $(f', g')$ with $f' h \equiv g' \pmod q$.

**Decisional NTRU.** Distinguish $h = g f^{-1} \bmod q$ from uniform $u \leftarrow R_q$.

Equivalently: find a short vector in the 2d-dimensional **NTRU lattice** $\Lambda_h = \{ (u, v) \in R^2 : uh \equiv v \pmod q \}$, which contains the unusually short vector $(f, g)$.

## Best known attacks

- Lattice reduction (BKZ) on $\Lambda_h$; concrete security tracked by the core-SVP methodology. Hybrid meet-in-the-middle + lattice attacks (Howgrave-Graham 2007).
- **Overstretched regime broken:** for $q$ subexponentially large in $d$ (as in some homomorphic proposals: YASHE, LTV), the sublattice attacks of Albrecht–Bai–Ducas and Kirchner–Fouque (2016–17) apply. Standard NTRUEncrypt/Falcon parameters are unaffected.
- No structural quantum attack known; believed exponentially hard.

## Importance

- Hoffstein–Pipher–Silverman (ANTS 1998, >3000 citations) — the oldest surviving practical lattice scheme, remarkable for predating and surviving 25+ years of cryptanalysis.
- **Deployed:** **Falcon / FN-DSA** (NIST post-quantum signature standard, used in blockchain PQ efforts) is proven secure under NTRU + Ring-SIS; NTRU-HRSS was used in Google/Cloudflare CECPQ2 TLS experiments; OpenSSH default hybrid `sntrup761x25519` uses the NTRU-Prime variant.
