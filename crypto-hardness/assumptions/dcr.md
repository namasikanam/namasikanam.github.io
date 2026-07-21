# Decisional Composite Residuosity (DCR)

**Proposed by:** Pascal Paillier (1999)
**Category:** Number-theoretic

## Mathematical form

Let $N = pq$ be a random RSA modulus. An element $z \in \mathbb{Z}_{N^2}^*$ is an **$N$-th residue** if $z = y^N \bmod N^2$ for some $y \in \mathbb{Z}_{N^2}^*$. The $N$-th residues form a subgroup of index $N$ in $\mathbb{Z}_{N^2}^*$.

**Assumption.** The distributions

$$\{ (N, y^N \bmod N^2) : y \leftarrow \mathbb{Z}_{N^2}^* \} \quad \text{and} \quad \{ (N, z) : z \leftarrow \mathbb{Z}_{N^2}^* \}$$

are computationally indistinguishable.

The structure $\mathbb{Z}_{N^2}^* \cong \mathbb{Z}_N \times \mathbb{Z}_N^*$ with the isomorphism $(m, y) \mapsto (1+N)^m y^N$ gives Paillier encryption: $\mathsf{Enc}(m; y) = (1+N)^m y^N \bmod N^2$, which is **additively homomorphic**: $\mathsf{Enc}(m_1)\cdot\mathsf{Enc}(m_2) = \mathsf{Enc}(m_1 + m_2 \bmod N)$.

## Relation to factoring

Factoring $N$ breaks DCR ($\lambda(N)$ reveals residuosity); equivalence is open. Quantum-broken via Shor.

## Importance

- Paillier (EUROCRYPT 1999, >12,000 citations).
- **Deployed:** threshold-ECDSA MPC wallets (Lindell 2017, GG18/GG20 protocols used by custody providers), privacy-preserving federated learning aggregation, cryptographic e-voting systems (e.g., Helios variants), private set intersection.
