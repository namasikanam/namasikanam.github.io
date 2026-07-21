# Symmetric External Diffie–Hellman (SXDH)

**Proposed by:** Emerged c. 2004–2005 (Scott; Ballard–Green–de Medeiros–Monrose 2005); popularized by Groth–Sahai (2008)
**Category:** Pairing-based

## Mathematical form

Let $e : \mathbb{G}_1 \times \mathbb{G}_2 \to \mathbb{G}_T$ be an **asymmetric** ("Type-3") pairing over groups of prime order $q$, with **no efficiently computable homomorphism** between $\mathbb{G}_1$ and $\mathbb{G}_2$ in either direction.

**Assumption.** [[ddh]] holds **in both** $\mathbb{G}_1$ and $\mathbb{G}_2$:

$$(g_i, g_i^a, g_i^b, g_i^{ab}) \approx_c (g_i, g_i^a, g_i^b, g_i^c) \quad \text{for } i \in \{1, 2\}.$$

This is consistent because the pairing can only compare an element of $\mathbb{G}_1$ *against* one of $\mathbb{G}_2$ — within a single source group no DDH test is available. Standard instantiation: BLS12-381, BN curves.

## Best known attacks

Discrete log in $\mathbb{G}_1$, $\mathbb{G}_2$, or $\mathbb{G}_T$ (finite-field NFS for $\mathbb{G}_T$). Quantum-broken via Shor.

## Importance

- The most efficient instantiation of **Groth–Sahai NIZK proofs** (2008, >2000 citations).
- Structure-preserving signatures, anonymous credentials (Microsoft U-Prove-adjacent literature, BBS-style schemes), compact e-cash.
- Type-3 pairings under SXDH are the default setting of modern pairing implementations (BLS12-381 in Zcash, Ethereum).
