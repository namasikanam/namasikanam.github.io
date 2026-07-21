# Quadratic Residuosity Assumption (QRA)

**Proposed by:** Shafi Goldwasser & Silvio Micali (1982)
**Category:** Number-theoretic

## Mathematical form

Let $N = pq$ be a random RSA modulus. Let $\mathbb{J}_N = \{ x \in \mathbb{Z}_N^* : \left(\frac{x}{N}\right) = +1 \}$ be the elements with Jacobi symbol $+1$, and let $\mathbb{QR}_N = \{ x^2 \bmod N : x \in \mathbb{Z}_N^* \} \subsetneq \mathbb{J}_N$ (index 2 in $\mathbb{J}_N$).

**Assumption.** The distributions

$$\{ (N, x) : x \leftarrow \mathbb{QR}_N \} \quad \text{and} \quad \{ (N, x) : x \leftarrow \mathbb{J}_N \setminus \mathbb{QR}_N \}$$

are computationally indistinguishable, i.e., no PPT distinguisher decides quadratic residuosity of Jacobi-symbol-$(+1)$ elements with non-negligible advantage. (The Jacobi symbol itself is poly-time computable, which is why the definition restricts to $\mathbb{J}_N$.)

## Relation to factoring

Factoring breaks QRA (Legendre symbols mod $p, q$); equivalence is open. Quantum-broken via Shor.

## Importance

- **Historic cornerstone:** Goldwasser–Micali (1982/84, >10,000 citations) used QRA to build the first semantically secure (IND-CPA) public-key encryption, introducing the definitional framework of modern cryptography.
- Cocks' identity-based encryption (2001); Blum–Blum–Shub PRG uses the related squaring structure.
