# Handoff — Prof. Pires meeting of 23 Sep 2026 (for a fresh Opus session)

Deadline: full thesis to the school **30 Sep 2026**. Main text limit **80 pp** (currently ends printed p.80, ~13 lines spare):
every addition needs an offset; re-measure with `pdftotext` page footers after each change.

## Read first
1. `THESIS_REVISION_TODO.md` — the dated block "Meeting with Prof. Pires — 23 September 2026" (top of §0) is the
   durable record: Prof's questions, grounding, Mine/Yours split, code items. Protocol at the top of that file ("How to
   read and update this file") applies: ground against source, explain back, classify Mine/Yours, execute Mine and show the
   real diff. Do not draft Yours prose unless Henrique asks that turn (single-use permission); when correcting a sentence he wrote,
   give the corrected sentence directly (standing exception).
2. Memory files in `~/.claude/projects/-Users-henriquefarinha-Library-CloudStorage-Dropbox-msc-thesis-thesis/memory/`
   (esp. mechanical-vs-yours-workflow, roe-question-log, thesis-review-antcalc).
3. **Build recipe (outside Dropbox):**
   `OUT=/private/tmp/claude-501/thesis_build; mkdir -p $OUT/{chapters,appendices,frontmatter,figures}; latexmk -pdf -interaction=nonstopmode -outdir=$OUT main.tex; cp $OUT/main.pdf main.pdf`.
   If a weird `.aux` macro error appears: delete all `*.aux` plus main.toc/bbl/bcf/blg.
   Prof's numbers refer to the compiled draft (156 pp, built 23 Sep); regenerate `pdftotext -layout main.pdf` to map them.

## Decisions already made (do not re-litigate)
- dσ^{S,e} is already introduced (Table 2.2 row) — done.
- Bare A22 args in Eq. (2.60) present — done.
- **A22 builds are KEPT.** `BuildAntenna[A,2,2,…]` will be patched (by Henrique's code agent, prompt in
  the agent prompt (file deleted 24 Sep; Code-1/2 landed as adc91cf, follow-up prompt given in chat — see todo G5/G6)) to return the integrated result / C(ε,2), real, single-power. Then the eight
  A22 build displays (Ch4 l.753/838/897/950; Appx A l.63/89/113/134) are regenerated, and Ch2 gets one sentence: for
  two-parton antennae Eq. (2.70) reduces to 𝒳 = C(ε,2)·X. Ch3 changes only minimally (one sentence §3.3.3 + Table 3.7 cell if
  build cost changes; check `fig:a22-build`/Fig. 3.4). This is BLOCKED on the code patch AND on the separate Lead/Sub
  regression on c5df6d3 that Henrique is diagnosing himself — do not advance that analysis.
- A22 is renormalised AFTER master combination (counterterm added at the public boundary).
- Remaining A31 builds must have the same shape in Ch4 and Appendix A.

## Work list

### Mine — do these now (none depends on the code patch); show the diff after each
- **M-1** `frontmatter/listofsymbols.tex:43`: `\breve{X}` = "one-loop-squared component (NNLO A_2^2)", not "double-fermion-loop self-interference".
- **M-2** §2.4.4 (Eqs. 2.56–2.61): LHS `M^l_{…}` → `|M^l_{…}|²` (per Eq. 2.44).
- **M-3** `chapters/04-worked-example.tex:1194–1236`: every `\widehat` → `\hat` (only place in the thesis).
- **M-4** §4.4: add a pointer to Appendix B.8 (local validations).
- **M-5** Ch5 §5.5: add `In[]/Out[]` for `BuildRRatio[SMQCD]` (Henrique runs Mathematica; or ask him for the output).
- **M-6** Move the printed-p.60 note (Â₃¹: unrenormalised interference has no N_f term; the N_f piece is the counterterm) to a general
  place (Ch2 §2.4.4 or Ch4 intro), keep a short pointer where it was. Check page cost.
- **M-7** Appx B.2 PaVe: massless forms (m=0), replacing general-mass (B.3, B.20–B.22); say A₀ = 0 (scaleless).
- **M-8** Appx B.8.x local validations: print the actual limit and expected expressions instead of a bare `Out[1]= 0`
  (Prof: easier to read). Run in Mathematica via Henrique or `wolframscript` (fresh kernel; `<< AntCalc`` loads the installed paclet — use `Get[…/AntennaPipeline.wl]`).
- **M-10** Diff Appx A vs Ch4: every expression printed in Ch4 must appear complete in Appx A; A31 builds same shape.

### Yours — Henrique writes, Claude reviews (never draft unasked)
- **Y-1** Fuller 2C_F normalisation explanation. Recommended place: one paragraph in §2.4.2 immediately after Eq. (2.43), replacing
  the one-line "normalised to the two-parton Born" sentence: |M|² there are colour- and coupling-stripped so antennae are purely
  kinematic; point to it from Ch4 l.~285 (1/(2g_s²C_F)) and Ch5 (2C_F prefactors, l.69/132/195/216).
- **Y-2** Appx B.1: specify `t_g` in Eq. (B.2) (with >1 external gluon, −g^{μν} needs ghost/physical-pol treatment — Prof: "phrase
  disregards ghosts") and give the Table B.1 gluon propagator gauge-generally, consistent with Ch2 l.71 (λ-propagator) and FeynArts.
- **Y-3** Appx B.8.2 opening: state the gluon-exchange test shows the gluon indices are symmetric (previously not stated). That is NOT the sole reason the
  3g‖4g limit vanishes: B.8.2.3 must show the actual 1/s₃₄ coefficient and give the reason (Henrique's physics to supply).
- **Y-4** Decide whether B.6 (Massive Extension) and Eq. (B.54) remain; if B.6 stays, s_ij must follow one definition (B.43 says
  (p_i+p_j)², symbols list says 2p_i·p_j).
- **Y-6** Ch3 minimal edits after the code patch (see above).

### Needs checking against code/paper (not yet done)
- **Q3** Appx A.23 (A31) suspects, unverified: `(s_{12}q^2+{13}s_{23})^2` (dropped s); `\pi^2 q^2/4` beside dimensionless terms;
  `(-s_{12}^{-\epsilon})` misplaced parenthesis. Verify against AntCalc output / hep-ph/0403057 before changing.

### Code (Henrique's agent — not Claude)
- **Code-1/Code-2** see the agent prompt (file deleted 24 Sep; Code-1/2 landed as adc91cf, follow-up prompt given in chat — see todo G5/G6). After it lands: update the version/commit citation (Ch3 l.10, l.871),
  regenerate the A22 displays (M-9 in the todo), re-check Table 4.1, Appendix A, Eq. (5.15).

## Suggested order
M-1, M-2, M-3, M-4 (trivial) → M-7 → M-6 → M-8 → M-10 → M-5 (needs Henrique's run) → Y-2/Y-3/Y-1 as Henrique drafts → after the code patch: M-9, Y-6.
Rebuild and page-count after each; log each Prof question's outcome in the todo block (roe-question-log).
