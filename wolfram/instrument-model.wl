(* ============================================================
   Xiao Family — Wolfram Language Model Package
   XIAO-001  |  v4.3  |  2026-05-08

   Open-open cylindrical pipe model for the xiao (箫):
   Bei Xiao / Nan Xiao / Qin Xiao — 8-hole chromatic scale.

   Usage:
     Get["/path/to/instrument-model.wl"]   (* load all definitions *)
     xiaoDesign["G"]                        (* design table for G Nan Xiao *)
     Manipulate[...] calls are in §6 below
   ============================================================ *)

(* ============================================================
   §1 — PARAMETERS (edit these inputs)
   ============================================================ *)

(* Speed of sound — parametric on temperature *)
cSound[tempF_] := 13504.0 * Sqrt[1 + (tempF - 32) / (1.8 * 273.15)];  (* in/s *)
cSound68 = cSound[68];  (* 13504 in/s at 68°F — shop default *)

(* A4 reference *)
A4Hz = 440.0;
MidiToHz[midi_] := A4Hz * 2^((midi - 69) / 12);

(* Xiao scale offsets from root — 8-hole chromatic *)
xiaoOffsets = {2, 3, 4, 5, 7, 9, 10, 11};  (* semitones above root *)
holeNames = {"Hole 1 (RH pinky)", "Hole 2 (RH ring)", "Hole 3 (RH middle)",
             "Hole 4 (RH index — key)", "Hole 5 (LH ring)",
             "Hole 6 (LH middle)", "Hole 7 (LH index)", "Hole 8 (LH thumb)"};

(* Xiao naming: Key = 4th hole = root + 5 semitones *)
XiaoKeyMidi[rootMidi_] := rootMidi + 5;
XiaoRootFromKeyMidi[keyMidi_] := keyMidi - 5;

(* Bore variants — ID in inches *)
boreVariants = <|
  "BeiXiao"  -> <|"boreID" -> 0.866, "wall" -> 0.236, "mouthLen" -> 2.0,  "cap" -> "U-notch"|>,
  "NanXiao"  -> <|"boreID" -> 0.866, "wall" -> 0.236, "mouthLen" -> 2.5,  "cap" -> "Open (bamboo root)"|>,
  "QinXiao"  -> <|"boreID" -> 0.551, "wall" -> 0.157, "mouthLen" -> 3.0,  "cap" -> "Narrow U-notch"|>
|>;
(* Note: bore IDs above are for the G-key column (root D4). Full family table in xiao-design-table.xlsx *)

(* ============================================================
   §2 — ACOUSTIC MODEL FUNCTIONS
   ============================================================ *)

(* Effective acoustic length from fundamental frequency *)
Leff[fHz_, c_: cSound68] := c / (2.0 * fHz);

(* End correction — one open end (Levine-Schwinger approx) *)
EndCorr[boreID_] := 0.6 * (boreID / 2.0);

(* Physical bore length — both ends open *)
Lbore[fHz_, boreID_, c_: cSound68] :=
  Leff[fHz, c] - 2.0 * EndCorr[boreID];

(* First-order tone hole position (distance from foot) *)
HoleDist[Leff_, fRoot_, fHole_] := Leff * (fRoot / fHole);

(* Full design table for one variant + key *)
XiaoDesign[keyName_String, variant_String: "NanXiao", tempF_: 68] := Module[
  {c, boreID, wall, rootMidi, fRoot, leff, lbore, endC, holeFreqs, holeDists, od},
  c = cSound[tempF];
  boreID = boreVariants[variant]["boreID"];
  wall = boreVariants[variant]["wall"];
  (* Key → root MIDI *)
  rootMidi = XiaoRootFromKeyMidi[
    69 + 12 * Log[2, MidiToHz[ (* parse key string to MIDI *)
      Which[keyName == "C", 60, keyName == "D", 62, keyName == "E", 64,
            keyName == "F", 65, keyName == "G", 67, keyName == "A", 69,
            keyName == "B", 71, True, 67]  (* default G *)
    ] / A4Hz] / Log[2] + 69
  ];
  (* recalculate cleanly *)
  rootMidi = Which[keyName == "C", 48, keyName == "D", 50, keyName == "E", 52,
                   keyName == "F", 53, keyName == "G", 55, keyName == "A", 57,
                   keyName == "B", 59, True, 50];  (* default D4 root → G xiao *)
  fRoot = MidiToHz[rootMidi];
  leff = Leff[fRoot, c];
  endC = EndCorr[boreID];
  lbore = leff - 2.0 * endC;
  od = boreID + 2.0 * wall;
  holeFreqs = MidiToHz[rootMidi + #] & /@ xiaoOffsets;
  holeDists = HoleDist[leff, fRoot, #] & /@ holeFreqs;
  <|
    "variant" -> variant,
    "key" -> keyName <> " Xiao",
    "rootNote" -> "D" <> ToString[Floor[rootMidi / 12] - 1],
    "rootMidi" -> rootMidi,
    "fRoot" -> fRoot,
    "tempF" -> tempF,
    "c" -> c,
    "boreID" -> boreID,
    "wall" -> wall,
    "OD" -> od,
    "Leff_in" -> leff,
    "endCorr_in" -> endC,
    "Lbore_in" -> lbore,
    "totalLength_in" -> lbore + boreVariants[variant]["mouthLen"] + 0.5,
    "holeFreqs_Hz" -> holeFreqs,
    "holeDists_in" -> holeDists,
    "holeDists_mm" -> holeDists * 25.4
  |>
];

(* ============================================================
   §3 — QUICK CALCULATION (G Nan Xiao prototype)
   ============================================================ *)

gNanXiao = XiaoDesign["G", "NanXiao", 68];

(* Print summary *)
Print["=== G Nan Xiao Design Summary (First-Order Model) ==="];
Print["Root: ", gNanXiao["rootNote"], " | f_root = ",
      NumberForm[gNanXiao["fRoot"], {6,2}], " Hz"];
Print["Bore ID: ", gNanXiao["boreID"], " in | OD: ",
      NumberForm[gNanXiao["OD"], {4,3}], " in"];
Print["L_eff = ", NumberForm[gNanXiao["Leff_in"], {5,2}], " in"];
Print["End correction (each end) = ", NumberForm[gNanXiao["endCorr_in"], {4,3}], " in"];
Print["L_bore (physical) = ", NumberForm[gNanXiao["Lbore_in"], {5,2}], " in  *** FIRST-ORDER ***"];
Print["Total blank length = ~", NumberForm[gNanXiao["totalLength_in"], {4,1}], " in"];
Print[""];
Print["Hole positions (distance from foot, first-order):"];
MapThread[
  Print["  ", #1, " | ", #2, " | ", NumberForm[#3, {5,2}], " in | ",
        NumberForm[#4, {5,1}], " mm"] &,
  {holeNames,
   {"E4","F4","Gb4","G4","A4","B4","C5","Db5"},
   gNanXiao["holeDists_in"],
   gNanXiao["holeDists_mm"]}
];
Print[""];
Print["*** All positions are FIRST-ORDER estimates. Validate on prototype. ***"];

(* ============================================================
   §4 — AUDIO PREVIEW
   ============================================================ *)

(* Synthesize the 8-note scale as a simple pure-tone arpeggio *)
xiaoScale := With[
  {freqs = gNanXiao["holeFreqs_Hz"]},
  Sound[Table[
    SoundNote[Quantity[f, "Hertz"], 0.4, "Sine"],
    {f, Prepend[freqs, gNanXiao["fRoot"]]}
  ]]
];

(* Play with: EmitSound[xiaoScale] *)

(* ============================================================
   §5 — VALIDATION PLOT
   ============================================================ *)

(* Plot: hole position (in from foot) vs semitone offset *)
holePositionPlot := ListPlot[
  Transpose[{xiaoOffsets, gNanXiao["holeDists_in"]}],
  PlotLabel -> "G Nan Xiao — Hole Positions (First-Order)",
  AxesLabel -> {"Semitone offset from root", "Distance from foot (in)"},
  PlotStyle -> {PointSize[0.02], Blue},
  PlotRange -> {{0, 12}, {10, 25}},
  Epilog -> {
    Red, Dashed,
    Line[{{0, gNanXiao["Lbore_in"]}, {12, gNanXiao["Lbore_in"]}}],
    Text["L_bore (model)", {6, gNanXiao["Lbore_in"] + 0.3}]
  },
  GridLines -> Automatic
];

(* ============================================================
   §6 — MANIPULATE CONTROLS
   ============================================================ *)

(* Interactive bore-variant and key explorer *)
xiaoManipulate := Manipulate[
  Module[{c, bID, leff, lbore, endC, fRoot, hFreqs, hDists},
    c = cSound[tempF];
    bID = Which[variant == "BeiXiao", 0.866,
                variant == "NanXiao", 0.866,
                variant == "QinXiao", 0.551];
    fRoot = A4Hz * 2^((rootMidi - 69) / 12);
    leff = Leff[fRoot, c];
    endC = EndCorr[bID];
    lbore = leff - 2.0 * endC;
    hFreqs = A4Hz * 2^((rootMidi + # - 69) / 12) & /@ xiaoOffsets;
    hDists = HoleDist[leff, fRoot, #] & /@ hFreqs;
    Grid[{
      {"Parameter", "Value", "Unit"},
      {"Variant", variant, ""},
      {"Root MIDI", rootMidi, ""},
      {"f_root", NumberForm[fRoot, {6, 2}], "Hz"},
      {"Temperature", tempF, "°F"},
      {"Bore ID", bID, "in"},
      {"L_eff", NumberForm[leff, {5, 2}], "in"},
      {"End corr (each)", NumberForm[endC, {4, 3}], "in"},
      {"L_bore", NumberForm[lbore, {5, 2}], "in *estimate*"},
      {"", "", ""},
      {"Hole", "Note (est.)", "from foot (in)"},
      Sequence @@ MapThread[
        {#1, #2, NumberForm[#3, {4, 2}]} &,
        {holeNames,
         PadRight[{"E","F","Gb","G","A","B","C","Db"}, 8],
         hDists}]
    }, Frame -> All]
  ],
  {{rootMidi, 50, "Root MIDI (D4=50, G4=55)"}, 38, 74, 1, Appearance -> "Labeled"},
  {{variant, "NanXiao", "Bore variant"}, {"BeiXiao", "NanXiao", "QinXiao"}},
  {{tempF, 68, "Temperature (°F)"}, 55, 85, 1, Appearance -> "Labeled"}
];

(* ============================================================
   §7 — BORE VARIANT COMPARISON
   ============================================================ *)

(* Compare Lbore and hole positions across all 3 variants for G key *)
boreCompare := Module[
  {variants = {"BeiXiao", "NanXiao", "QinXiao"},
   bores = {0.866, 0.866, 0.551},
   fRoot = MidiToHz[50]},  (* D4 *)
  TableForm[
    Table[
      With[{bID = bores[[i]], leff = Leff[fRoot]},
        {variants[[i]],
         bID,
         NumberForm[leff - 2*EndCorr[bID], {5,2}],
         NumberForm[HoleDist[leff, fRoot, MidiToHz[55]], {4,2}]}],
      {i, 3}],
    TableHeadings -> {None, {"Variant", "Bore ID (in)", "L_bore (in)", "Hole 4 pos (in)"}}
  ]
];

(* ============================================================
   §8 — CENTS ERROR FUNCTION (for validation)
   ============================================================ *)

CentsError[measuredHz_, targetHz_] := 1200.0 * Log[2, measuredHz / targetHz];

(* Example usage after prototype measurement:
   CentsError[294.5, 293.66]  (* D4 fundamental — should be ~+5 cents *)
*)

(* ============================================================
   §9 — WOLFRAM NOTEBOOK ENTRY POINT
   ============================================================ *)

(* Run this to open the explorations as a formatted notebook *)
(*
CreateDocument[{
  TextData[{"Xiao Family — Acoustic Model Notebook\n",
    "XIAO-001 | v4.3 | G Nan Xiao prototype\n",
    "All positions are FIRST-ORDER estimates until prototype measured."}],
  ExpressionCell[holePositionPlot, "Output"],
  ExpressionCell[xiaoManipulate, "Output"],
  ExpressionCell[boreCompare, "Output"]
}]
*)

(* End of instrument-model.wl *)
