# Phi-hiding: disproof and Lean formalization

## Scope

### What is disproved

The following equivalence is false:

> For an RSA modulus $N=pq$, the condition $e\mid\varphi(N)$ is equivalent to
> $x\mapsto x^e$ on $\mathbb Z_N^*$ being exactly $e$-to-one on its image.

Therefore a phi-hiding claim restated as indistinguishability between an
**exactly $e$-to-one** power map and a permutation is not equivalent to the
predicate-only claim. For $e=3$, the two exact-map promises are in fact
perfectly distinguishable from the public modulus.

### What is not disproved

This argument does **not** disprove every phi-hiding assumption stated directly
as indistinguishability between two explicit modulus samplers:

$$
e\mid\varphi(N)
\qquad\text{versus}\qquad
\gcd(e,\varphi(N))=1.
$$

Such an assumption depends on the exact samplers and their public side
conditions. The argument below does not supply a universal distinguisher for
every possible pair of those distributions.

## 1. Kernel size

Let $N=pq$, where $p$ and $q$ are distinct primes. The Chinese remainder
theorem gives

$$
\mathbb Z_N^*\cong\mathbb Z_p^*\times\mathbb Z_q^*.
$$

Both local groups are cyclic, of orders $p-1$ and $q-1$. In a cyclic group of
order $m$, the kernel of $x\mapsto x^e$ has cardinality $\gcd(e,m)$. Hence

$$
\left|\ker(x\mapsto x^e)\right|
=\gcd(e,p-1)\gcd(e,q-1). \tag{1}
$$

Every nonempty fiber of a group homomorphism is a coset of its kernel, so (1)
is also the exact number of preimages of every point in the image.

It follows that $\gcd(e,\varphi(N))=1$ is exactly the permutation condition.
However, $e\mid\varphi(N)$ does not force the right-hand side of (1) to equal
$e$: both prime factors may contribute nontrivial local kernels.

## 2. Concrete counterexample

Take

$$
N=91=7\cdot13,\qquad e=3.
$$

The advertised small-exponent condition holds, and the positive predicate is
true:

$$
3^4=81<91,
\qquad
3\mid\varphi(91)=72.
$$

But (1) gives

$$
\left|\ker(x\mapsto x^3)\right|
=\gcd(3,6)\gcd(3,12)=3\cdot3=9.
$$

Thus cubing on $\mathbb Z_{91}^*$ is nine-to-one on its image, not
three-to-one. This disproves the claimed equivalence.

## 3. Distinguisher for the exact-three-to-one restatement

Assume $p$ and $q$ are primes other than $3$.

- Cubing has kernel cardinality $3$ exactly when one of $p,q$ is $1\pmod 3$
  and the other is $2\pmod 3$. Therefore $N=pq\equiv2\pmod3$.
- Cubing is a permutation exactly when both $p,q$ are $2\pmod3$. Therefore
  $N=pq\equiv1\pmod3$.

Consequently the public deterministic test

```text
N % 3 == 2
```

accepts every exact-three-to-one instance and rejects every permutation
instance. Hence the exact-map restatement is not merely inequivalent to the
predicate-only statement; for $e=3$ it is false under the stated RSA-prime
conditions.

## 4. Lean formalization

[`lean/PhiHiding.lean`](lean/PhiHiding.lean) proves:

1. the local cyclic-group kernel formula;
2. the RSA kernel formula (1) via the Chinese remainder theorem;
3. equality of every nonempty fiber size with the kernel size;
4. the $N=91$, $e=3$ counterexample;
5. the exact-three-to-one and permutation residue classifications; and
6. correctness of the public modulo-$3$ distinguisher.

The development uses Lean 4 and Mathlib and contains no `sorry`, `admit`, or
added axioms. To check it:

```sh
lake update
lake exe cache get
lake build
```

The reproducible project files are in [`lean/`](lean/).
