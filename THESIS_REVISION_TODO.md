# Thesis revision checklist

Consolidated from three independent reviews of the current thesis draft on 17 August 2026.  This is a prioritised working list, not a claim that every item is an established physics error.  Items marked **verify** require comparison with the cited source or a trusted symbolic calculation before changing the thesis.

Known placeholder references to the appendices are deliberately not repeated here, as they are already tracked separately.

## 1. Submission blockers

- [ ] Write the Portuguese **Resumo** and English **Abstract**.  Both are currently placeholders.
- [ ] Fill the four appendices, or temporarily remove their headings from the compiled thesis.  Their bodies currently contain placeholders.
- [ ] Remove visible PDF link borders.  The red rectangles around contents/cross-reference links and green rectangles around citations make the PDF look like it contains review markup.  Configure `hyperref` with `hidelinks` (or equivalent unobtrusive link styling) in `preamble.tex`, then rebuild and visually check the PDF.
- [ ] Complete a final compile with no undefined references or citations.  In particular, visually check Chapter 5 and all front matter after the final bibliography run.
- [ ] Remove “Versão Provisória” from the title page only when preparing the final submitted version.

## 2. Correctness and internal consistency

### Must verify before submission

- [ ] **A6 master-integral expansion:** reconcile the incompatible expansions in `chapters/04-worked-example.tex` around lines 389 and 513.  They have different `zeta_3` and `pi^4` coefficients (`23`/`103 pi^4/180` versus `27`/`23 pi^4/36`) and differ in the scale convention.  Establish whether a convention/analytic-continuation factor explains this; otherwise correct one expression and state the convention.
- [ ] **NNLO self-interference normalisation:** check the relative factor multiplying `breve A_2^2` between the Chapter 2 NNLO cross-section expression and Chapter 5 Eq. (5.5).  The review identified a possible `C_F` versus `2 C_F = N - 1/N` mismatch.  Verify against the cited R-ratio reference, not by visual pattern matching.
- [ ] **R-ratio expansion convention:** Chapter 5 first introduces coefficients in powers of `alpha_s/pi`, then writes the AntCalc result in `alpha_s/(2 pi)`.  Add one explicit sentence relating the two coefficient conventions (`c_NLO = r_NLO/2`, `c_NNLO = r_NNLO/4`) or use one convention throughout.
- [ ] Check the apparent loss of the `e_q^2 g_s^2 (N^2-1)` prefactor in the final line of the squared-amplitude derivation near Eq. (4.64).  If it is intentionally factored out, say so; otherwise restore it.

### Specific source corrections

- [ ] Chapter 2, footnote after the massless Mandelstam definition: change “as `p_k^2` for any `k`” to “as `p_k^2 = 0` for any `k`”.
- [ ] Chapter 2 colour-algebra introduction: fill the missing group name in “governed by the $ $ generators `T^a`” (normally `SU(N)` in the general discussion, or state `SU(3)_c` if intentionally specialised).
- [ ] Chapter 2: correct `AndCalc's` to `AntCalc's` and “framework establish” to “framework established”.
- [ ] Chapter 2, footnote on `T^{2(k+1)}`: correct the explanation of the order index.  “Twice ... plus one” conflicts with the displayed exponent; it should describe `2(k+1)`.
- [ ] Chapter 2: correct `c sigma^{RV}` to `d sigma^{RV}` and begin the following sentence “As an example”.
- [ ] Chapter 2: replace `>>` and `<<` in math with `\gg` and `\ll`.
- [ ] Chapter 2, footnote concerning loop antennae: check the condition reported as `l >= 0`; it should likely be `l >= 1` if the sentence distinguishes loop from tree-level antennae.
- [ ] Chapter 4: reduce `72 zeta_2` in the `hat A_2^2` finite term, or deliberately retain it with a consistent convention.  If simplified, `4085 - 546 pi^2 + 72 zeta_2` becomes `4085 - 534 pi^2`.
- [ ] Chapter 4: remove the duplicate citation in the early footnote cited by the review and correct “Källen” to “Källén”.

## 3. References, labels, and typesetting

- [ ] Fix the higher-level-functions figure reference in Chapter 3: it should point to Figure 3.9 (`fig:higher-level`), not the Future Work figure.  The current source already points to `fig:higher-level`; confirm the next full rebuild resolves this correctly.
- [ ] Standardise reference prose: use `Eq.~\ref{...}`, `Fig.~\ref{...}`, and `Section~\ref{...}` consistently.  Examples needing attention include Chapter 3 around the expansion-order and component-extraction discussion.
- [ ] Standardise citation calls so multi-source citations render as one list (`[9, 21]`) rather than adjacent lists (`[9][21]`).
- [ ] Replace remaining red `\textcolor{red}{AntCalc}` instances in Chapter 4 with `\textit{AntCalc}`; red should be reserved for intentional review annotations, which should not remain in the final PDF.
- [ ] Use `\slashed{}` consistently for Dirac-slash notation, since the `slashed` package is already loaded.  Inspect the affected Chapter 4 equations after changing them, because visual clarity is the goal.
- [ ] Correct tilde scope in multi-index antenna notation: write `\tilde{\mathcal A}_3^1`, not `\tilde{\mathcal A_3^1}`.
- [ ] Make an end-to-end visual pass after the final build: link borders absent; no empty reference boxes; code blocks, long equations, tables, and workflow diagrams readable at normal print size.

## 4. Strengthen the scientific argument

- [ ] In the introduction and conclusion, explicitly frame the contribution as **automation and validation of known antenna results**, plus an exploratory massive extension—not a claim of new massless QCD results.  This makes the novelty precise and defensible.
- [ ] Expand the `A_3^0` worked example with one **representative IBP reduction term**.  After introducing the cut-integral family, choose a term from the antenna integrand, show its denominator/index representation, state the reduction identity or LiteRed2 reduction output, and show how it reduces to the `R_3` master before the master substitution.  Keep it to one compact example: its job is to make the reduction bridge auditable, not to reproduce the complete IBP system.
- [ ] Expand Chapter 5, the thesis’s main global validation.  Add a compact table of the pole cancellation by perturbative order and NNLO colour/flavour channel, followed by the final finite R-ratio comparison with the literature.
- [ ] Replace repeated “the result agrees with the literature” claims in Chapter 4 with one evidence-dense summary table.  Suggested columns: antenna route/components, build reduction, integration basis/master integrals, comparison target, Laurent orders checked, and validation status.
- [ ] Add a concise reproducibility paragraph, preferably in Chapter 3 or an appendix: AntCalc version/commit, Mathematica, FeynCalc/FeynArts/LiteRed2 versions, hardware/RAM, representative runtimes, and what tests are automated.
- [ ] Cite **MadGraph5_aMC@NLO** and **NNLOJET** at their first substantive mentions in Future Work.  The citations should support the proposed interfaces, not imply that either is presently part of AntCalc.  Use the primary MadGraph5_aMC@NLO paper (Alwall *et al.*, JHEP 07 (2014) 079, arXiv:1405.0301) and the NNLOJET code paper (Huss *et al.*, arXiv:2503.22804; published as SciPost Phys. Codebases 69 (2026), if that is the bibliography convention being used).
- [ ] Add a short positioning paragraph on related subtraction/antenna automation tools.  State clearly what AntCalc automates, what it does not yet do, and how its role differs from a numerical event-generator validation such as NNLOJET.
- [ ] State in the conclusion that the present validation is analytic/symbolic and that an independent numerical Monte Carlo check remains future work.

## 5. Improve the thesis as a document

- [ ] Rebalance Chapter 3.  Keep the architectural rationale and the strong diagrams, but move the full profile association dump and other API-level detail to a user guide or appendix if page budget permits.  The main text should foreground design decisions, extensibility, and scientific consequences.
- [ ] Rework the longest raw Mathematica `In[]/Out[]` transcripts in Chapter 4.  Retain the compact examples that demonstrate the API, but replace truncated large outputs with a result statement, a reference to the complete expression, and a validation table.
- [ ] Enlarge or split the densest workflow figures and code blocks if they are not comfortably readable when printed.  Figure 3.9 is a likely candidate.
- [ ] Do a style pass to remove informal or weak framing: “simple”, “simply”, “usual”, “as expected”, and “we may now”.  Prefer a direct statement of what is computed and why it establishes the claim.
- [ ] Reduce repeated descriptions of the build/integrate workflow, especially across Chapter 4 case studies; use the freed space for interpretation and validation evidence.
- [ ] Standardise terms and capitalisation: `Wolfram Language` versus `Mathematica`, `build stage`/`build-side`, `master integral`/`MI`, and package names.

## 6. Final delivery checklist

- [ ] Confirm title-page names, degree wording, academic year, and institutional template requirements with the supervisors/department.
- [ ] Run a clean build from scratch with Biber, then resolve every warning that affects the output.
- [ ] Check the table of contents, lists of figures/tables, page numbering, captions, bibliography, and all PDF metadata.
- [ ] Ask one subject-matter reader to sign off specifically on the two marked **verify** physics/normalisation items before submission.
