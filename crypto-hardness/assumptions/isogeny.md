# Supersingular Isogeny Problems

**Proposed by:** Couveignes (1997/2006), Rostovtsev–Stolbunov (2006) for ordinary curves; Charles–Goren–Lauter (2006), Jao–De Feo (2011), Castryck et al. (CSIDH 2018) for supersingular
**Category:** Isogeny-based / post-quantum

## Mathematical form

**Supersingular isogeny path problem.** Given two supersingular elliptic curves $E_1, E_2$ over $\mathbb{F}_{p^2}$, find an isogeny $\varphi : E_1 \to E_2$ (equivalently, a path in the $\ell$-isogeny graph, a Ramanujan expander with $\approx p/12$ vertices).

**Endomorphism ring problem.** Given supersingular $E/\mathbb{F}_{p^2}$, compute $\mathrm{End}(E)$ (a maximal order in a quaternion algebra). **Wesolowski (2021):** heuristically equivalent to the path problem.

**Group-action (CSIDH/CSI-FiSh) problem.** For the class group $\mathrm{cl}(\mathcal{O})$ acting freely and transitively on $\mathcal{E}\ell\ell_p(\mathcal{O})$, given $E$ and $\mathfrak{a} \star E$, find $\mathfrak{a}$ — a "DLP-like" problem without a group law on ciphertexts.

## Status — read carefully

- **SIDH/SIKE is BROKEN** (Castryck–Decru, Maino–Martindale, Robert 2022, classical poly-time): the attack exploits the **auxiliary torsion-point images** SIDH publishes, not the pure path problem.
- The **plain path/endomorphism-ring problems remain hard**: best classical attacks $\tilde{O}(\sqrt{p})$, quantum $\tilde{O}(p^{1/4})$ (claw-finding).
- CSIDH's group-action problem admits Kuperberg's quantum subexponential $2^{O(\sqrt{\log p})}$ attack — parameters debated.

## Importance

- Jao–De Feo (2011, >1500 citations) launched the field; the 2022 break is itself a landmark of falsifiability.
- **SQIsign** (based on the endomorphism-ring problem) is in the NIST signature on-ramp — the smallest post-quantum signatures known.
- CGL hash function; CSI-FiSh signatures; isogeny VDFs. The only known post-quantum drop-in for *non-interactive* Diffie–Hellman-like group actions.
