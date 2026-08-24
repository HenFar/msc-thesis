# Thesis revision checklist

Consolidated from three independent reviews of the current thesis draft on 17 August 2026.  This is a prioritised working list, not a claim that every item is an established physics error.  Items marked **verify** require comparison with the cited source or a trusted symbolic calculation before changing the thesis.

Known placeholder references to the appendices are deliberately not repeated here, as they are already tracked separately.

## 0. PRIORITY — Advisor feedback from Prof. Pires (Ch1 Introduction + Ch2 partial, received 24 August 2026)

Advisor feedback takes priority over everything below where they overlap. This is a **partial** pass — Prof. Pires said more corrections for the rest of Chapter 2 are coming later this week; fold those in here when they arrive. Where he supplied ready-made replacement text, go back to his email for the exact wording rather than re-deriving it.

### Chapter 1 — Introduction
- [ ] Opening sentence: name the LHC/CERN explicitly as the motivating example of "high-energy collider experiments," not just an unspecified reference.
- [ ] "Achieving higher orders of perturbation is not simply..." → "Obtaining higher-order perturbative predictions is not simply a matter of...".
- [ ] Remove "(in trajectory)" after "collinear" — not a meaningful qualifier for collinear partons.
- [ ] Rewrite "these individual contributions are divergent and must be arranged before they can be evaluated reliably" — "arranged" is vague. Replace with explicit language: IR singularities must be extracted and cancelled before numerical integration; for IR-safe observables (e.g. the hadronic $R$-ratio) the cancellation is between real and virtual contributions, leaving a finite result. Prof supplied exact replacement text.
- [ ] Reword the following "antenna subtraction formalism provides the framework for this rearrangement" sentence to match (framework for *extracting and cancelling* these singularities).
- [ ] "Their systematic construction and integration are therefore central ingredients in higher-order QCD calculations" → qualify as central *within the antenna subtraction framework* specifically. Other subtraction schemes (Catani–Seymour, FKS, sector-improved, ...) don't use antenna functions at all — the unqualified claim overclaims generality.
- [ ] Define the $R$-ratio in one sentence at first mention (currently used before being defined) and set it in italics (\textit{$R$-ratio}); tighten the sentence on local eikonal/AP-splitting validation. Prof supplied phrasing.
- [ ] Rewrite the chapter-outline paragraph: it currently uses $A_2^1$, $B_4^0$, $A_3^0$, and "$T$-objects" before that notation has been introduced anywhere — confirmed against `chapters/01-introduction.tex:47-55`. Prof's rewrite avoids the problem by naming only "the $A_3^0$ antenna" in prose and deferring all other notation to where it's actually defined (§2.4.3); adopt that structure.

### Chapter 2 — cross-cutting concern
- [ ] **Grade-relevant, not just stylistic:** the chapter is currently too long and too technical in a way that dilutes the thesis's own motivation and objectives. In places it's oversimplified to the point of losing rigor (soft/collinear power counting, loop-momentum divergence description — see below, both are actual errors, not just clarity issues). In other places (§2.4/§2.4.1/§2.4.2, Eq. 2.27, three footnotes on one page) it's over-indexed to the point of being hard to follow. Prof is explicit that this can pull the final grade down even with correct physics and a strong defence. General fix: replace index-heavy taxonomy prose with tables/lists/figures. Model the antenna-subtraction exposition on Gehrmann-De Ridder et al., hep-ph/0505111 — §2.1 explains NLO antenna subtraction in a couple of pages using a figure; §3/Table 1 gives a compact antenna taxonomy by letter (A/B/C/D) and particle content (q,g,q̄ / q,q̄,q,q̄ / ...). This converges with the "rebalance for readability" theme already in §5 below — two independent reviews flagging the same density problem, treat as confirmed and high priority.

### §2.1.1 (QCD Lagrangian)
- [ ] Currently the gauge-fixing/ghost discussion lives entirely in one footnote (`chapters/02-physics-background.tex:71-73`) and no gauge choice is ever stated. Commit explicitly to a gauge (presumably Feynman gauge) for the gluon propagator, and if so, state that the Faddeev–Popov ghost Lagrangian is required to cancel unphysical gluon polarisations in loops. Move from footnote into a short main-text paragraph — Prof flags this as a place an examiner in this specific subfield is likely to probe.

### §2.1.2
- [ ] Rewrite "the interaction terms in $\mathcal L_q$ and $\mathcal L_g$ generate Feynman rules..." — interaction terms fix the vertices; vertices + propagators together are the Feynman rules. Add that a Feynman diagram is one term in the amplitude's perturbative expansion, and the full amplitude sums over all contributing diagrams at a given order. Prof supplied text.
- [ ] Eq. (2.9): define what the $D$ and $D'$ summation indices represent — currently unexplained.

### §2.2.1 (Infrared divergences)
- [ ] Open the section by defining real vs. virtual corrections before the soft/collinear limits (Prof supplied a short definitional paragraph).
- [ ] **Physics correctness issue** at `chapters/02-physics-background.tex:179-188`: the text currently states both soft and collinear limits go as $1/s_{ij}^2\to\infty$. That's bare propagator power-counting only. Once numerator/spin structure is included (as the thesis itself does correctly later, for the eikonal factor and AP splitting functions), the leading collinear singularity is $1/s_{ij}$, not $1/s_{ij}^2$ — this is an inconsistency between two parts of the same chapter and needs an actual correction. Also add: only a soft *gluon* diverges at NLO (a soft quark does not — no helicity-preserving soft enhancement for fermions); a soft $q\bar q$ pair only becomes a genuine divergence at NNLO (double-soft configurations).
- [ ] Footnote on $p_k^2$ at `chapters/02-physics-background.tex:175` — missing "$=0$". **Duplicates the item already in §2 "Specific source corrections" below; now advisor-confirmed, treat as settled.**
- [ ] Rewrite the "experimentally indistinguishable" / KLN paragraph for rigor (Prof supplied text distinguishing "unresolved" from "absent" and framing the KLN cancellation more carefully). Note: the KLN citations `\cite{Kinoshita1962,Lee:1964is}` are already present at this location (`chapters/02-physics-background.tex:199`) — no new citation needed, just the rewritten prose around it.
- [ ] Expand the real/virtual subtraction-structure explanation: introduce the local counterterm $d\sigma^S$ more carefully, and explicitly label the current `eq:subScheme` as the *NLO* schematic only (NNLO needs its own statement — see next item).
- [ ] Add an explicit thesis-motivation paragraph at the end of this subsection, at the point where NNLO complications are raised: state that antenna subtraction gives a systematic construction of $d\sigma^S$ via antenna functions, and that a central objective of *this thesis* is constructing quark-antiquark antennae both unintegrated (local subtraction) and integrated (pole cancellation against virtual corrections). This is the direct fix for "motivation gets diluted" — put it here explicitly.

### §2.2.2 (Ultraviolet divergences)
- [ ] **Correctness/clarity issue** at `chapters/02-physics-background.tex:225`: "The soft and collinear limits on $l$ behave exactly as described above for the outgoing momenta" is not accurate as a blanket statement. Rewrite: loop-momentum regions soft/collinear to an *external massless* momentum are what generate the IR poles contributing to $d\sigma^V$'s singular structure; large-$|l|\to\infty$ is a separate, UV, divergence.
- [ ] Rewrite the UV power-counting paragraph and the renormalisation paragraph following Prof's cleaner phrasing; add a forward-reference to the explicit renormalisation discussion later in the thesis (he suggests the $\hat A_3^1$ antenna as the natural place).

### §2.3 (Dimensional regularisation)
- [ ] Rewrite the opening paragraph to explicitly connect: the subtraction split → $d\sigma^R-d\sigma^S$ numerically finite in 4D → $d\sigma^S$ integrated analytically in $d=4-2\epsilon$ → poles cancel $d\sigma^V$'s poles via KLN.
- [ ] Terminology: "dimensional regularisation methods" → "dimensional regularisation **schemes**".
- [ ] State explicitly which scheme is used throughout — **Conventional Dimensional Regularisation (CDR)**, all momenta and polarisation states continued to $d$ dimensions — and why (consistency with the antenna-formalism reference paper). Name HV and FDH as the alternatives, with citations.
- [ ] Rewrite the paragraph that currently conflates CDR, $\overline{\text{MS}}$, and the antenna normalisation convention. Prof's restructuring separates it into: (a) the dim-reg normalisation $S_\epsilon=(4\pi)^{-\epsilon}e^{\epsilon\gamma_E}$, (b) the coupling-convention normalisation $G_k=(8\pi^2)^k$ split into multiplicity/loop pieces, (c) the combined factor $C(\epsilon,k)$. **Verify** this is exactly consistent with the normalisation actually used for the integrated antennae in Ch4/Ch5 before adopting verbatim — Prof wrote this without seeing your committed Ch4 conventions.
- [ ] The $\Phi_2$ phase-space normalisation sentence currently asserts the normalisation without motivating it ("Since multi-particle phase spaces recursively factorise, we must also normalise...") — an examiner will ask why. Either derive it, or (Prof's lower-effort suggestion) reframe it explicitly as *the convention adopted in the antenna-subtraction literature*. First check whether §2.4's "Phase-Space Factorisation" subsection (`chapters/02-physics-background.tex:682`) already justifies the recursive factorisation this depends on — if so this may just be a forward-reference fix, not a missing derivation.
- [ ] Add the coupling-renormalisation paragraph (bare $\alpha_s^0$ vs. renormalised $\alpha_s(\mu)$, $\mu_0$ vs. $\mu$, $\beta_0$, $N=3$, $N_f$) where UV divergences from §2.2.2 are picked back up — needs a citation for $\beta_0$.

### §2.4 / §2.4.1 / §2.4.2 (Antenna subtraction formalism, antenna functions, colour algebra)
- [ ] Same core critique as the chapter-wide note above, concentrated here: Eq. (2.27) is overloaded with indices; three footnotes on one page is a readability red flag. Simplify substantially.
- [ ] Concrete fix: build a compact antenna-taxonomy table (letter A/B/C/D, particle content, order) modeled on hep-ph/0505111 Table 1, replacing some of the current index-heavy prose.
- [ ] Consider a figure illustrating NLO antenna subtraction (as hep-ph/0505111 Fig. 3 does) instead of describing it purely in equations.

### Still pending
- [ ] Prof said corrections for the remainder of Chapter 2 (beyond §2.4.2) are coming later this week — re-open this section when they arrive.

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
