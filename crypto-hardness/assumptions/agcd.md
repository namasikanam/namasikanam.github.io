# Approximate Greatest Common Divisor (AGCD)

**Proposed by:** Nick Howgrave-Graham (2001); cryptographic use by van Dijk, Gentry, Halevi & Vaikuntanathan (2010)
**Category:** Integer/lattice-flavored, post-quantum candidate

## Mathematical form

Parameters: secret-prime length $\eta$, sample length $\gamma \gg \eta$, noise length $\rho < \eta$.

For a random $\eta$-bit prime $p$, the AGCD distribution outputs

$$x_i = q_i \, p + r_i, \qquad q_i \leftarrow \mathbb{Z} \cap [0, 2^{\gamma}/p), \quad r_i \leftarrow \mathbb{Z} \cap (-2^{\rho}, 2^{\rho}).$$

**Search-AGCD.** Given polynomially many samples $x_i$, find $p$.

**Decisional-AGCD.** Distinguish AGCD samples from uniform $\gamma$-bit integers (given one exact multiple $x_0 = q_0 p$ in some variants).

I.e., the common divisor $p$ must be recovered although every sample is only an *approximate* multiple.

## Best known attacks

- Lattice attacks (orthogonal-lattice, simultaneous Diophantine approximation, Coppersmith/Howgrave-Graham): require $\gamma/\eta^2$ to be small; parameters choose $\gamma = \tilde{\Omega}(\eta^2)$ to defeat them.
- Chen–Nguyen (2012) square-root attack: time $\tilde{O}(2^{\rho/2})$ — fixes $\rho$ large enough.
- Reduction **from LWE** to AGCD variants (Cheon–Stehlé 2015) — evidence the assumption is lattice-solid. No quantum polynomial attack known.

## Importance

- **DGHV "Fully Homomorphic Encryption over the Integers"** (EUROCRYPT 2010, >2500 citations) — the conceptually simplest FHE, second ever constructed; batch and scale-invariant variants followed (CCK+, CLT).
- Keeps FHE constructions independent of ring structure; also used in some obfuscation-adjacent constructions (CLT13 multilinear maps — though *those* were broken via zeroizing, the plain AGCD problem stands).
