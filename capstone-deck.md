# Xiao Family Capstone Deck Outline
## XIAO-001 · G Nan Xiao · v4.3 · 2026-05-08

> Binary .pptx: run `python3 scripts/generate_capstone_docs.py . --title "Xiao Capstone"` when bash is available.

---

# Slide 1 — Title

**Xiao Family (箫)**  
*Chinese End-Blown Vertical Flute — Engineering Documentation*  
Build ID: XIAO-001 · G Nan Xiao prototype · Heifer Zephyr · 2026-05-08

[hero image: finished xiao, vertical, natural light]

---

# Slide 2 — What This Project Is

**One sentence:** A parametric engineering study of the Chinese xiao, producing a CNC-turned wooden prototype of the G Nan Xiao with a 22.5 in deep-bored cylindrical bore, 8-hole chromatic scale, and first-order acoustic validation.

**Intended use:**
- Demonstrate long-bore woodwind design and headstock-driven drilling technique
- Establish baseline acoustic model for three bore variants (Bei/Nan/Qin)
- Populate the Heifer Zephyr instrument catalogue with a new woodwind family

**Design table covers:** 26 keys × 3 variants (Bei / Nan / Qin Xiao)

---

# Slide 3 — File Map

| File | Purpose | Use when |
|---|---|---|
| `xiao-design-table.xlsx` | Parametric design — all keys and variants | All dimensions |
| `design.md` | Acoustic model, formulas, hole positions | Building the physics |
| `assembly-manual.md` | Stage-by-stage build guide | In the shop |
| `cnc/setup-sheet.md` | Operation plan, release checks | Before each operation |
| `jigs/*.md` | Jig specs for bore and tone holes | Fixture setup |
| `drawings/*.svg` | Bore profile, tone holes, embouchure, drill setup | Layout and reference |
| `wolfram/instrument-model.wl` | Wolfram acoustic model package | Physics validation |
| `risks.md` | 12 risks with verification tests | Before cutting material |
| `validation.csv` | Tuning checkpoints | After each voicing pass |
| `site/index.html` | Public build-log site | Sharing with outside makers |

---

# Slide 4 — Build Workflow

```
Stock prep → Bore SCRAP (validate) → Bore tonewood → Turn OD from bore axis
→ Embouchure notch (by ear) → Lay out tone holes → Drill holes
→ Voice / tune (strobe) → Bore finish → Validate → Ship
```

**Critical rule: Bore before turning.** The bore axis is the lathe datum.  
**Critical rule: Scrap blank first.** Bore wander < 0.030 in before touching tonewood.  
**Critical rule: All tuning claims first-order** until prototype measured.

---

# Slide 5 — Acoustic Model

**Governing model:** Open-open cylindrical pipe  
`f = c / (2 · L_eff)` · `L_eff = L_bore + 1.2 · r` (both ends open)

**G Nan Xiao prototype:**

| Parameter | Value | Status |
|---|---|---|
| Root (D4) | 293.66 Hz | Formula |
| L_eff | 22.99 in | Calculated |
| δ_emb | 0.260 in assumed | **TBD — measure on prototype** |
| L_bore | 22.47 in | **FIRST-ORDER ESTIMATE** |
| Bore ID | 0.866 in | Design table |

**Scale:** 8-hole chromatic, offsets +2,+3,+4,+5,+7,+9,+10,+11 from root  
**Key convention:** Xiao key = 4th hole note (G xiao has root D)  
**No NAF corrections** — different embouchure geometry and bore range.

[embed: drawings/xiao-tonehole-layout.svg]

---

# Slide 6 — BOM and Sourcing

| Item | Qty | Cost | Status |
|---|---|---|---|
| Black walnut blank 1.5×1.5×26 in | 1 | $8–15 | TBD |
| Scrap pine/poplar blank | 1 | $3–5 | TBD |
| 1/4 in pilot bit 18 in+ | 1 | $8 | TBD |
| 55/64 in finish bit 18 in+ | 1 | $25–45 | **Order first — lead time 3–5 days** |
| 7/8 in adjustable reamer | 1 | $35 | TBD |
| Bore + exterior finish | 1 set | $9 | Available |
| Tailstock carrier (shop-made) | 1 | $15 | TBD |
| **Total (est.)** | | **~$109** | |

**Lead-time risk:** 55/64 in bit. Order before cutting stock.

---

# Slide 7 — Drawings and CAD

[embed: drawings/xiao-bore-profile.svg] — Bore Profile (DWG-001)  
[embed: drawings/xiao-headstock-drill-setup.svg] — Drill Setup (DWG-004)

| Drawing | Status | File |
|---|---|---|
| Bore profile | ✅ Generated | drawings/xiao-bore-profile.svg |
| Tone hole layout | ✅ Generated | drawings/xiao-tonehole-layout.svg |
| Embouchure detail | ✅ Generated | drawings/xiao-embouchure-detail.svg |
| Drill setup diagram | ✅ Generated | drawings/xiao-headstock-drill-setup.svg |
| SolidWorks body part | ❌ TBD | cad/ |

---

# Slide 8 — CNC / Operation Plan

**Machines:** Wood lathe (bore + turning) · Drill press (tone holes) · Router table (embouchure notch)

**9 operations sequenced** in `cnc/cnc-plan.json` + `cnc/setup-sheet.md`:

OP-01 Stock → OP-02 Bore scrap (**gate**) → OP-03 Bore tonewood → OP-04 Turn OD → OP-05 Notch → OP-06 Layout → OP-07 Drill holes → OP-08 Voice → OP-09 Finish

Each operation has a **release check** — the next OP cannot start until it passes.

---

# Slide 9 — Assembly

**Bore before turning** (bore axis = lathe datum)  
**Headstock-driven drilling:** bit in headstock Jacobs chuck; blank stationary in tailstock carrier  
**Peck drilling:** 0.5 in pecks, retract to clear chips, conservative RPM (500–800)  
**Embouchure notch:** set by ear, not by dimension — bevel angle refined to produce stable edge tone  
**Tone holes:** drilled 1–2 mm toward foot; undercut to tune sharp → flat

See `assembly-manual.md` and `jigs/` for full procedures.

---

# Slide 10 — Validation Plan

| Check | Target | Tolerance | Tool |
|---|---|---|---|
| Bore wander (scrap) | < 0.030 in | — | Calipers |
| Bore diameter | 0.866 in | ± 0.005 in | Telescoping gauge |
| Fundamental (D4) | 293.66 Hz | ± 5 cents | Korg OT-120 / Peterson |
| Embouchure δ (measured) | TBD | — | Back-calculate from f_meas |
| Each tone hole (H1–H8) | See design.md | ± 10 cents | Strobe tuner |
| Overblown octave | 587.33 Hz | ± 15 cents | Strobe tuner |

All measurements at 68°F. Record temperature in validation.csv.

---

# Slide 11 — Open Risks

| Risk | Severity | Status |
|---|---|---|
| RISK-A01: Embouchure δ unknown | HIGH | TBD — measure on blank |
| RISK-S01: Bore wander | HIGH | Mitigated: scrap validation |
| RISK-S02: Notch crack | HIGH | Mitigated: CA seal, radius corners |
| RISK-A03: Bore finish shifts pitch | MEDIUM | Mitigated: apply before voicing |
| RISK-SU01: 55/64 bit lead time | MEDIUM | Order before cutting stock |

Full register: `risks.md` — 12 risks with verification tests.

---

# Slide 12 — Next Actions

- [ ] Order 55/64 in long-series drill bit (lead time risk)
- [ ] Mill or source walnut blank + scrap blank
- [ ] Build tailstock square-stock carrier jig
- [ ] Run scrap bore validation — record wander and bore diameter
- [ ] If scrap passes: bore tonewood
- [ ] Measure fundamental on bored blank before drilling holes
- [ ] Update L_bore in design.md if δ_emb ≠ 0.260 in
- [ ] Drill tone holes and voice
- [ ] Populate validation.csv and images/
- [ ] Generate binary capstone-deck.pptx and print-packet.pdf (when bash available)
- [ ] SolidWorks CAD part from design table
