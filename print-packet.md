# Xiao Family (箫) — Printable Shop Packet
## XIAO-001 · G Nan Xiao · v4.3 · 2026-05-08

> Binary .pdf: run `python3 scripts/generate_capstone_docs.py . --title "Xiao Print Packet"` when bash is available.
> Print this Markdown on A4 or Letter in portrait. Each `---` is a page break.

---

# COVER

**Xiao Family (箫)**  
Chinese End-Blown Vertical Flute  
Build ID: XIAO-001 · G Nan Xiao (南箫) prototype  
Heifer Zephyr Instrument Catalogue · tonykoop@gmail.com  
Date: 2026-05-08

Repo: github.com/tonykoop/xiao  
License: CC BY 4.0

---

# QUICK START AND FILE MAP

Take to shop:
- This document (print-packet.md or PDF)
- `validation.csv` (print; fill in measured values)
- `drawings/` folder (all 4 SVGs — print at full page)
- `cnc/setup-sheet.md` (print — OP-02 through OP-09 release checks)

Key files:
- `design.md` — acoustic model, hole positions, formulas
- `assembly-manual.md` — complete stage-by-stage instructions
- `jigs/headstock-bore-jig.md` — bore jig build spec
- `jigs/tonehole-drilling-jig.md` — tone hole jig setup
- `risks.md` — 12 risks with verification tests

**CRITICAL SEQUENCE: Bore before turning. Scrap blank before tonewood.**

---

# DESIGN INTENT AND ASSUMPTIONS

**Instrument:** G Nan Xiao (南箫) — Chinese end-blown vertical bamboo flute  
**Scale:** 8-hole chromatic, root D4, xiao key G  
**Material:** Black walnut (prototype). Traditional: madake bamboo.  
**Governing model:** Open-open cylindrical pipe

**Key assumptions (verify on prototype):**
1. Embouchure end correction δ_emb = 0.260 in (assumed open end). MEASURE ON BLANK.
2. Bore is cylindrical (no taper). Walnut is truly cylindrical; bamboo is slightly tapered.
3. Bore finish (BLO) raises pitch ~1–5 cents. Apply BEFORE final voicing.
4. All tone-hole positions are first-order estimates. Drill 1–2 mm toward foot; undercut to tune.
5. Tuning reference: A4 = 440 Hz, at 68°F.

---

# BOM

| Part | Qty | Spec | Est. Cost |
|---|---|---|---|
| Body blank — walnut | 1 | 1.5 × 1.5 × 26 in | $8–15 |
| Scrap blank (validation) | 1 | Same dimensions | $3–5 |
| Foot plug | 1 | Cork or hardwood, ~0.9 in OD | $1–3 |
| Pilot bit | 1 | 1/4 in HSS, 18 in+ | $8 |
| Finish bit | 1 | 55/64 in HSS, 18 in+ | $25–45 |
| Reamer | 1 | 7/8 in adjustable | $35 |
| Bore finish | 1 | BLO or shellac, 4 oz | $4 |
| Exterior finish | 1 | Danish oil, 4 oz | $5 |
| Sandpaper | 1 set | 120–400 grit | $3 |
| Tailstock carrier | 1 | Shop-made plywood jig | $15 |
| **TOTAL** | | | **~$109** |

**Order 55/64 in bit first — lead time 3–5 days from McMaster-Carr.**

---

# SOURCING LIST

| Item | Supplier | P/N / Notes |
|---|---|---|
| Walnut blank | Woodcraft / local mill | S4S or S2S; FAS grade; kiln-dried MC ≤ 8% |
| 1/4 in pilot bit 18 in | McMaster-Carr | Search: "aircraft length drill 1/4" |
| 55/64 in finish bit 18 in | McMaster-Carr / Toolmex | Long-series; search: "55/64 aircraft drill" |
| 7/8 in reamer | McMaster-Carr | P/N 2514A14 or equivalent |
| BLO | Local hardware | Ace / Home Depot |
| Danish oil | Local hardware | Watco or equivalent |

---

# CUT LIST AND STOCK

| Part | Material | Raw | Finished |
|---|---|---|---|
| Body — Nan Xiao G | Black walnut | 1.5×1.5×26 in | OD 1.338 in × 25.5 in L |
| Scrap — bore validation | Pine or poplar | 1.5×1.5×26 in | Bored only; discard after |
| Foot plug | Cork or hardwood | 1 × 1 × 1 in | 0.75 in L, fits bore ID 0.866 in |

**Trim allowance:** Blank is 26 in; finished body ~25.5 in. Extra 0.5 in for endgrain waste and setup.

---

# DRAWING BRIEF AND CRITICAL DIMENSIONS

| Dimension | Value | Status |
|---|---|---|
| Bore ID | 0.866 in (22.0 mm) | Design table |
| OD | 1.338 in (34.0 mm) | Derived |
| Wall | 0.236 in (6.0 mm) | Design table |
| Body length | ~25.5 in (648 mm) | Nominal |
| Bore length L_bore | 22.47 in (571 mm) | **⚠ FIRST-ORDER** |
| L_eff acoustic | 22.99 in (584 mm) | Calculated |
| Hole 1 from foot | 20.48 in (520 mm) | **⚠ FIRST-ORDER** |
| Hole 4 from foot | 17.22 in (437 mm) | **⚠ FIRST-ORDER** |
| Hole 8 from foot | 12.18 in (309 mm) | **⚠ FIRST-ORDER** |
| Notch width | ~11 mm | TBD by prototype |
| Notch depth | ~5 mm | TBD by prototype |

[See drawings/: bore-profile, tonehole-layout, embouchure-detail, headstock-drill-setup]

---

# ASSEMBLY MANUAL (summary — full version: assembly-manual.md)

**Stage 1 — Blank prep:** Mill to 1.5×1.5×26 in. Grain parallel. MC ≤ 8%. Mark centerlines and bore centers.

**Stage 2 — Bore scrap blank (MANDATORY):**
- Headstock Jacobs chuck + stationary blank in tailstock carrier
- Anti-rotation clamps REQUIRED (blank will launch without them)
- Peck drill: 0.5 in pecks, 500–800 RPM, chip-clear every peck
- Sequence: 1/4 in pilot → 1/2 in step → 55/64 in → ream to 0.866 in
- Measure wander. **Reject if > 0.030 in. Re-jig and repeat.**

**Stage 3 — Bore tonewood:** Identical to Stage 2. Measure bore at 3 stations.

**Stage 4 — Turn OD:** Mount from BORE AXIS (bore-plug at tailstock). Turn to 1.338 in.

**Stage 5 — Embouchure notch:** Router + hand chisel. Width ~11 mm, depth ~5 mm, inner bevel ~45°. **Set by ear — listen for stable edge tone.**

**Stage 6 — Tone holes:** V-block + length stop. Pilot 3 mm → finish 6–10 mm. Sequence H1→H8. H8 (thumb) drilled from rear.

**Stage 7 — Voicing:** Undercut each hole with file/chisel. Measure with strobe tuner at 68°F. ±10 cents per hole.

**Stage 8 — Finishing:** BLO bore finish (cloth strip, 24 hr cure). Re-measure after cure. Danish oil exterior. Foot plug fitted.

---

# VALIDATION / TUNING SHEET (fill in on prototype)

| Check | Target | Tolerance | Measured | Cents Error | Pass/Fail |
|---|---|---|---|---|---|
| Bore wander (scrap) | < 0.030 in | — | ___ | — | ___ |
| Bore dia (entry) | 0.866 in | ± 0.005 | ___ | — | ___ |
| Bore dia (mid) | 0.866 in | ± 0.005 | ___ | — | ___ |
| Bore dia (exit) | 0.866 in | ± 0.005 | ___ | — | ___ |
| Fundamental D4 | 293.66 Hz | ± 5 ¢ | ___ | ___ | ___ |
| δ_emb (calculated) | 0.260 in (model) | TBD | ___ | — | ___ |
| Hole 1 — E4 | 329.63 Hz | ± 10 ¢ | ___ | ___ | ___ |
| Hole 2 — F4 | 349.23 Hz | ± 10 ¢ | ___ | ___ | ___ |
| Hole 3 — Gb4 | 369.99 Hz | ± 10 ¢ | ___ | ___ | ___ |
| Hole 4 — G4 | 392.00 Hz | ± 10 ¢ | ___ | ___ | ___ |
| Hole 5 — A4 | 440.00 Hz | ± 10 ¢ | ___ | ___ | ___ |
| Hole 6 — B4 | 493.88 Hz | ± 10 ¢ | ___ | ___ | ___ |
| Hole 7 — C5 | 523.25 Hz | ± 10 ¢ | ___ | ___ | ___ |
| Hole 8 — Db5 | 554.37 Hz | ± 10 ¢ | ___ | ___ | ___ |
| Overblown octave | 587.33 Hz | ± 15 ¢ | ___ | ___ | ___ |
| Bore finish delta | TBD | — | ___ | ___ | ___ |
| Structural (no cracks) | None visible | — | ___ | — | ___ |

**Record temperature:** ____°F at time of measurement. Target: 68°F.  
**Tuner used:** _____________________________

---

# SUPPLIER RFQ

See `supplier-rfq.md` for full templates. Key items to confirm with suppliers:

- Walnut blanks: Do you stock 1.5 in square × 26 in? Kiln-dried? MC?
- 55/64 in bit: Available in 18 in+ length? Lead time?
- Reamer: 7/8 in adjustable in stock?

---

# APPENDIX — FORMULAS

```
c     = 13504 × √(1 + T_F/491.67)      in/s, T_F in Fahrenheit
f_n   = 440 × 2^((MIDI_n − 69) / 12)  Hz
L_eff = c / (2 × f_root)               acoustic length, in
δ     = 0.6 × (bore_ID / 2)            end correction each end, in
L_bore = L_eff − 2 × δ                 physical bore length, in
d_n   = L_eff × (f_root / f_hole_n)    hole n distance from foot, in
cents = 1200 × log2(f_meas / f_target) cents error

Hole offsets from root (semitones): +2, +3, +4, +5, +7, +9, +10, +11
Key convention: Xiao key = root + 5 semitones = 4th hole note
```

---

*Xiao Family (箫) · XIAO-001 · Heifer Zephyr · github.com/tonykoop/xiao · CC BY 4.0*
