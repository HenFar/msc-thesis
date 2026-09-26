Get["/Users/henriquefarinha/Desktop/AntCalc/AntennaPipeline.wl"];
out[name_, x_] := Print[name, " :: ", ToString[x, InputForm, PageWidth -> Infinity]];
(* ---- A40 leading ---- *)
A40 = BuildAntenna[A,4,0,Component->Leading];
soft3Rules = {s13 -> lambda s13, s23 -> lambda s23, s34 -> lambda s34, s134 -> s14, s234 -> s24, q2 -> s124};
out["A40_soft", SeriesCoefficient[A40 /. soft3Rules, {lambda, 0, -2}] // Simplify];
col13Rules = {s13 -> lambda, s12 -> z sP2, s23 -> (1-z) sP2, s14 -> z sP4, s34 -> (1-z) sP4, s134 -> sP4, s234 -> (1-z) sP2 + s24 + (1-z) sP4, q2 -> sP2 + sP4 + s24, Epsilon -> 0};
out["A40_col13", SeriesCoefficient[Together[A40 /. col13Rules], {lambda, 0, -1}] // FullSimplify];
col34Rules = {s34 -> lambda, s13 -> z s1P, s14 -> (1-z) s1P, s23 -> z sP2, s24 -> (1-z) sP2, s134 -> s1P + lambda, s234 -> sP2 + lambda, q2 -> s12 + s1P + sP2 + lambda, Epsilon -> 0};
out["A40_col34", SeriesCoefficient[Together[A40 /. col34Rules], {lambda, 0, -1}] // FullSimplify];
(* ---- tA40 ---- *)
tA40 = BuildAntenna[A,4,0,Component->Subleading];
out["tA40_soft_eps_general", SeriesCoefficient[tA40 /. soft3Rules, {lambda, 0, -2}] // Simplify];
out["tA40_soft_eps0", SeriesCoefficient[tA40 /. Append[soft3Rules, Epsilon -> 0], {lambda, 0, -2}] // Simplify];
out["tA40_col13", SeriesCoefficient[Together[tA40 /. col13Rules], {lambda, 0, -1}] // FullSimplify];
col34RulesG = DeleteCases[col34Rules, Epsilon -> 0];
out["tA40_col34_general", FullSimplify[SeriesCoefficient[Together[tA40 /. col34RulesG], {lambda, 0, -1}]]];
(* ---- B40 ---- *)
B40 = BuildAntenna[B,4,0];
col34B = {s34 -> lambda, s13 -> z s1P, s14 -> (1-z) s1P, s23 -> z sP2, s24 -> (1-z) sP2, s134 -> s1P, s234 -> sP2, q2 -> s12 + s1P + sP2};
out["B40_col34", SeriesCoefficient[Together[B40 /. col34B], {lambda, 0, -1}] // FullSimplify];
doubleSoftRules = {s13 -> lambda s13, s14 -> lambda s14, s23 -> lambda s23, s24 -> lambda s24, s34 -> lambda^2 s34, s134 -> lambda (s13+s14) + lambda^2 s34, s234 -> lambda (s23+s24) + lambda^2 s34, q2 -> s12 + lambda (s13+s14+s23+s24) + lambda^2 s34, Epsilon -> 0};
out["B40_doublesoft", SeriesCoefficient[Together[B40 /. doubleSoftRules], {lambda, 0, -4}] // FullSimplify];
tc134 = {s13 -> lambda r13, s14 -> lambda r14, s34 -> lambda r34, s12 -> w sP2, s23 -> x sP2, s24 -> (1-w-x) sP2, s134 -> lambda (r13+r14+r34), s234 -> (1-w) sP2 + lambda r34, q2 -> sP2 + lambda (r13+r14+r34)};
out["B40_triple", SeriesCoefficient[Together[B40 /. tc134], {lambda, 0, -2}] // FullSimplify];
(* ---- C40 ---- *)
C40 = BuildAntenna[C,4,0];
c34 = {s34 -> lambda, s13 -> z s1P, s14 -> (1-z) s1P, s23 -> z sP2, s24 -> (1-z) sP2, s134 -> s1P, s234 -> sP2, q2 -> s12 + s1P + sP2, Epsilon -> 0};
out["C40_col34", FullSimplify[SeriesCoefficient[Together[C40 /. c34], {lambda, 0, -1}]]];
tc234 = {s23 -> lambda r23, s24 -> lambda r24, s34 -> lambda r34, s12 -> w s1P, s13 -> x s1P, s14 -> (1-w-x) s1P, s234 -> lambda (r23+r24+r34), s134 -> (1-w) s1P + lambda r34, q2 -> s1P + lambda (r23+r24+r34), Epsilon -> 0, s123 -> (w+x) s1P + lambda r23, s124 -> (1-x) s1P + lambda r24};
out["C40_triple", SeriesCoefficient[Together[C40 /. tc234], {lambda, 0, -2}] // FullSimplify];
(* ---- massive A30 ---- *)
mA30 = BuildAntenna[A,3,0,quarkMass->mQ];
softRules = {s13 -> lambda s13, s23 -> lambda s23, s123 -> s12 + lambda (s13+s23), q2 -> s12 + 2 mQ^2 + lambda (s13+s23), Epsilon -> 0};
out["mA30_soft", SeriesCoefficient[Together[mA30 /. softRules], {lambda, 0, -2}] // FullSimplify];
quasi13Rules = {s13 -> lambda r13, s12 -> z sP2, s23 -> (1-z) sP2, s123 -> sP2 + lambda r13, q2 -> sP2 + lambda r13 (1+2 muQg2), mQ^2 -> lambda muQg2 r13, mQ^4 -> lambda^2 muQg2^2 r13^2, Epsilon -> 0};
out["mA30_quasi13", r13 SeriesCoefficient[Together[mA30 /. quasi13Rules], {lambda, 0, -1}] // FullSimplify];
Print["DONE"];
