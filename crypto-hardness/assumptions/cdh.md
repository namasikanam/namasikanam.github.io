# Computational Diffie–Hellman (CDH)

**Proposed by:** Whitfield Diffie & Martin Hellman (1976)
**Category:** Group-based

## Mathematical form

Let $\mathbb{G} = \langle g \rangle$ be a cyclic group of prime order $q$ (generated as in [[discrete-log]]).

**Assumption.** For every PPT algorithm $\mathcal{A}$:

$$\Pr\left[ a, b \leftarrow \mathbb{Z}_q ;\; \mathcal{A}(\mathbb{G}, q, g, g^a, g^b) = g^{ab} \right] \leq \varepsilon(n).$$

## Relations

- DLP-hard $\Leftarrow$ CDH-hard $\Leftarrow$ DDH-hard (each implication strict as far as we know; see [[ddh]]).
- Maurer–Wolf (1996): CDH is equivalent to DLP in groups where a suitable auxiliary elliptic curve of smooth order exists — evidence the two rarely diverge.
- **Gap-DH** variant (Okamoto–Pointcheval 2001): CDH remains hard even given a DDH oracle; this is the assumption underlying BLS signatures and many verified key-exchange proofs (e.g., analyses of TLS and Signal handshakes).

## Best known attacks

Nothing better than solving discrete log. Quantum-broken via Shor.

## Importance

- Security of the **Diffie–Hellman key exchange** itself (New Directions in Cryptography, 1976 — foundational paper, >30,000 citations): (EC)DH in TLS 1.3, SSH, Signal/WhatsApp X3DH.
- ElGamal one-wayness, hashed-ElGamal KEMs (with random oracle), BLS signatures (co-CDH in pairing groups — deployed in Ethereum consensus, Chia, drand).
