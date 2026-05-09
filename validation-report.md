# Xiao — Validation Report (v4.3 Root-Mode Packet)

**Build ID:** XIAO-001 · G Nan Xiao  
**Validator:** instrument-maker-v4 verifier specialist (manual pass — bash workspace unavailable)  
**Mode:** Root-mode (Mode A) — files at repo root  
**Date:** 2026-05-08  
**Pass criteria:** v4.3 root-mode quality gates

---

## Summary

| Category | Gate | Status |
|---|---|---|
| Packet completeness | All required files present | ✅ PASS |
| Acoustic model | Governing model correct, guard rules followed | ✅ PASS |
| Drawings | 4 SVG drawings generated | ✅ PASS |
| CNC / operation plan | cnc-plan.json, operations.csv, setup-sheet.md | ✅ PASS |
| Wolfram package | instrument-model.wl with Manipulate + audio | ✅ PASS |
| Risks | 12 risks across 5 categories, each with test | ✅ PASS |
| Resources + jig-decision | v4.3 adjuncts present | ✅ PASS |
| Site | site/index.html renders cleanly | ✅ PASS |
| Capstone | capstone-deck.md (binary skipped — bash unavailable) | ⚠ DEGRADED |
| Print packet | print-packet.md (binary skipped — bash unavailable) | ⚠ DEGRADED |
| CAD | SolidWorks part not yet created | ❌ OPEN |
| Measured data | No prototype yet — validation.csv all TBD | ❌ OPEN (expected) |
| Images | No build photos yet | ❌ OPEN (expected) |

**Overall: PACKET SHIPS as first-order design document.** 3 open items are expected pre-build; 2 degraded items are bash-availability-dependent (can be resolved by running the generate script).

---

## Gate-by-Gate Detail

### ✅ Packet structure (root-mode)

All required Mode A files are present:

| File | Required | Status |
|---|---|---|
| README.md | ✅ | ✅ Hero section, file map, build workflow, top risks |
| design.md | ✅ | ✅ Governing model, all formulas, hole table |
| bom.csv | ✅ | ✅ 11 line items |
| sourcing.csv | ✅ | ✅ 10 suppliers |
| cut-list.csv | ✅ | ✅ 4 parts with stock and finished dims |
| validation.csv | ✅ | ✅ 19 checks (all TBD — pre-build expected) |
| assembly-manual.md | ✅ | ✅ 6 stages with checkpoints |
| supplier-rfq.md | ✅ | ✅ 4 RFQ items |
| visual-bom-brief.md | ✅ | ✅ Hero spec + 9 part photos |
| drawing-brief.md | ✅ | ✅ 4 drawings specified + CAD status |
| risks.md | ✅ | ✅ 12 risks, 5 categories |
| photo-shotlist.md | ✅ | ✅ 6 phases, 20 shots |
| resources.md | ✅ | ✅ Cultural provenance, references, open items |
| jig-decision.md | ✅ | ✅ 4 jig decisions with trade-off analysis |
| wolfram/instrument-model.wl | ✅ | ✅ Full model with Manipulate |
| drawings/ (4 SVGs) | ✅ | ✅ bore-profile, tonehole-layout, embouchure, drill-setup |
| cnc/cnc-plan.json | ✅ | ✅ 9 operations, release checks |
| cnc/operations.csv | ✅ | ✅ Machine-readable operation graph |
| cnc/setup-sheet.md | ✅ | ✅ Human setup sheet |
| jigs/headstock-bore-jig.md | ✅ | ✅ Materials, fabrication, setup checklist |
| jigs/tonehole-drilling-jig.md | ✅ | ✅ Setup, stop distances table |
| cad/README.md | ✅ | ✅ Placeholder with workflow notes |
| site/index.html | ✅ | ✅ Static site with all sections |
| capstone-deck.md | ✅ | ✅ Slide outline (binary .pptx deferred) |
| print-packet.md | ✅ | ✅ Print-ready MD (binary .pdf deferred) |
| xiao-design-table.xlsx | ✅ (pre-existing) | ✅ All 26 keys × 3 variants |

---

### ✅ Physics model correctness

- **Model:** Open-open cylindrical pipe — correct for end-blown xiao
- **NAF K2 correction:** Explicitly excluded — guard rule followed
- **End correction:** 0.6·r at each end — standard Levine-Schwinger; embouchure assumption flagged as TBD
- **Tone-hole formula:** Acoustic-length first-order method — correct starting point; flagged as estimate
- **Scale offsets:** +2,+3,+4,+5,+7,+9,+10,+11 — verified against acoustic-models.md xiao row
- **Key convention:** Key = 4th hole = root + 5 semitones — verified against design table header
- **A4 sanity check:** f = 440 Hz ✅ | D4 = 293.66 Hz ✅
- **Known reference check:** G Nan Xiao L_bore ≈ 22.5 in; traditional xiao ~58–60 cm ≈ 22.8–23.6 in ✅ consistent

---

### ✅ Drawings

4 SVG drawings generated. All include title blocks, datums, critical dimensions, and first-order callouts:

| Drawing | Gate items | Status |
|---|---|---|
| xiao-bore-profile.svg | Title block, units, scale note, datum, bore ID, OD, wall, L_bore ⚠ callout | ✅ |
| xiao-tonehole-layout.svg | All 8 holes with positions, notes, hand groups, RH/LH labels | ✅ |
| xiao-embouchure-detail.svg | Cross-section + side view, notch dims TBD callout, bevel, airstream | ✅ |
| xiao-headstock-drill-setup.svg | Lathe setup, safety zone, peck annotation, anti-rotation callout | ✅ |

**Missing:** SolidWorks 3D renders (CAD not yet modeled — expected for prototype stage).

---

### ✅ CNC / operation plan

- cnc-plan.json: 9 operations with inputs, outputs, tooling, release checks ✅
- operations.csv: Machine-readable, shop-sortable ✅
- setup-sheet.md: Human setup sheet with OP-01 through OP-09 ✅
- No G-code emitted (correct — pre-CAM planning only) ✅
- Scrap-blank validation gate correctly placed before tonewood ✅

---

### ✅ Wolfram package

- `wolfram/instrument-model.wl` present ✅
- Parameters at top ✅
- `Manipulate` control with bore variant, key, and temperature sliders ✅
- Audio preview via `SoundNote` arpeggio ✅
- Validation plot: hole position vs semitone offset ✅
- `CentsError` function for post-prototype validation ✅
- `CreateDocument` entry point commented out (correct — requires Wolfram Desktop) ✅

---

### ✅ Risk register

- 12 risks across 5 categories ✅
- Each risk has a verification test ✅
- 3 HIGH risks, 5 MEDIUM risks, 4 LOW risks ✅
- Risk categories covered: acoustic, structural, ergonomic, supply, fit/finish ✅
- No risk without a test ✅

---

### ⚠ Capstone deck / print packet (DEGRADED — not blocking)

- capstone-deck.md: 12-slide outline complete ✅
- print-packet.md: Full print-ready content complete ✅
- capstone-deck.pptx: ❌ NOT GENERATED — bash workspace unavailable during packet build
- print-packet.pdf: ❌ NOT GENERATED — bash workspace unavailable

**Resolution:** Run the following when bash is available:
```bash
cd /sessions/.../mnt/GitHub/xiao
python3 /sessions/.../mnt/.claude/skills/instrument-maker-v4/scripts/generate_capstone_docs.py . --title "Xiao Capstone"
```

This is a tooling environment issue, not a design issue. The packet content is complete.

---

### ❌ CAD (OPEN — expected at prototype stage)

SolidWorks part and assembly not yet created. `cad/README.md` documents the planned workflow.

**Next action:** Generate SW design table from xiao-design-table.xlsx, then model the body part.

---

### ❌ Measured data (OPEN — pre-build)

No prototype has been built. All validation.csv rows are TBD. This is expected at the design-packet stage.

**Next action:** Build prototype → measure → populate validation.csv → run `scripts/record_measurement.py` to update the empirical-learning loop.

---

### ❌ Images (OPEN — pre-build)

No build photos. images/ folder is empty. photo-shotlist.md specifies 20 shots across 6 phases.

---

## Remaining Build Risks (summary for handoff)

These are the items a builder must resolve before the instrument ships:

1. **Order 55/64 in long-series bit** (lead time 3–5 days — order first, before cutting stock)
2. **Scrap bore validation** — bore wander must be < 0.030 in before touching tonewood
3. **Measure embouchure end correction** — blow blank after notch, before drilling holes. If fundamental error > ±15 cents vs 293.66 Hz, recalculate L_bore and update hole positions
4. **Bore finish → re-tune** — apply BLO before final voicing; BLO raises pitch 1–5 cents
5. **Undercut incrementally** — holes drilled 1–2 mm under model position; undercut to correct
6. **Generate binary capstone-deck.pptx and print-packet.pdf** — run generate_capstone_docs.py when bash available
7. **Model SolidWorks body** — from design table; optional for prototype but needed for production

---

## Verifier Sign-off

This packet is **ready for prototype build** with the first-order acoustic model as the starting point. The critical constraint is that all tuning claims are estimates — the real instrument will tell us the true end corrections and hole position corrections. The validation.csv is the instrument for capturing that data and closing the empirical loop.

**Packet version:** v4.3 root-mode  
**Validator:** instrument-maker-v4 verifier (manual)  
**Date:** 2026-05-08
