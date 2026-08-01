(*
<<FeynCalc`
*)

(* traces *)

aaTrace =
    DiracTrace[GSD[k1] . GAD[\[Mu]] . GSD[k1 + k3] . GAD[\[Rho]] . GSD[
        k2] . GAD[\[Rho]] . GSD[k1 + k3] . GAD[\[Mu]], FCE -> True] //
    DiracSimplify //
    Simplify;

bbTrace =
    DiracTrace[GSD[k1] . GAD[\[Mu]] . GSD[k2 + k3] . GAD[\[Rho]] . GSD[
        k2] . GAD[\[Rho]] . GSD[k2 + k3] . GAD[\[Mu]], FCE -> True] //
    DiracSimplify //
    Simplify;

abTrace =
    DiracTrace[GSD[k1] . GAD[\[Rho]] . GSD[k1 + k3] . GAD[\[Mu]] . GSD[
        k2] . GAD[\[Rho]] . GSD[k2 + k3] . GAD[\[Mu]], FCE -> True] //
    DiracSimplify //
    Simplify;

baTrace =
    DiracTrace[GSD[k1] . GAD[\[Mu]] . GSD[k2 + k3] . GAD[\[Rho]] . GSD[
        k2] . GAD[\[Mu]] . GSD[k1 + k3] . GAD[\[Rho]], FCE -> True] //
    DiracSimplify //
    Simplify;

(* subs *)

pairSub = {Pair[Momentum[a__, D], Momentum[b__, D]] :> SPD[a, b]};

sumSub = {SPD[a__, b__ + c__] :> SPD[a, b] + SPD[a, c]};

identities = {SPD[k__, k__] :> 0, SPD[k1, k2] -> s12 / 2, SPD[k1, k3]
     -> s13 / 2, SPD[k2, k3] -> s23 / 2};

(* results *)

aaRes = aaTrace / s13^2 /. pairSub /. sumSub /. identities // Simplify;

bbRes = bbTrace / s23^2 /. pairSub /. sumSub /. identities // Simplify;

abRes = abTrace / (s13 s23) /. pairSub /. sumSub /. identities // Simplify;

baRes = baTrace / (s13 s23) /. pairSub /. sumSub /. identities // Simplify;

(* interference full *)

M3D = aaRes + bbRes - abRes - baRes // Simplify;

q2Rule = {-2 s12^2 - 2 s12 (s13 + s23) -> -2 s12 q2};

M3 = aaRes + bbRes - abRes - baRes /. D -> 4 - 2 Epsilon /. {2 s12^2 
    + 2 s12 (s13 + s23) -> 2 s12 q2} // Simplify;

(* antenna *)

Born = 4 (D - 2) q2 /. D -> 4 - 2 Epsilon;

A30 = M3 / Born // Simplify

A30 = A30 /. q2Rule // Collect[#, Epsilon]&;

(* prints *)

Print["aaRes = ", aaRes];

Print["bbRes = ", bbRes];

Print["abRes = ", abRes];

Print["baRes = ", baRes];

Print["M3D = ", M3D];

Print["M3 = ", M3 // Collect[#, Epsilon]&];

Print["A30 = ", A30];
