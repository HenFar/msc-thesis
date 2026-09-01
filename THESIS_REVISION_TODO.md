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

---

### Meeting with Prof. Pires — 28 August 2026 (in person)

**Nature of this pass:** a live meeting, *not* an email. There is no verbatim advisor text — Henrique's notes plus his recollection are the source of record, so his correction of this map carries more weight than usual. Every point below was grounded against the *current* `.tex` and against hep-ph/0505111 on 28 Aug 2026. Compiled section numbers (from `main.toc`), for disambiguation: §2.1.2 = "From the QCD Lagrangian to Feynman Diagrams" (p16); §2.2.1 = "Infrared Divergences" (p17); §2.3 = "Dimensional Regularisation" (p19); §2.4.1 = "NLO and NNLO Subtraction Terms" (p21); §2.4.2 = "Antenna Functions" (p23); §2.4.3 = "Colour Algebra and the Antenna Colour Decomposition" (p25, and it currently contains a `\subsubsection{$T$-objects}` at `:793`); §2.4.4 = "Antenna Families" (p27); §2.4.5 = "Phase-Space Factorisation" (p28).

**Overall verdict from Prof:**
- Ch2 is still too dense. Take notation *and* diagrams from hep-ph/0505111 much more directly. Read the chapter as an examiner would.
- What he is happy with: the integration material (§2.5 — keep **one** IBP example), and §2.1.1 Lagrangian / §2.2 divergences / §2.3 dim-reg. **The problems are concentrated in §2.4 (subtraction).** Converges with the "Chapter 2 — cross-cutting concern" already in this file.

**STRUCTURAL DECISION — RESOLVED 28 Aug 2026 (Henrique): §2.4.1 gets a CLEAN REWRITE against hep-ph/0505111 §2.1, not a patch.** It moves from the thesis's own abstracted notation (`eq:subTerms`: `d\sigma^X = 2C_F\sum_{a(,s)}f_a(N,N_f)X^l_{ij,(a,s)}d\sigma^B`) to 0505111's *exact* eq. (2.5) structure (`d\sigma^S = N\sum_{m+1}\int d\Phi_{m+1}\frac{1}{S_{m+1}}\sum_j X^0_{ijk}\,|M_m(\ldots\tilde p_I,\tilde p_K\ldots)|^2\,J^{(m)}_m`). This **supersedes most of Task D** (T-object content in Ch2, `tab:sigmaByOrder`, the abstracted-sum equations, the `\sim`→exact work — all committed in `a572aa8`/`785a2fd`/`9744c15`). Task D's roadmap note "keep `subsec:antennaFuncs` mostly as-is" is also overridden — Prof wants §2.4.2 redone (see below). **Prof numbers §2.4.x by the current compiled draft** (confirmed 28 Aug): 2.4.2 = Antenna Functions, 2.4.3 = Colour Algebra.

#### Chapter 2

**§2.4.1 CLEAN REWRITE — supersedes the §2.4.1 half of Task D. [Yours] — one commit. Task Q — IN PROGRESS (30 Aug 2026).**

**PROGRESS (30 Aug 2026) — the intro + subtraction-terms part is drafted and committed.** Henrique wrote it; Claude reviewed structure only (no mistakes pass yet, at his request). Old §2.4 content left in place inside `\iffalse … \fi` blocks, to be deleted after the *whole* §2.4 rewrite is done.
- **`sec:antSubForm` intro (unnumbered, `:441–478`):** mirrors 0505111 §2 opening — sum over partonic channels (1 LO / 2 NLO / 5 NNLO), UV via renorm + IR via KLN, then the LO (`eq:bornLevel`, `d\sigma^B` in the `\sum_n d\Phi_n (1/S_n)|M_n|^2 J` form + explicit `d\Phi_n`), NLO (`d\sigma^R + d\sigma^V`), and NNLO (`d\sigma^{RR}+d\sigma^{RV}+d\sigma^{VV}`, five channels) *naive* decompositions.
- **`\subsection{Subtraction Terms}` (§2.4.1) with unnumbered `NLO` / `NNLO` heads** (kept unnumbered deliberately — Prof's fragmentation complaint; no 2.4.1.1/2.4.1.2).
  - **NLO — content-complete.** naive→subtracted cross section; requirements list (all four: every singular limit / analytically integrable / local / no spurious); KLN + the loop *closed* ("after analytic integration … explicit `\epsilon`-poles which cancel … pole-by-pole"); `d\sigma^S_\text{NLO}` in the 0505111 (2.5) antenna-sum form; mapped momenta `\tilde p_I,\tilde p_K` + parent/daughter + colour connection + `fig:colourConnectionNLO`; `R`-ratio → `J=1` → phase-space factorisation `d\Phi_{m+1}=d\Phi_m\,d\Phi_{X_{ijk}}` → `d\Phi_3 = P_2\,d\Phi_{X_{ijk}}`.
  - **NNLO — structurally complete.** naive (2.14-form) → subtracted; `d\sigma^S = S,a+S,b+S,c+S,d`, `d\sigma^T = T,a+T,b+T,c`; `tab:counterterms` (config → subterm, all seven rows); the takeaway sentence ("at this order four-parton `X^0_{ijkl}` and one-loop three-parton `X^1_{ijk}` antennae are necessary"); **`S,a`, `S,b`, `T,a`, `T,b` in full** (the ones that apply to a two-hard-radiator process; `S,b`'s `X^0_{ijkl}-X^0_{ijk}X^0_{IKl}-…` and `T,b`'s `X^1\to X^1+(\beta_0/\epsilon)(…)X^0` shift kept as bare formulas — deliberately *not* explained here, that's §2.4.2's job when `B_4^0`/`C_4^0`/`A_3^1` come up); **`S,c`, `S,d`, `T,c` cut to one sentence + `\cite{Gehrmann-DeRidder:2005btv}`**; colour-connection notation + three NNLO figures; `R`-ratio → `J=1` → `d\Phi_4 = P_2\,d\Phi_{X_{ijkl}}`.

**PARKED — pick up when resuming §2.4 (do NOT lose these):**
1. **Dangling refs.** `eq:sigmaSDef` now lives inside `\iffalse`; downstream text still `\ref`s it at `02-physics-background.tex:720` and `:1144`. Fix after the *complete* §2.4 rewrite (the downstream subsections `subsec:antennaFuncs` onward will be rewritten anyway — Q2).
2. **"higher-multiplicity processes" (`:615`) → "processes with three or more hard partons."** Physics-accuracy wording, not polish — `S,c/S,d/T,c` are about hard-radiator count, not final-state multiplicity (`q\bar qgg` is higher multiplicity but still two hard radiators). Don't let this get lost in the typo pass.
3. **`R`-ratio → Ch5 pointer.** The NNLO-R-ratio-via-antennae result is Henrique's headline selling point (Prof, 28 Aug meeting: "not something everybody is able to do", cited Joana Reis's thesis leaving it undone). It is currently mentioned *nowhere* in §2.4. Decide deliberately where it lands — end of the NNLO subtraction part, §2.4.2, or the later results discussion — stated as a contribution + forward-ref, not as a boast.
4. **Scope statement** ("this work treats final-final `q\bar q` antennae; qg/gg families + initial-state = future work"): does NOT live in §2.4 (Henrique's call, agreed). Homes: Ch1 intro (already partly there) + a **new Ch2 opening paragraph** (Ch2 currently jumps straight from `\chapter{Theoretical Foundations}` into `\section{QCD…}` with no chapter intro / roadmap — add one). §2.4.4/`tab:antFamilies` gets at most a one-clause "qg/gg follow the same construction, see Ch6".
5. Full **mistakes pass** on the new §2.4.1 (the `\sum_n d\Phi_n` missing `\int`, `tab:counterterms` cosmetics, typos) — deliberately deferred at Henrique's request.

**Still open in Task Q proper (not started):** §2.4.2 "Antenna Functions" rewrite (Q2), `tab:antFamilies` additions (Q3), the paired Ch3 T-primer, deleting the Ch2 `\subsubsection{$T$-objects}` (now at `02-physics-background.tex:897`), the non-antennae explanation.

---

**Original Task Q spec (unchanged):**
Ground the whole subsection on hep-ph/0505111 §2.1 (eqs. 2.1, 2.3, 2.4, 2.5, 2.6, 2.8; Figures 1–3). Specific asks, all pulled toward "match the paper exactly":
- Write `d\sigma^S` in the exact form of **0505111 eq. (2.5)**, not the abstracted `2C_F\sum f_a X d\sigma^B`. Prof said more than once he is "not a fan of the `d\sigma` expressions" (`eq:subTerms`, `eq:nnloCross` tail, the `\sigma^\text{NLO}/\sigma^\text{NNLO}` block at `:531-539`).
- **Drop the `2C_F f_a(N,N_f)` prefactor bookkeeping.** (Henrique confirmed: "2C_F f_a" = the colour-prefactor terms carried with the antennae in `eq:subTerms`.) 0505111's notation folds all of this into the normalisation `N` and the colour-ordered `|M_m|^2`; adopt that.
- **Use matrix elements, not antennae, in the schematic** (Henrique confirmed — meaning: keep `|M_m(\ldots)|^2` explicit and multiply by the tree antenna `X^0_{ijk}`, exactly as eq. 2.5/2.6 do; don't collapse the reduced matrix element into a `d\sigma^B` blob).
- **The Born / reduced matrix element must be written in terms of the mapped `I, K` momenta** — `|M_m(p_1,\ldots,\tilde p_I,\tilde p_K,\ldots)|^2`, per eq. (2.6). (Henrique confirmed reading.)
- **`S_j` (the single-unresolved / soft factor) does not depend on the process — use the exact formula from 0505111**, not the "universal singular factor for this process" phrasing at `:422-428`. For a soft gluon `j` between radiators `i,k` the paper gives `|M_{m+1}|^2 \to (2s_{ik}/s_{ij}s_{jk})|M_m|^2` explicitly (p6–7, just after eq. 2.6), with the colour factor modification `T^a_{ikj}\leftrightarrow\delta_{iI}\delta_{IK}\delta_{Kk}`.
- **Jet / measurement function: state `J = F_n` explicitly, and `= 1` for the R-ratio** (Henrique confirmed). Thesis already says `F_n=1` for every `n` (`:454-457`); the ask is to identify it with 0505111's `J^{(n)}_m` and use that notation.
- **`d\sigma_\text{NLO}` and `d\sigma_\text{NNLO}` must be explicitly defined**; explain **why both NLO and NNLO subtraction are needed**; explain **why the analytic integration is needed** and **why there are `\epsilon` poles**. (Some of this exists at `:459-482`, `eq:nnloCross` — needs to be foregrounded and tightened, not buried after the equation.)
- **Mention the non-antennae `A^2_2`, `A^2_1`** (and `\tilde A^2_2` etc.): state plainly that they are *not* antenna functions **by definition** but *are* required ingredients, and why. Prof wants this as a short **addendum near `tab:antFamilies`** (see the tab:antFamilies item below) as well as in the §2.4.1 narrative.
- **All colour-independent objects → "colour-stripped"** (not "colour-independent"); state that colour is handled inside FeynCalc/FeynArts. (Same wording fix as Task J item (e) in the Ch3 review — apply consistently.)
- **`tab:sigmaByOrder` (`:545`, "dσ in terms of antennae") is badly placed** — reposition (or fold into the rewrite).
- **T-objects — REMOVE the Ch2 `\subsubsection{$T$-objects}` entirely** (`02-physics-background.tex:793-828`, from commit `8292d57`). Confirmed 28 Aug (Henrique): the whole subsubsection goes, not a trim. 0505111 uses no T-objects. Ch5's `subsec:Tobjects` + `eq:integratedT` are a **separate matter** — they stay (Task D's topology-grouping argument + Task W both need them); this removal is Ch2-only. Check inbound refs to the removed block before cutting (`eq:genTSum`/`list:A31Comps` are referenced nearby — verify what points at the T-object equations specifically).
- **Framing to use instead of T-object bookkeeping:** "every antenna carries all colour components; the ones a given antenna doesn't have are simply zero." (Henrique's note, confirmed.)
- Diagrams to bring in from 0505111: the **colour-connection chain** (their Fig. 1), the **parent/daughter `i,j,k \to I,K`** picture (their Fig. 2), and the **mapping/factorisation diagram showing the division** (their Fig. 3 — the `[...]` bracket = antenna function × antenna phase space). Thesis already has `fig:antennaFactorisation` (Task E) — Prof wants the *division* to read more clearly, Fig. 3 style. This is the "digram on the mapping should have the division" + "colour coupling diagrams" notes.

**§2.4.2 "Antenna Functions" — redo. [Yours]. Task Q2 (fold into Q or keep adjacent — same commit series).**
Prof: "redo 2.4.2" (= Antenna Functions, confirmed his numbering matches the compiled draft). "2.4.3 stays" (= Colour Algebra body — but the T-objects subsubsection currently inside it is removed, see above). This overrides Task D's roadmap line "keep `subsec:antennaFuncs` mostly as-is." Scope to settle with Henrique: `eq:bornNorm` density (already a Task E follow-up), the antenna-definition presentation, and whether the per-antenna-type Feynman-diagram figures (already noted under Task L) land here.

**§2.4 — `tab:antFamilies` (was "Table 1 of 0505111"). Layout is GOOD (confirmed 28 Aug). Two additions. [Yours, small]. Task Q3.**
- **Show the defining/relative partons of each antenna as a reference** — e.g. `A^0_3(q,g,\bar q)`, `A^0_4(q,g,g,\bar q)`, `B^0_4(q,q',\bar q',\bar q)`, … the way 0505111 Table 1 gives the explicit argument list. Add as a column or an inline annotation.
- **Addendum on the non-antennae**: a short note at/under the table stating that the `q\bar q`-row entries (`A^1_2`, `A^2_2`, `\tilde A^2_2`, `\hat A^2_2`, `\breve A^2_2`) are **not antenna functions by definition** (an antenna requires at least one unresolved parton radiated between two hard radiators), but are needed as assembly ingredients. Same content as the §2.4.1 "mention the non-antennae" bullet — write once, reference from both places.

**§2.4 — AP and eikonal checks on `A^0_4`. [Yours]. Provisional Task R.**
Add explicit Altarelli–Parisi (collinear) and eikonal (soft) limit checks for the `A^0_4` antenna, demonstrating it reproduces the known singular factors. 0505111 §8.2.2 has the target limits. Related to the existing "local eikonal/AP-splitting validation" mention in Ch1.

**§2.4 — PaVe pointer / move.** Already **Task G (DONE, `9744c15`-era)** — `subsec:PaVe` moved to Appendix B.2, all three refs retargeted. Prof's note ("point to PaVe in the appendix, maybe transfer them there") is now satisfied. Treat as closed; just confirm he's seen it.

**§2.2.1 — soft-quark explanation is wrong. Reopens the closed "Task B" item. [Yours]. Task U — DONE (30 Aug 2026).**
Current text (`:218-229`): "if only one of the quarks is soft, then the pole formed is the same as in the collinear limit, and requires no separate dedicated soft-quark counterterm." **Prof says this is physically impossible as stated** — for `\gamma^*\to q(k_1)g(k_3)\bar q(k_2)`, a soft `q(k_1)` would require an underlying Born process `\gamma^*\to g\bar q`, which does not exist (colour / fermion-number). So there is no soft-single-quark limit to describe for this process at all. (Henrique: "he didn't like the current logic, he said it's physically impossible; there should be information about it in 0505111.") This **overturns the refinement committed under the old Task B** (`56e2311`). Grounding needed against 0505111 §8 (single unresolved factors — soft quark appears only where a `q\bar q` pair can factor onto a genuine lower process, e.g. `E`/`G`-type antennae), before rewriting. Cross-check the §2.2.1 `\cite{Ellis:1996mzs}` claim.
- **DONE:** grounded against 0505111 §8.2 — `A^0_3` has exactly two single-unresolved limits (soft gluon eq. 8.14, `q\|g` collinear eq. 8.15), no soft-quark entry anywhere in the whole §8 catalogue; §8.1.1's single-unresolved factor list is soft-gluon eikonal + three AP splittings only. The wrong worked-example paragraph was deleted; Henrique wrote a replacement (`:215-220`): a soft limit exists only where removing the parton leaves a physical lower-multiplicity process, so `\gamma^*\to qg\bar q` admits a soft gluon but not a soft quark (no `\gamma^*\to g\bar q`); a quark can only go unresolved collinearly; a `q\bar q` pair can go soft as a unit at NNLO. `\cite{Ellis:1996mzs}` dropped from the deleted claim (the `:202` kinematics cite stays). Build clean.

**§2.4 (or new) — table/list of the limits considered. [Yours, small]. Task R2 — DONE (30 Aug 2026).**
Explicit list or table of the unresolved limits actually relevant here: soft gluon, collinear, double-soft gluon, soft `q\bar q` pair, etc. — with which invariant each singularity sits on and which antenna handles it. Must be consistent with the corrected soft-quark story (Task U). The retired §2.2.1 "motivation paragraph" bullet noted a table like this would do that motivational work.
- **DONE:** `tab:limits` added to §2.2.1 (`02-physics-background.tex:227-`) as an inline `longtable` (not a float — it was orphaning a page), caption below. Organised by final-state configuration (`(1_q,3_g,2_{\bar q})` NLO; `(1_q,3_g,4_g,2_{\bar q})`, `(1_q,3_{q'},4_{\bar q'},2_{\bar q})`, `(1_q,3_q,4_{\bar q},2_{\bar q})` NNLO), each row: limit / kinematic condition (`p_3\to0`, `1_q \parallel 3_g`, …) / vanishing invariants. All 14 rows verified against 0505111 §8.2 eqs. 8.14–8.30. **No antenna column** — Task Q adds the antenna→limit mapping later so R2 isn't reworked. Referenced from `:227`. Build clean.

**§2.1.2 — Feynman rules. [Yours-light]. Task S — DONE (30 Aug 2026).**
~~move Feynman rules elsewhere, maybe an appendix~~ — **re-scoped 30 Aug (Henrique's meeting recollection): NOT a relocation and NOT a trim of §2.1.2.** Prof *liked* §2.1.2 as it is; his point was that "how the `\mathcal M` amplitudes appear" is left unanswered — he wants the Feynman rules *explained somewhere*. So Task S is purely **additive**: §2.1.2 unchanged except a one-line pointer.
- **DONE:** new `\section{Feynman Rules}` in Appendix B (`appendices/appendixB.tex`, `sec:FeynmanRules`, B.1): propagator table (quark/gluon/ghost, massless + massive-quark parenthetical, graphical reps), external-state completeness relations (`\sum u\bar u=\slashed p`, `\sum \varepsilon_\mu\varepsilon_\nu^*=-g_{\mu\nu}+\text{gauge}`), vertex table (`q\bar qg`, `ggg`, `gggg`, `c\bar cg`, `\gamma^*q\bar q` with graphical reps). All expressions checked against Peskin/ESW conventions as a consistent set (`ggg`/ghost carry no explicit `i` in that convention; `gggg` sign `-ig_s^2` and colour `f^{abe}f^{cde}` fixed in review). Cited `\cite{Ellis:1996mzs,Peskin:1995ev}` on both tables. §2.1.2 (`:185-186`) adds "An amplitude … is computed from a Feynman diagram using Feynman rules. This ruleset is given in Section~\ref{sec:FeynmanRules}." B.1 points back to Ch4's full application (`subsec:masslessA30`). No full worked example in B.1 — Ch4 has it. Build clean, 119 pp.
- Loose end (minor): B.1's `\ref{subsec:masslessA30}` prints "Subsection" but the target is a `\subsubsection` — same label-type mismatch family the 27-Aug coherence pass fixed 7 of.

**Normalisations — it's a PRESENTATION problem, not a section. [Yours]. Task T — §2.3 HALF DONE (30 Aug); structural `G_k`/`Λ_l`/`𝒩` unification with §3.5.3 still bundled with Task M.** Entangled with Task M (Ch3 §3.5.3).
- **DONE 30 Aug (finish of the §2.3 half):** the `S_ε` / `G_k` / `C(ε,k)` / `𝒩` apparatus collapsed to one short paragraph + `eq:loopNorm` (`G_k=(8π²)^{n-2}Λ_l`) + `eq:normN` (`𝒩=C/Φ_2`, `C=G_kS_ε`), with the hedge compressed to a one-line pointer to `tab:GkNorm` (§3.5.3). `eq:alphaRescaling` prose tail cut from ~6 lines to 2 (`μ_0`, `β_0`, `N=3`, `N_f` glossed). Both deleted labels (`eq:loopNorm`, `eq:normN`) re-added — Ch3 `:318`/`:630` resolve again. `S_ε` cite switched `Bardeen:1978yd`→`Gehrmann-DeRidder:2005btv`. Build clean. This went a bit past the "two quick wins" scope but stopped short of the shared-symbol unification with §3.5.3, which stays in Task M.
- Tiny nit not yet fixed: "the renormalisation scale **is scaled as** `μ²=q²`" → "is set to".
Clarified 28 Aug (Henrique): Prof was not pointing at one section. His complaint is the **overall presentation** of the normalisation factors — too much prose, it breaks the narrative flow. The apparatus (`S_\epsilon`, `G_k`, `\Lambda_l`, `C(\epsilon,k)`, `\Phi_2`, `\mathcal N(\epsilon,k)`) sits in **§2.3** (`:338-405`) and is bridged again in **Ch3 §3.5.3** ("Normalisations and Convention Bridge", `tab:GkNorm`).
- **Done 28–29 Aug (§2.3 half, `02-physics-background.tex:338-405`):** cut the "why 4π/γ_E/Γ(1−ε) appear from d-dimensional spherical coordinates" textbook paragraph (pure over-explanation); tightened the `S_ε` sentence (MS̄ + `\cite{Bardeen:1978yd}` retained, "using CDR" clumsiness removed); kept a one-clause `α_s/(2π)` justification (load-bearing — `β_0=(11N−2N_f)/6` is only right in that convention, and `(8π²)^k` needs it); moved `k=(n-2)+l` into the `C(ε,k)` equation line and killed the resulting dangling "and is, itself defined as," fragment; de-fragmented the `Λ_l` sentence; `n`/`l` now defined right after `eq:loopNorm`. Rebuilt clean, all 7 inbound labels (`eq:loopNorm`/`eq:normN`/`eq:alphaRescaling` from Ch3/Ch4) resolve. **Assessed honestly as only ~20% of Prof's density complaint** — cut ~4 of ~50 lines. The passage still hits 4 displayed normalisation equations + 5 symbols back to back.
- **Still open, deferred to the Task M joint pass:** `eq:alphaRescaling` prose tail → one sentence (or move the whole coupling-renorm eq to §2.2.2 where UV renorm is discussed); the `G_k→C(ε,k)→𝒩` three-step chain → collapse to `𝒩(ε,k) = (8π²)^k(4π)^{−ε}e^{εγ_E}/Φ_2` + pointer; defer `Λ_l` introduction to Ch3; hedge paragraph (`:386-390`) → one line. Can't finish in §2.3 alone — the symbols are shared with §3.5.3, which Prof separately suggested cutting; do both files at once.
- "Simplify equations and review normalisations" (his §2.4 note) is the same theme. The unverified-`C(\epsilon,k)` caveat is still flagged in §2.3 and Task D.

#### Chapter 3

**§3.6 "Higher-Level Functions" — condense to a list/table.** Already **Task P**. Prof repeated it verbatim in the meeting ("going on too much on the inner workings, just list them or show a table"). Confirms Task P; no change, still blocked on the Task D T-object destination.

#### Chapter 4

**Rename `\mathcal S_3 \to s_{123}`, `\mathcal S_4 \to s_{1234}`; do NOT touch `d\mathcal S_3`. Mech-22 — DONE 28 Aug 2026 by Henrique himself.** Not reviewed by Claude; if a diff review is wanted later, check the `:138-281` block plus any prose mentions.

**Show antenna results reduced to the quoted master integrals. [Yours]. Provisional Task V.**
For each antenna result in Ch4, show the reduction to the stated master-integral basis before the master substitution. Overlaps with the existing §4 items "Expand the `A_3^0` worked example with one representative IBP reduction term" and "Replace repeated 'agrees with the literature' claims with one evidence-dense summary table." Treat as one task.

#### Chapter 5

**Show the integrated T-objects with their `\epsilon` poles, à la hep-ph/0403057. [Yours]. Provisional Task W.**
`subsec:Tobjects` (`chapters/05-validation-r-ratio.tex:53`), `eq:integratedT` (`:137`). Prof wants each integrated `\mathcal T`-object shown with its explicit Laurent expansion so the pole cancellation is visible and the subtraction reads as clearly complete — the way `Gehrmann-DeRidder:2004ttg` (hep-ph/0403057, "Infrared structure of e+e- -> 2 jets at NNLO") lays it out. Directly overlaps the existing §5 item "Add a compact table of the pole cancellation by perturbative order and NNLO colour/flavour channel." One task.

#### Considered and deferred — NOT a task

**Numerical validation with NNLOJET.** Prof raised it as "a further point that might be interesting," explicitly **not** a "do it." Henrique's own view: it's a stretch to claim NNLOJET validates AntCalc when both use the same underlying antenna expressions. Sketch, if ever pursued: NNLOJET 4.1, the e⁺e⁻ setup from arXiv:2503.22804, `\sqrt{s}` = 900 and 365 GeV, `\mu=\sqrt{s}`, three runs (LO/NLO/NNLO), observable TBD (`p_T^\text{jet}`, invariant mass, …), likely a case-studies chapter. Leave parked here; do not letter it. (Related to the existing §4 item "State in the conclusion that an independent numerical MC check remains future work" — that stays.)

### Open questions — RESOLVED with Henrique 28 Aug 2026

1. **§2.4.1 rewrite depth** → **clean rewrite** against 0505111 §2.1.
2. **"§2.1 normalisations"** → not section-specific; it's the overall *presentation* (too much text, breaks flow). Task T reframed accordingly, spanning §2.3 + Ch3 §3.5.3.
3. **T-objects in Ch2** → **remove the `\subsubsection{$T$-objects}` entirely** (`:793-828`). Ch5 T-objects untouched (Task W needs them).
4. **Prof's §2.4 sub-numbering** → he uses the **current compiled draft numbers** (2.4.2 = Antenna Functions, 2.4.3 = Colour Algebra).
5. **`tab:antFamilies`** → layout is **good as-is**; add (a) the defining partons of each antenna as a reference, (b) an addendum that the non-antennae aren't antennae by definition. → Task Q3.
6. **Task lettering** → convention confirmed; Q, Q2, Q3, R, R2, S, T, U, V, W + Mech-22 stand. Reletter to strict one-letter-per-commit when sequencing the work.

**Still to settle at execution time (not blocking):** whether Q2/Q3 fold into Q's commit or sit adjacent; how much of §2.1.2's Feynman-rules content moves vs. stays as a pointer (Task S); whether removing the Ch2 T-objects subsubsection leaves Ch3 (`03-package-framework.tex:~358`, `T_\text{Lead}` etc.) with no upstream definition — the Ch3 T-primer was already an open Task-D-extension item, re-confirm it covers this.

### Execution plan (walked through with Henrique 28–29 Aug, to start in full 30 Aug)

**Core rule that prevents rework:** *nothing fine-grained inside §2.4 happens before Task Q.* Everything that can safely precede Q is outside §2.4. No polishing `tab:sigmaByOrder`, `eq:subTerms`, the T-objects subsubsection, `eq:bornNorm`, or `fig:antennaFactorisation` before Q/Q2 — all of it gets rewritten.

**Phase 1 — outside §2.4 (no rework risk, any order) — COMPLETE (30 Aug 2026).**
- **U — soft-quark fix, §2.2.1. DONE.** Grounded vs. 0505111 §8.2 (no soft-quark limit anywhere in the antenna catalogue), wrong paragraph deleted, Henrique wrote the replacement, `Ellis:1996mzs` dropped from the bad claim.
- **R2 — limits list/table. DONE.** `tab:limits` in §2.2.1, inline `longtable`, by-configuration (limit / kinematic condition / vanishing invariants), 14 rows checked vs. eqs. 8.14–8.30, no antenna column (Q adds it).
- **S — Feynman rules. DONE (re-scoped — additive, not a relocation).** Appendix B.1 `\section{Feynman Rules}`: propagator + vertex tables + external-state relations, Peskin/ESW-consistent, cited; §2.1.2 gets a one-line pointer, unchanged otherwise.
- **T (§2.3 half). DONE.** Apparatus collapsed to one paragraph + `eq:loopNorm` + `eq:normN`; `eq:alphaRescaling` tail trimmed; deleted labels restored; hedge → one-line pointer to `tab:GkNorm`. Structural `G_k`/`Λ_l`/`𝒩` unification with §3.5.3 still in Task M.

**Phase 2 — the §2.4 rewrite (strict order):**
- **Q — rewrite `sec:antSubForm` intro + §2.4.1 against 0505111 §2.1.** Sets the whole §2.4 narrative, notation, and figure plan (0505111 Figs 1/2/3). Deletes the T-objects subsubsection (`:793-828`). Writes the non-antennae explanation **once**. *(IN PROGRESS 30 Aug — intro + `\subsection{Subtraction Terms}` (NLO + NNLO) drafted and committed, old content in `\iffalse`; see the full progress + PARKED list under the "§2.4.1 CLEAN REWRITE … Task Q" entry above.)*
- **Q — paired: add the Ch3 T-primer.** Same logical change as deleting the Ch2 T-block — otherwise `03-package-framework.tex:358` etc. (`T_\text{Lead}`/`T_\text{Sublead}`/`T_\text{QL}`) point at nothing. Own small commit right after Q, no gap between them.
- **Q2 — redo §2.4.2 "Antenna Functions."** Built to serve the narrative Q just fixed. Folds in: the `eq:bornNorm` explicit-`l=1`/`l=2`-cases follow-up (do *not* do separately), the figure execution, and Task L per-antenna Feynman diagrams if they land here.
- **Q3 — `tab:antFamilies`.** Add the defining-partons reference (`A^0_3(q,g,\bar q)` style) + the non-antennae addendum (references the explanation written in Q).
- **R — AP + eikonal checks on `A^0_4`.** Needs the antenna definitions in final form → after Q2. Ties to the Ch1 "local eikonal/AP-splitting validation" mention.

**Phase 3 — Ch3, then Ch4/5:**
- **Task M + T (structural half)** — joint §2.3 / §3.5.3 normalisation collapse, both files open at once. Defer `Λ_l` introduction to Ch3.
- **Ch3 T-object extension** (§3.3.2 / §3.3.3 / §3.5.4 / §3.6 → Ch5 `subsec:Tobjects` outright vs. short pointer) **+ Task P** (condense §3.6 to the itemised one-liners / table).
- Remaining Ch3 review tasks (H, I, J, K, L, N, O) as they fit.
- **V — Ch4 antenna results reduced to the quoted masters.** Merge the existing §4 "one representative IBP term" + "replace 'agrees with literature' prose with a validation table" items.
- **W — Ch5 integrated T-objects with their ε poles**, à la hep-ph/0403057. Merge the existing §5 "compact pole-cancellation table" item.

**Done outside this order:** Mech-22 (Ch4 `\mathcal S_3 → s_{123}`) — completed by Henrique 28 Aug, not Claude-reviewed.

---

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

**Net result: back to the state documented in the `Move subsec:antFamilies` entry above, plus `eq:integratedT` joining it.** Ch2 stays fully clean (that part of the appendix attempt was correct and stands). The full $T$-object narrative — general definition, `eq:ATypeTObj`, the two NNLO extensions, the $B_4^0$/$C_4^0$ $T$-objects, and now also `eq:integratedT` — lives in `chapters/05-validation-r-ratio.tex`'s `subsec:Tobjects`. `chapters/03-package-framework.tex:804`'s reference points there again. `appendices/appendixB.tex` shows no net diff from before the appendix attempt.

**Correction, 26 Aug 2026 — the revert above was initially incomplete, caught by Henrique asking "did you make prose changes?" rather than by any build check.** The first revert pass restored Ch5 to its state right after the *original* `antFamilies` move (before `eq:integratedT` joined it), then deleted the appendix section outright — silently dropping `eq:integratedT` and its explanatory paragraph from the thesis entirely, with no dangling reference to catch it, since the one citation to it (`tab:sigmaByOrder`'s caption) had already been removed during the earlier Ch2 cut. A clean build is therefore not sufficient evidence that a content move preserved everything — it only proves references resolve, not that content wasn't dropped between edits with no reference pointing at it. Fixed same session: `eq:integratedT` and its explanation re-added to `chapters/05-validation-r-ratio.tex` (`:135-146`ish), full clean rebuild reconfirmed.

**Still open:**
- `chapters/05-validation-r-ratio.tex` — the pacing/coherence review flagged when the `antFamilies` split first landed (see the `Item added 26 Aug 2026` entry below) still applies, now covering a slightly larger block since `eq:integratedT` joined it on this second landing.
- Chapter 3's own T-object-heavy sections (§3.3.2, §3.3.3, §3.5.4, §3.6 — see the scope-extension note below) — untouched. Same kind of call as before: how much moves to Ch5 outright vs. gets trimmed to a light pointer, still entangled with Tasks O and P. Destination is Ch5 again, not the appendix.

*Net effect on length:* §2.4 goes from 5 subsections to roughly 4 (intro+`antennaFuncs`, `colourAlg`, compressed `antFamilies`, `phaseSpaceFactor`), loses ~180 lines of T-object content to Ch5, gains the new explicit-sum equations and mapping discussion (a few paragraphs) and, separately via Task E, the taxonomy table replacing prose. Should net out similar length or shorter than today, not longer — consistent with Prof's own "couple of pages" reference-paper anchor.

*Final item, added 27 Aug 2026, deliberately deferred to the very end of Task D (and Task E) — a systematic logical-coherence and cross-reference pass — DONE 27 Aug 2026.* Scope ended up much wider than originally planned: Henrique asked for a full pass across all of Chapter 2, the moved material in Ch5/Appendix B, and cross-references elsewhere, run twice independently (Claude's own pass, plus a second pass through ChatGPT with a purpose-written review prompt) and then compared. Neither pass was trusted blind — every finding from both was checked against the actual current source/PDF before acting on it.

**The one serious substantive finding, from ChatGPT's pass, confirmed real: a genuine definition-order regression in Chapter 3, caused by this session's own `T`-object move (Task D).** `chapters/03-package-framework.tex:358` uses $T_\text{Lead}$/$T_\text{Sublead}$/$T_\text{QL}$ with zero local definition. Before the move, this was fine — the general `T`-object definition lived in Ch2, read before Ch3. Now it's in Ch5, read after Ch3. **Not yet fixed** — needs a compact, *locally motivated* `T`-notation primer in Ch3 (not Ch2 — reintroducing it there would recreate Prof's original complaint) right before this first use, plus a forward-pointer to `subsec:Tobjects`. Also needs the terminology split ChatGPT flagged: "$T$-terms"/"interference components" for the raw pieces ($T_\text{Lead}$ etc.) vs. "$T$-object" reserved for $T_\text{topology}^{2(k+1)}$ itself.

**A second substantive finding, also confirmed, also not yet fixed:** `tab:sigmaByOrder` in Ch2 shows $\mathcal A_2^1\mathcal A_3^0$ product terms with zero derivation — the only explanation (the $A_3^1$ two-diagram-type / iterated-subtraction story) now lives in Ch5's `subsec:Tobjects` itemize, three chapters away. Fix agreed: move (compress, don't duplicate) that explanation into Ch2 near the table — it's genuinely physics content about how $A_3^1$ is built, not something specific to the $T$-object or R-ratio story, so it belongs where the reader first needs it. Ch3's `eq:a31Norm` and Ch5's itemize then both get backward-pointers instead of each re-deriving it. Not yet drafted.

**The "exact coincidence" claim (§2.4.1, `:479-487`) — resolved.** ChatGPT initially objected that "the subtraction terms coincide identically... everywhere, not merely in the unresolved limit" was stronger than the argument supplied. On request, it went back to hep-ph/0505111 and found the claim is *literally stated* in that paper's §2.5 as a special property of two-jet production specifically — verified directly against the extracted paper text (exact quote match), not taken on ChatGPT's word. Henrique rewrote the paragraph to ground it in the paper's actual construction-based justification instead of the thesis's own weaker derivation, citing `Gehrmann-DeRidder:2005btv` directly in place of the general `Catani:1996vz` citation (kept only where the general limiting-behaviour contrast is stated). One round of review needed to catch a missing citation and an `$F_n=1$` "order" vs. "multiplicity" slip before it was solid.

**Everything else — confirmed mechanical, executed directly, full clean rebuild after each batch:**
- Fixed all 7 Section/Subsection/Subsubsection word-vs-label-type mismatches thesis-wide (built an actual label→heading-type map from every `\label{}` and cross-checked every reference against it — not spot-checking). 3 in Ch2 (`:333`, `:661`→now fixed, `:1192`), 3 in Ch4, 1 in Ch6. Re-ran the same automated audit after fixing: 0 remaining.
- "Passarino-Veltmann" → "Passarino-Veltman" (missing-n misspelling), 2 instances (Ch2, Ch4) — cross-checked against the 9 correct instances elsewhere. Re-verified after: 0 remaining.
- Ch2 terminology/grammar: "Fundamental Casimir" → lowercase; "$N$ for the leading order" → "leading colour" (real terminology confusion, not just capitalisation); $g^2$ → $g_s^2$; "make"/"makes" subject-verb agreement; $\eta^B$ → $\eta^b$ (ghost Lagrangian index mismatch); the `\alpha_0`-"as shown in Eq. 2.1" claim (that equation doesn't actually contain $\alpha_0$) corrected to "implicit in the covariant derivative"; "bare" redefined consistently as "before UV renormalisation" (was conflated with "without normalisation," which contradicts `eq:antennaTree` already including $\mathcal N_X$); several comma-splice/run-on sentences split (`subsec:phaseSpaceFactor`'s phase-space definition, the IBP scalar-products derivation); duplicate "relevant sectors" definition removed (kept the more complete one); $F_n$'s inconsistent triple description (quantity/observable/distribution) collapsed to one; "respectively subtract" tightened to state which counterterm subtracts which piece explicitly; "inadvertently" → "introduces" (the complexity is inherent, not accidental); $B_4^0$/$C_4^0$ topic-sentence fragments fixed; missing noun after "Born-level" fixed; subject-verb "does not exist" → "do not exist" (D–H families paragraph); ambiguous $\delta$-function reference in reverse-unitarity disambiguated ($\delta^{(d)}$ = momentum conservation, $\delta^+$ = on-shell condition); "$n_u=0$" note now explicitly excludes $A_2^0$ with its own stated reason (Born normalisation, not an integrated subtraction ingredient) rather than silently omitting it.
- `tab:antFamilies`'s final-state ordering vs. the surrounding prose's ordering — genuinely different conventions (table follows the reference paper's radiator-position ordering; prose lists by flavour pairing), not an arbitrary inconsistency. Added a one-line caption clarification rather than picking a "winner," since changing the table would break its deliberate fidelity to hep-ph/0505111's own Table 1.
- Citation-placement gaps: $B_4^0$'s definition (previously uncited while $C_4^0$'s wasn't) now cites `Gehrmann-DeRidder:2005btv`; `eq:antPhaseSpaceFact` (now an exact equality, was uncited) now cites the same; `eq:ATypeTObj` in Ch5 (previously only cited via an unrelated notation footnote) now cites `Gehrmann-DeRidder:2005btv` directly.
- Ch5: the $T$/$\mathcal T$ direction was reversed on first introduction ("These are the $\mathcal T$-objects... defined, before integration... notated by $T$") — fixed to state unintegrated/integrated forms in the correct order; `eq:integratedT`'s $T_{q\bar q}$ was missing its `^2` superscript present in every neighbouring equation (confirmed real, predates this session, not introduced by the T-object move) — fixed; several informal phrasings tightened ("kinematics- and colour-conscious" → "carrying both kinematic and colour information," "creates a very elegant structure... It goes like," → "takes a simple form," "construct back" → "reconstruct," "not singular to" → "not unique to," "notated" → "denoted," "blindly integrating" → "integrating the composite... directly"); ambiguous "As mentioned before Eq. X" comma fix; repeated "using... using" and missing articles in the chapter opening; closing sentence "exact expression... at NNLO" (misleadingly implies all-orders exactness) → "exact... coefficient through NNLO."
- Appendix B: "the vast majority of the present work's ensuing chapters will focus on [the massless] regime" — now sits after every main chapter, so there are no ensuing chapters; reworded retrospectively. "the massive phase-scale is not equal to" clarified to "the characteristic phase-space scale." "the phase-space in non-trivial" typo fixed. "With general massive denominator defined as" → plural "denominators" (two are being defined) and trimmed "takes the form that follows" redundancy. Conversational phrasing in the rank-one bubble worked example tightened ("we are able to write that" → "Lorentz covariance gives," "which once contracted... makes" → "Contracting with $p_\mu$ yields," "where we consider $r_1=p$" → "setting $r_1=p$").
- All three Ch2/Ch3 references to the PaVe material retargeted from the whole "Appendix B" to the specific "Section B.2" (`\ref{subsec:PaVe}`), now that PaVe and Massive Extension are two distinct numbered sections there.

**Explicitly not done, flagged rather than silently applied:**
- `subsec:PaVe`'s label still reads `subsec:` despite now being a `\section` — cosmetic only, left alone to avoid unnecessary churn across every reference to it.
- Appendix B's two backward references to Ch2 subsections (`:31`, `:95`) still omit the "of Chapter~\ref{ch:physicsbackground}" qualifier that the Ch5 case got — much lower priority since the chapter context is already set a few lines earlier in the appendix's own opening, unlike the Ch5 case.
- `subsec:PaVe`'s rank-one-example's $r_i$-vs-$p_i$ relationship (ChatGPT's finding) — genuinely two different, both-legitimate PaVe quantities (propagator shifts vs. independent tensor-decomposition basis vectors), already bridged explicitly in the worked example (`$r_1=p$`) but not in the general $N$-point discussion. Flagged, not fixed — didn't want to risk mis-stating the general relationship without more certainty.
- ChatGPT's #50 (systematic comma-vs-colon before displayed equations, recurring across `Eqs. 2.1–2.9, 2.11, 2.14, 2.27, 2.37, B.15` and others) — lower-value, very broad stylistic preference touching a large number of individually tiny edits; not applied this pass, left as an optional future polish.

Full clean rebuild confirmed after every batch (0 errors, 0 undefined refs/citations throughout); two automated audits (Section/Subsection label-type map, Veltman spelling) re-run at the end and both confirm zero remaining instances.

*Item added 26 Aug 2026, once the `antFamilies` split landed — review the Ch5 $T$-object content and run a logical-coherence/pacing check on Chapter 5.* The `subsec:Tobjects` block (`chapters/05-validation-r-ratio.tex`, now also including `eq:integratedT`) is a mechanical transplant from Ch2, not yet reviewed as Ch5 prose: it still opens with "As described in Subsection~\ref{subsec:colourAlg}..." — phrasing written for a reader arriving straight from `subsec:colourAlg` in Ch2, not one arriving at Ch5 after three intervening chapters — and the whole block was written to *introduce* antenna machinery, whereas by Ch5 the reader has long since met it, so tone/pacing may now be off. Also check how it sits against the *existing* Ch5 material immediately after it (the $R = \dots$ assembly equations) — there may be overlap or a register jump between the transplanted definitional prose and the pre-existing assembly walkthrough. **Sequencing unchanged: run this only after the systematic logical-coherence and cross-reference pass on Chapter 2 (the item directly above) is done** — Ch2's pass may still trigger further edits upstream of this block.

**Task E — §2.4 readability cleanup (separable from Task D, can be done independently) — CLOSED 27 Aug 2026, all five items done.** Two related items surfaced during this task that were never formal Task E items and remain open, tracked separately: `eq:bornNorm`'s further readability step (showing the $l=1$/$l=2$ cases explicitly instead of the "..." expansion) and the $D$–$E$–$F$–$G$–$H$ paragraph trim, which Henrique drafted himself and is now done too (`chapters/02-physics-background.tex:857-864`) — final version restores the split citations (`GehrmannDeRidder2005:neutralino` with the SUSY claim specifically, `Glover2010` with the $H\to gg$ EFT claim) after a review round caught them dropped, and fixes "Ch." to "Chapter" to match the thesis-wide convention. Full clean rebuild confirmed (0 errors, 0 undefined refs/citations).
- [x] Two of the three original mechanical items already done in the §2.5/§2.6 pass above: the empty `$ $` placeholder and the self-citing footnote at `subsec:phaseSpaceFactor`.
- [x] Eq. `eq:bornNorm` is index-heavy (the likely "Eq. 2.27") — simplify. **Fixed 26 Aug 2026, and it turned out to be a correctness bug, not just a readability one.** The sum bound `\min(l, k-1)` is only correct for $n\ge3$ (real-emission) antennae; for the $n=2$ purely-virtual antennae ($A_2^1$, $A_2^2$), where $k=(n-2)+l=l$, the bound evaluates to $l-1$ — one short. Concretely, $A_2^1$ ($l=1$) got a bound of $0$ (empty sum, i.e. the formula claimed the NLO virtual antenna needs *no* coupling-renormalisation counterterm at all), and $A_2^2$ ($l=2$) got a bound of $1$ instead of $2$ (silently dropping the double-counterterm term). Verified against standard coupling-renormalisation structure (an $l$-loop bare amplitude always needs exactly $l$ counterterms down to tree level, regardless of $n$) and cross-checked the general shape against the reference paper's own NNLO pole structure (eq. 9.56: renormalised content built from $\beta_0$-counterterms times the one-order-lower amplitude). Fix: bound changed from `\min(l,k-1)` to plain `l` — since $n\ge2$ always in this problem, $k\ge l$ always, so `\min(l,k)=l` unconditionally; the min-wrapper was only ever needed because the bound was off by one. This is also the readability win: one index cleaner, no `k`/min-comparison in the bound. Left the further readability step (showing the $l=1$/$l=2$ cases explicitly instead of the "..." expansion, since $l\le2$ throughout this thesis) as a follow-up, not done in this pass.
- [x] Three footnotes within ~130 lines in `subsec:antennaFuncs`/`subsec:colourAlg` — trim/merge. Done 26-27 Aug 2026, split across two sessions since one turned out to be a real terminology fix, not a style call:
  - `:581` ("other antenna types... different normalisations") and `:713` ("colour Fierz identity") — genuinely mechanical, inlined verbatim as parentheticals, no content change.
  - `:603` (colour charge vs. strong charge) — **not mechanical, and not actually a synonym choice either.** The footnote defined two different *kinds* of object (colour charge = a conserved quantum number; "strong charge" = the coupling constant $g_s$) as if they were alternate names for the same thing. But the main sentence attributes their conservation to the Ward-Takahashi and Slavnov-Taylor identities — WI enforces U(1) electric charge conservation, STI is its non-abelian generalisation enforcing SU(3) *colour* charge conservation; neither identity says anything about a coupling constant being "conserved" (couplings run with scale, they aren't Noether charges). So "strong charge," as the footnote defined it, wasn't the right concept for this sentence at all. Fix: main text now reads "the electric and colour charges"; footnote deleted outright, since there's no second unfamiliar term left needing definition.
  Full clean rebuild confirmed after all three (via manual `pdflatex`→`biber`→`pdflatex`×2, since `latexmk` hit a transient Dropbox-sync-related `.bcf` corruption a couple of times this session — not caused by the edits, resolved by the manual sequence each time).
- [x] Build the compact antenna-taxonomy table modelled on hep-ph/0505111 Table 1. Done 27 Aug 2026. Verified directly against Prof's original note (`PROF_PIRES_COMP_REVIEWS.md:154`): he names Table 1 explicitly by number and describes its exact structure (letter + defining final-state particles), so this isn't a style choice, it's a direct instruction, matched precisely. `tab:antFamilies`, new at `chapters/02-physics-background.tex:718` — final state / tree level / one loop / two loop columns, covering $A_2^0$ through $C_4^0$; replaced the enumeration prose at the old `:715-729` (kept the B-vs-C explanation and the $B_4^0$/$C_4^0$ derivation right after it, since a table can't replace *why*, only *what*). Henrique asked for the two-loop column to be added afterward, with $A_2^2$/$\tilde A_2^2$/$\hat A_2^2$/$\breve A_2^2$ in the $q\bar q$ row (matching Ch3's `tab:antennaTiers` convention) and `---` elsewhere, since it's genuinely the only two-loop entry in the thesis's scope.

  **Build-tooling note, 27 Aug 2026, unrelated to content correctness but worth recording:** while rebuilding after this edit, hit a real `main.out` (hyperref bookmarks file, pure build output) corruption — 8192 null bytes baked into a 12288-byte file — that made every subsequent `pdflatex` pass fail immediately with "invalid character" errors, cascading through several failed diagnostic attempts (briefly suspected Dropbox sync, then VS Code's LaTeX Workshop auto-build racing the manual rebuilds) before isolating the actual corrupted file. Fixed by deleting `main.out` (safe — it's regenerated automatically, no authored content) and rebuilding. Source `.tex` files were never at risk — checked brace/environment balance and confirmed zero null bytes in all of them before chasing the build issue. If a `pdflatex` run ever fails immediately with a wall of "Text line contains an invalid character" errors again, check `main.out`, `main.aux`, and other build artifacts for null-byte corruption first (`python3 -c "print(open(f,'rb').read().count(b'\x00'))"`) before assuming the source content is wrong.
- [x] **Un-softened 27 Aug 2026 — this is a direct instruction, not an optional "consider" — and now done.** Re-checked Prof's original note (`PROF_PIRES_COMP_REVIEWS.md:154`): he names hep-ph/0505111's Figure 3 explicitly, in the same sentence as the Table 1 instruction, both aimed at simplifying §2.4/2.4.1/2.4.2. Built `fig:antennaFactorisation` in `chapters/02-physics-background.tex`, right after `eq:antennaTree` in `subsec:antennaFuncs`. Deliberately *not* a copy of the paper's own Fig. 3 — Henrique found that one unreadable on first read ("doesn't come across as a division"), since it's two disconnected before/after snapshots with generic $1,\ldots,i,j,k,\ldots,m+1$ labels. This version instead draws it as three TikZ panels connected by literal "$=$" and "$\times$" nodes, so the factorisation reads as the multiplication it algebraically is; and it reuses the thesis's own concrete $\gamma^*\to q(i)g(j)\bar q(k)$ process (same one as `fig:feynDiagsEx`, one page earlier) instead of the paper's abstract $(m+1)$-parton indices, so there's no generic bookkeeping to translate. One layout bug caught and fixed during visual verification (rendered the actual PDF page to PNG and inspected it, not just checked for build errors): the "fixed $\tilde p_I+\tilde p_K$" label initially overlapped "$q(i)$" in the third panel — repositioned higher, reverified. Full clean rebuild confirmed (0 errors, 0 undefined refs/citations) after the fix.

  **Separate build-tooling note, 27 Aug 2026:** while building this figure, isolated the actual root cause of the `.aux`/`.bcf` corruption flagged in the taxonomy-table entry above — it was neither Dropbox sync nor VS Code's LaTeX Workshop racing (both suspected in turn), it was a corrupted `main.out` (hyperref bookmarks, pure build output) with 8192 null bytes baked into it from an earlier interrupted run, causing every subsequent `pdflatex` pass to fail immediately. Deleting `main.out` and rebuilding fixed it for good — hasn't recurred since. Updating the earlier note's diagnosis for the record: check `main.out` specifically, not just `main.aux`/`main.bcf`, if this happens again.

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
- [x] **Task F — DONE 27 Aug 2026.** The "2.54"/"2.60" labels in Prof's note were stale (equation numbers had shifted a lot this session) — relocated by content instead: the actual `\sim` equation was `sec:integration`'s opening ($\mathcal X_n^l\sim\int(\ldots)N_s(\ell_r,p_a)/\prod D_j^{a_j}(\ell_r,p_a)\ldots$, unlabeled), and the actual $D_j$-definition companion equation ("2.60") was in `subsec:ibp`, not `subsec:PaVe` as first guessed (checked: PaVe's own denominator definition is single-loop only, a special case, and PaVe is a separate technique applied after antenna integration — doesn't fit "clarify external-particle treatment in the antenna integration process" the way `subsec:ibp`'s general multi-loop $D_j$ definition does). Fix: recognised the `\sim` equation was a redundant, looser restatement of `eq:intFamily`, which sits a few lines later and is already exact — dropped the separate $N_s/D_j^{a_j}(\ell_r,p_a)$ notation entirely rather than patching it. Relocated `subsec:ibp`'s $D_j$ definition up to this earlier spot (new label `eq:denomDef`), added one new sentence — "for the massless, on-shell external partons considered throughout this work, $D_j$ reduces directly to a combination of Mandelstam invariants $s_{ij}$" — which is what actually resolves the $s_{ij}$-vs-$p_a$ complaint. `subsec:ibp` now references `eq:denomDef` back instead of re-deriving it. Visually verified via rendered PDF pages (not just build-clean), full clean rebuild confirmed. Also established, while investigating: Task F and Task G (`subsec:PaVe` move) don't actually conflict, since the relocated equation was never in `subsec:PaVe` to begin with.
- [x] **Task G — DONE 27 Aug 2026.** Re-verified scope before executing (the TODO's own protocol) — found it covered more than tracked: **three** references to `subsec:PaVe`, not the one originally noted (`chapters/03-package-framework.tex`'s line had also shifted, 296→313). The other two were internal to Ch2 itself: `:1022`, a forward pointer ("described in detail in Subsection~\ref{subsec:PaVe}"), and `:1216`, in `subsec:ibp`, which actively said "the *previous* Subsection~\ref{subsec:PaVe}" — this one would have become factually wrong once PaVe left, not just stale. All three resolved as mechanical reference-swaps to `Appendix~\ref{ap:supportingDerivations}` (the Ch3 case follows the same precedent already accepted for the `TObject` move — Ch3 describing an API whose full technical treatment lives elsewhere is normal, not the "reads backwards" problem). Moved the ~110-line block (including the rank-1 bubble worked example) to `appendices/appendixB.tex` as a new `\section` (promoted from `\subsection`; the internal "Rank-One Bubble Example" `\subsubsection` promoted to `\subsection` to match), landing as B.2 after "The Massive Extension." One more internal wording fix caught: a footnote inside the moved block said "throughout this subsection" — no longer accurate once promoted to a `\section`, fixed to "this section." Confirmed via `grep` that none of the moved block's internal equation labels (`eq:paveDens`, `eq:paveRankOne`, `eq:ellToDens`, `eq:gramInversion`, `eq:bubbleResult`) are referenced from outside the block — clean, self-contained move. Executed via a small Python script rather than the Edit tool after an exact-string-match failure on the ~110-line block (not a content issue — just safer for a block that size). Visually verified all three reference seams and the new appendix landing page via rendered PDF, not just a clean build. Full clean rebuild confirmed (0 errors, 0 undefined refs/citations).
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
