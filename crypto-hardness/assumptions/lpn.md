# Learning Parity with Noise (LPN)

**Proposed by:** Implicit in decoding; cryptographic formulation by Blum, Furst, Kearns & Lipton (1993)
**Category:** Code-based / post-quantum

## Mathematical form

Parameters: dimension $n$, noise rate $\tau \in (0, 1/2)$.

For secret $s \in \mathbb{F}_2^n$, the LPN oracle samples $a \leftarrow \mathbb{F}_2^n$, $e \leftarrow \mathrm{Ber}_\tau$, and outputs $(a, \langle a, s \rangle \oplus e)$.

**Assumption.** For every PPT $\mathcal{A}$ with access to polynomially many samples:

$$\Pr\left[ s \leftarrow \mathbb{F}_2^n ;\; \mathcal{A}^{\mathsf{LPN}_{s,\tau}}(1^n) = s \right] \leq \varepsilon(n),$$

and the decisional version — samples indistinguishable from uniform $(a, b)$ — is equivalent. LPN is exactly [[lwe]] with $q = 2$ and Bernoulli noise, and equals average-case decoding of a random linear code with a flexible number of rows (cf. [[syndrome-decoding]]).

## Best known attacks

- **BKW** (Blum–Kalai–Wasserman 2003): time/samples $2^{O(n / \log n)}$ — slightly subexponential, needs many samples.
- With few samples: ISD-style / Gaussian-elimination hybrids, $2^{\Theta(n)}$ for constant noise. Low-noise regimes ($\tau = n^{-1/2}$) used by some schemes are correspondingly easier.
- No meaningful quantum speedup known beyond generic ones.

## Importance

- Extremely lightweight symmetric primitives: HB/HB$^+$ authentication for RFID (Hopper–Blum 2001; Juels–Weis 2005, ~1000+ citations).
- **Used in practice today via silent secure computation:** pseudorandom correlation generators and "silent OT" (Boyle et al. 2018–19) rest on dual-LPN; they power modern MPC and private-set-intersection deployments.
- Public-key encryption from low-noise LPN (Alekhnovich 2003); commitments and zero-knowledge friendly primitives.
