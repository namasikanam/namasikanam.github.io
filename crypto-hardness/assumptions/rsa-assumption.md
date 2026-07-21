# RSA Assumption

**Proposed by:** Ron Rivest, Adi Shamir & Leonard Adleman (1978)
**Category:** Number-theoretic

## Mathematical form

Let $N = pq$ as in [[factoring]], and let $e$ satisfy $\gcd(e, \varphi(N)) = 1$.

**Assumption (RSA / $e$-th root problem).** For every PPT algorithm $\mathcal{A}$:

$$\Pr\left[ y \leftarrow \mathbb{Z}_N^* ;\; x \leftarrow \mathcal{A}(N, e, y) \;:\; x^e \equiv y \pmod{N} \right] \leq \varepsilon(n).$$

That is, computing $e$-th roots modulo $N$ without the trapdoor $d = e^{-1} \bmod \varphi(N)$ is infeasible. The RSA function $x \mapsto x^e \bmod N$ is the canonical candidate **trapdoor permutation**.

## Relation to factoring

Factoring $N$ breaks RSA, but the converse is open: RSA is *not known* to be equivalent to factoring (evidence against black-box equivalence: Boneh–Venkatesan 1998). Hence RSA is a possibly stronger assumption than [[factoring]].

## Best known attacks

Same as factoring (GNFS); no faster $e$-th-root algorithm is known. Broken by Shor's quantum algorithm. Low-exponent/partial-key attacks (Coppersmith, Wiener) apply only to improper parameter choices.

## Importance

- **Deployed:** RSA-PKCS#1 v1.5 and RSA-PSS signatures, RSA-OAEP encryption — TLS, S/MIME, code signing, secure boot, hardware tokens.
- **Literature:** Bellare–Rogaway FDH/OAEP (each >3000 citations); the original RSA paper is one of the most cited works in computer science (>25,000 citations).
