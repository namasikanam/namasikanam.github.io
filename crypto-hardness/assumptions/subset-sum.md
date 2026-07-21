# Subset Sum / Knapsack Problem

**Proposed by:** Cryptographic use by Ralph Merkle & Martin Hellman (1978); modern treatment by Impagliazzo–Naor (1989)
**Category:** Combinatorial, post-quantum candidate

## Mathematical form

**Random subset sum SS$(n, M)$.** Given $a_1, \ldots, a_n \leftarrow \mathbb{Z}_M$ and

$$t = \sum_{i \in S} a_i \bmod M \quad \text{for random } S \subseteq [n],$$

find $S$ (search) or distinguish $(a, t)$ from uniform (decision — equivalent to search for random instances, Impagliazzo–Naor).

The **density** $\delta = n / \log_2 M$ governs hardness: the assumptiond-hard regime is $\delta \approx 1$ ($M \approx 2^n$). Worst-case subset sum is NP-complete.

## Best known attacks

- **Low density ($\delta < 0.94$): broken** by lattice reduction (Lagarias–Odlyzko 1985, Coster et al.) — this, plus the structured superincreasing trapdoor, is how **Merkle–Hellman was broken** (Shamir 1984) along with nearly all knapsack cryptosystems.
- Density $\approx 1$: classical time $2^{0.283n}$ (Howgrave-Graham–Joux 2010; Becker–Coron–Joux), quantum $2^{0.216n}$ — exponential; no polynomial quantum attack (not a hidden-subgroup problem in any known useful sense).

## Importance

- Merkle–Hellman (1978, >1500 citations) — the first public-key alternative to RSA; its fall founded lattice-based cryptanalysis.
- **Impagliazzo–Naor** (1989, ~1000 citations): PRGs and universal one-way hash functions from random subset sum — a clean, structure-free foundation still cited as a canonical OWF candidate ([[one-way-functions]]).
- Subset-sum-style problems reappear inside modern primitives: [[sis]] is a modular vector subset-sum; LPN/LWE secrets, balanced-allocation hashing in FHE bootstrapping, and post-quantum PRG proposals.
