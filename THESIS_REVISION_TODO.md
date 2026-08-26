# Thesis revision checklist

Consolidated from three independent reviews of the current thesis draft on 17 August 2026.  This is a prioritised working list, not a claim that every item is an established physics error.  Items marked **verify** require comparison with the cited source or a trusted symbolic calculation before changing the thesis.

Known placeholder references to the appendices are deliberately not repeated here, as they are already tracked separately.

## How to read and update this file (protocol for any Claude instance, added 26 Aug 2026)

**This file is the single source of truth, edited by multiple Claude Code sessions over time, not just
whichever one you're in right now.** Treat it accordingly:

- **Always re-read this file fresh at the start of a session and before acting on it, even if you
  remember editing it recently.** Another instance may have advanced it further than your own memory
  of it — the entries below already show this happening in practice (a second session found and fixed
  the real footnote 17 after an earlier session's guess was wrong; re-lettered tasks after one was
  retired; pulled a "Mechanical Pile" out of the whole document, not just the section a prior session
  was focused on). If a memory note or your own recollection disagrees with what's actually in this
  file, **this file wins** — it reflects real edits to real source files, a memory note is a summary
  that can go stale within the same day.
- **If the file (or `memory/thesis-review-antcalc.md`) shows as changed since you last read it,
  that's expected, not an error.** Read the new content, take it as current state, and only push back
  if something in it looks actually wrong on its own merits (a physics claim you can check and
  disagree with, a classification that doesn't hold up) — not just because it differs from what you
  remembered. Don't silently revert another session's work.
- **Task-labelling conventions in use, keep them consistent:**
  - Items requiring Henrique's own composition/judgement (the "Yours" bucket) get single capital
    letters — **A, B, C, ...** — assigned once and kept stable; if an earlier letter gets retired
    (folded into a later task), leave a `~~struck~~` pointer rather than reusing the letter or leaving
    a gap.
  - Purely mechanical items (no physics judgement, no composition, a fix or relocation anyone could
    verify and execute) live in the **Mechanical Pile** section, numbered **Mech-1, Mech-2, ...** in
    roughly execution order. If you find a mechanical item still sitting in its original
    section elsewhere in this file, that's a sign no one's swept it into the pile yet, not that it
    doesn't belong there.
  - When an item is finished, resolved as already-satisfied, found stale, or retired, mark it `[x]`
    (or leave `[ ]` with a clear stale/deferred note — see Mech-6, Mech-9) and **say what actually
    happened**, not just "done" — the entries in this file that hold up best are the ones that record
    what was checked and why, so a later session (or Henrique) doesn't have to re-derive the
    reasoning. If an item duplicates one already resolved elsewhere in the file, mark it done with a
    pointer to where, rather than leaving two copies of the same open task.
  - Before marking anything "Mine"/mechanical and executing it, verify it's actually still mechanical
    against the *current* source — grep for cross-chapter references, check whether a cited equation
    or subsection still means what the task assumes. Several items in this file were reclassified
    from Mine to Yours mid-review after this check turned up a real dependency (`subsec:antFamilies`,
    `subsec:PaVe`, the §2.4 `\sim`-equation fixes) — that reclassify-and-flag discipline is the point,
    not a failure mode to avoid.
- **New Prof. Pires review emails get processed the same way every time**, in order: read the whole
  email before reacting to any single point (check for repeats of earlier feedback first); ground
  every point against the actual current source, including verifying his own technical claims where
  checkable, not just his paraphrase of the text; explain each point back to Henrique in plain terms
  *before* touching any file; classify into Mine/Mechanical vs. Yours and write the result into this
  file as the durable record; then execute Mine items directly (showing the real diff afterward) and
  build Yours items through grounding/worked examples rather than drafting the prose, reviewing
  Henrique's own draft afterward the same way you'd review anyone's. Full version of this protocol,
  plus the working history behind it, is in `memory/mechanical-vs-yours-workflow.md` and
  `memory/thesis-review-antcalc.md` — read those too, but this file's actual task state is authoritative
  over both if they ever disagree.

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
- [x] **Task C — DONE (26 Aug 2026). [Yours]** Resolved as both a convention citation *and* a forward-reference to the existing derivation, rather than either alone — checked first that `subsec:phaseSpaceFactor` (§2.4.4) already derives the recursive factorisation ($d\Phi_3=d\Phi_2\,d\Phi_{ijk}$, $d\Phi_4=d\Phi_2\,d\Phi_{ijkl}$, cited to `Catani:1996vz`), so this was a forward-reference gap, not a missing derivation. Final text: "...as is convention in the antenna-subtraction literature \cite{Gehrmann-DeRidder:2005btv}. The factorisation method used is discussed in Subsection~\ref{subsec:phaseSpaceFactor}, and written in Eq.~\ref{eq:phi2Factor}." Also combined the two previously separate $d\Phi_3$/$d\Phi_4$ equations into one `\split` block under a single new label `eq:phi2Factor` so both could be referenced together. Verified by rendering the compiled PDF (pp. 21–22, 27): citation resolves to `[4]`, both cross-references resolve correctly (Subsection 2.4.4, Eq. 2.45), combined equation renders as one numbered pair. One grammar slip caught in review (a stray "in" — "the factorisation method used **in** discussed in..." ) and fixed.
- [x] Added the coupling-renormalisation paragraph (bare $\alpha_s^0$ vs. renormalised $\alpha_s(\mu)$, $\mu_0$ vs. $\mu$, $\beta_0$, $N=3$, $N_f$); added a citation for $\beta_0$ (`\cite{Ellis:1996mzs,Peskin:1995ev}`). **[Mine]**

### §2.4 (full section) — expanded 25 Aug 2026 after Prof's follow-up note on this section specifically; re-reviewed and split into Task D / Task E on 25 Aug 2026

Prof confirmed §2.4 needs an actual rewrite: confusing, needs more rigour in places, and the subsection order is wrong. Re-checked every item below against the current source on 25 Aug 2026 — all confirmed genuinely non-mechanical, so **all of §2.4 is [Yours]**, none of it automatic. Split into two tasks: **Task D** is the core rewrite, where the sub-items are entangled around one underlying decision (how much T-object content survives in Ch2 vs. moves to Ch5, and how the antenna-sum equations get written once that's settled) — treat as one unit of work so it lands as one commit. **Task E** is the separable readability cleanup, confirmed in the original pass as *unaffected* by the Task D entanglement — it can be done independently, though doing it after Task D means the taxonomy table/figure can reflect the finished §2.4 structure rather than the current one.

**Task D — core §2.4 rewrite (entangled, one commit):**
- [x] **Reorder subsections.** Done earlier in this session (before the transcript segment this file's later entries describe). Verified 26 Aug 2026 against current source, since the checkbox had gone stale: `chapters/02-physics-background.tex:435`, "NLO and NNLO Subtraction Terms," is now the first subsection of §2.4, immediately after `sec:antSubForm` opens at `:415` — matches the planned reorder exactly.
- [x] **Write the general dσ^S (and dσ^T) equations as explicit antenna sums.** Done earlier in this session, same stale-checkbox situation as above. `eq:subTerms` (in the new 2.4.1) gives the abstracted $2C_F\sum_{a(,s)}f_a(N,N_f)X_{ij,(a(,s))}^l\,d\sigma^B$ form for all five terms ($d\sigma^V_\text{NLO}$, $d\sigma^S_\text{NLO}$, $d\sigma^{VV}_\text{NNLO}$, $d\sigma^T_\text{NNLO}$, $d\sigma^S_\text{NNLO}$) — an abstracted alternative to the reference paper's fully-expanded eq. 2.5, chosen because it matches this thesis's actual scope (assembling known antenna combinations, not deriving numerical MC subtraction machinery) — see the session's earlier back-and-forth on this before it landed.
- [x] **Add a momentum-mappings discussion.** Done earlier in this session, same stale-checkbox situation. Verified 26 Aug 2026: present at `chapters/02-physics-background.tex:514-522`, right after the antenna-sum equations, covering the reduced on-shell momenta $\tilde p_I,\tilde p_K$ and explicitly noting the pure-virtual terms ($d\sigma^V_\text{NLO}$, $d\sigma^{VV}_\text{NNLO}$) need no mapping.
- [x] **Move `subsec:antFamilies` ("Antenna Families and T-Objects") to Chapter 5.** Done 26 Aug 2026. `chapters/02-physics-background.tex`'s `subsec:antFamilies` retitled to "Antenna Families" and trimmed to the taxonomy + $B_4^0$/$C_4^0$ definitions only (`eq:cAntTheory` unaffected, stays put). The $T$-object machinery (general $T$-object definition/footnote, `eq:ATypeTObj`, the $A_3^1$/$\breve A_2^2$ NNLO-extension itemize, and the $B_4^0$/$C_4^0$-specific $T$-object equations) moved into `chapters/05-validation-r-ratio.tex`'s §5.2 "Assembly from Integrated Antennae", which now carries a new label `subsec:Tobjects` and opens with the moved definitional content before the pre-existing $R$-ratio assembly equations that actually use it. `chapters/03-package-framework.tex:744` (the `TObject`-build-route reference) retargeted from `\ref{subsec:antFamilies}` to `\ref{subsec:Tobjects}`/Ch5 — see resolution note below. Full clean rebuild confirmed no undefined/duplicate references. **Still open:** the new Ch5 prose is a mechanical transplant, not yet reviewed for flow/continuity in its new home — see the new Ch5-review item added below, to run after the logical-coherence pass on Ch2.
- [x] **Replace the `\sim` equations with exact ones.** Done 26 Aug 2026. Went to the primary literature (Gehrmann-De Ridder, Gehrmann, Glover, hep-ph/0505111, eqs. 2.8/2.10/2.11/2.18/2.19/2.23/2.35) rather than the paraphrase. First equation (`\int_1 d\sigma^S\sim\int d\Phi_{ijkl...}\,X_n^l`): the Born/jet-function piece factors out exactly by the phase-space factorisation, so `eq:sigmaSDef`'s $\sum_\text{unresolved pairs}$ structure carries straight through — now reads `\int_1 d\sigma^S=\sum_\text{unresolved pairs}\left(\int d\Phi_{ijkl...}\,X_n^l\right)d\sigma^B`. Second equation (`eq:antPhaseSpaceFact`): found it was doing two things at once — the $\int d\Phi_{ijkl...}X_n^l=\frac1{\Phi_2}\int d\Phi_n\,X_n^l$ half was already exact (follows directly from `eq:phi2Factor` divided by the constant $\Phi_2$), only the leading "$\mathcal X_n^l\sim$" was inexact, and redundant besides — `eq:antennaIntegral`, two equations later, already states $\mathcal X_n^l$ exactly with the correct $\mathcal N(\epsilon,k)$ prefactor. Dropped "$\mathcal X_n^l\sim$" from the equation and softened the lead-in sentence ("is then rewritten as," not "is then computed as,") to match. One near-miss caught in review: an intermediate edit briefly left `eq:antPhaseSpaceFact` claiming `$\mathcal X_n^l = \frac1{\Phi_2}\int d\Phi_n X_n^l$` outright — contradicting `eq:antennaIntegral`'s `$\mathcal N(\epsilon,k)$` four lines later by a factor of `$C(\epsilon,k)$`. Caught and fixed before it reached the build. Also surfaced, unprompted: `C(\epsilon,k)=(8\pi^2)^k(4\pi)^{-\epsilon}e^{\epsilon\gamma_E}` (`:378`) doesn't actually match the reference paper's own usage at $k=2$ — their NNLO 4-particle case (eq. 2.23) squares the *entire* prefactor including $S_\epsilon$, while their one-loop 3-particle case (eq. 2.35, also nominally $k=2$ under the thesis's own $k=(n-2)+l$) does *not* square $S_\epsilon$ at all, suggesting the correct power might track $(n-2)$ alone, not $k$. Left unresolved and un-fixed — this is the same "unverified 'matches Ch4/Ch5 conventions'" caveat already flagged on `C(\epsilon,k)` in §2.3, now with a concrete literature discrepancy attached, not something to silently patch. Full clean rebuild confirmed after each step.

**Roadmap for Task D (drafted 26 Aug 2026, for execution ~27 Aug) — a proposed shape, not a final decision.** Went through all five current subsections of §2.4 line by line, plus the reference paper's actual §2.1/Table 1 (not just the paraphrase) and every cross-chapter dependency, to ground this. Henrique reacts/adjusts before writing.

*§2.4 intro + `subsec:antennaFuncs` (`chapters/02-physics-background.tex:415-515`) — KEEP, mostly as-is.* The singular-factor factorisation, tree-level antenna definition (`eq:antennaTree`), generalisation to loop antennae, and the $k$-index are all foundational and not T-object content. `eq:bornNorm` (`:503-509`) is the index-heavy equation (Task E, not D). Candidate spot for the reference paper's colour-connection figure (their Fig. 2) — nothing here currently illustrates the $i,j,k\to I,K$ parent/daughter relationship pictorially, it's prose-only.

*`subsec:colourAlg` (`:517-593`) — KEEP as-is.* Colour algebra, Casimir invariants, the leading/subleading/fermion-loop ($N$/$1/N$/$N_f$, i.e. tilde/hat) taxonomy, the four-quark Fierz identity. Not T-object content, no restructuring needed — just the 2 footnotes here that are part of Task E's "three footnotes" trim (`:454` and `:586`; the third is `:476`, also in `subsec:antennaFuncs`).

*`subsec:antFamilies` (`:594-738`) — SPLIT, this is the crux.* Confirmed it bundles two genuinely different things:
  - **(a) Antenna-family letter taxonomy + $B_4^0$/$C_4^0$ definitions** (`:596-664`, including `eq:cAntTheory` at `:641`) — KEEP in Ch2, compress into the Task E taxonomy table (this *is* the content Table 1 in the reference paper compresses). Not what Prof's T-object complaint was about.
  - **(b) The $T$-object machinery itself** (`:666-738`: definitions, the $A_3^1$/$\breve A_2^2$ NNLO extensions, the $B_4^0$/$C_4^0$-specific $T$-object equations `eq:cAntTheory`-derived) — CUT from Ch2, MOVE to Ch5.
  - This split resolves `chapters/03-package-framework.tex:288` (cites `eq:cAntTheory`) for free, since that equation stays in part (a). `chapters/03-package-framework.tex:744` (cites the subsection for the `TObject` build-route explanation) — **resolved 26 Aug 2026:** retargeted to `\ref{subsec:Tobjects}` in Ch5 rather than rephrased away. Accepted as a legitimate forward reference: Ch3 describes the `TObject` function's build route (assembling Ch2 antennae per the method now formally defined in Ch5), and that assembly method genuinely isn't defined in prose until Ch5, for the same reason Prof gave for moving it out of Ch2 in the first place. Left unrephrased rather than softened, since the earlier concern (Ch2 pointing forward to Ch5) doesn't reapply the same way here — Ch3 explaining an API call whose full definition comes later is ordinary technical-writing practice, not the "reads backwards" problem Prof flagged.

*`subsec:phaseSpaceFactor` (`:739-841`) — KEEP the antenna phase-space factorisation and `eq:antennaIntegral`/`eq:phi2Factor` machinery.* The closing "Implications on the $T$-objects" subsubsection (`eq:integratedT`) — **done 26 Aug 2026**, cut from Ch2, landed in Ch5's `subsec:Tobjects` (see the destination-history entry below). This is also the natural place for the new momentum-mappings material (Task D item 3) — still open.

*`subsec:nloAndNnloSubtraction` (`:842-941`) — DISSOLVES as a standalone subsection.* Front two-thirds (`:842-909`: why $d\sigma^S$/$d\sigma^T$ are needed, the NLO/NNLO cross-section splits, the exactness argument specific to this process) is genuine motivation — becomes the new, un-subsectioned **opening of §2.4** (mirroring the reference paper's own §2.1, which isn't subdivided either). Needs real rewriting, not cut-and-paste: it currently opens "So far... we have discussed what antenna functions are..." — a recap framing that assumes antenna functions were already introduced. Once this opens the section instead, that framing inverts to a preview ("we will build...", not "we have built..."). This is also where the new explicit $d\sigma^S$/$d\sigma^T$ antenna-sum equations (Task D item 2) land, right where "NLO only needs $X_3^0$-type, NNLO needs $X_4^0$/$X_3^1$-type" gets to follow visibly from the sum, exactly as Prof asked. Back third (`:910-941`: the $T$-object-heavy rewriting of $\sigma^\text{NLO}$/$\sigma^\text{NNLO}$, `eq:nnloCross`) — **resolved for free, checked 26 Aug 2026**: this was never carried over verbatim during drafting. The current `eq:nnloCross` (`chapters/02-physics-background.tex:460`) is already the clean, antenna-based form written for Task D item 2, not the old $T$-object version. Nothing to cut here.

*Destination history, 26 Aug 2026 — tried Appendix B, reverted the same day.* Ch2's own $T$-object content (`tab:sigmaByOrder`'s column, the "Implications" subsubsection) was cut and, together with the `subsec:Tobjects` block already sitting in Ch5 from the earlier `antFamilies` move, relocated wholesale to a new `appendices/appendixB.tex` section, "The $\mathcal T$-Object Notation." Reasoning at the time: $T$-objects are a derived notation, not independent physics, and Ch5's own text already reaches the correct final $R$-ratio result via the antenna-only form, so nothing physical is lost keeping them out of the main narrative anywhere.

**Reverted after further discussion with Henrique, same day — his point, on reflection correct.** The $T$-object form of the $R$-ratio equation groups terms by *final-state topology* ($\mathcal T_{q\bar q}^4$, $\mathcal T_{q\bar qg}^4$, $\mathcal T_{q\bar qq\bar q}^6$, ...), which is exactly what motivates "why these particular terms, at this order" — the antenna form groups by colour structure instead, essential for computation but not as direct an answer to that question. Since the $T$-object *equation* genuinely earns its place in Ch5's main argument, splitting its *definition* into an appendix would recreate the same "notation used before it's defined" problem this whole exercise exists to fix, just one level down (Ch5 using $T$-objects with the definition sitting in an appendix, instead of Ch2 using them with no definition at all). Also a more literal reading of Pires's own conditional after all — his "if useful, move to Ch5" test comes back *positive*, not negative as first assessed, once the topology-grouping argument is accounted for.

**Net result: back to the state documented in the `Move subsec:antFamilies` entry above, plus `eq:integratedT` joining it.** Ch2 stays fully clean (that part of the appendix attempt was correct and stands). The full $T$-object narrative — general definition, `eq:ATypeTObj`, the two NNLO extensions, the $B_4^0$/$C_4^0$ $T$-objects, and now also `eq:integratedT` (newly joining on this pass) — lives in `chapters/05-validation-r-ratio.tex`'s `subsec:Tobjects`. `chapters/03-package-framework.tex:804`'s reference points there again. Full clean rebuild confirmed after the revert; `appendices/appendixB.tex` shows no net diff from before the appendix attempt.

**Still open:**
- `chapters/05-validation-r-ratio.tex` — the pacing/coherence review flagged when the `antFamilies` split first landed (see the `Item added 26 Aug 2026` entry below) still applies, now covering a slightly larger block since `eq:integratedT` joined it on this second landing.
- Chapter 3's own T-object-heavy sections (§3.3.2, §3.3.3, §3.5.4, §3.6 — see the scope-extension note below) — untouched. Same kind of call as before: how much moves to Ch5 outright vs. gets trimmed to a light pointer, still entangled with Tasks O and P. Destination is Ch5 again, not the appendix.

*Net effect on length:* §2.4 goes from 5 subsections to roughly 4 (intro+`antennaFuncs`, `colourAlg`, compressed `antFamilies`, `phaseSpaceFactor`), loses ~180 lines of T-object content to Ch5, gains the new explicit-sum equations and mapping discussion (a few paragraphs) and, separately via Task E, the taxonomy table replacing prose. Should net out similar length or shorter than today, not longer — consistent with Prof's own "couple of pages" reference-paper anchor.

*Final item, added 27 Aug 2026, deliberately deferred to the very end of Task D (and, if needed, Task E) — a systematic logical-coherence and cross-reference pass.* Not a re-read; a checklist pass once the structure has actually stopped moving: grep every `\ref{}`/`\label{}` touched by the restructuring and confirm each resolves to content that still makes sense in its new position; separately scan for "as described above/below"-type phrasing left pointing the wrong way after a move. Deferred deliberately rather than skipped — doing this mid-restructuring means doing it again after every subsequent move, so it only gets done once, after everything else in Task D (and Task E, if the two end up finishing close together) has landed.

*Item added 26 Aug 2026, once the `antFamilies` split landed — review the Ch5 $T$-object content and run a logical-coherence/pacing check on Chapter 5.* The `subsec:Tobjects` block (`chapters/05-validation-r-ratio.tex`, now also including `eq:integratedT`) is a mechanical transplant from Ch2, not yet reviewed as Ch5 prose: it still opens with "As described in Subsection~\ref{subsec:colourAlg}..." — phrasing written for a reader arriving straight from `subsec:colourAlg` in Ch2, not one arriving at Ch5 after three intervening chapters — and the whole block was written to *introduce* antenna machinery, whereas by Ch5 the reader has long since met it, so tone/pacing may now be off. Also check how it sits against the *existing* Ch5 material immediately after it (the $R = \dots$ assembly equations) — there may be overlap or a register jump between the transplanted definitional prose and the pre-existing assembly walkthrough. **Sequencing unchanged: run this only after the systematic logical-coherence and cross-reference pass on Chapter 2 (the item directly above) is done** — Ch2's pass may still trigger further edits upstream of this block.

**Task E — §2.4 readability cleanup (separable from Task D, can be done independently):**
- [x] Two of the three original mechanical items already done in the §2.5/§2.6 pass above: the empty `$ $` placeholder and the self-citing footnote at `subsec:phaseSpaceFactor`.
- [ ] Eq. `eq:bornNorm` is index-heavy (the likely "Eq. 2.27") — simplify.
- [ ] Three footnotes within ~130 lines in `subsec:antennaFuncs`/`subsec:colourAlg` — trim/merge.
- [ ] Build the compact antenna-taxonomy table modelled on hep-ph/0505111 Table 1 (your version only needs the quark-antiquark rows: A/B/C).
- [ ] Consider a simple colour-connection figure per their Fig. 1/2 instead of describing it purely in prose.

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

**Still open — re-reviewed and relettered 25 Aug 2026:**
- [x] Remove footnote 17. **→ DONE via the Mechanical Pile, Mech-1.** See that entry — the earlier guess at which footnote this meant was wrong; resolved against `PROF_PIRES_COMP_REVIEWS.md` and fixed for real.
- [ ] **Task F — Eq. (2.54): replace `\propto` with the exact equation; fix the $s_{ij}$-vs-$p_a$ inconsistency next to it; bring Eq. (2.60) up next to it and explain external-particle treatment. [Yours]**
- [ ] **Task G — Move the entire `subsec:PaVe` "PaVe Reduction" subsection** (~110 lines, including the rank-1 bubble worked example) to the appendix (`appendices/appendixB.tex`, alongside the Massive Extension now there). **[Yours — reclassified during this review.]** Originally scoped as a mechanical relocation like the Massive Extension move, but this review found `chapters/03-package-framework.tex:296` ("reduction using PaVe, as described in Subsection~\ref{subsec:PaVe}") citing this subsection directly by label — the same earlier-chapter-points-forward problem that made the `antFamilies` move (Task D) non-mechanical. Needs the same kind of judgment call: rephrase Ch3's reference, or accept the forward pointer into the appendix. **Blocked** until Task D exists, since the one-sentence forward-reference from wherever the unintegrated $A_3^1$ construction ends up depends on that section being written.
- [x] **DONE — duplicate, already completed above.** Original text: "Remove or relocate §2.6, 'The Massive Extension'... to an appendix." This is the same action as the §2.6 relocation already logged as done earlier in this file — confirmed against the current source: `grep`-ing for "Massive Extension" across `chapters/` and `appendices/` finds it only in `appendices/appendixB.tex`, never in Chapter 2. Already done; this entry had just never been marked off.
- [x] **DONE — duplicate, already completed above.** Original text: "Add a closing paragraph at the end of Chapter 2... forward-references Ch3... and closes on the $\epsilon$-pole structure..." This is the same closing paragraph already logged as done earlier in this file — confirmed against the current source: Chapter 2's final paragraph already forward-references Ch3/Ch4 and closes on exactly the $\epsilon$-pole-structure point described here. Already done; this entry had just never been marked off.

### Still pending
- [ ] Prof said corrections for the remainder of Chapter 2 (beyond §2.4.2) are coming later this week — re-open this section when they arrive.

## Chapter 3 review — Prof. Pires, received 26 Aug 2026

Full-chapter review of `chapters/03-package-framework.tex`, grounded against the current source before
classifying (line numbers below refer to that file as of this pass). One point is a **repeat with
extended scope**: the "move T-objects out" note already tracked as Task D (Ch2) turns out to apply to
Chapter 3 too — see the Task D extension below, not a new task. Section numbers in Pires's email drift
slightly from the compiled numbering in places; items below are matched by content, not by his stated
number.

**[Mine] — DONE (26 Aug 2026).** All items below executed in one pass directly on
`chapters/03-package-framework.tex`, `references.bib`. Full clean rebuild confirmed afterward
(`latexmk -pdf -gg`, 4 pdflatex passes + biber): no undefined references, no undefined citations,
no LaTeX errors — every new `\ref{}` added below (to `eq:antennaIntegral`, `sec:dimreg`,
`eq:expansionOrderDiag`, `tab:twoLoopProdModes`, `ch:workedexample`) resolves correctly, and the
two new bibliography entries (`PackageX`, `FeynHelpers`) compile and cite correctly. Individual
items:
- [x] Opening 3 paragraphs (`:1-27`): footnote the GitHub link, state AntCalc was built from scratch
  for this thesis (supplied text); swap the FeynCalc/LiteRed2 sentence for the tighter supplied version;
  swap the "Experimental routes" sentence for the supplied version.
- [x] §3.1 opening objective sentence (`:40-41`) — supplied replacement (names "antenna subtraction
  method" instead of vague "antenna calculations").
- [x] §3.1 PaVe-reduced example sentence (`:45-46`) — supplied replacement describing $X_3^1$ via
  Passarino-Veltman reduction into scalar one-loop functions.
- [x] §3.1 `IntegrateAntenna` default-truncation sentence (`:47-51`) — supplied replacement naming the
  NLO/NNLO antennae explicitly.
- [x] §3.1 "Using route profiles..." grammar fix (`:61-63`) — supplied replacement.
- [x] §3.1 tier itemize (`:69-83`) → table, per Pires's sketch. Populate the full antenna list
  (already present in the current itemize) into the table columns he specified
  (Perturbative Order / Antenna / Status), plus his connecting sentences before and after.
- [x] §3.2 route-key example (`:96-103`) — supplied replacement naming "leading-colour"/"subleading-colour"
  explicitly instead of bare "leading"/"subleading".
- [x] §3.2 renormalisation cross-reference: add a pointer to `\ref{sec:dimreg}` (Section 2.3) alongside
  the existing `\ref{eq:alphaRescaling}` citation, in both the $A_3^1$ (`:333`) and $A_2^2$ (`:422`)
  UV-renormalisation paragraphs — label already exists, this is a straightforward addition, not a new
  derivation.
- [x] §3.3 build-stage opening paragraph (`:171-177`) — supplied replacement.
- [x] §3.3 loop-order-dispatcher sentence (`:192-196`) — supplied replacement (fixes the physics: tensor
  reduction of loop-momentum dependence, not "reduction of the loop momenta").
- [x] §3.3.2 "These antenna functions also differ..." grammar fix (`:303`) — supplied replacement.
- [x] §3.4 full section: rename to "From the Build Stage to Integration", replace the whole paragraph
  (`:448-460`) with the supplied text.
- [x] §3.5 opening paragraph (`:464-469`) — supplied replacement; resolve the placeholder
  "equation (X.YY)" to `\ref{eq:antennaIntegral}` (Ch2, the antenna phase-space integral definition).
- [x] §3.5.1 $A_2^1$-exception sentence (`:507-509`) — supplied replacement (Passarino-Veltman wording).
- [x] §3.5.1 Table `tab:intModes` "Current Route" column (`:518-523`): these are *integrated* routes,
  so the antenna symbols should be calligraphic ($\mathcal A_2^1$, etc.), matching the convention used
  everywhere else once an antenna is integrated — currently plain-letter, inconsistent with its own
  table's subject.
- [x] §3.5.1 closing paragraph (`:530-536`) — supplied $B_4^0$-example replacement, plus the new
  forward-reference to Chapter 4 for the master-integral basis.
- [x] §3.5.2 heading "PaVe Route" → "Passarino-Veltman Route"; opening paragraph (`:542-550`) — supplied
  replacement. Needs a real citation for Package-X/FeynHelpers where the text says "(add reference)" —
  not currently in `references.bib` (checked); source and add the correct entries rather than leave a
  placeholder (likely Patel 1503.01469 for Package-X, Shtabovenko 1611.06793 for FeynHelpers — verify
  before citing, don't transcribe from memory).
- [x] §3.5.2 IBP Route paragraph (`:554-567`) — supplied replacement, keeps the existing
  `\ref{sec:integration}` citation.
- [x] §3.5.3.1 "Expansion Order" subsection (`:612-619`) — supplied replacement.
- [x] §3.5.3.1 comment below `eq:expansionOrderDiag` (`:628-632`) — supplied replacement (fixes the
  apparent self-contradiction about literature validation); use `\ref{eq:expansionOrderDiag}` instead
  of the hardcoded "(3.15)".
- [x] §3.5.4 title → "Reconstruction of Colour Components"; first paragraph (`:634-647`) — supplied
  replacement. **Stop there** — the rest of this subsection (`:649-673`, the $\mathcal T_\text{Lead}$
  etc. content) is T-object material now in scope for the Task D extension below, not this pass.
- [x] §3.5.5 opening paragraph (`:676-679`) — supplied replacement; resolve "Table 3.4" to
  `\ref{tab:twoLoopProdModes}` (the two-loop contributions table in §3.3.3 — not `tab:intModes`, which
  is a different table also numbered 3.4 in his draft numbering).
- [x] §3.6 opening sentence (`:694`): name the two canonical functions explicitly —
  `\texttt{BuildAntenna}` and `\texttt{IntegrateAntenna}` — instead of "the two canonical functions".

**New Mechanical Pile items (sweep across the whole thesis, not just Ch3):**
- [x] **Mech-19 — DONE for Chapter 3 (26 Aug 2026).** "PaVe" → "Passarino-Veltman" wherever it named
  the reduction method in running prose: fixed all 5 remaining prose instances in Ch3 (the
  `AntennaReductionProfile`/`ReductionProfile` walkthrough at `:128,175,313`, the `tab:intModes`
  backend-name cell, and the `IntegrateAntenna[...]` workflow pseudocode's "IBP/PaVe reduction" line).
  Left the `subsec:PaVe` LaTeX label itself untouched, correctly — it's an internal identifier, not
  rendered text. **Not yet done in Chapter 2** — `subsec:PaVe`'s own prose still says "PaVe" throughout;
  deliberately left alone since that whole subsection is mid-relocation per Task G and would need the
  same fix regardless of where it ends up — do it once, as part of executing Task G, not twice.
- [x] **Mech-20 — DONE for Chapter 3 (26 Aug 2026).** "leading"/"subleading" (unqualified) →
  "leading-colour"/"subleading-colour" in running prose: fixed the `{A,3,1}` route-key example and the
  $A_3^1$-vs-$A_4^0$ comparison sentence in §3.3.2. Left alone, correctly: the literal code/option
  identifiers `Leading`/`SubLead`/`Subleading` (`Component->Subleading`, the `\texttt{}` profile-field
  names, the $X_\text{Lead}$/$X_\text{SubLead}$ subscripts) — these name actual package internals, not
  prose, and renaming them would misrepresent the code; and the generic "the subleading component" in
  §3.6, which reads unambiguously in its own context. **§3.3.1 (Tree-Level Routes) not swept** — that
  whole subsection is Task J territory (entangled terminology rewrite), left for that pass. **Ch2 not
  checked yet** — flagged, not done.
- [x] **Mech-21 — DONE (26 Aug 2026).** Added `PackageX` (Patel, Comput. Phys. Commun. 197 (2015)
  276-290, arXiv:1503.01469) and `FeynHelpers` (Shtabovenko, Comput. Phys. Commun. 218 (2017) 48-65,
  arXiv:1611.06793) to `references.bib` — verified via live web search against arXiv/ADS before adding,
  not transcribed from memory, since neither existed in the bibliography yet. Cited from the new
  Passarino-Veltman Route paragraph in Ch3. Confirmed resolving correctly in a full rebuild.

**New Yours tasks (continuing the letter sequence from Task G):**
- [ ] **Task H — §3.1, "Higher-order terms in the ϵ-expansion can be obtained through the options
  described above" (`:52-53`).** Pires flagged this as unclear — no specific option was actually named
  above it. Decide: cut the sentence, or point to the real option (`ExpansionOrder`, introduced later
  in §3.5.3.1) — either needs a judgment call about what this paragraph should promise this early.
- [ ] **Task I — Add an equation to the `AntennaProfile[{A,2,1}]` discussion (`:149-167`)** clarifying
  what `TreeAmplitude`/`BornInterference` actually compute for $A_2^1$ — Pires's suggestion, not
  supplied text; needs deciding which equation belongs here (likely `eq:treeLoopInterf`, already defined
  later at `:325-328`, or a purpose-built normalised version) and how it interacts with that later
  definition.
- [ ] **Task J — Full rewrite of §3.3.1 "Tree-Level Routes" (`:209-290`), entangled, several linked
  issues:** (a) "self-interference"/`BornInterference` terminology is confusing at tree level, since
  there's no actual interference except for $C_4^0$ — Pires wants "squared matrix element" in prose
  while the code field itself stays named `BornInterference` (can't rename the code); (b) the $B_0$
  letter clashes with the $B_4^0$ antenna — Pires suggests replacing the prose definition with the
  actual normalisation equation from hep-ph/0505111 eq. (3.2) directly (ground against
  `thesis_docs/pdfs/0505111v3.pdf` before writing); (c) "Leading"/"Subleading" needs the physical
  explanation — that $A_4^0$'s two-quark-two-gluon process generates exactly two colour terms ($N$,
  $1/N$) from its own colour algebra, not just named coefficients; (d) "profile-defined sectors" is
  internal package language and needs an actual physical definition of what a sector is; (e)
  "colour-independent" → "colour-stripped" (Pires: current wording is physically wrong, not just
  informal); (f) the $B_4^0$ description ("primary-current sector has been self-interfered") needs to
  state plainly whether this is an interference or a squared amplitude. One commit, not split — the
  paragraphs share the same terminology decisions throughout.
- [ ] **Task K — One-loop routes (§3.3.2, `:292-364`):** clarify "the components extracted" (`:302`,
  which components, and when there are none vs. three); add the missing antenna-definition equation
  (hep-ph/0505111 eq. 3.3-style) before the $T_\text{Lead}$/$T_\text{Sublead}$/$T_\text{QL}$ discussion
  so the later decomposition is motivated rather than dropped in; and the "using PaVe... as described in
  the appendix" cross-reference (`:296`) is **blocked on Task G** (the `subsec:PaVe`→appendix move isn't
  executed yet).
- [ ] **Task L — Two-loop $A_2^2$ (§3.3.3, `:366-434`): explain physically why $A_2^2$ has four
  components** (the two-loop quark form factor for $\gamma^*\to q\bar q$, split by the two distinct
  interference contributions) — currently just asserted, not derived or motivated. Pires separately
  raised, here and previously in conversation, that **Feynman-diagram figures for the antenna types
  themselves** ($A_2^2$, $A_2^1$, $C_4^0$, $A_3^1$, ...) would make the physical process each symbol
  represents legible to a reader who doesn't already know the antenna-subtraction literature — this is
  a bigger scope item, ties into the existing "expand the worked example" bullets in Section 4 below;
  treat as one open item rather than duplicating it there.
- [ ] **Task M — §3.5.3 "Normalisations and Convention Bridge" (`:571-608`), including `tab:GkNorm`.**
  Pires: this section doesn't explain why some routes need extra multiplicative factors and others
  don't, and an examiner won't care about the mechanics of an $8\pi^2\cdot e^{\epsilon\gamma}$-type
  factor — he explicitly suggested cutting it if a clear rewrite isn't achievable. Genuine editorial
  judgment call: rewrite around simple equations, or remove and fold anything essential elsewhere.
- [ ] **Task N — §3.5.1 "The $A_2^2$ exception" sentence (`:506`).** Needs one explanatory clause tying
  back to the two-source-contribution split already established in §3.3.3 (Task L) — smaller than the
  others, but still requires composing the connective explanation, not a supplied swap.
- [ ] **Task O — §3.7 "Validation and Development Diagnostics" (`:785-930`) — move to Chapter 5, per
  Pires.** Looked mechanical at first (same shape as the Massive Extension move), but checking cross-
  chapter references first (per the established red-flag rule — see
  `memory/mechanical-vs-yours-workflow.md`) found `chapters/06-future-work.tex:43` citing
  `\ref{subsec:wardAndRelease}` directly — the Ward-identity validation subsection inside this block is
  referenced forward from Ch6. **Reclassified Yours** for that reason alone, same pattern as Task D
  (`antFamilies`) and Task G (`subsec:PaVe`): needs a judgment call on whether to rephrase Ch6's
  reference or keep the forward pointer into Ch5.
- [ ] **Task P — §3.6 "Higher-Level Functions" (`:692-783`) — condense.** Pires: replace the long prose
  walkthrough of each of the five functions with the 1-2 line description already itemised, using his
  supplied one-liners as a starting point. Entangled with the Task D extension below, since the
  `TObject`/`BuildRRatio` descriptions here overlap with T-object content moving to Ch5 — do after that
  lands so the compressed description doesn't have to be rewritten twice.

**Task D — scope extension (repeat of the "T-objects belong in Ch5" note, now covering Chapter 3 too):**
Pires repeated the instruction explicitly for Ch3: the whole $\mathcal T$-object description belongs in
Chapter 5, not Chapter 3 either. This is the same underlying decision as the Ch2 T-object move already
tracked as Task D, not a new task — but it now also covers: §3.3.2's $T_\text{Lead}$/$T_\text{Sublead}$/
$T_\text{QL}$ interference-decomposition content (`:330-360`); §3.3.3's $T_{q\bar q}^6$ assembly
(`:436-446`); §3.5.4's $\mathcal T$-object equations, the "why already UV renormalised" question, and
the `ReturnTTerms` option (`:649-673`, everything after the first paragraph already scheduled as Mine
above); and §3.6's `TObject` function description and `tab:TObject` (`:742-773`, feeding into Task P).
Resolve as one decision alongside the rest of Task D's Ch2 roadmap — don't draft the Ch3 side of this
independently, since how much of this Ch3 content is a light forward-reference versus needs to move
wholesale depends on where the destination ends up.

**Update, 26 Aug 2026: the destination is Chapter 5** (`subsec:Tobjects` in
`chapters/05-validation-r-ratio.tex`) — briefly moved to `appendices/appendixB.tex` the same day, then
reverted (see Task D's "Destination history" entry above): the $T$-object form of the $R$-ratio equation
genuinely earns its place in Ch5's main argument, so its definition belongs there with it, not in an
appendix. That still resolves the "don't draft independently" blocker above: the Ch3 side can now be
scoped against a concrete, stable target. Still genuinely open, still Henrique's call — how much of
§3.3.2 (`:330-360`), §3.3.3 (`:436-446`), §3.5.4 (`:649-673`), and §3.6 (`:742-773`, `tab:TObject`) moves
to Ch5 outright versus gets trimmed to a short pointer at `\ref{subsec:Tobjects}`. Not executed this
session — flagged, not touched.

## Mechanical Pile — [Mine], reassigned 26 Aug 2026

Full sweep of the entire checklist (not just Section 0) on 26 Aug 2026, pulling out every item confirmed genuinely mechanical — no physics judgement, no composition, no editorial call Henrique needs to own — and renumbering them **Mech-1** through **Mech-18** in roughly the order they'll get executed. Everything left behind in its original section (Sections 1–6 below, plus Tasks C/D/E/F/G above) stays **[Yours]** or **verify**, confirmed deliberately rather than by default. Two items outside either pile — confirming title-page details with the supervisors, and getting a subject-matter reader's sign-off — need another person, not either of us, so they're left where they were.

- [x] **Mech-1 — DONE (26 Aug 2026).** Originally logged as "remove footnote 17," and originally misidentified: the compiled PDF at the time showed a footnote numbered 15 ("assumes generic kinematics with $p^2\neq0$...") that content-matched a footnote-17-shaped gap, but no reasoning for removing *that one* survived anywhere in this file's history, and its content read as a genuine caveat rather than cruft — so execution was paused pending confirmation. Henrique then added `PROF_PIRES_COMP_REVIEWS.md`, Prof's original notes in full. Cross-checked against a `pdftotext` dump of the *pre-revision* `main.pdf` (via `git show fb22fdb^:main.pdf`) and found the real footnote 17 two footnotes earlier than the one first suspected: "The inversion in Eq.~2.71 assumes a non-singular Gram matrix. Exceptional kinematics may require a limiting procedure or an alternative reduction method," attached to the Lorentz-decomposition-coefficients sentence in the PaVe rank-one-bubble derivation. Prof's note confirms the removal directly. Removed the `\footnote{...}` at what is now `chapters/02-physics-background.tex:1120` (in the pre-edit numbering; kept the sentence grammatical — "...by taking," now leads straight into `eq:gramInversion`). The footnote 15/"assumes generic kinematics" one that was originally suspected was never actually asked for removal (it's footnote 18 in Prof's own copy) and was correctly left alone.
- [x] **Mech-2 — DONE (26 Aug 2026).** "Twice ... plus one" conflicted with the displayed exponent $2(k+1)=2k+2$ — checked against $T^2/T^4/T^6$ at LO/NLO/NNLO ($k=0,1,2$) to confirm $2(k+1)$ is the correct reading. Reworded the footnote at `chapters/02-physics-background.tex:669` to "our previous $k$-index... incremented by one and then doubled, $2(k+1)$."
- [x] **Mech-3 — DONE.** `c\sigma^{RV}`→`d\sigma^{RV}` was already fixed in an earlier pass (confirmed via git history — predates this review cycle). The "As an example" half was real: `chapters/02-physics-background.tex:908` literally began mid-word, "an example, $\sigma^\text{NNLO}$..." — added the missing "As ".
- [x] **Mech-4 — Already satisfied, no change needed.** No `>>`/`<<` remain anywhere in Chapter 2 math mode (already fixed in an earlier pass). The one remaining `<<` in the whole thesis (`chapters/03-package-framework.tex`) is `<<AntCalc\`` — genuine Wolfram Language package-load syntax inside a `\texttt{}` code listing, not a math-mode inequality — correctly left alone.
- [x] **Mech-5 — DONE.** Confirmed against the thesis's own convention (`chapters/02-physics-background.tex:948` explicitly defines "loop-level antennae ($l\geq1$)"): the footnote at line 809 said "$l\geq0$... which happens for all loop antennae by definition" right after a sentence excluding $l=0$ — inconsistent with itself. Corrected to $l\geq1$.
- [x] **Mech-6 — Stale, not executed; premise didn't match the source.** The actual source at `chapters/04-worked-example.tex:1121` (the $\hat A_2^2$ finite term) reads `72\zeta_3`, not `72\zeta_2` — and $\zeta_3$ appears consistently across all four bracket terms in that same result (standard NNLO transcendental, not a one-off). No `zeta_2` exists anywhere in the thesis. This was evidently already fixed independently before this review cycle; touching it on the stale "72 zeta_2" premise would have risked introducing an actual error into a real physics result.
- [x] **Mech-7 — DONE.** Removed the duplicate `\cite{TM_JoanaReis}` right after its own footnote at `chapters/04-worked-example.tex:9-12` (cited once inside the footnote, then redundantly again immediately outside it). Corrected "Källen" → "Källén" at line 153.
- [x] **Mech-8 — Already satisfied, no source change needed; verified via full rebuild.** `preamble.tex`'s `\hypersetup` already had `colorlinks=true`, all link/cite/url colors set to black, and `pdfborder={0 0 0}` — functionally equivalent to `hidelinks`. Ran a full `latexmk`+`biber` rebuild and visually checked the Table of Contents (rendered page, all links) — no colour boxes anywhere.
- [ ] **Mech-9 — Remove "Versão Provisória" from the title page.** **Deferred — do not execute yet.** Only do this when actually preparing the final submitted version; running it now would be premature.
- [x] **Mech-10 — Already satisfied, no change needed; confirmed via rebuild.** Checked `chapters/03-package-framework.aux` after a full rebuild: `fig:higher-level` resolves to `{3.9}{55}`, exactly as expected — not pointing at the Future Work figure.
- [x] **Mech-11 — DONE.** Standardised to the canonical forms the item itself specifies. Fixed: 3× missing `~` in `Eq.\ref{}` (ch2:908, ch3:217, ch3:628 — the last two are exactly the "expansion-order"/`eq:expansionOrderDiag` area flagged); 1× missing `~` in `Fig.\ref{}` (ch3:644, the "component-extraction" area, also flagged specifically); 2× `Figure~\ref{}`→`Fig.~\ref{}` (ch3:29, ch4:564); 1× `Sec.~\ref{}`→`Section~\ref{}` (ch4:862). Appendices were already clean.
- [x] **Mech-12 — Already satisfied, no change needed.** Grepped for any `\cite{}\cite{}` (adjacent, any spacing/punctuation) across every chapter and appendix — zero matches. Every multi-source citation already uses the combined `\cite{a,b}` form.
- [x] **Mech-13 — Already satisfied, no change needed.** No `\textcolor{red}{...}` instances remain anywhere in the thesis.
- [x] **Mech-14 — DONE.** Found 10 instances of the manual slash hack `/\!\!\!X` across `chapters/04-worked-example.tex` (lines 618, 630–631, 648–651, 697, 871, 873 — the $A_3^0$/$A_2^0$ amplitude derivations), none of which the earlier search caught due to a regex-escaping miss. Converted all to `\slashed{X}` (`\slashed{k_1}`, `\slashed{\varepsilon}^*(k_3)`, etc.). Rebuilt and visually confirmed the Feynman-slash strokes render correctly (p. 70–71).
- [x] **Mech-15 — DONE, scope extended.** Fixed the 1 literal tilde-scope instance, plus 12 more of the *identical* bug under `\hat{}` and `\breve{}` (same root cause — the accent macro wrapping the whole `\mathcal A_n^l` including sub/superscripts instead of just the base letter) across `chapters/02-physics-background.tex`, `03-package-framework.tex`, and `05-validation-r-ratio.tex` — flagging this extension explicitly since the item as written only named "tilde." All now read `\tilde{\mathcal A}_3^1` / `\hat{\mathcal A}_2^2` / `\breve{\mathcal A}_2^2` style.
- [x] **Mech-16 — Narrowed after investigation; one real fix, two false positives.** "Wolfram Language" (1 instance, ch3 opening sentence, "an active research Wolfram Language package") is technically correct as written — Wolfram's own terminology distinguishes the language from the Mathematica front-end — left alone rather than forced to match the more casual majority usage. "build-side" vs. "Build Stage/build stage" turned out not to be a real inconsistency either: "build-side" is used only as an adjective, "Build Stage" only as the section-title noun phrase (matching the equivalent "Integration Stage" pattern) — genuinely different grammatical roles, not free variation. "master integral" vs. "MI" is the standard define-then-abbreviate pattern, not an inconsistency. The one real finding: 5 instances of "Build stage" (capital B) in running prose in `chapters/03-package-framework.tex`, inconsistent with the lowercase body-text convention used everywhere else (including the one already-correct "build stage" instance and every "integration stage" instance) — fixed all 5 to lowercase, left the actual `\section{The Build Stage}` title untouched.
- [x] **Mech-17 — Already satisfied, no change needed.** Both citations already exist in `references.bib` with exactly the bibliographic details requested (Alwall et al. JHEP 07(2014)079/arXiv:1405.0301 for MadGraph; Huss et al. SciPost Phys. Codebases 69 (2026) for NNLOJET — the published-venue form, which the item explicitly allowed for), already cited at `chapters/06-future-work.tex:49,51`, and the surrounding prose already frames both as proposed future connections ("could allow us to... enable...") rather than implying either is currently part of AntCalc.
- [ ] **Mech-18 — Final build & QA sweep (do last, near submission).** Consolidates three near-duplicate QA bullets originally scattered across Sections 1/3/6: run a clean build from scratch with Biber and resolve every warning; confirm the final compile has no undefined references or citations, visually checking Chapter 5 and all front matter; check the table of contents, lists of figures/tables, page numbering, captions, bibliography, and PDF metadata; do a final end-to-end visual pass (link borders absent, no empty reference boxes, code blocks/long equations/tables/workflow diagrams readable at normal print size).

## 1. Submission blockers

- [ ] Write the Portuguese **Resumo** and English **Abstract**.  Both are currently placeholders.
- [ ] Fill the four appendices, or temporarily remove their headings from the compiled thesis.  Their bodies currently contain placeholders.
- [x] ~~Remove visible PDF link borders...~~ **→ DONE (already satisfied) via the Mechanical Pile, Mech-8.**
- [ ] ~~Complete a final compile with no undefined references or citations...~~ **→ folded into Mech-18 in the Mechanical Pile.**
- [ ] ~~Remove "Versão Provisória" from the title page...~~ **→ moved to the Mechanical Pile as Mech-9 (deferred).**

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
- [x] ~~Chapter 2, footnote on `T^{2(k+1)}`...~~ **→ DONE via the Mechanical Pile, Mech-2.**
- [x] ~~Chapter 2: correct `c sigma^{RV}` to `d sigma^{RV}`...~~ **→ DONE via the Mechanical Pile, Mech-3.**
- [x] ~~Chapter 2: replace `>>` and `<<`...~~ **→ DONE (already satisfied) via the Mechanical Pile, Mech-4.**
- [x] ~~Chapter 2, footnote concerning loop antennae...~~ **→ DONE via the Mechanical Pile, Mech-5.**
- [ ] ~~Chapter 4: reduce `72 zeta_2`...~~ **→ found STALE via the Mechanical Pile, Mech-6 — source already reads `72\zeta_3`, not `zeta_2`; not touched. Left unchecked deliberately, see Mech-6.**
- [x] ~~Chapter 4: remove the duplicate citation... "Källen" → "Källén".~~ **→ DONE via the Mechanical Pile, Mech-7.**

## 3. References, labels, and typesetting

- [x] ~~Fix the higher-level-functions figure reference in Chapter 3...~~ **→ DONE (already satisfied, confirmed via rebuild) via the Mechanical Pile, Mech-10.**
- [x] ~~Standardise reference prose...~~ **→ DONE via the Mechanical Pile, Mech-11.**
- [x] ~~Standardise citation calls...~~ **→ DONE (already satisfied) via the Mechanical Pile, Mech-12.**
- [x] ~~Replace remaining red `\textcolor{red}{AntCalc}`...~~ **→ DONE (already satisfied) via the Mechanical Pile, Mech-13.**
- [x] ~~Use `\slashed{}` consistently...~~ **→ DONE via the Mechanical Pile, Mech-14.**
- [x] ~~Correct tilde scope...~~ **→ DONE (scope extended to \hat{}/\breve{} too) via the Mechanical Pile, Mech-15.**
- [ ] ~~Make an end-to-end visual pass after the final build...~~ **→ folded into Mech-18 in the Mechanical Pile.**

## 4. Strengthen the scientific argument

- [ ] In the introduction and conclusion, explicitly frame the contribution as **automation and validation of known antenna results**, plus an exploratory massive extension—not a claim of new massless QCD results.  This makes the novelty precise and defensible.
- [ ] Expand the `A_3^0` worked example with one **representative IBP reduction term**.  After introducing the cut-integral family, choose a term from the antenna integrand, show its denominator/index representation, state the reduction identity or LiteRed2 reduction output, and show how it reduces to the `R_3` master before the master substitution.  Keep it to one compact example: its job is to make the reduction bridge auditable, not to reproduce the complete IBP system.
- [ ] Expand Chapter 5, the thesis's main global validation.  Add a compact table of the pole cancellation by perturbative order and NNLO colour/flavour channel, followed by the final finite R-ratio comparison with the literature.
- [ ] Replace repeated "the result agrees with the literature" claims in Chapter 4 with one evidence-dense summary table.  Suggested columns: antenna route/components, build reduction, integration basis/master integrals, comparison target, Laurent orders checked, and validation status.
- [ ] Add a concise reproducibility paragraph, preferably in Chapter 3 or an appendix: AntCalc version/commit, Mathematica, FeynCalc/FeynArts/LiteRed2 versions, hardware/RAM, representative runtimes, and what tests are automated.
- [x] ~~Cite **MadGraph5_aMC@NLO** and **NNLOJET**...~~ **→ DONE (already satisfied) via the Mechanical Pile, Mech-17.**
- [ ] Add a short positioning paragraph on related subtraction/antenna automation tools.  State clearly what AntCalc automates, what it does not yet do, and how its role differs from a numerical event-generator validation such as NNLOJET.
- [ ] State in the conclusion that the present validation is analytic/symbolic and that an independent numerical Monte Carlo check remains future work.

## 5. Improve the thesis as a document

- [ ] Rebalance Chapter 3.  Keep the architectural rationale and the strong diagrams, but move the full profile association dump and other API-level detail to a user guide or appendix if page budget permits.  The main text should foreground design decisions, extensibility, and scientific consequences.
- [ ] Rework the longest raw Mathematica `In[]/Out[]` transcripts in Chapter 4.  Retain the compact examples that demonstrate the API, but replace truncated large outputs with a result statement, a reference to the complete expression, and a validation table.
- [ ] Enlarge or split the densest workflow figures and code blocks if they are not comfortably readable when printed.  Figure 3.9 is a likely candidate.
- [ ] Do a style pass to remove informal or weak framing: "simple", "simply", "usual", "as expected", and "we may now".  Prefer a direct statement of what is computed and why it establishes the claim.
- [ ] Reduce repeated descriptions of the build/integrate workflow, especially across Chapter 4 case studies; use the freed space for interpretation and validation evidence.
- [x] ~~Standardise terms and capitalisation...~~ **→ DONE (narrowed after investigation) via the Mechanical Pile, Mech-16.**

## 6. Final delivery checklist

- [ ] Confirm title-page names, degree wording, academic year, and institutional template requirements with the supervisors/department.
- [ ] ~~Run a clean build from scratch with Biber...~~ **→ folded into Mech-18 in the Mechanical Pile.**
- [ ] ~~Check the table of contents, lists of figures/tables...~~ **→ folded into Mech-18 in the Mechanical Pile.**
- [ ] Ask one subject-matter reader to sign off specifically on the two marked **verify** physics/normalisation items before submission.
