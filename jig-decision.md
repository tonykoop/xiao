# Xiao — Jig Decision Record

**Project:** XIAO-001 · G Nan Xiao  
**Date:** 2026-05-08

This document records jig selection decisions, trade-offs considered, and fixture specifications for the xiao build. Part of the v4.3 public-readiness adjunct set.

---

## Decision 1 — Long-Bore Drilling Method

**Question:** How do we drill a 22.5 in straight bore through a 1.5 in square hardwood blank?

### Options considered

| Method | Description | Pros | Cons |
|---|---|---|---|
| **A. Headstock-driven drilling** | Bit spins in headstock Jacobs chuck; square blank advanced from tailstock vise (selected) | Works with square stock pre-turning; single setup; validated on pan-flute builds | Requires rigid tailstock carrier; long bits whip; scrap validation mandatory |
| B. Split-blank routing | Rip blank in half; CNC-route semicircular channel in each half; re-glue | Precise bore profile; accessible for cleanup | Glue line in bore; registration error risk; seam affects tone |
| C. Drill press with extension | Index blank through drill press; drill from both ends to meet | Simple tooling | Bore wander at junction; difficult to center-match from both ends |
| D. Long-series bit in drill chuck (no lathe) | Freehand long-bit boring | Lowest setup | High wander risk on long bore; not recommended |

**Decision: Method A — Headstock-driven drilling.**

Rationale: The xiao bore is cylindrical (no taper) and must be drilled before turning the OD — the bore axis becomes the datum for all subsequent turning. Method A is the only approach that guarantees the bore and OD share a common axis. The split-blank glue-line risk is unacceptable for a tuned bore instrument. The pan-flute precedent (Uncle Carpenter reference) gives validated setup procedures.

**Fallback:** If bore wander on the scrap blank exceeds 0.030 in with Method A, switch to Method B (split-blank routing with CNC) for the tonewood blank.

---

## Decision 1 — Fixture Specifications

**Tailstock square-stock carrier (shop-made):**

- Material: 3/4 in Baltic birch plywood or MDF, 2 layers laminated
- Channel: Square pocket sized to blank cross-section (1.5 in × 1.5 in + 0.002 in slip fit)
- Anti-rotation: Two side clamps (toggle clamps or hand screws) engaging blank faces
- Alignment: Carrier rides on lathe bed and is shimmed until center of pocket tracks spindle axis (verify with dial indicator)
- Steady rest: Optional — mount between tailstock and headstock for blanks >24 in

**Lathe taper and chuck:**
- Headstock taper: Confirm MT2 or MT3 (lathe-specific — check before ordering chuck)
- Jacobs chuck capacity: Must accept 1/4 in and 55/64 in shanks. Most 5/8 in capacity chucks work for pilot; 1 in capacity chuck needed for finish bit.
- Drill bit shank: Reduce-shank bits acceptable if chuck capacity is insufficient

**Depth stop:**
- Mark finish bore depth on drill shank with tape flag at: 25.0 in from chuck face
- This limits drilling depth and prevents running the chuck into the carrier

---

## Decision 2 — Tone Hole Drilling Jig

**Question:** How do we drill perpendicular tone holes at precise axial positions along a round (post-turning) body?

### Options considered

| Method | Pros | Cons |
|---|---|---|
| **A. V-block + drill press fence (selected)** | Simple; adjustable; works with any diameter | Requires fence indexed to body length |
| B. Laser-cut template sleeve | Accurate if made correctly; reusable | Requires template material and laser time |
| C. Freehand with pilot holes | Fastest | Not accurate enough for ±1 mm tone hole placement |

**Decision: Method A — V-block clamped to drill press fence with length stop.**

**Fixture specification:**
- V-block: Commercial or shop-made, sized for 1.338 in OD body
- Length stop: Adjustable stop clamped to drill press fence. Set stop distance = distance from foot + bore center offset for each hole
- Perpendicularity: V-block aligns bore axis horizontally; drill press provides vertical drill axis — holes are automatically perpendicular to bore
- Sequence: Drill in order from foot toward head (holes 1 → 8), re-indexing stop for each

See `jigs/tonehole-drilling-jig.md` for full fixture setup diagram.

---

## Decision 3 — Embouchure Notch Cutting

**Question:** How do we cut the U-notch with consistent geometry and a clean inner bevel?

### Options considered

| Method | Pros | Cons |
|---|---|---|
| **A. Router bit in drill press or router table (selected)** | Consistent profile; controllable depth | Requires correct bit radius; setup time |
| B. Chisel and mallet (hand cut) | Traditional; flexible | Skill-dependent; hard to reproduce |
| C. CNC router (if body is held in fixture) | Most precise | Requires fixture and CAM setup |

**Decision: Method A — small ball-nose or straight router bit in drill press, followed by hand bevel refinement.**

The router establishes the notch width and initial depth. The inner bevel — the acoustic edge — is refined by hand with a sharp chisel. This is a judgment call that depends on the prototype's tonal response; no fixture can substitute for listening during voicing.

**Notch geometry starting point (TBD — refine by playing):**
- Width: 10–12 mm centered on bore axis
- Depth: ~5 mm below OD surface (intersects bore at upper tangent line)
- Inner bevel: 45° into bore toward foot; sharpen with chisel to a clean edge

---

## Decision 4 — Foot Plug Fit

**Question:** Should the foot plug be fixed (glued) or adjustable?

**Decision: Adjustable (friction fit, no glue) for prototype.**

A sliding foot plug allows ±2–3 mm of acoustic length adjustment, providing a coarse pitch trim of approximately ±8–12 cents. This is useful during prototype tuning before committing to final hole positions. Mark plug insertion depth on body for reproducibility. If a fixed plug is desired for production, glue after final tuning is confirmed.
