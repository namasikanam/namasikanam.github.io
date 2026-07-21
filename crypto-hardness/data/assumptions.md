## Cryptographic Hardness Assumptions

<!--
  HUMAN-EDITABLE SOURCE. This is a GitHub-Flavored-Markdown table; add or edit a row and open a PR.
  Columns: Category | Name | Importance | File | Author (Year) | Difficulty | Note

  Importance and Difficulty each START WITH A 1-10 SCORE (bold), then " · " and the justification.
  Keep that format — the website sorts the column by the leading number.

  Importance (how much rests on the assumption):
    10 = underpins ubiquitous deployed infrastructure or all of cryptography
    7-9 = deployed in major systems, or foundational to a large literature
    4-6 = significant literature and/or niche deployment
    1-3 = historic or specialized

  Difficulty (how hard the problem is, i.e. confidence in the assumption, given best known attacks;
  C = classical, Q = quantum):
    10  = no approach known at all
    8-9 = only exponential/generic attacks, classical AND quantum
    6-7 = exponential classically, but broken by quantum computers (or minor structural caveats)
    4-5 = subexponential classical attacks, quantum-broken, or degraded parameter regimes
    1-3 = fragile: broken except in carefully chosen regimes

  The File cell links to assumptions/<slug>.md, which holds the precise mathematical statement.
  Keep one row per line so diffs stay readable.
-->

| Category | Name | Importance | File | Author (Year) | Difficulty | Note |
|---|---|---|---|---|---|---|
| Foundations | P ≠ NP | **10** · Necessary for all complexity-based crypto; if false, no one-way functions | [p-vs-np.md](assumptions/p-vs-np.md) | Cook (1971), Levin (1973) | **10** · No algorithm known; Millennium Problem | Necessary but not sufficient (worst-case vs average-case) |
| Foundations | One-way functions exist | **10** · Minimal assumption: equivalent to PRGs, PRFs, signatures, commitments, symmetric crypto | [one-way-functions.md](assumptions/one-way-functions.md) | Diffie–Hellman (1976), Yao (1982) | **10** · Open; every candidate below instantiates it | Not known to imply public-key encryption |
| Number-theoretic | Integer factorization | **10** · RSA key recovery; Rabin/BBS provably equivalent; TLS certificates, smart cards | [factoring.md](assumptions/factoring.md) | folklore; RSA (1978) | **5** · C: subexp GNFS $L_N[1/3]$; **Q: poly (Shor)** | 829-bit record (2020); 2048-bit safe classically |
| Number-theoretic | RSA assumption | **10** · RSA-PKCS#1/PSS/OAEP everywhere; RSA paper >25k citations | [rsa-assumption.md](assumptions/rsa-assumption.md) | Rivest–Shamir–Adleman (1978) | **5** · C: subexp (via factoring); **Q: poly** | Possibly stronger than factoring; equivalence open |
| Number-theoretic | Strong RSA | **6** · Camenisch–Lysyanskaya credentials (>2k cit.); TPM DAA; RSA accumulators | [strong-rsa.md](assumptions/strong-rsa.md) | Barić–Pfitzmann, Fujisaki–Okamoto (1997) | **5** · C: subexp (via factoring); **Q: poly** | Adversary chooses the exponent — stronger than RSA |
| Number-theoretic | Quadratic residuosity | **5** · Goldwasser–Micali (>10k cit.): birth of semantic security; Cocks IBE | [quadratic-residuosity.md](assumptions/quadratic-residuosity.md) | Goldwasser–Micali (1982) | **5** · C: subexp (via factoring); **Q: poly** | Mostly historic today |
| Number-theoretic | Decisional composite residuosity | **7** · Paillier (>12k cit.); additively homomorphic: threshold-ECDSA wallets, e-voting | [dcr.md](assumptions/dcr.md) | Paillier (1999) | **5** · C: subexp (via factoring); **Q: poly** | — |
| Number-theoretic | Phi-hiding | **3** · Cachin–Micali–Stadler PIR (~1k cit.); lossy RSA; tight RSA-FDH proofs | [phi-hiding.md](assumptions/phi-hiding.md) | Cachin–Micali–Stadler (1999) | **4** · Predicate-only form remains sampler-dependent; **Q: poly** | Exact $e$-to-1 restatement is false; explicit generators are essential |
| Number-theoretic | Class-group assumptions | **4** · Wesolowski VDF (Chia); CL encryption in threshold-ECDSA; transparent accumulators | [class-group.md](assumptions/class-group.md) | Buchmann–Williams (1988); Wesolowski (2019) | **5** · C: subexp $L[1/2]$; **Q: poly (Biasse–Song)** | Trustless alternative to RSA groups (no secret factorization) |
| Discrete-log | Discrete log (DLP / ECDLP) | **10** · ECDSA/EdDSA + ECDH: TLS 1.3, SSH, Signal, Bitcoin/Ethereum, passkeys | [discrete-log.md](assumptions/discrete-log.md) | Diffie–Hellman (1976); Koblitz, Miller (1985) | **7** · C: $\sqrt{q}$ on EC, subexp in field; **Q: poly (Shor)** | Generic lower bound $\sqrt{q}$ (Shoup) |
| Discrete-log | Computational Diffie–Hellman (CDH) | **9** · DH key exchange (>30k cit.); BLS signatures (Ethereum) via co-CDH | [cdh.md](assumptions/cdh.md) | Diffie–Hellman (1976) | **7** · Same as DLP; **Q: poly** | ≈ equivalent to DLP in most groups (Maurer–Wolf) |
| Discrete-log | Decisional Diffie–Hellman (DDH) | **9** · ElGamal; Cramer–Shoup (>3k cit.); Naor–Reingold PRF; PAKEs; X25519 | [ddh.md](assumptions/ddh.md) | ElGamal (1985); Boneh survey (1998) | **7** · Same as DLP; **Q: poly** | **False** in pairing groups & full $\mathbb{Z}_p^*$ — use prime-order subgroups |
| Discrete-log | Gap Diffie–Hellman (Gap-DH) | **7** · BLS proofs (Ethereum); ECIES, HMQV (>1k cit.), X3DH analyses | [gap-dh.md](assumptions/gap-dh.md) | Okamoto–Pointcheval (2001) | **7** · Same as DLP (DDH oracle unhelpful); **Q: poly** | CDH-with-DDH-oracle; pairing groups are natural gap groups |
| Pairing | Bilinear DH (BDH / DBDH) | **8** · Boneh–Franklin IBE (>12k cit.); ABE GPSW/BSW (>6k cit. each) | [bdh.md](assumptions/bdh.md) | Boneh–Franklin (2001); Joux (2000) | **6** · C: DLP in $\mathbb{G}$ or NFS in $\mathbb{G}_T$; **Q: poly** | Tower-NFS forced BN254 → BLS12-381 |
| Pairing | Decisional Linear (DLIN) | **6** · BBS group signatures (>3k cit.); Groth–Sahai NIZK (>2k cit.); $k$-Lin family | [dlin.md](assumptions/dlin.md) | Boneh–Boyen–Shacham (2004) | **6** · Same as DLP in pairing group; **Q: poly** | DDH-substitute surviving symmetric pairings |
| Pairing | SXDH | **6** · Most efficient Groth–Sahai; structure-preserving crypto; BLS12-381 setting | [sxdh.md](assumptions/sxdh.md) | Ballard et al. / Scott (~2005) | **6** · Same as DLP; **Q: poly** | Needs Type-3 pairings (no $\mathbb{G}_1 \leftrightarrow \mathbb{G}_2$ map) |
| Pairing | q-Strong DH (q-SDH) | **8** · Boneh–Boyen sigs (>2k cit.); BBS+ (W3C/IETF); KZG commitments (Ethereum EIP-4844, PLONK) | [q-sdh.md](assumptions/q-sdh.md) | Boneh–Boyen (2004) | **5** · C: Cheon $\sqrt{p/q}$ degradation; **Q: poly** | Parameterized; weaker standing than static assumptions |
| Pairing | DH inversion family (q-DHI, q-BDHI) | **5** · Boneh–Boyen IBE (>2k cit.); Dodis–Yampolskiy VRF; MIKEY-SAKKE (RFC 6508) | [dh-inversion.md](assumptions/dh-inversion.md) | Mitsunari et al. (2002); Boneh–Boyen (2004) | **5** · C: Cheon $\sqrt{p/q}$; **Q: poly** | Exponent-inversion branch of the q-type family |
| Pairing | LRSW | **5** · CL signatures (>1.5k cit.); TPM 2.0 ECC-DAA, Intel EPID/SGX — billions of chips | [lrsw.md](assumptions/lrsw.md) | Lysyanskaya–Rivest–Sahai–Wolf (1999) | **6** · No attack beyond DLP; **Q: poly** | Interactive assumption; holds in generic group model |
| Pairing | Subgroup decision (BGN, KSW) | **5** · BGN homomorphic enc. (>1.5k cit.); KSW predicate enc. (>1.5k cit.); dual-system encryption | [subgroup-decision.md](assumptions/subgroup-decision.md) | Boneh–Goh–Nissim (2005) | **5** · C: subexp (via factoring $N$); **Q: poly** | Composite-order pairings; often replaced by $k$-Lin |
| Pairing | Knowledge-of-exponent (KEA / q-PKE) | **8** · Groth16 SNARK (>3k cit.): Zcash, zk-rollups, Filecoin | [kea.md](assumptions/kea.md) | Damgård (1991); Groth (2010–16) | **7** · Not falsifiable — no attack game; no counterexample known | Needed for SNARKs (Gentry–Wichs); AGM is the modern substitute |
| Lattice | Worst-case GapSVP / SIVP | **8** · Foundation of lattice crypto via worst-case ⇒ average-case reductions | [lattice-worst-case.md](assumptions/lattice-worst-case.md) | Ajtai (1996, crypto relevance) | **9** · C: $2^{0.292n}$ sieve; Q: $2^{0.257n}$ — exp | Poly-approx regime not NP-hard (in NP ∩ coNP) |
| Lattice | Short Integer Solution (SIS) | **7** · Ajtai (>2.5k cit.); GPV signatures (>2k cit.); ML-DSA unforgeability | [sis.md](assumptions/sis.md) | Ajtai (1996) | **9** · C/Q: exp (BKZ core-SVP) | First worst-case/average-case reduction |
| Lattice | Learning With Errors (LWE) | **10** · Regev (>8k cit.); all FHE (BGV/BFV/CKKS/TFHE); basis of NIST PQC | [lwe.md](assumptions/lwe.md) | Regev (2005) | **9** · C: $2^{0.292\beta}$, Q: $2^{0.257\beta}$ — exp | Quantum worst-case reduction from GapSVP/SIVP |
| Lattice | Ring-LWE / Module-LWE | **9** · ML-KEM & ML-DSA (FIPS 203/204): Chrome TLS, Signal, iMessage; LPR >2.5k cit. | [ring-module-lwe.md](assumptions/ring-module-lwe.md) | Lyubashevsky–Peikert–Regev (2010) | **8** · Same as LWE — exp; no attack exploits ring structure | Structured worst-case (Ideal-SVP) possibly easier |
| Lattice | NTRU | **7** · Oldest surviving lattice scheme (>3k cit.); Falcon/FN-DSA; OpenSSH sntrup761 | [ntru.md](assumptions/ntru.md) | Hoffstein–Pipher–Silverman (1996/98) | **8** · C/Q: exp (BKZ + hybrid MITM) | **Overstretched-q regime broken**; std params fine |
| Lattice | Approximate GCD (AGCD) | **4** · DGHV FHE over the integers (>2.5k cit.) | [agcd.md](assumptions/agcd.md) | Howgrave-Graham (2001); DGHV (2010) | **7** · C: lattice/Chen–Nguyen $2^{\rho/2}$ — exp; Q: no poly attack | LWE reduces to variants (Cheon–Stehlé) |
| Code-based | Syndrome decoding | **7** · McEliece (>3k cit.); Classic McEliece (ISO), HQC (NIST 2025) | [syndrome-decoding.md](assumptions/syndrome-decoding.md) | McEliece (1978); BMvT (1978) | **9** · C: ISD $2^{cn}$; Q: still exp | NP-hard worst case; 1978 parameters unbroken |
| Code-based | Learning Parity with Noise (LPN) | **5** · HB RFID auth (~1k cit.); silent-OT / PCGs powering deployed MPC & PSI | [lpn.md](assumptions/lpn.md) | Blum–Furst–Kearns–Lipton (1993) | **7** · C: BKW $2^{O(n/\log n)}$ (slightly subexp); Q: no speedup | = LWE with $q=2$; low-noise variants easier |
| Multivariate | Multivariate Quadratic (MQ) | **5** · UOV/MAYO in NIST signature on-ramp; Patarin HFE line ~1k+ cit. | [mq.md](assumptions/mq.md) | Matsumoto–Imai (1988); Patarin (1996) | **8** · C/Q: exp (Gröbner/XL) for random $m \approx n$ | Random MQ solid; many trapdoored schemes broken (Rainbow 2022) |
| Combinatorial | Subset sum / knapsack | **3** · Merkle–Hellman (>1.5k cit., broken); Impagliazzo–Naor PRG/UOWHF (~1k cit.) | [subset-sum.md](assumptions/subset-sum.md) | Merkle–Hellman (1978); Impagliazzo–Naor (1989) | **6** · C: LLL for density <0.94; $2^{0.283n}$ at density 1; Q: $2^{0.216n}$ | Random density-1 hard; most knapsack cryptosystems broken |
| Isogeny | Supersingular isogeny path | **5** · Jao–De Feo (>1.5k cit.); SQIsign (NIST on-ramp, smallest PQ sigs); CGL hash | [isogeny.md](assumptions/isogeny.md) | Couveignes (1997); CGL (2006); Jao–De Feo (2011) | **7** · C: $\sqrt{p}$, Q: $p^{1/4}$ — exp; CSIDH: Q subexp (Kuperberg) | **SIDH/SIKE broken (2022)** via torsion; pure path problem intact |
| Symmetric | SHA-2 / SHA-3 collision & preimage | **10** · Everything: TLS, Bitcoin, Git, HMAC; sole assumption of SPHINCS+ and STARKs | [hash-collision-resistance.md](assumptions/hash-collision-resistance.md) | NIST/NSA (2001); Keccak team (2008) | **8** · C: birthday $2^{n/2}$; Q: $2^{n/3}$ collision, Grover $2^{n/2}$ preimage | MD5/SHA-1 falsified — assumption is per-function |
| Symmetric | AES is a strong PRP | **10** · The planet's default cipher (TLS-GCM, disk, Wi-Fi); all mode proofs reduce to it | [aes-prp.md](assumptions/aes-prp.md) | Daemen–Rijmen (1998) | **8** · C: $2^{126.1}$ biclique (≈ brute force); Q: Grover $2^{k/2}$ | Related-key attacks on AES-256 outside standard model |
| Sequentiality | Sequential squaring | **5** · RSW time-lock (~2k cit.); VDFs (BBBF >1k cit.); Chia, randomness beacons | [sequential-squaring.md](assumptions/sequential-squaring.md) | Rivest–Shamir–Wagner (1996) | **5** · No parallel shortcut without $\varphi(N)$; **Q: poly (Shor)** | A *depth* lower bound — different in kind from all others |
