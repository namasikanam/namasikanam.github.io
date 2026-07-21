# Ring-LWE and Module-LWE

**Proposed by:** Vadim Lyubashevsky, Chris Peikert & Oded Regev (2010); module generalization by Adeline Langlois & Damien Stehlé (2015); precursor SPLWE ideas in NTRU
**Category:** Lattice / post-quantum (structured)

## Mathematical form

Let $R = \mathbb{Z}[X]/(X^d + 1)$ with $d$ a power of two, $R_q = R/qR$.

**Ring-LWE (decision).** For secret $s \leftarrow R_q$ (or from the error distribution), distinguish

$$(a_i, \; a_i \cdot s + e_i)_{i \leq m} \quad \text{from} \quad (a_i, u_i)_{i \leq m},$$

where $a_i, u_i \leftarrow R_q$ and $e_i \leftarrow \chi$ (small-coefficient Gaussian in $R$).

**Module-LWE.** Interpolates between LWE and Ring-LWE: secret $\mathbf{s} \in R_q^k$, samples $(\mathbf{a}_i, \langle \mathbf{a}_i, \mathbf{s} \rangle + e_i)$ with $\mathbf{a}_i \leftarrow R_q^k$. Rank $k = 1$ is Ring-LWE; $R = \mathbb{Z}$ recovers plain [[lwe]]. One Ring-LWE sample packs $d$ pseudorandom scalars — the source of the $\tilde{O}(d)$ efficiency gain.

## Worst-case connection

LPR 2010: quantum reduction from worst-case approximate SVP **on ideal lattices** of $R$; Langlois–Stehlé: from module lattices. The structured worst-case problems are possibly easier than unstructured ones (quantum unit-group algorithms give subexponential Ideal-SVP for large factors), but no attack exploits the ring structure of Ring/Module-LWE itself for standard parameters.

## Best known attacks

Same lattice attacks as unstructured LWE (BKZ core-SVP); the algebraic structure gives only constant-factor savings today. Believed exponentially hard, classically and quantumly.

## Importance

- LPR (EUROCRYPT 2010, >2500 citations).
- **Deployed at internet scale:** Module-LWE/Module-SIS are the security basis of **ML-KEM (Kyber, FIPS 203)** and **ML-DSA (Dilithium, FIPS 204)** — X25519MLKEM768 hybrid key exchange is default in Chrome/Firefox TLS, Signal PQXDH, Apple iMessage PQ3, OpenSSH 9.x.
- Practical FHE (CKKS, BFV run over $R_q$), zk-friendly lattice proof systems.
