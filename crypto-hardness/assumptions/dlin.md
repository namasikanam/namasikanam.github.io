# Decisional Linear Assumption (DLIN)

**Proposed by:** Dan Boneh, Xavier Boyen & Hovav Shacham (2004)
**Category:** Pairing-based

## Mathematical form

Let $\mathbb{G}$ be a group of prime order $q$ equipped with a symmetric pairing $e : \mathbb{G} \times \mathbb{G} \to \mathbb{G}_T$.

**Assumption.** The distributions

$$(u, v, h, u^a, v^b, h^{a+b}) \quad \text{and} \quad (u, v, h, u^a, v^b, h^{z})$$

with $u, v, h \leftarrow \mathbb{G}$, $a, b, z \leftarrow \mathbb{Z}_q$, are computationally indistinguishable.

## Motivation

In symmetric pairing groups, [[ddh]] is **easy** (test $e(g^a, g^b) \stackrel{?}{=} e(g, g^{ab})$). DLIN is the natural DDH substitute that survives the pairing: the pairing lets one check *linear* relations only pairwise, and no test distinguishes the DLIN tuple. DLIN holds in the generic group model even with a symmetric pairing. Generalizes to the $k$-Linear family ($k=1$ is DDH, $k=2$ is DLIN), and to Matrix-DDH (Escala et al. 2013).

## Best known attacks

Discrete log. Quantum-broken via Shor.

## Importance

- Introduced for **short group signatures** (Boneh–Boyen–Shacham 2004, >3000 citations).
- **Groth–Sahai proofs** (2008, >2000 citations) — efficient NIZK for bilinear groups, instantiable under DLIN — the workhorse of structure-preserving cryptography, anonymous credentials, and early SNARK-adjacent constructions.
- Linear encryption; many IBE/ABE variants proven under $k$-Lin, the currently preferred "weakest" pairing assumption in theoretical work.
