# Xiao Family (箫)

*Engineering documentation and parametric design for the xiao — Chinese end-blown vertical bamboo flute.*

**Build ID:** XIAO-001 · **Variants:** Bei Xiao · Nan Xiao · Qin Xiao · **Scale:** 8-hole chromatic  
**Prototype target:** G Nan Xiao (root D4) · Black walnut · Headstock-driven deep-bore drilling  
Part of the [tonykoop/instrument-maker](https://github.com/tonykoop/instrument-maker) catalogue.

> ⚠ **Status: First-order acoustic model.** Bore lengths and tone-hole positions are model predictions. All tuning claims are marked as estimates and must be validated on prototype.

---

<!-- hero image placeholder — replace with finished instrument photo -->
![Xiao hero image](images/finished-full.jpg)

---

## What this is

The xiao (箫, *xiāo*) is a Chinese end-blown vertical flute with a breathy, dark tone — one of the oldest and most meditative instruments in the Chinese tradition. This repo contains a complete engineering build packet for a CNC-turned wooden prototype across three bore variants:

- **Bei Xiao (北箫)** — Northern style, capped U-notch, larger bore
- **Nan Xiao (南箫)** — Southern style, open bamboo-root end (most common; prototype target)
- **Qin Xiao (琴箫)** — Narrow-bore companion to the guqin zither

The design table covers 26 keys from C4 through D6. The G Nan Xiao (root D4, bore ≈ 22 mm) is the prototype focus.

The key engineering challenge is the 22.5 in straight bore — drilled before turning the exterior, using the headstock-driven technique so the bore axis becomes the lathe datum.

---

## File Map

| File / Folder | Description |
|---|---|
| `xiao-design-table.xlsx` | Parametric design table — all 26 keys × 3 variants |
| `design.md` | Governing acoustic model, hole positions, formulas, assumptions |
| `bom.csv` | Bill of materials |
| `sourcing.csv` | Supplier table |
| `cut-list.csv` | Stock and cut dimensions |
| `validation.csv` | Tuning checkpoints with pass/fail blanks |
| `assembly-manual.md` | Stage-by-stage build instructions |
| `supplier-rfq.md` | RFQ templates for lumber and tooling |
| `visual-bom-brief.md` | Photo/image layout spec for the visual BOM |
| `drawing-brief.md` | Drawing specifications and critical dimensions |
| `risks.md` | Red-team risk register — 12 risks with verification tests |
| `resources.md` | Cultural provenance, acoustic references, open review items |
| `jig-decision.md` | Fixture selection decisions for bore drilling and tone holes |
| `photo-shotlist.md` | Staged photo list for build documentation |
| `drawings/` | Dimensioned SVG drawings (bore profile, tone holes, embouchure, drill setup) |
| `cnc/` | Operation graph, operations.csv, setup-sheet.md |
| `jigs/` | Jig specs — headstock bore carrier, tonehole V-block |
| `wolfram/instrument-model.wl` | Wolfram acoustic model package |
| `cad/` | SolidWorks CAD placeholder |
| `site/index.html` | Build-log static site |
| `images/` | Build photos (populate during build) |
| `data/` | Design intake JSON and CSV |

---

## Build Workflow

```
Design table → Acoustic model → Stock prep → Bore scrap blank (validate) →
Bore tonewood → Turn OD from bore axis → Cut embouchure notch →
Lay out tone holes → Drill tone holes → Voice / tune → Finish → Validate
```

**Critical rule: bore before turning.** The bore axis becomes the lathe datum. Do not turn the exterior first.

---

## Acoustic Model (summary)

- **Model:** Open-open cylindrical pipe — `f = c / (2 · L_eff)`
- **Speed of sound:** 13,504 in/s at 68°F
- **G Nan Xiao prototype:** root D4 = 293.66 Hz → L_eff = 22.99 in → L_bore = 22.47 in
- **End correction (each open end):** δ = 0.6 × r = 0.260 in (embouchure assumed open — TBD)
- **Tone holes:** 8-hole chromatic, offsets +2,+3,+4,+5,+7,+9,+10,+11 semitones from root
- **NAF corrections do NOT apply.** All hole positions first-order until prototype measured.

See `design.md` for full model, all formulas, and the complete hole position table.

---

## Key Drawings

| Drawing | File |
|---|---|
| Bore profile (section view) | `drawings/xiao-bore-profile.svg` |
| Tone hole layout (plan view) | `drawings/xiao-tonehole-layout.svg` |
| Embouchure notch detail | `drawings/xiao-embouchure-detail.svg` |
| Headstock drilling setup | `drawings/xiao-headstock-drill-setup.svg` |

---

## Build Risks (top 3)

1. **RISK-S01 — Bore wander (HIGH):** 22.5 in bore wander risks thin wall or structural failure. Validate on scrap blank first; reject if wander > 0.030 in.
2. **RISK-A01 — Embouchure end correction (HIGH):** Model assumes δ_emb = 0.260 in. Real value unknown until prototype. Leave trim allowance and measure before drilling holes.
3. **RISK-S02 — Embouchure notch cracks (HIGH):** U-notch stress concentration at wall. Radius corners; seal grain immediately. Full register in `risks.md`.

---

## License

[CC BY 4.0](LICENSE) — see LICENSE for details.

---

*Heifer Zephyr instrument catalogue · [tonykoop](https://github.com/tonykoop)*
