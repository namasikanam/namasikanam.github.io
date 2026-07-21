# Diffie–Hellman Inversion Family (q-DHI, q-BDHI, q-wBDHI)

**Proposed by:** Mitsunari–Sakai–Kasahara (2002); Dan Boneh & Xavier Boyen (2004)
**Category:** Group/pairing-based (q-type)

## Mathematical form

Let $\mathbb{G} = \langle g \rangle$ of prime order $p$, $x \leftarrow \mathbb{Z}_p^*$.

**q-DHI (Diffie–Hellman Inversion).** Given $\left(g, g^x, g^{x^2}, \ldots, g^{x^q}\right)$, compute $g^{1/x}$.

**q-BDHI (Bilinear DHI).** In a pairing group $e : \mathbb{G}_1 \times \mathbb{G}_2 \to \mathbb{G}_T$: given the same power-tuple, compute $e(g, g)^{1/x} \in \mathbb{G}_T$. The decisional version (q-DBDHI) asks to distinguish $e(g,g)^{1/x}$ from random.

**q-wBDHI (weak BDHI).** Given $g, h, g^x, \ldots, g^{x^q}$, compute $e(g, h)^{x^{q+1}}$ — the assumption behind hierarchical IBE with constant-size ciphertexts.

## Relations and attacks

- $q$-DHI $\Rightarrow$ $q$-SDH-style flexibility; all imply CDH; all fall to [[discrete-log]].
- **Cheon's attack** applies as for [[q-sdh]]: with $q$ large and $q \mid p \pm 1$, recover $x$ in $\tilde{O}(\sqrt{p/q})$ — security degrades with the tuple length. Quantum-broken via Shor.

## Importance

- **Boneh–Boyen selective-ID IBE** (EUROCRYPT 2004, >2000 citations) — q-DBDHI; **Boneh–Boyen–Goh HIBE** (2005, >1500 citations) — q-wBDHI.
- **Dodis–Yampolskiy VRF/PRF** (2005, ~1000 citations): $F_x(m) = e(g,g)^{1/(x+m)}$ — the standard exponent-inversion PRF, used across anonymous-credential and e-cash literature.
- **Sakai–Kasahara IBE** under q-BDHI is deployed: **MIKEY-SAKKE** (IETF RFC 6508/6509), the UK-government-mandated standard for secure voice (Secure Chorus).
