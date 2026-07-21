# Existence of One-Way Functions (OWF)

**Proposed by:** Whitfield Diffie & Martin Hellman (1976, informal); formalized by Andrew Yao (1982)
**Category:** Complexity-theoretic foundation (the minimal assumption of symmetric cryptography)

## Mathematical form

**Assumption.** There exists a function $f : \{0,1\}^* \to \{0,1\}^*$ such that:

1. **(Easy to compute)** $f$ is computable by a deterministic polynomial-time algorithm.
2. **(Hard to invert)** For every probabilistic polynomial-time (PPT) algorithm $\mathcal{A}$, there is a negligible function $\varepsilon$ such that for all $n$:

$$\Pr_{x \leftarrow \{0,1\}^n}\left[ \mathcal{A}(1^n, f(x)) \in f^{-1}(f(x)) \right] \leq \varepsilon(n).$$

## Equivalences and implications

OWFs exist **iff** each of the following exists (all directions constructive):

- Pseudorandom generators (Håstad–Impagliazzo–Levin–Luby 1999)
- Pseudorandom functions (Goldreich–Goldwasser–Micali 1986)
- Statistically binding commitments (Naor 1991) and zero-knowledge proofs for all of NP (Goldreich–Micali–Wigderson 1991)
- Existentially unforgeable digital signatures (Rompel 1990)
- Symmetric-key encryption and MACs

OWFs imply $\mathsf{P} \neq \mathsf{NP}$ (see [[p-vs-np]]) but the converse is not known. Public-key encryption is **not** known to follow from OWFs alone (Impagliazzo–Rudich 1989 black-box barrier).

## Status

Open. Every concrete assumption in this folder implies the existence of OWFs; candidate instantiations include SHA-256 compression, AES, and all number-theoretic/lattice functions listed here.
