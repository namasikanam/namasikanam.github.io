# Phi-Hiding Assumption

**Proposed by:** Christian Cachin, Silvio Micali & Markus Stadler (1999)
**Category:** Number-theoretic

## Mathematical form

Let $N = pq$ be an RSA modulus and $e$ a small prime (or prime power), $e < N^{1/4}$.

**Assumption.** The distributions

$$\{ (N, e) : e \mid \varphi(N) \} \quad \text{and} \quad \{ (N, e) : \gcd(e, \varphi(N)) = 1 \}$$

(with $N$ sampled appropriately in each case) are computationally indistinguishable — i.e., it is hard to tell whether $e$ divides $\varphi(N) = (p-1)(q-1)$, equivalently whether the map $x \mapsto x^e$ on $\mathbb{Z}_N^*$ is $e$-to-1 or a permutation.

## Caveats and attacks

- $e$ must be small relative to $N$: for $e > N^{1/4}$, Coppersmith's method factors $N$ when $e \mid p - 1$ (Bauer et al.); parameters must respect this.
- Otherwise no attack better than factoring $N$ is known. Quantum-broken via Shor.

## Importance

- **Cachin–Micali–Stadler PIR** (EUROCRYPT 1999, ~1000 citations) — the first single-server private information retrieval with polylogarithmic communication.
- Efficient lossy trapdoor functions from RSA (Kiltz–O'Neill–Smith 2010) and the **optimal tightness proofs for RSA-FDH signatures** (Kakvi–Kiltz 2012).
- Used in some e-cash and password-authenticated protocols; a standard tool for making RSA "lossy" in security proofs.
