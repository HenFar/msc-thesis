# Prompt 2 (Opus version, 26 Sep 2026): remove paper-tuned convention factors from the AntCalc A22 route

You are a fresh Claude Code (Opus 5.5) session working in the **AntCalc** repository, `~/Desktop/AntCalc`, which is a
Wolfram Language package. I am Henrique, the author. The package is the subject of my MSc thesis, which is due at the
school on **30 Sep 2026**. You have none of the context from the session that wrote this prompt, so everything you need
is below or in the files it points to. Read the whole prompt before touching anything.

## Why this matters
The thesis says the A22 integrated antennae come out of AntCalc's own algorithm with no number copied from the literature.
That includes the one-loop-squared component, "Breve". It also says AntCalc *found* the −7ζ₃/(6ε) sign discrepancy in
hep-ph/0403057 Eq. (4.10), which arXiv:2211.08446 Eq. (B.7) later confirmed independently. An examiner who reads the repo
sees something else:
- Commit f091788 ("…removing the ad-hoc convention ledger and applying the fix from 2211.08446") edits the ζ₃ terms of a
  hard-coded, truncated ε-series in `masterIntegrals/A22LO.wl: A22LOVirtualConventionFactor[]` (l.49): 26ζ₃/3 → −2ζ₃/3 at
  ε³, plus the ε⁴ term. A comment cites 2211.08446.
- `src/engines/integration_ibp.wl: A22OneLoopSelfVirtualConventionFactor[]` (l.2171) carries a comment saying it was
  patched "to match 2211.08446 Eq. (B.7) … −7ζ3/3 correction".
- `dev/a22_literature_reference.wl` had its Breve target sign flipped.

Together these read as "tuned to the paper". The goal is the opposite: every conversion factor exact and derived, with
the literature used only as a regression *target*. If that turns out to be impossible, I need to know by the time-box so
I can reword the thesis instead. **An honest "not derivable, here is why" is a successful outcome. A factor fitted to hit
the target is not.**

## Facts already established (verify them, don't trust them)
- `breveFactor = A22LOMasterCore[] * A22OneLoopSelfVirtualConventionFactor[] / A22TwoLoopTreeMasterValueA22LO[]` with
  q2 → 1 equals **−1/cos(2πε) through ε⁴** and first differs at ε⁵ (by −154π²ζ₃ε⁵/9). So the hard-coded series are
  truncations and not the exact function.
- An earlier check (21 Sep) gave F_v·F_tree = cos(2πε) e^{2γ_E ε}/Γ(1−ε)² through ε⁴. That is a pure Γ/cos normalisation
  (S_Γ → S_ε conversion plus timelike analytic continuation), not a fit.
- Thesis conventions: S_ε = (4π)^ε e^{−εγ_E}, and C(ε,2) = G₂/S_ε², so a public A22 build equals 𝒳/C(ε,2) with prefactor
  (4π)^{2ε} e^{−2εγ_E}/(64π⁴). At 8df5225, Build·C(ε,2) = Integrate holds for all four components (Lead, Sub, Nf, Breve).
- Regression anchor: `BuildRRatio[SMQCD]` finite coefficient = **365/24 − 11ζ₃ + N_f(2ζ₃/3 − 11/12)** at N = 3.
- The Breve master combination currently prints as a ratio of ζ₃-polynomials, which can't go in the thesis. The thesis
  form is (−2ε²+ε−2)²/(16π⁴ε²) × A22LO.

Other files that contain 2211.08446 and need checking: `dev/regression_a22_external_literature_contract.wl`,
`dev/check_rratio_paper_target_assembly.wl`, `dev/regression_rratio_a22_breve_correction.wl`,
`src/interface/rratio_driver.wl`, `src/core/version.wl`, `src/engines/integrated_antenna_extraction.wl`.
`docs/manual/conventions-and-normalisation.md` is the written conventions reference.

## Tasks
1. **Inventory.** List every hard-coded series, convention factor or route-local master value in the A22 integration
   path, and in the A31/B40/C40 paths if they have any. Start with `A22LOVirtualConventionFactor`,
   `A22LOTwoLoopTreeVirtualConventionFactor`, `A22OneLoopSelfVirtualConventionFactor`,
   `A22VirtualTwoPartonConventionFactor` and `A22TwoLoopTreeMasterValueA4Basis7Like/Basis8Like`, then grep
   `integration_ibp.wl`, `master_values_runtime.wl` and `masterIntegrals/` for literal ζ₃, π² or truncated ε-series. For each
   one, say what it represents physically and whether it has a closed form.
2. **Derive closed forms.** Build each one from Γ functions, e^{γ_E ε}, cos(πε)/cos(2πε), the S_Γ↔S_ε conversion and the
   phase-space volume. Derive the form from the definitions; do not guess it from the series. Prove equality with the old
   series **to at least ε⁸**, by exact symbolic series subtraction (residual exactly 0 at each order), wherever the old
   series extends that far. Where the old series stops earlier, prove equality to its last order and state where it
   stops. If the closed form and the old series disagree at an order the old series actually has (the ε⁵ Breve mismatch
   is a candidate), **do not paper over it.** Work out which one is correct from the derivation and report it. It only
   affects published numbers if it reaches ε⁰ of an integrated result, so check that explicitly.
3. **Clean up provenance.** Remove comments and docstrings saying a factor was "patched", "corrected" or "matched" to a
   paper. Literature values stay only in `dev/` regression files, as *targets*, and never as pipeline inputs. Record in the
   commit message what changed and why, including the history (f091788).
4. **Breve master combination.** Return the rational-in-ε coefficient times `A22LO`, i.e.
   (−2ε²+ε−2)²/(16π⁴ε²)·A22LO, and report the exact conversion factor separately (as the A31/A22 combinations already do
   with "FamilyPrefactor"), so both are clean and exact.
5. **Context leak.** `ReturnMasterCombination` prints `Global`B0` / `Global`C0`. Make it print `B0` and `C0`.
6. **Leave the published numbers alone.** The integrated A22/A31/A40/B40/C40 series through ε⁰ must be identical to those
   at 8df5225, the Build·C(ε,2) = Integrate identity must still hold for all four A22 components, and the R-ratio anchor
   above must be unchanged.

## How to work
- **Setup.** Start from a clean `release/0.3.x` at 8df5225 (the working tree was clean on 26 Sep). Create branch
  `fix/exact-convention-factors`. Before changing anything, save baseline outputs from 8df5225 to a scratch directory:
  the integrated series for all components, the four `ReturnMasterCombination` outputs, the R-ratio coefficient, and the
  `dev/` regression results. Every later comparison is against those saved files, not against memory.
- **Kernel hygiene.** `<< AntCalc`` loads the *installed* paclet, not your working copy. Load with
  `Get["~/Desktop/AntCalc/AntennaPipeline.wl"]` (or reinstall the paclet), and run every check in a fresh `wolframscript`
  process. The A22 and A31 LiteRed kinematics interfere with each other (see 4b91b39), so test each route in its own kernel
  as well as together.
- **Environment.** `~/Desktop` is TCC-protected. If you get "Operation not permitted", stop and ask me to grant access;
  don't work around it. `wolframscript` may need the Bash sandbox disabled. ChatGPT/Codex is down, so don't use
  `ask-codex`.
- **Checkpoint.** After task 1, show me the inventory table and your planned closed forms *before* editing source. Continue
  to tasks 2–5 once I say go.
- **Commit rules.** Commit only when every gate in task 6 passes. Don't push, don't bump the version string until I
  confirm, and don't touch the thesis repo.
- **Time-box: end of 27 Sep.** If the closed forms can't be established and verified by then, don't commit. Report what
  you found, and I'll keep 8df5225 and reword the thesis.

## Report back
1. The inventory table: name, file:line, meaning, closed form or "not derivable" plus the reason.
2. For each closed form, the equality proof: the order reached, the residual at each order, and the `wolframscript`
   snippet that shows it.
3. Any disagreement between a closed form and the old series, which one is right, and whether it reaches ε⁰.
4. The new Breve `ReturnMasterCombination` output, verbatim, and the separately reported conversion factor.
5. The `B0`/`C0` printing, verbatim.
6. Regression results against the saved baseline, one line per gate.
7. The commit hash and the proposed version string (e.g. 0.3.2-beta.4), so I can update Ch3 of the thesis.
8. A two-sentence verdict for the thesis: can §4.2.4 keep saying AntCalc found the Eq. (4.10) sign independently, or not?
   Base it on what the code now does *and* on the git history. f091788 still exists whatever the code looks like today.
