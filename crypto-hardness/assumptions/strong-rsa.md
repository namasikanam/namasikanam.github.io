# Strong RSA Assumption

**Proposed by:** Niko Barić & Birgit Pfitzmann (1997); Eiichiro Fujisaki & Tatsuaki Okamoto (1997)
**Category:** Number-theoretic

## Mathematical form

Let $N = pq$ be a random RSA modulus (typically a product of safe primes).

**Assumption.** For every PPT algorithm $\mathcal{A}$:

$$\Pr\left[ y \leftarrow \mathbb{Z}_N^* ;\; (x, e) \leftarrow \mathcal{A}(N, y) \;:\; e > 1 \;\wedge\; x^e \equiv y \pmod{N} \right] \leq \varepsilon(n).$$

The difference from [[rsa-assumption]]: the adversary may **choose the exponent** $e$ itself. This flexibility is what makes it "strong(er)" — i.e., a more generous attack model, hence a stronger assumption.

## Best known attacks

No attack better than factoring $N$ is known. Broken by Shor's quantum algorithm.

## Importance

- **Signatures without random oracles:** Cramer–Shoup (1999) and Gennaro–Halevi–Rabin (1999) signature schemes.
- **Anonymous credentials:** Camenisch–Lysyanskaya (2001, >2000 citations) — the basis of IBM Idemix and of DAA (Direct Anonymous Attestation) in the TPM 1.2 standard, deployed in billions of chips.
- **RSA accumulators** (Barić–Pfitzmann; Camenisch–Lysyanskaya 2002): stateless blockchain proposals, revocation systems.
