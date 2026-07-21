# Gap Diffie–Hellman (Gap-DH / GDH)

**Proposed by:** Tatsuaki Okamoto & David Pointcheval (2001)
**Category:** Group-based ("gap" / oracle-assisted family)

## Mathematical form

Let $\mathbb{G} = \langle g \rangle$ be cyclic of prime order $q$. Let $\mathcal{O}_{\mathrm{DDH}}$ be an oracle that on input $(g^a, g^b, g^c)$ returns 1 iff $c \equiv ab \pmod q$.

**Assumption.** For every PPT algorithm $\mathcal{A}$ with oracle access:

$$\Pr\left[ a, b \leftarrow \mathbb{Z}_q ;\; \mathcal{A}^{\mathcal{O}_{\mathrm{DDH}}}(g, g^a, g^b) = g^{ab} \right] \leq \varepsilon(n).$$

I.e., [[cdh]] remains hard *even when the decisional problem [[ddh]] is free*. Pairing groups are the canonical "gap groups": the pairing implements $\mathcal{O}_{\mathrm{DDH}}$, yet CDH is believed hard — so there Gap-DH ⟺ co-CDH-style assumptions hold unconditionally given CDH.

## Best known attacks

The DDH oracle is not known to help compute $g^{ab}$: best attack is still solving [[discrete-log]]. Quantum-broken via Shor.

## Importance

- Okamoto–Pointcheval "The Gap-Problems" (PKC 2001, >1000 citations) — introduced the gap framework.
- **BLS signatures** (Boneh–Lynn–Shacham 2001, >3000 citations) are proven secure exactly in gap groups (co-CDH with pairing-as-DDH-oracle) — deployed in Ethereum proof-of-stake, Chia, drand.
- Security proofs of deployed key exchange and encryption: **ECIES**/hashed-ElGamal KEMs, **HMQV** (Krawczyk 2005, >1000 citations), and the analyses of Signal's X3DH handshake all use gap-DH (or its interactive sibling, oracle-DH).
