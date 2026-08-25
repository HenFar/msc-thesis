# Thesis revision checklist

Consolidated from three independent reviews of the current thesis draft on 17 August 2026.  This is a prioritised working list, not a claim that every item is an established physics error.  Items marked **verify** require comparison with the cited source or a trusted symbolic calculation before changing the thesis.

Known placeholder references to the appendices are deliberately not repeated here, as they are already tracked separately.

## 0. PRIORITY — Advisor feedback from Prof. Pires (Ch1 Introduction + Ch2 partial, received 24 August 2026)

Advisor feedback takes priority over everything below where they overlap. This is a **partial** pass — Prof. Pires said more corrections for the rest of Chapter 2 are coming later this week; fold those in here when they arrive. Where he supplied ready-made replacement text, go back to his email for the exact wording rather than re-deriving it.

### Chapter 1 — Introduction — DONE (25 Aug 2026) [Mine — all Prof-supplied text or minimal-diff edits]
- [x] Opening sentence: name the LHC/CERN explicitly as the motivating example of "high-energy collider experiments," not just an unspecified reference.
- [x] "Achieving higher orders of perturbation is not simply..." → "Obtaining higher-order perturbative predictions is not simply a matter of...".
- [x] Remove "(in trajectory)" after "collinear" — not a meaningful qualifier for collinear partons.
- [x] Rewrite "these individual contributions are divergent and must be arranged before they can be evaluated reliably" — "arranged" is vague. Replace with explicit language: IR singularities must be extracted and cancelled before numerical integration; for IR-safe observables (e.g. the hadronic $R$-ratio) the cancellation is between real and virtual contributions, leaving a finite result. Prof supplied exact replacement text.
- [x] Reword the following "antenna subtraction formalism provides the framework for this rearrangement" sentence to match (framework for *extracting and cancelling* these singularities).
- [x] "Their systematic construction and integration are therefore central ingredients in higher-order QCD calculations" → qualify as central *within the antenna subtraction framework* specifically. Other subtraction schemes (Catani–Seymour, FKS, sector-improved, ...) don't use antenna functions at all — the unqualified claim overclaims generality.
- [x] Define the $R$-ratio in one sentence at first mention (currently used before being defined) and set it in italics (\textit{$R$-ratio}); tighten the sentence on local eikonal/AP-splitting validation. Prof supplied phrasing.
- [x] Rewrite the chapter-outline paragraph: it currently uses $A_2^1$, $B_4^0$, $A_3^0$, and "$T$-objects" before that notation has been introduced anywhere — confirmed against `chapters/01-introduction.tex:47-55`. Prof's rewrite avoids the problem by naming only "the $A_3^0$ antenna" in prose and deferring all other notation to where it's actually defined (§2.4.3); adopt that structure. Note: paragraph 2's mention of the $R$-ratio still technically precedes paragraph 4's fuller definition — flagged to Henrique as a minor ordering nuance, left as is by his choice.

### Chapter 2 — cross-cutting concern
- [ ] **Grade-relevant, not just stylistic:** the chapter is currently too long and too technical in a way that dilutes the thesis's own motivation and objectives. In places it's oversimplified to the point of losing rigor (soft/collinear power counting, loop-momentum divergence description — see below, both are actual errors, not just clarity issues). In other places (§2.4/§2.4.1/§2.4.2, Eq. 2.27, three footnotes on one page) it's over-indexed to the point of being hard to follow. Prof is explicit that this can pull the final grade down even with correct physics and a strong defence. General fix: replace index-heavy taxonomy prose with tables/lists/figures. Model the antenna-subtraction exposition on Gehrmann-De Ridder et al., hep-ph/0505111 — §2.1 explains NLO antenna subtraction in a couple of pages using a figure; §3/Table 1 gives a compact antenna taxonomy by letter (A/B/C/D) and particle content (q,g,q̄ / q,q̄,q,q̄ / ...). This converges with the "rebalance for readability" theme already in §5 below — two independent reviews flagging the same density problem, treat as confirmed and high priority.

### §2.1.1 (QCD Lagrangian) — DONE (25 Aug 2026)
- [x] Gauge-fixing and ghost content moved from the old footnote into the main text: names the convention (t'Hooft–Feynman, $\lambda=1$), shows $\mathcal L_\text{gf}$ and the resulting propagator, shows $\mathcal L_\text{ghost}$, and states explicitly that ghosts leave only the two transverse gluon polarisations in physical amplitudes (Pires's specific requested "why"). $\lambda=1$ confirmed directly via `Options[CreateFeynAmp]` in Henrique's own Mathematica session (not just FeynArts' documented default) and cross-checked against the `ExcludeParticles` lists in AntCalc's own build-stage code, which exclude the electroweak ghosts (`U[1]`-`U[4]`) but never the QCD ghost (`U[5]`) — confirming the gluon ghost is genuinely present in the $A_3^1$ one-loop generation, not assumed. Citation swapped from the wrong source (`FeynArts1Manual`, the 1991 v1.0 manual) to the correct one (`Hahn:2000kx`, the 2001 FeynArts 3 paper). The `ExcludeParticles`-level implementation detail was deliberately kept out of Ch2 and left as optional Ch3 (`subsec:oneLoopRoutes`) material if Henrique wants to document it later.

### §2.1.2 — DONE [Mine]
- [x] Rewrite "the interaction terms in $\mathcal L_q$ and $\mathcal L_g$ generate Feynman rules..." — interaction terms fix the vertices; vertices + propagators together are the Feynman rules. Add that a Feynman diagram is one term in the amplitude's perturbative expansion, and the full amplitude sums over all contributing diagrams at a given order. Prof supplied text.
- [x] Eq. (2.9): define what the $D$ and $D'$ summation indices represent — currently unexplained.

### §2.2.1 (Infrared divergences) — DONE, one item retired [mixed Mine/Yours]
- [x] Open the section by defining real vs. virtual corrections before the soft/collinear limits. **[Mine]**
- [x] **Physics correctness issue, formerly "Task B".** **[Yours]** — resolved via a worked example using $\gamma^*\to q(k_1)g(k_3)\bar q(k_2)$ (already the process in Fig. 2.1): collinear → single pole $1/s_{13}$; soft gluon → double pole $1/(s_{13}s_{23})$; soft quark → same pole as the collinear limit, no separate counterterm needed (refined beyond Prof's original blunter framing, verified computationally against Henrique's own `BuildAntenna[A,3,0]` output); NNLO soft-$q\bar q$-pair case added as a genuine double pole in the pair's own invariant, sourced to Gehrmann-De Ridder–Gehrmann–Glover eq. 8.4 (verified by reading the paper directly). Cites `\cite{Ellis:1996mzs}` for the general framework, `\cite{Gehrmann-DeRidder:2005btv}` for the NNLO claim.
- [x] Footnote on $p_k^2$ — missing "$=0$". **[Mine]** Duplicated the same fix into §2 "Specific source corrections" below, since it's the identical underlying footnote.
- [x] Rewrite the "experimentally indistinguishable" / KLN paragraph for rigor. **[Mine]**
- [x] Expand the real/virtual subtraction-structure explanation and label `eq:subScheme` as the *NLO* schematic only. **[Mine]**
- [ ] ~~Add an explicit thesis-motivation paragraph... central objective of this thesis...~~ **RETIRED — do not do separately.** Superseded by the explicit $d\sigma^S$/$d\sigma^T$ antenna-sum equations planned in the §2.4 restructuring below (**Yours**) — that item does the same motivational work more concretely, from an equation rather than prose assertion. Writing both would be redundant.

### §2.2.2 (Ultraviolet divergences) — DONE [Mine]
- [x] **Correctness/clarity issue**: "The soft and collinear limits on $l$ behave exactly as described above for the outgoing momenta" was not accurate as a blanket statement. Rewritten: loop-momentum regions soft/collinear to an *external massless* momentum generate the IR poles contributing to $d\sigma^V$'s singular structure; large-$|l|\to\infty$ is a separate, UV, divergence.
- [x] Rewrote the UV power-counting paragraph and the renormalisation paragraph; added a forward-reference to `Subsection~\ref{subsec:oneLoopRoutes}` (Ch3's one-loop routes, where $A_3^1$ renormalisation is actually made explicit — checked the label and its content exist before citing it).

### §2.3 (Dimensional regularisation) — mostly done, one item still open [mixed]
- [x] Rewrite the opening paragraph to explicitly connect the subtraction split → numerical finiteness in 4D → analytic integration in $d=4-2\epsilon$ → pole cancellation via KLN. **[Mine]**
- [x] Terminology: "dimensional regularisation methods" → "dimensional regularisation **schemes**". **[Mine]**
- [x] State explicitly which scheme is used throughout — **Conventional Dimensional Regularisation (CDR)**. Named HV and FDH as the alternatives, with citations. **[Mine]**
- [x] Rewrote the paragraph that conflated CDR, $\overline{\text{MS}}$, and the antenna normalisation convention into the separated $S_\epsilon$ / $G_k$ / $C(\epsilon,k)$ structure. **[Mine]** — the **verify against Ch4/Ch5 conventions** caveat from the original note still stands and hasn't been separately re-checked; worth a pass before final submission.
- [ ] **The $\Phi_2$ phase-space normalisation sentence — still open, this is "Task D." [Yours]** Still asserts the normalisation without motivating it. Either derive it, or reframe it as *the convention adopted in the antenna-subtraction literature*. Check whether `subsec:phaseSpaceFactor` already justifies the recursive factorisation this depends on before deciding.
- [x] Added the coupling-renormalisation paragraph (bare $\alpha_s^0$ vs. renormalised $\alpha_s(\mu)$, $\mu_0$ vs. $\mu$, $\beta_0$, $N=3$, $N_f$); added a citation for $\beta_0$ (`\cite{Ellis:1996mzs,Peskin:1995ev}`). **[Mine]**

### §2.4 (full section) — expanded 25 Aug 2026 after Prof's follow-up note on this section specifically

Prof confirmed §2.4 needs an actual rewrite: confusing, needs more rigour in places, and the subsection order is wrong. Six concrete sub-tasks, all checked against the current source:

- [ ] **Reorder subsections — turned out not to be mechanical, now Henrique's.** `subsec:nloAndNnloSubtraction` (currently 2.4.5) should open §2.4 — it explains *why* antenna functions and T-objects are needed, and currently comes last. **But its own back half (roughly the last third) is itself a detailed T-object discussion** — the $\sigma^{\rm NNLO}$/$\sigma^{\rm NLO}$ equations written in terms of $\mathcal T^4_{q\bar q}$, $\mathcal T^6_{q\bar q}$ etc., with an explicit cite to `subsec:antFamilies`. Since T-objects are moving to Ch5 (see below), simply relocating this subsection unchanged would open the rewritten §2.4 with exactly the T-object content Pires wants kept out of Ch2. This needs an actual decision — how much of the T-object material to cut vs. keep as a light forward-reference to Ch5 — not a cut-and-paste, so it's paired with item 4 in the "Yours" list at the top of this file.
- [ ] **Replace the `\sim` equations with exact ones.** Confirmed at `chapters/02-physics-background.tex:730` and `:770` (the integrated-antenna definition in the phase-space-factorisation subsection) — both use `\sim` where the reference paper's equivalent step (their eq. 3.2) writes an exact equality with the symmetry factor spelled out. Same fix at each: write the missing constant/symmetry factor explicitly instead of `\sim`.
- [ ] **Write the general dσ^S (and dσ^T) equations as explicit antenna sums**, not just the abstract `dσ^S = Σ S_j · dσ^B` form already at `chapters/02-physics-background.tex:396-401`, and not just the cross-section-level "=" equations already in `eq:nnloCross` (`chapters/02-physics-background.tex:851`). Model: reference paper's eq. 2.5, `dσ^S_NLO = 𝒩 Σ dΦ (1/S) Σ_j X^0_ijk |M_m|^2 J_m`. Once written explicitly for NLO and NNLO, "NLO only needs X₃⁰-type antennae" and "NNLO needs X₄⁰ and X₃¹-type antennae" follow visibly from the sum (single extra parton vs. double-real/real-virtual respectively) instead of needing separate prose assertion — this **replaces/upgrades Task C's motivation paragraph**, do this instead of a purely prose version there.
- [ ] **Add a momentum-mappings discussion — currently essentially absent.** Grepped the whole chapter: "mapping" appears exactly once, at `chapters/02-physics-background.tex:1564`, buried in the massive-extension section, never introduced where it's actually needed. The mapping (reduced on-shell momenta $\tilde p_I,\tilde p_K$ used away from the singular point) is what makes the subtraction well-defined over the *whole* phase space, not just at the unresolved limit — a real content gap, not a wording one. Likely belongs right after the antenna function definition (2.4.1).
- [ ] **Move `subsec:antFamilies` ("Antenna Families and T-Objects") to Chapter 5 — also turned out not to be purely mechanical, now Henrique's.** Checked more than originally planned: it's not just Ch5 that depends on this content. `chapters/03-package-framework.tex:744` and `:288` both cite `\ref{subsec:antFamilies}` and `\ref{eq:cAntTheory}` (an equation inside this subsection) directly. Moving the subsection to Ch5 wouldn't break the build (LaTeX labels resolve across chapters fine), but it would leave Chapter 3 — an *earlier* chapter — pointing forward to Chapter 5 for content it discusses as part of its own build-stage explanation, which reads backwards for a thesis. Needs a judgment call: does Ch3's reference get rephrased to not depend on the exact equation, does a short version of what Ch3 needs stay in Ch2, or is the forward reference just acceptable? Paired with the §2.4 reorder above — both stem from the same underlying question of how much T-object material survives in Ch2 vs. moves wholesale.
- [x] Two of the three original mechanical items already done in the §2.5/§2.6 pass above: the empty `$ $` placeholder and the self-citing footnote at `subsec:phaseSpaceFactor`.
- [ ] Still open from the original pass, unaffected by the above: Eq. `eq:bornNorm` is index-heavy (the likely "Eq. 2.27"); three footnotes within ~130 lines in `subsec:antennaFuncs`/`subsec:colourAlg`; build the compact antenna-taxonomy table modelled on hep-ph/0505111 Table 1 (your version only needs the quark-antiquark rows: A/B/C); consider a simple colour-connection figure per their Fig. 1/2 instead of describing it purely in prose.

### §2.5 / §2.6 (Phase-Space Integration & IBP Reduction; The Massive Extension) — new, 25 Aug 2026; executed 25 Aug 2026

Prof's first paragraph in this batch (§2.4 reorder/exact-equations/mappings/T-objects) is a verbatim repeat of the note already captured above — no new action there.

**Done:**
- [x] §2.5 opening two paragraphs rewritten (Prof's text, adapted to use `\ref{eq:antennaIntegral}` instead of a hardcoded "(2.45)"). The old footnote explaining that "unintegrated" already refers to phase-space integration was removed — its content is now stated directly in the rewritten prose, so it was redundant.
- [x] Sentence fixes applied: "fixed mapped hard-radiator momenta" → "hard-radiator momenta"; "integrated through $\Phi_X$" → "integrated over $\Phi_X$"; "propagator or invariant denominators" → "propagator or Mandelstam invariants $s_{ij}$'s"; "integrand of a single amplitude" → "integrand of an antenna function". Also found and fixed a second instance of the "hard-radiator momenta... fixed" error later in the section ("$\tilde p_\text{hard}$ remains fixed as the hard-radiator combined momenta" → "...is the hard-radiator combined momenta"), confirmed by grep — a third-looking hit ("momenta held fixed during the loop integration...") was checked and left alone, since it's a different, legitimate usage (external momenta being constant with respect to the loop-integration variable, not a claim about hard-radiator momenta being fixed/mapped in general).
- [x] Paragraph below the master-integral-reduction equation rewritten (Prof's text), with the original's "positive vs. non-positive $a_j$" clarification kept as an added final sentence rather than dropped, since it wasn't in Prof's replacement but is genuine content not stated anywhere else.
- [x] Mechanical fixes: the empty `$ $` math-mode placeholder now reads "$SU(3)_c$ generators"; the self-citing footnote (`subsec:phaseSpaceFactor` citing itself) removed outright, since it added no information a reader in that same subsection didn't already have.
- [x] §2.6 "The Massive Extension" relocated wholesale to `appendices/appendixB.tex` ("Supporting Derivations," previously just an empty chapter header) as a new `\section`. Checked first: no `\label` existed anywhere in this section and no other chapter references its content by name or number (grepped Ch3/Ch4/Ch6) — genuinely self-contained, safe to move mechanically. One internal cross-reference inside the moved text ("throughout this chapter") was updated to `Chapter~\ref{ch:physicsbackground}` since it now lives outside that chapter.
- [x] Closing paragraph added at the true end of Chapter 2 (Prof's text, using `\ref{ch:packageframework}`/`\ref{ch:workedexample}` instead of hardcoded chapter numbers), now landing naturally right after §2.5.3 "Master Integrals" since §2.6 no longer follows it.
- [x] **Correction to an earlier claim in this file:** while doing this relocation, an Edit initially clipped one sentence short and left an orphaned fragment at the end of the chapter, which briefly looked like the chapter had always ended mid-sentence. That was wrong — checked against `git show HEAD` and the original text was complete. Both files are now clean; flagging this only so nobody trusts a stray "the file just stops" claim from earlier in this session.

**Still open:**
- [ ] Remove footnote 17. Best guess is `chapters/02-physics-background.tex:1137` in the original numbering (now shifted after the edits above — re-locate it) — "The result shown in Eq.~\ref{eq:bubbleResult} assumes generic..." — but footnote numbering depends on whether the document resets the counter per chapter, so **verify against the actual compiled PDF** before deleting.
- [ ] **Move the entire `subsec:PaVe` "PaVe Reduction" subsection** (~110 lines, including the rank-1 bubble worked example) to the appendix (`appendices/appendixB.tex`, alongside the Massive Extension now there). **Blocked**: needs the new §2.4 to exist first, since the one-sentence forward-reference from wherever the unintegrated $A_3^1$ construction ends up depends on that section being written. Do this after the §2.4 restructuring below.
- [ ] Eq. (2.54): replace `\propto` with the exact equation; fix the $s_{ij}$-vs-$p_a$ inconsistency next to it; bring Eq. (2.60) up next to it and explain external-particle treatment. **(Yours — see below.)**
- [ ] **Remove or relocate §2.6, "The Massive Extension" (`chapters/02-physics-background.tex:1486-1620`), to an appendix.** Same length-control reasoning. Worth noting: this duplicates content already scoped for Ch4 per your own Chapter 1 outline ("the chapter concludes with an exploratory extension of the $A_3^0$ antenna to the massive case") — so trimming this from Ch2 isn't just a length cut, it removes an actual redundancy with Ch4's own massive-extension section, not just Ch2 self-indulgence.
- [ ] **Add a closing paragraph at the end of Chapter 2** connecting the master-integral/IBP-reduction machinery just built to the rest of the thesis — currently the chapter just stops, with no bridge to Ch3/Ch4. Prof supplied text: states that the reduction techniques (IBP via the Laporta algorithm) are the computational tools used throughout the thesis, forward-references Ch3 for the implementation and Ch4 for their application to obtain integrated antenna functions, and closes on the $\epsilon$-pole structure these produce being what NLO/NNLO subtraction actually needs. This is the same "motivation gets diluted" fix as Task C, applied at the chapter's close rather than mid-chapter — don't skip it just because Task C already covers the mid-chapter version, they're different moments in the text.

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

- [x] **DONE** (fixed via the §2.2.1 pass) Chapter 2, footnote after the massless Mandelstam definition: change "as `p_k^2` for any `k`" to "as `p_k^2 = 0` for any `k`".
- [x] **DONE** (fixed via the §2.4 mechanical pass) Chapter 2 colour-algebra introduction: fill the missing group name in "governed by the $ $ generators `T^a`" — now reads "$SU(3)_c$ generators".
- [x] **DONE** — grepped the current source, no remaining "AndCalc" or "framework establish" instances anywhere in `chapters/02-physics-background.tex`.
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
