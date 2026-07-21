# AES as a (Strong) Pseudorandom Permutation

**Proposed by:** Joan Daemen & Vincent Rijmen (Rijndael, 1998; NIST FIPS 197, 2001); PRP formalization: Luby–Rackoff (1988), Bellare–Kilian–Rogaway (1994)
**Category:** Symmetric / concrete assumption

## Mathematical form

Let $E : \{0,1\}^k \times \{0,1\}^{128} \to \{0,1\}^{128}$ be AES. For a distinguisher $\mathcal{D}$ making $q$ queries and running in time $t$:

$$\mathbf{Adv}^{\mathrm{sprp}}_{E}(\mathcal{D}) = \left| \Pr_{K \leftarrow \{0,1\}^k}\left[ \mathcal{D}^{E_K, E_K^{-1}} = 1 \right] - \Pr_{\pi \leftarrow \mathsf{Perm}(128)}\left[ \mathcal{D}^{\pi, \pi^{-1}} = 1 \right] \right|.$$

**Assumption (strong PRP security).** For all $\mathcal{D}$ with $t \ll 2^k$: $\mathbf{Adv}^{\mathrm{sprp}}_{E}(\mathcal{D}) \approx t / 2^k$ — i.e., no attack meaningfully better than exhaustive key search.

## Best known attacks

- **Biclique key recovery** (Bogdanov–Khovratovich–Rechberger 2011): $2^{126.1}$ for AES-128 — a factor ~4 below brute force; no practical impact.
- **Related-key attacks** on AES-192/-256 (Biryukov–Khovratovich 2009) — outside the standard PRP model; avoided by proper key derivation.
- **Quantum:** Grover halves effective key length ($2^{64}$ for AES-128) — AES-256 is the quantum-safe choice. 25 years of cryptanalysis with no single-key break.

## Importance

- The default cipher of the planet: TLS (AES-GCM), disk encryption (XTS), Wi-Fi WPA2/3, IPsec, cloud storage, hardware AES-NI in every CPU.
- All provable security of modes (GCM, CBC, CTR, OCB; Bellare et al., Rogaway — thousands of citations) reduces mode security to exactly this PRP/SPRP assumption.
