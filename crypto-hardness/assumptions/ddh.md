# Decisional Diffie–Hellman (DDH)

**Proposed by:** Implicit in ElGamal (1985) and earlier; first systematically studied and named by Stefan Brands (1993) / surveyed by Dan Boneh (1998)
**Category:** Group-based

## Mathematical form

Let $\mathbb{G} = \langle g \rangle$ be cyclic of prime order $q$.

**Assumption.** The distributions

$$(g, g^a, g^b, g^{ab}) \quad \text{and} \quad (g, g^a, g^b, g^c), \qquad a, b, c \leftarrow \mathbb{Z}_q$$

are computationally indistinguishable: for every PPT $\mathcal{D}$,

$$\left| \Pr[\mathcal{D}(g, g^a, g^b, g^{ab}) = 1] - \Pr[\mathcal{D}(g, g^a, g^b, g^c) = 1] \right| \leq \varepsilon(n).$$

## Where it holds / fails

- **Believed to hold:** prime-order subgroups of $\mathbb{F}_p^*$, prime-order elliptic-curve groups without efficient pairings (P-256, Curve25519, Ristretto255).
- **Provably false:** groups with an efficiently computable symmetric pairing $e$ (test $e(g^a, g^b) = e(g, g^{ab})$) — this is exactly why [[dlin]] and [[sxdh]] were introduced; also false in $\mathbb{Z}_p^*$ itself (Legendre-symbol leak) — always work in the prime-order subgroup.

## Best known attacks

Nothing better than computing discrete logs. Quantum-broken via Shor.

## Importance

- IND-CPA security of **ElGamal encryption**; IND-CCA security of **Cramer–Shoup** (1998, first practical CCA scheme without random oracles, >3000 citations).
- **Naor–Reingold PRF** (1997), Ristretto/VRFs, PAKE protocols (SPAKE2, OPAQUE), mix-nets, and the analyses of X25519-based protocols (TLS 1.3, Signal) — typically as gap/oracle variants.
- Boneh's survey "The Decision Diffie–Hellman Problem" (1998, >2000 citations).
