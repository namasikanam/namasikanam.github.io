# Learning With Errors (LWE)

**Proposed by:** Oded Regev (2005)
**Category:** Lattice / post-quantum

## Mathematical form

Parameters: dimension $n$, modulus $q$, error distribution $\chi$ over $\mathbb{Z}$ (typically discrete Gaussian with parameter $\alpha q$, $\alpha q > 2\sqrt{n}$).

For secret $s \in \mathbb{Z}_q^n$, define the LWE distribution $A_{s,\chi}$: sample $a \leftarrow \mathbb{Z}_q^n$, $e \leftarrow \chi$, output $(a, \langle a, s \rangle + e \bmod q)$.

**Search-LWE.** Given $m = \mathrm{poly}(n)$ samples from $A_{s,\chi}$, find $s$.

**Decision-LWE.** Distinguish $m$ samples of $A_{s,\chi}$ from $m$ samples of the uniform distribution over $\mathbb{Z}_q^n \times \mathbb{Z}_q$:

$$(A, As + e) \approx_c (A, u), \qquad A \leftarrow \mathbb{Z}_q^{m \times n},\; e \leftarrow \chi^m,\; u \leftarrow \mathbb{Z}_q^m.$$

Search and decision are equivalent for suitable $q$. The secret may be drawn from $\chi^n$ ("normal form") without loss of security.

## Worst-case connection

Regev (2005): a poly-time algorithm for average-case LWE yields a poly-time **quantum** algorithm for worst-case GapSVP$_{\tilde{O}(n/\alpha)}$ and SIVP ([[lattice-worst-case]]). Classical reductions: Peikert (2009), Brakerski et al. (2013).

## Best known attacks

Primal/dual lattice attacks via BKZ; core-SVP cost $2^{0.292\beta}$ classical, $2^{0.257\beta}$ quantum for block size $\beta$ determined by $(n, q, \alpha)$. Arora–Ge algebraic attack needs $n^{O(\eta)}$ samples for error width $\eta$. No subexponential attack known for standard parameters; believed exponential even quantumly.

## Importance

- Regev (STOC 2005; JACM 2009, >8000 citations).
- **All of fully homomorphic encryption** after 2011: BGV, BFV, CKKS, TFHE/FHEW (each scheme paper >2000–5000 citations) — deployed in private-AI and encrypted-compute products.
- Via [[ring-module-lwe]]: **ML-KEM/Kyber and ML-DSA/Dilithium**, now shipping in Chrome, Signal, iMessage, OpenSSH.
- Lossy trapdoors, fully homomorphic signatures, attribute-based encryption for circuits, candidate iO building blocks.
