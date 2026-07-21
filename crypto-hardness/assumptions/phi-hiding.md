# Phi-Hiding Assumption

**Proposed by:** Christian Cachin, Silvio Micali & Markus Stadler (1999)
**Category:** Number-theoretic

## Mathematical form

Let $N = pq$ be an RSA modulus and $e$ a small prime (or prime power), $e < N^{1/4}$.

**Predicate-only assumption.** For two explicitly specified RSA-modulus generators, the distributions

$$\{ (N, e) : e \mid \varphi(N) \} \quad \text{and} \quad \{ (N, e) : \gcd(e, \varphi(N)) = 1 \}$$

(with the positive and negative generators fixing all public side conditions) are computationally indistinguishable.

The earlier version of this page called this equivalent to distinguishing an exactly
$e$-to-1 map from a permutation. That equivalence is false. For $N=pq$,

$$
\left|\ker(x\mapsto x^e)\right|
=\gcd(e,p-1)\gcd(e,q-1).
$$

Thus $\gcd(e,\varphi(N))=1$ is exactly the permutation condition, but
$e\mid\varphi(N)$ only implies that each nonempty fiber has size **at least** $e$.
It need not have size exactly $e$.

## Mechanized correction and counterexample

Take $N=91=7\cdot13$ and $e=3$. Then $3^4<91$ and $3\mid\varphi(91)=72$, but

$$
\gcd(3,6)\gcd(3,12)=9.
$$

Cubing on $\mathbb Z_{91}^*$ is therefore nine-to-one on its image, not three-to-one.
Moreover, for ordinary RSA primes $p,q\ne3$, the exact-three-to-one branch has
$N\equiv2\pmod3$, while the permutation branch has $N\equiv1\pmod3$; reduction
modulo $3$ distinguishes those two promises perfectly.

The kernel formula, fiber-size statement, concrete counterexample, and perfect
distinguisher are checked in Lean 4 without `sorry`, `admit`, or added axioms:
**[read the proof and download the Lean project](../attempts/phi-hiding/)**.

## Caveats and attacks

- $e$ must be small relative to $N$: for $e > N^{1/4}$, Coppersmith's method factors $N$ when $e \mid p - 1$ (Bauer et al.); parameters must respect this.
- The exact-$e$-to-one restatement is broken as above, even below that bound.
- This does **not** break every predicate-only phi-hiding formulation. The generators must be explicit: naive independent-prime conditioning leaks public residue information, while deliberately balanced residue classes can remove that leak.
- Factoring breaks any repaired formulation; quantum factoring via Shor also breaks it.

## Importance

- **Cachin–Micali–Stadler PIR** (EUROCRYPT 1999, ~1000 citations) — the first single-server private information retrieval with polylogarithmic communication.
- Efficient lossy trapdoor functions from RSA (Kiltz–O'Neill–Smith 2010) and the **optimal tightness proofs for RSA-FDH signatures** (Kakvi–Kiltz 2012).
- Used in some e-cash and password-authenticated protocols; a standard tool for making RSA "lossy" in security proofs.
