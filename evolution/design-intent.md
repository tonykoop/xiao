# Design Intent — xiao rev A

- Master CAD: `cad/xiao.scad` (sha256: 3832be6631ce64d141e368377fbe873fe25e27d0db50bf8b6a6dd54874659363), driven by `xiao-design-table.xlsx` (sha256: 17c8b5783f117235e83f1da46e28202ae674b4700645ce71d5cdee196199d32a)
- Function: End-blown Chinese vertical bamboo flute (箫). The G Nan Xiao prototype (root D4, open-open cylindrical bore) is bored straight through a hardwood blank before the exterior is turned (bore axis = lathe datum), then cut with a U-notch embouchure at the top and 8 tone holes (7 front + 1 back thumb) drilled and voiced to a first-order acoustic model. Played near-vertical; breath jet against the notch edge excites the open-open pipe resonance. See design.md and README.md "What this is" / "Acoustic Model".
- Environment: hand-held wind instrument; breath moisture enters the bore during play, so bore finish and material stability (checking, cracking) matter. No sustained structural load beyond normal handling.
- Target qty: 1 (prototype). Deadline: TBD. Budget/unit ceiling: TBD.

## Critical dimensions (carry tolerances)

| Feature | Nominal | Tolerance | Why critical | Source |
| --- | --- | --- | --- | --- |
| Bore ID | 0.866 in | reject scrap-blank wander > 0.030 in (RISK-S01) | sets L_bore and all hole positions | design.md section 2.3 (worked Nan Xiao table); flagged discrepancy vs xiao-design-table.xlsx row16 col E = 0.984 in — see cad/xiao.scad header |
| Physical bore length (L_bore) | 22.47 in | +0.25 in trim allowance before final tuning cut | sets fundamental (D4 = 293.66 Hz) | design.md section 2.3, formula L_eff - 2*delta_end |
| Wall thickness | 0.236 in | min 0.118 in per RISK-S01 (Qin Xiao floor) | structural integrity of 22.5 in bore | design.md section 2.3; flagged discrepancy vs xlsx row17 col E = 0.276 in |
| Tone-hole positions (holes 1-8, dist. from foot) | 20.48 / 19.33 / 18.25 / 17.22 / 15.34 / 13.67 / 12.90 / 12.18 in | drill under-length 1-2 mm toward foot, correct by undercutting (measurement_required) | intonation of 8-hole chromatic scale | design.md section 2.4 (first-order acoustic-length method); reproduced by formula in cad/xiao.scad, exact match verified via OpenSCAD echo |
| Hole diameter | 0.354 in (9 mm) | TBD — affects cutoff frequency and playability | voicing | design.md section 5 "Key Assumptions" — explicitly TBD, traditional range ~8-10mm; used here as a documented ASSUMPTION, not a design-table value |
| Embouchure end correction | 0.260 in (0.6*r), applied as open-end assumption | TBD — measure on prototype (RISK-A01) | fundamental frequency accuracy | design.md section 2.2/2.3; NOT modeled as cut geometry in cad/xiao.scad (blowing edge out of scope) |
| Mouthpiece stock length | 2.5 in | n/a (uncut stock allowance) | leaves material for embouchure notch carving | design.md section 2.3 / xiao-design-table.xlsx row20 col E (both sources agree) |

## Incidental (free for DFM)

- Exterior turning profile/taper of the body (beyond the bore-driven OD), decorative wrap placement, foot-plug cosmetic shaping, finish sheen.

## Must-nots (DFM may never violate)

- Never turn the exterior before boring — the bore axis is the lathe datum (design.md "Build Workflow"; "Critical rule: bore before turning").
- Never exceed 0.030 in bore wander on the scrap-blank validation test before committing to the tonewood blank (RISK-S01, risks.md).
- Never cut the embouchure notch wider than the bore diameter (~12 mm max) or with square (non-radiused) corners — stress-concentration crack risk at the thin mouthpiece wall (RISK-S02, risks.md).
- Never drill tone holes before the embouchure cut and fundamental-frequency check — δ_emb must be measured and L_bore reconciled first, or all hole positions will be systematically off (RISK-A01, risks.md).
- Never apply bore finish after tone holes are drilled without masking — finish pooling in holes sharpens notes unpredictably (RISK-FF01, risks.md).

## Material intent

- Preferred: black walnut (or cherry) hardwood body blank, kiln-dried (MC <= 8%); bore finish boiled linseed oil or shellac; exterior finish Danish oil or wax. Per bom.csv.
- Acceptable subs: bamboo (madake/zizhu) for a traditional build, per design.md section 4 "Material Assumptions" — not costed in bom.csv.
- Forbidden: none recorded.

## Stage status

Stage 0 intake complete 2026-07-01. Gate A (Alpha shop compile) NOT yet run — no concessions logged, nothing presented as shippable.
