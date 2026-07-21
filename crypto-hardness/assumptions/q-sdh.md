# q-Strong Diffie–Hellman (q-SDH) and q-type Assumptions

**Proposed by:** Dan Boneh & Xavier Boyen (2004)
**Category:** Pairing-based ("parameterized" / q-type)

## Mathematical form

Let $e : \mathbb{G}_1 \times \mathbb{G}_2 \to \mathbb{G}_T$ be a pairing, $g_1 \in \mathbb{G}_1$, $g_2 \in \mathbb{G}_2$ generators, $x \leftarrow \mathbb{Z}_q^*$.

**Assumption (q-SDH).** For every PPT $\mathcal{A}$:

$$\Pr\left[ \mathcal{A}\left(g_1, g_1^x, g_1^{x^2}, \ldots, g_1^{x^q}, g_2, g_2^x\right) = \left(c, \; g_1^{1/(x+c)}\right) \text{ for some } c \in \mathbb{Z}_q \setminus \{-x\} \right] \leq \varepsilon(n).$$

The adversary receives $q$ powers of a secret $x$ "in the exponent" and must produce a new inversion $g_1^{1/(x+c)}$. The same power-tuple $(g^{x^i})_{i \leq q}$ is the trusted setup ("powers of tau") underlying polynomial commitments.

## Caveats

- **Cheon's attack (2006):** when $q$ divides $p \pm 1$ appropriately, recovers $x$ in $\tilde{O}(\sqrt{p/q} + \sqrt{q})$ — security degrades with $q$; parameters must account for it.
- Non-static ("q-type") assumptions are considered stronger/less clean than [[dlin]]-style static ones; the Algebraic Group Model (Fuchsbauer–Kiltz–Loss 2018) is often used to justify them from DLP.

## Importance

- **Boneh–Boyen signatures** (2004, >2000 citations combined) — short signatures without random oracles.
- **BBS/BBS+ signatures** — being standardized (IETF/W3C) for verifiable credentials and privacy-preserving identity (e.g., anonymous credentials in mobile driver's licenses).
- **KZG polynomial commitments** (Kate–Zaverucha–Goldberg 2010, >1000 citations) rely on the related q-power assumptions: deployed in **Ethereum EIP-4844 (proto-danksharding)** and virtually every pairing-based SNARK (PLONK, Marlin, Groth16 setup).
