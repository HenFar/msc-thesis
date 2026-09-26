# Prompt 2 for the AntCalc-code agent (25 Sep 2026): no paper-tuned convention factors in the A22 route

Context: the thesis (due 30 Sep) says the A22 results, including the one-loop-squared component (Breve), come out of
AntCalc's own algorithm with no number copied from the literature, and that the −7ζ₃/(6ε) discrepancy with hep-ph/0403057
Eq. (4.10) was *found* by AntCalc and later confirmed by arXiv:2211.08446 Eq. (B.7). An examiner who reads the repo will
see, in commit f091788 ("…removing the ad-hoc convention ledger and applying the fix from 2211.08446"), that
`masterIntegrals/A22LO.wl: A22LOVirtualConventionFactor[]` has hard-coded truncated series whose ζ₃ term was edited
(26ζ₃/3 → −2ζ₃/3 ε³, and the ε⁴ term) with a comment citing 2211.08446, and that
`dev/a22_literature_reference.wl` had its Breve target sign flipped. That reads as "tuned to the paper". We want the
opposite: every conversion factor derivable and exact.

## What I already know (verify, do not trust)
- `breveFactor = A22LOMasterCore[] A22OneLoopSelfVirtualConventionFactor[] / A22TwoLoopTreeMasterValueA22LO[]` (q2→1)
  equals −1/cos(2πε) through ε⁴ and first differs at ε⁵ (−154π²ζ₃ε⁵/9). So the hard-coded series are *truncated*:
  results are only guaranteed through a finite order in ε, and the ε⁵ mismatch shows they are not the exact function.
- Earlier check (21 Sep): F_v·F_tree = cos(2πε) e^{2γ_Eε}/Γ(1−ε)² through ε⁴, i.e. the factor is a pure Γ-function/cos
  normalisation (S_Γ → S_ε conversion plus timelike continuation), not a fit.
- Current Breve master combination prints as a ratio of ζ₃-polynomials, which is unpresentable.

## Tasks
1. List every hard-coded series / convention factor / route-local master value in the A22 (and A31, B40, C40 if any) integration
   path (start with `A22LOVirtualConventionFactor`, `A22LOTwoLoopTreeVirtualConventionFactor`,
   `A22OneLoopSelfVirtualConventionFactor`, `A22VirtualTwoPartonConventionFactor`,
   `A22TwoLoopTreeMasterValueA4Basis7Like/Basis8Like`, and anything in `integration_ibp.wl`/`master_values_runtime.wl` that
   contains a literal ζ₃, π² or ε-series). For each, say what it represents and whether it can be written in closed form.
2. Replace each by its exact closed form (Γ functions, e^{γ_Eε}, cos(πε)/cos(2πε), S_Γ↔S_ε conversion, phase-space volume),
   derived, not fitted. Prove equality with the old series to at least ε⁸ (exact symbolic series comparison) so all
   published numbers are unchanged. Any factor that genuinely cannot be derived must be listed explicitly with its origin.
3. Remove code comments/commit-style text that say a factor was "patched", "corrected" or "matched" to a paper. Where a
   literature comparison exists, keep it only in `dev/` regression files, as a *target*, not as an input to the pipeline.
4. Breve master combination: return the rational-in-ε coefficient times `A22LO` (as in the thesis: (−2ε²+ε−2)²/(16π⁴ε²)) and
   report the exact conversion factor separately (so the printed combination is clean and the factor is exact, not a series).
5. Remove the `Global` context leak on `B0`/`C0` in `ReturnMasterCombination` output (they print as "Global`B0"). Print them
   as `B0`, `C0`.
6. Keep everything else unchanged: integrated A22/A31/A40/B40/C40 series through ε⁰ must be identical to today's;
   `BuildRRatio[SMQCD]` finite coefficient must stay 365/24−11ζ₃+N_f(2ζ₃/3−11/12) at N=3.

## Practical rules
- Work on `release/0.3.x` from commit 8df5225 (0.3.2-beta.3), which the thesis currently cites. If you commit a change,
  tell me the new hash and version so I can update the thesis citation.
- `<< AntCalc`` loads the installed paclet; use `Get[…/AntennaPipeline.wl]` or reinstall. Test in a fresh kernel.
- Time-box: if the closed forms cannot be established and verified safely by **27 Sep**, do not commit; report what you
  found and I will keep 8df5225 and reword the thesis instead.

## Report back
The list from task 1 (with closed forms or "not derivable"), the ε⁸ equality proofs, the new Breve combination `Out`,
the `B0/C0` printing, regression results, and the commit hash.
