# LRSW Assumption

**Proposed by:** Anna Lysyanskaya, Ron Rivest, Amit Sahai & Stefan Wolf (1999)
**Category:** Group/pairing-based, **interactive** assumption

## Mathematical form

Let $\mathbb{G} = \langle g \rangle$ of prime order $q$; secret $x, y \leftarrow \mathbb{Z}_q$, public $X = g^x$, $Y = g^y$. Define the oracle $\mathcal{O}_{x,y}$ that on input $m \in \mathbb{Z}_q$ picks $a \leftarrow \mathbb{G}$ and returns the triple

$$\left(a, \; a^y, \; a^{x + m x y}\right).$$

**Assumption.** For every PPT $\mathcal{A}$:

$$\Pr\left[ (m^*, a, b, c) \leftarrow \mathcal{A}^{\mathcal{O}_{x,y}}(g, X, Y) : m^* \notin Q \,\wedge\, m^* \neq 0 \,\wedge\, b = a^y \,\wedge\, c = a^{x + m^* x y} \right] \leq \varepsilon(n),$$

where $Q$ is the set of oracle queries. I.e., valid triples for *fresh* messages cannot be forged even after adaptively obtaining triples for chosen messages.

## Nature and attacks

Interactive (oracle-dependent) — stronger in kind than static assumptions; holds in the generic group model (LRSW 1999). No attack better than [[discrete-log]] is known. Quantum-broken via Shor.

## Importance

- **Camenisch–Lysyanskaya (CL) signatures** from bilinear maps (CRYPTO 2004, >1500 citations) — the pairing-based anonymous-credential workhorse with efficient proofs of knowledge of a signature.
- **Deployed at hardware scale:** ECC-DAA (Direct Anonymous Attestation) in the **TPM 2.0** standard (ISO/IEC 11889) and **Intel EPID** (Enhanced Privacy ID, used for SGX remote attestation) descend from CL/LRSW-style credentials — shipped in billions of chips.
- Idemix-style anonymous credentials, compact e-cash (Camenisch–Hohenberger–Lysyanskaya 2005, ~1000 citations).
