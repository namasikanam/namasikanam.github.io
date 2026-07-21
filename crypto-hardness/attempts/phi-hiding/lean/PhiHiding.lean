import Mathlib

/-!
# A mechanized counterexample to the statement in `phi-hiding.md`

The central object is the kernel of the power map on the unit group modulo an
RSA modulus.  The Chinese remainder theorem identifies this kernel with the
product of the two local kernels.  Since the unit group modulo a prime is
cyclic, the local kernel has size `gcd (p - 1) e`.
-/

namespace PhiHiding

/-- The `e`-th roots of unity in a commutative group.  This is the kernel of
the `e`-power homomorphism, written as a subtype for convenient transport
along equivalences. -/
def PowRoots (G : Type*) [CommGroup G] (e : ℕ) := {x : G // x ^ e = 1}

instance {G : Type*} [CommGroup G] [Finite G] (e : ℕ) : Finite (PowRoots G e) :=
  Subtype.finite

/-- `PowRoots` is the kernel subtype of `powMonoidHom`. -/
noncomputable def powRootsKerEquiv {G : Type*} [CommGroup G] (e : ℕ) :
    PowRoots G e ≃ (powMonoidHom e : G →* G).ker :=
  Equiv.subtypeEquivRight fun x => by simp

/-- A multiplicative equivalence transports roots of unity. -/
noncomputable def powRootsEquiv {G H : Type*} [CommGroup G] [CommGroup H]
    (f : G ≃* H) (e : ℕ) : PowRoots G e ≃ PowRoots H e :=
  f.toEquiv.subtypeEquiv fun x => by
    constructor
    · intro hx
      simpa only [map_pow, map_one] using congrArg f hx
    · intro hx
      apply f.injective
      simpa only [map_pow, map_one] using hx

/-- Roots in a product group are pairs of roots. -/
def powRootsProdEquiv {G H : Type*} [CommGroup G] [CommGroup H] (e : ℕ) :
    PowRoots (G × H) e ≃ PowRoots G e × PowRoots H e :=
  (Equiv.subtypeEquivRight fun x : G × H => by
    change x ^ e = 1 ↔ x.1 ^ e = 1 ∧ x.2 ^ e = 1
    constructor
    · intro hx
      constructor
      · simpa using congrArg Prod.fst hx
      · simpa using congrArg Prod.snd hx
    · intro hx
      apply Prod.ext <;> simpa using hx.1 <;> simpa using hx.2) |>.trans
      Equiv.subtypeProdEquivProd

/-- The CRT equivalence on RSA unit groups. -/
noncomputable def rsaUnitsEquiv {p q : ℕ} (h : p.Coprime q) :
    (ZMod (p * q))ˣ ≃* (ZMod p)ˣ × (ZMod q)ˣ :=
  (Units.mapEquiv (ZMod.chineseRemainder h).toMulEquiv).trans MulEquiv.prodUnits

/-- The CRT equivalence restricted to the kernel of the `e`-power map. -/
noncomputable def rsaPowRootsEquiv {p q : ℕ} (h : p.Coprime q) (e : ℕ) :
    PowRoots (ZMod (p * q))ˣ e ≃
      PowRoots (ZMod p)ˣ e × PowRoots (ZMod q)ˣ e :=
  (powRootsEquiv (rsaUnitsEquiv h) e).trans (powRootsProdEquiv e)

/-- Over a prime field, the kernel of the `e`-power map has size
`gcd (p - 1) e`. -/
theorem local_powRoots_card {p e : ℕ} (hp : p.Prime) :
    Nat.card (PowRoots (ZMod p)ˣ e) = (p - 1).gcd e := by
  letI : Fact p.Prime := ⟨hp⟩
  letI : IsCyclic (ZMod p)ˣ := ZMod.isCyclic_units_prime hp
  let K := (powMonoidHom e : (ZMod p)ˣ →* (ZMod p)ˣ).ker
  calc
    Nat.card (PowRoots (ZMod p)ˣ e) = Nat.card K := by
      exact Nat.card_congr (powRootsKerEquiv e)
    _ = (Nat.card (ZMod p)ˣ).gcd e :=
      IsCyclic.card_powMonoidHom_ker ((ZMod p)ˣ) e
    _ = (p - 1).gcd e := by
      rw [Nat.card_eq_fintype_card, ZMod.card_units_eq_totient,
        Nat.totient_prime hp]

/-- Kernel-size formula for an RSA modulus.  Every nonempty fiber of the
`e`-power map has this cardinality. -/
theorem rsa_powRoots_card {p q e : ℕ} (hp : p.Prime) (hq : q.Prime)
    (hpq : p.Coprime q) :
    Nat.card (PowRoots (ZMod (p * q))ˣ e) =
      (p - 1).gcd e * (q - 1).gcd e := by
  calc
    Nat.card (PowRoots (ZMod (p * q))ˣ e) =
        Nat.card (PowRoots (ZMod p)ˣ e × PowRoots (ZMod q)ˣ e) :=
      Nat.card_congr (rsaPowRootsEquiv hpq e)
    _ = Nat.card (PowRoots (ZMod p)ˣ e) * Nat.card (PowRoots (ZMod q)ˣ e) :=
      Nat.card_prod _ _
    _ = (p - 1).gcd e * (q - 1).gcd e := by
      rw [local_powRoots_card hp, local_powRoots_card hq]

/-- Every nonempty fiber of a power map has the same cardinality as its
kernel.  This justifies reading `Nat.card (PowRoots G e)` as the exact
lossiness of the map onto its image. -/
theorem powMap_fiber_card {G : Type*} [CommGroup G] [Finite G] (e : ℕ) (a : G) :
    Nat.card {x : G // x ^ e = a ^ e} = Nat.card (PowRoots G e) := by
  let f : G →* G := powMonoidHom e
  calc
    Nat.card {x : G // x ^ e = a ^ e} = Nat.card (f ⁻¹' {f a}) := by
      congr 1
    _ = Nat.card f.ker := Nat.card_congr (MonoidHom.fiberEquivKer f a)
    _ = Nat.card (PowRoots G e) := Nat.card_congr (powRootsKerEquiv e).symm

/-- On a finite group the power map is a permutation exactly when its kernel
has one element. -/
theorem powMap_bijective_iff_card_powRoots_eq_one
    {G : Type*} [CommGroup G] [Finite G] (e : ℕ) :
    Function.Bijective (powMonoidHom e : G →* G) ↔ Nat.card (PowRoots G e) = 1 := by
  let f : G →* G := powMonoidHom e
  rw [show Nat.card (PowRoots G e) = Nat.card f.ker from
    Nat.card_congr (powRootsKerEquiv e)]
  constructor
  · intro h
    rw [f.ker_eq_bot_iff.mpr h.injective]
    exact Subgroup.card_bot
  · intro h
    have hbot : f.ker = ⊥ := f.ker.eq_bot_of_card_eq h
    have hinj : Function.Injective f := f.ker_eq_bot_iff.mp hbot
    exact ⟨hinj, Finite.injective_iff_surjective.mp hinj⟩

/-! ## The concrete counterexample `N = 91`, `e = 3` -/

theorem ninety_one_cube_kernel_card :
    Nat.card (PowRoots (ZMod 91)ˣ 3) = 9 := by
  change Nat.card (PowRoots (ZMod (7 * 13))ˣ 3) = 9
  rw [rsa_powRoots_card (by norm_num) (by norm_num) (by norm_num)]
  norm_num

theorem ninety_one_totient : Nat.totient 91 = 72 := by
  native_decide

/-- Every nonempty fiber of cubing modulo `91` has nine elements. -/
theorem ninety_one_cube_fiber_card (a : (ZMod 91)ˣ) :
    Nat.card {x : (ZMod 91)ˣ // x ^ 3 = a ^ 3} = 9 := by
  rw [powMap_fiber_card, ninety_one_cube_kernel_card]

/-- This is the pointwise negation of the claimed equivalence in the file:
`3^4 < 91`, `3 ∣ φ(91)`, but cubing is nine-to-one on its image, not
three-to-one. -/
theorem phi_hiding_claim_counterexample :
    3 ^ 4 < 91 ∧
      3 ∣ Nat.totient 91 ∧
      Nat.card (PowRoots (ZMod 91)ˣ 3) ≠ 3 := by
  refine ⟨by norm_num, ?_, ?_⟩
  · rw [ninety_one_totient]
    norm_num
  rw [ninety_one_cube_kernel_card]
  norm_num

/-! ## The public mod-3 distinguisher -/

/-- Exactly one RSA prime contributes a nontrivial local cube kernel. -/
def ExactCubeBranch (p q : ℕ) : Prop :=
  (3 ∣ p - 1 ∧ ¬3 ∣ q - 1) ∨ (¬3 ∣ p - 1 ∧ 3 ∣ q - 1)

/-- Neither RSA prime contributes a nontrivial local cube kernel. -/
def PermutationCubeBranch (p q : ℕ) : Prop :=
  ¬3 ∣ p - 1 ∧ ¬3 ∣ q - 1

/-- The efficient public distinguisher: output `true` exactly on residue `2`. -/
def modThreeDistinguisher (N : ℕ) : Bool := N % 3 == 2

private theorem gcd_three (n : ℕ) :
    n.gcd 3 = if 3 ∣ n then 3 else 1 := by
  by_cases h : 3 ∣ n
  · simp [h, Nat.gcd_eq_right h]
  · have hc : Nat.Coprime n 3 :=
      (Nat.prime_three.coprime_iff_not_dvd.mpr h).symm
    simp [h, hc]

/-- Kernel cardinality three is equivalent to the exact-loss branch. -/
theorem cube_kernel_card_eq_three_iff {p q : ℕ} (hp : p.Prime) (hq : q.Prime)
    (hpq : p.Coprime q) :
    Nat.card (PowRoots (ZMod (p * q))ˣ 3) = 3 ↔ ExactCubeBranch p q := by
  rw [rsa_powRoots_card hp hq hpq, gcd_three, gcd_three]
  by_cases h₁ : 3 ∣ p - 1 <;> by_cases h₂ : 3 ∣ q - 1 <;>
    simp [ExactCubeBranch, h₁, h₂]

/-- Kernel cardinality one is equivalent to the permutation branch. -/
theorem cube_kernel_card_eq_one_iff {p q : ℕ} (hp : p.Prime) (hq : q.Prime)
    (hpq : p.Coprime q) :
    Nat.card (PowRoots (ZMod (p * q))ˣ 3) = 1 ↔ PermutationCubeBranch p q := by
  rw [rsa_powRoots_card hp hq hpq, gcd_three, gcd_three]
  by_cases h₁ : 3 ∣ p - 1 <;> by_cases h₂ : 3 ∣ q - 1 <;>
    simp [PermutationCubeBranch, h₁, h₂]

private theorem mod_three_eq_one_of_dvd_sub_one {n : ℕ} (hn : 0 < n)
    (h : 3 ∣ n - 1) : n % 3 = 1 := by
  rw [Nat.dvd_iff_mod_eq_zero] at h
  omega

private theorem prime_mod_three_eq_two_of_not_dvd_sub_one {p : ℕ}
    (hp : p.Prime) (hp3 : p ≠ 3) (h : ¬3 ∣ p - 1) : p % 3 = 2 := by
  have hlt : p % 3 < 3 := Nat.mod_lt p (by norm_num)
  have hzero : p % 3 ≠ 0 := by
    intro hpmod
    have hdvd : 3 ∣ p := Nat.dvd_iff_mod_eq_zero.mpr hpmod
    have heq : 3 = p := (Nat.prime_dvd_prime_iff_eq Nat.prime_three hp).mp hdvd
    exact hp3 heq.symm
  have hone : p % 3 ≠ 1 := by
    intro hpmod
    apply h
    rw [Nat.dvd_iff_mod_eq_zero]
    omega
  omega

theorem exactCubeBranch_mod_three {p q : ℕ} (hp : p.Prime) (hq : q.Prime)
    (hp3 : p ≠ 3) (hq3 : q ≠ 3) (h : ExactCubeBranch p q) :
    (p * q) % 3 = 2 := by
  rcases h with h | h
  · have hpmod := mod_three_eq_one_of_dvd_sub_one hp.pos h.1
    have hqmod := prime_mod_three_eq_two_of_not_dvd_sub_one hq hq3 h.2
    simp [Nat.mul_mod, hpmod, hqmod]
  · have hpmod := prime_mod_three_eq_two_of_not_dvd_sub_one hp hp3 h.1
    have hqmod := mod_three_eq_one_of_dvd_sub_one hq.pos h.2
    simp [Nat.mul_mod, hpmod, hqmod]

theorem permutationCubeBranch_mod_three {p q : ℕ} (hp : p.Prime) (hq : q.Prime)
    (hp3 : p ≠ 3) (hq3 : q ≠ 3) (h : PermutationCubeBranch p q) :
    (p * q) % 3 = 1 := by
  have hpmod := prime_mod_three_eq_two_of_not_dvd_sub_one hp hp3 h.1
  have hqmod := prime_mod_three_eq_two_of_not_dvd_sub_one hq hq3 h.2
  simp [Nat.mul_mod, hpmod, hqmod]

/-- The distinguisher accepts every exact-three-to-one instance. -/
theorem modThreeDistinguisher_accepts_exact {p q : ℕ}
    (hp : p.Prime) (hq : q.Prime) (hpq : p.Coprime q)
    (hp3 : p ≠ 3) (hq3 : q ≠ 3)
    (hexact : Nat.card (PowRoots (ZMod (p * q))ˣ 3) = 3) :
    modThreeDistinguisher (p * q) = true := by
  have hbranch := (cube_kernel_card_eq_three_iff hp hq hpq).mp hexact
  simp [modThreeDistinguisher, exactCubeBranch_mod_three hp hq hp3 hq3 hbranch]

/-- The distinguisher rejects every permutation instance. -/
theorem modThreeDistinguisher_rejects_permutation {p q : ℕ}
    (hp : p.Prime) (hq : q.Prime) (hpq : p.Coprime q)
    (hp3 : p ≠ 3) (hq3 : q ≠ 3)
    (hperm : Function.Bijective
      (powMonoidHom 3 : (ZMod (p * q))ˣ →* (ZMod (p * q))ˣ)) :
    modThreeDistinguisher (p * q) = false := by
  have hcard : Nat.card (PowRoots (ZMod (p * q))ˣ 3) = 1 :=
    (powMap_bijective_iff_card_powRoots_eq_one 3).mp hperm
  have hbranch := (cube_kernel_card_eq_one_iff hp hq hpq).mp hcard
  simp [modThreeDistinguisher, permutationCubeBranch_mod_three hp hq hp3 hq3 hbranch]

end PhiHiding
