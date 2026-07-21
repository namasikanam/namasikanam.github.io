# Collision Resistance of Standardized Hash Functions (SHA-2 / SHA-3)

**Proposed by:** Concept: Ivan Damgård (1987), Ralph Merkle (1989); concrete assumptions: NIST/NSA (SHA-2, 2001), Bertoni–Daemen–Peeters–Van Assche (Keccak/SHA-3, 2008)
**Category:** Symmetric / concrete ("unstructured") assumption

## Mathematical form

For a fixed function $H : \{0,1\}^* \to \{0,1\}^n$ (SHA-256: $n = 256$):

**Collision resistance (concrete assumption).** No algorithm finds $x \neq x'$ with $H(x) = H(x')$ in time substantially below the generic birthday bound $2^{n/2}$.

**Preimage / second-preimage resistance.** Given $y = H(x)$ (resp. $x$), no algorithm finds a preimage (resp. a second preimage) in time substantially below $2^n$.

Formally, collision resistance requires a keyed family $\{H_k\}$ (for a fixed function a collision trivially "exists"); practice assumptions *human ignorance* of any collision for the standardized instances. Related idealization: the **random oracle model** (Bellare–Rogaway 1993, >10,000 citations) treats $H$ as a uniformly random function — a proof heuristic, not an assumption about a real object.

## Best known attacks

- **SHA-256 / SHA-3:** nothing beats generic bounds (quantum: Grover $2^{n/2}$ for preimages, Brassard–Høyer–Tapp $2^{n/3}$ for collisions with heavy memory — hence "quantum-safe" with doubled parameters).
- **Falsifiability demonstrated:** MD5 collisions (Wang–Yu 2005, >2000 citations), SHA-1 collisions (SHAttered 2017) — both now forbidden.

## Importance

- Ubiquitous: TLS/certificate signing, Bitcoin (double-SHA-256 PoW and addresses), Git object integrity, package managers, HMAC, KDFs, Merkle trees in Certificate Transparency and every blockchain.
- **SLH-DSA / SPHINCS+ (FIPS 205)** post-quantum signatures rely *only* on hash-function security — the most conservative PQ assumption.
- Hash-based transparency logs and zk-STARKs (collision-resistant hashes are their sole cryptographic assumption).
