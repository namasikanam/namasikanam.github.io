# Discrete Logarithm Problem (DLP / ECDLP)

**Proposed by:** Whitfield Diffie & Martin Hellman (1976); elliptic-curve setting by Neal Koblitz & Victor Miller (1985)
**Category:** Number-theoretic / group-based

## Mathematical form

Let $\mathcal{G}(1^n)$ output a cyclic group $\mathbb{G} = \langle g \rangle$ of prime order $q$ (with $\log q \approx \mathrm{poly}(n)$).

**Assumption.** For every PPT algorithm $\mathcal{A}$:

$$\Pr\left[ (\mathbb{G}, q, g) \leftarrow \mathcal{G}(1^n);\; x \leftarrow \mathbb{Z}_q ;\; \mathcal{A}(\mathbb{G}, q, g, g^x) = x \right] \leq \varepsilon(n).$$

The two standard instantiations:
- **Finite fields:** $\mathbb{G} \subseteq \mathbb{F}_p^*$ (a prime-order subgroup).
- **Elliptic curves (ECDLP):** $\mathbb{G} \subseteq E(\mathbb{F}_p)$, e.g., NIST P-256, secp256k1, Curve25519.

## Best known attacks

- **Generic groups:** $\Theta(\sqrt{q})$ (Pollard rho; matching lower bound by Shoup 1997). This is the best known for well-chosen elliptic curves — hence 256-bit curves for 128-bit security.
- **Finite fields:** index calculus / NFS, subexponential $L_p[1/3]$; quasi-polynomial in small characteristic (Barbulescu et al. 2014) — small-characteristic fields are dead.
- **Quantum:** Shor's algorithm solves DLP in any group in polynomial time. **Broken against quantum computers.**
- Weak curves excluded: MOV/Frey–Rück pairing transfer, anomalous curves, small subgroup attacks.

## Importance

- **Deployed everywhere:** ECDH key exchange and ECDSA/EdDSA signatures in TLS 1.3, SSH, Signal, WhatsApp, Bitcoin & Ethereum (secp256k1), FIDO2/passkeys, DNSSEC.
- Underlies [[cdh]], [[ddh]] and all pairing assumptions ([[bdh]], [[dlin]], [[q-sdh]], [[sxdh]]).
