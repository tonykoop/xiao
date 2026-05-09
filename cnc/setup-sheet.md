# Xiao — CNC / Lathe Setup Sheet

**Project:** XIAO-001 · G Nan Xiao  
**Date:** 2026-05-08  
**Machines:** Wood lathe (headstock-driven deep-bore) + drill press (tone holes) + router table (embouchure notch)  
**Note:** This is a PRE-CAM operation plan. No G-code is provided. All feeds/speeds are starting estimates; verify on scrap.

---

## Operation Graph

```
OP-01: Stock prep → OP-02: Bore scrap → OP-03: Bore tonewood → OP-04: OD turning
  → OP-05: Embouchure notch → OP-06: Tone hole layout → OP-07: Tone hole drilling
  → OP-08: Voicing → OP-09: Finishing
```

No operation may begin until the preceding operation's RELEASE CHECK passes.

---

## OP-01 — Stock Preparation

| Parameter | Value |
|---|---|
| Machine | Jointer, planer, table saw |
| Stock | Black walnut, rough-sawn or S2S |
| Target dimensions | 1.5 in × 1.5 in × 26 in |
| Moisture content | ≤ 8% MC (kiln-dried preferred) |

**Release check:**
- [ ] Grain runs parallel to long axis (< 5° runout)
- [ ] No visible checks, knots, or splits in bore zone (center 24 in)
- [ ] Blank length ≥ 25.5 in
- [ ] Both ends squared, center-punched

---

## OP-02 — Headstock-Driven Bore (Scrap Blank)

| Parameter | Value |
|---|---|
| Machine | Wood lathe |
| Setup | Headstock Jacobs chuck + tailstock square-stock carrier |
| Bit sequence | 1/4 in pilot → 1/2 in intermediate → 55/64 in finish |
| Spindle speed | 500–800 RPM (conservative; long bits whip) |
| Peck depth | ~0.5 in per advance |
| Chip clearing | Retract every peck; blow chips |
| Depth stop | Tape flag at 25 in from chuck face |

**Release check:**
- [ ] Bore wander (entry vs exit center) < 0.030 in
- [ ] Bore diameter at 3 stations: 0.866 in ± 0.005 in (after reaming)
- [ ] No splits or burn marks in scrap blank bore

---

## OP-03 — Headstock-Driven Bore (Tonewood Blank)

Same parameters as OP-02. **Only after OP-02 release check passes.**

**Release check (V-BORE-TONE):**
- [ ] Bore diameter at entry, mid, exit: 0.866 in ± 0.005 in
- [ ] Light passes through bore cleanly (no obstructions)
- [ ] No cracks visible at blank ends

---

## OP-04 — Exterior Turning

| Parameter | Value |
|---|---|
| Machine | Wood lathe |
| Datum | Bore axis (live center plug in bore at tailstock end) |
| Target OD | 1.338 in ± 0.010 in |
| Spindle speed | 800–1200 RPM (round stock, safe range) |
| Tool | Roughing gouge → spindle gouge → skew |
| Final sand | 120 → 220 grit on lathe |

**Release check (V-OD-ROUND):**
- [ ] OD at 4 stations: 1.338 in ± 0.010 in
- [ ] Surface smooth to 220 grit
- [ ] No chatter marks

---

## OP-05 — Embouchure Notch

| Parameter | Value |
|---|---|
| Machine | Router table or drill press with ball-nose bit |
| Fixture | V-block, body clamped notch-side up |
| Bit | Small ball-nose or straight router bit (8–12 mm dia) |
| Notch width | ~10–12 mm (TBD — set by playability) |
| Notch depth | ~5 mm below OD (TBD) |
| Inner bevel | Hand-cut 45° with sharp chisel after routing |

**Release check (V-EMBROCHURE):**
- [ ] Stable edge tone produced with light blow
- [ ] No structural cracks at notch corners
- [ ] Inner bevel clean and sharp (no fuzz)

---

## OP-06 — Tone Hole Layout

| Parameter | Value |
|---|---|
| Machine | None (layout only) |
| Tool | Calipers + marking pencil |
| Datum | Foot-end face (0.000) |
| Reference | validation.csv V-HOLE1 through V-HOLE8 positions |
| Note | Mark holes 1–2 mm toward foot vs model position (tuning margin) |

**Release check:**
- [ ] All 8 hole centers marked and verified against drawing DWG-002
- [ ] Positions double-checked with calipers before drilling

---

## OP-07 — Tone Hole Drilling

| Parameter | Value |
|---|---|
| Machine | Drill press |
| Fixture | V-block + length stop fence |
| Pilot bit | 3 mm (1/8 in) per hole |
| Finish bit | 6–10 mm (TBD by hole; see assembly-manual.md §5.2) |
| Sequence | Holes 1 → 8 (foot to head) |
| Perpendicularity | Verified by V-block alignment |

**Release check:**
- [ ] All 8 holes drilled through wall; bore visible through each hole
- [ ] No wall splintering or splits between holes
- [ ] Hole spacing verified with calipers

---

## OP-08 — Voicing (Tuning)

| Parameter | Value |
|---|---|
| Tools | Round file, tapered file, dental pick, sharp chisel |
| Measurement | Strobe tuner (Korg OT-120 or Peterson) |
| Temperature | 68°F (record in validation.csv) |
| Tolerance | ±10 cents per hole (initial); refine toward ±5 cents |

**Release check (V-HOLE1 through V-HOLE8):**
- [ ] Each hole ±10 cents of target at 68°F
- [ ] Fundamental ±5 cents of 293.66 Hz
- [ ] Overblown octave responds cleanly (±15 cents)

---

## OP-09 — Finishing

| Parameter | Value |
|---|---|
| Bore finish | Boiled linseed oil (BLO) — cloth-strip method |
| Exterior finish | Danish oil or paste wax |
| Cure time | 24 hr BLO, 2 hr exterior |
| Re-measure | Measure fundamental again after bore finish cure |

**Release check:**
- [ ] Bore finish applied and cured
- [ ] Fundamental re-measured and within ±5 cents after finishing
- [ ] Exterior finish applied; no finish in bore holes
- [ ] Foot plug fitted and insertion depth marked
