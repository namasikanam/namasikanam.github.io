# Integer Factorization Assumption

**Proposed by:** Implicit since antiquity; cryptographic use by Rivest, Shamir & Adleman (1978)
**Category:** Number-theoretic

## Mathematical form

Let $\mathsf{GenModulus}(1^n)$ output $N = pq$ where $p, q$ are uniformly random $n/2$-bit primes.

**Assumption.** For every PPT algorithm $\mathcal{A}$:

$$\Pr\left[ (N, p, q) \leftarrow \mathsf{GenModulus}(1^n) ;\; \mathcal{A}(N) \in \{p, q\} \right] \leq \varepsilon(n)$$

for some negligible $\varepsilon$. Variants restrict to safe primes ($p = 2p'+1$ with $p'$ prime) or Blum integers ($p \equiv q \equiv 3 \pmod 4$, used in the Rabin function and Blum–Blum–Shub PRG, where inverting is *provably equivalent* to factoring).

## Best known attacks

- **Classical:** General Number Field Sieve, heuristic time $L_N[1/3, (64/9)^{1/3}] = \exp\left((1.923 + o(1))(\ln N)^{1/3}(\ln \ln N)^{2/3}\right)$. Record: RSA-250 (829 bits, 2020).
- **Quantum:** Shor's algorithm (1994) factors in polynomial time. **The assumption is false against large-scale quantum computers.**

## Importance

- RSA ([[rsa-assumption]]) key recovery reduces to factoring; RSA remains ubiquitous in TLS certificates, code signing, smart cards.
- Provably factoring-based: Rabin encryption/signatures, Blum–Blum–Shub, Goldwasser–Micali ([[quadratic-residuosity]]), Paillier ([[dcr]]).
