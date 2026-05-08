# Xiao — Drawing Brief

**Project:** XIAO-001 · G Nan Xiao  
**Date:** 2026-05-08  
**Drawing standard:** Blueprint quality (Strat blueprint reference — see drawing-and-visualization.md)  
**Units:** Inches primary, mm in parentheses

---

## Drawings Required

### DWG-001 — Bore Profile (Side View)
**File:** `drawings/xiao-bore-profile.svg`  
**Status:** Generated (first-order)  
**Contents:**
- Full-length side view of the xiao body, section cut on centerline
- Bore ID labeled: 0.866 in (22 mm)
- OD labeled: 1.338 in (34 mm)
- Wall thickness: 0.236 in (6 mm)
- Total body length: 25.5 in (648 mm) nominal
- Bore length: 22.47 in (571 mm) — labeled "FIRST-ORDER ESTIMATE"
- Mouthpiece section: 2.5 in from head end
- Foot end: open, with plug location noted
- Datum: foot-end open face = 0.000

### DWG-002 — Tone Hole Layout (Plan View)
**File:** `drawings/xiao-tonehole-layout.svg`  
**Status:** Generated (first-order)  
**Contents:**
- Unwrapped top surface of xiao body (front-hole side)
- All 8 holes with centers marked, distances from foot labeled
- Hole numbers and notes labeled
- Holes shown as circles (diameter TBD — use 8 mm / 0.315 in as placeholder)
- TBD callout on all hole positions: "FIRST-ORDER — verify on prototype"

### DWG-003 — Embouchure Detail
**File:** `drawings/xiao-embouchure-detail.svg`  
**Status:** Generated (schematic)  
**Contents:**
- Enlarged cross-section of mouthpiece end (2× scale)
- U-notch geometry: width TBD (~11 mm), depth TBD (~5 mm)
- Inner bevel angle: ~45° (starting point)
- Lip contact zone indicated
- Player's breath direction arrow (airstream direction)
- Bore axis shown in phantom line

### DWG-004 — Headstock Drilling Setup (Jig Diagram)
**File:** `drawings/xiao-headstock-drill-setup.svg`  
**Status:** Schematic placeholder  
**Contents:**
- Lathe bed elevation view
- Headstock with Jacobs chuck and long drill bit
- Tailstock with square-stock carrier / V-block
- Blank clamped in carrier, stationary
- Anti-rotation clamps labeled
- Drill peck depth annotation
- Safety zone callout (no-hands region at chuck)

---

## Critical Dimensions (shop reference)

| Dimension | Value | Status |
|---|---|---|
| Bore ID | 0.866 in (22.0 mm) | Design table |
| OD | 1.338 in (34.0 mm) | Derived |
| Wall thickness | 0.236 in (6.0 mm) | Design table |
| Total body length | 25.5 in (648 mm) | Nominal — add trim allowance |
| Bore length | 22.47 in (571 mm) | FIRST-ORDER ESTIMATE |
| L_eff (acoustic) | 22.99 in (584 mm) | Calculated |
| Hole 1 from foot | 20.48 in (520 mm) | FIRST-ORDER ESTIMATE |
| Hole 4 from foot | 17.22 in (437 mm) | FIRST-ORDER ESTIMATE |
| Hole 8 from foot | 12.18 in (309 mm) | FIRST-ORDER ESTIMATE |
| Notch width | ~11 mm | TBD — prototype |
| Notch depth | ~5 mm | TBD — prototype |

---

## CAD Status

| File | Status | Notes |
|---|---|---|
| `cad/xiao-body.SLDPRT` | TBD | SolidWorks part — not yet created |
| `cad/xiao-design-table.xlsx` | TBD | SW design table from xiao-design-table.xlsx |
| `cad/xiao-assembly.SLDASM` | TBD | Assembly with foot plug |

See `references/solidworks-integration.md` for design table workflow.
