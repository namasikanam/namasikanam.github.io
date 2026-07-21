# Sequential Squaring (Time-Lock / VDF Assumption)

**Proposed by:** Ron Rivest, Adi Shamir & David Wagner (1996); VDF formalization: Boneh–Bonneau–Bünz–Fisch (2018), Pietrzak (2019), Wesolowski (2019)
**Category:** Fine-grained / sequentiality assumption

## Mathematical form

Let $N = pq$ be an RSA modulus of unknown factorization (or a class group of an imaginary quadratic field, which needs no trusted setup).

**Assumption.** For random $x \leftarrow \mathbb{Z}_N^*$, computing

$$y = x^{2^T} \bmod N$$

requires $T$ *sequential* squarings: any algorithm using $\mathrm{poly}(\log N)$ processors and time $\ll T \cdot t_{\mathrm{sq}}$ (with $t_{\mathrm{sq}}$ the time of one modular squaring) succeeds with negligible probability — knowledge of $\varphi(N)$ is the only known shortcut ($y = x^{2^T \bmod \varphi(N)}$).

This is a **depth** (wall-clock) lower-bound assumption, not a total-work one — qualitatively different from every other assumption in this folder.

## Best known attacks

Factoring $N$ (then it's instant); otherwise no parallel speedup beyond small constant factors (optimized squaring circuits) is known. Quantum: broken via Shor (factoring); class-group variants also quantum-broken (unit group computation).

## Importance

- Rivest–Shamir–Wagner time-lock puzzles (1996, ~2000 citations); the LCS35 challenge.
- **Verifiable Delay Functions** (Boneh et al. 2018, >1000 citations; Pietrzak and Wesolowski proof systems): deployed in the **Chia blockchain** (class-group VDFs) and used in randomness beacons / leader election designs (Ethereum RANDAO+VDF research, Filecoin).
- Timed commitments, fair contract signing, front-running mitigation.
