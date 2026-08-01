Get["/Users/henriquefarinha/Library/CloudStorage/Dropbox/msc_thesis/thesis_docs/codexAlley/antenna_pipeline/AntennaPipeline.wl"
    ]

A30 = BuildAntenna[A, 3, 0];

(* Eikonal *)

softSubs = {s13 -> lambda * s13, s23 -> lambda * s23};

A30Soft = A30 /. softSubs;

A30SoftSeries = Series[A30Soft, {lambda, 0, 0}];

eikonalRaw = SeriesCoefficient[A30SoftSeries, -2] /. q2 -> s12 // Simplify;

Print["Leading soft term (candidate eikonal):"]

Print[eikonalRaw]

Print[];

(* Altarelli-Parisi *)

collinearSubs = {s13 -> lambda, s12 -> z q2, s23 -> (1 - z) q2, Epsilon
     -> 0};

A30Colliner = A30 /. collinearSubs;

A30CollinearSeries = Series[A30Colliner, {lambda, 0, 0}];

pRaw = SeriesCoefficient[A30CollinearSeries, -1] // Simplify;

Print["Leading collinear term (candidate Altarelli-Parisi):"]

Print[pRaw];
