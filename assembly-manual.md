# Xiao — Assembly and Build Manual

**Instrument:** G Nan Xiao (南箫) · Root D4  
**Build ID:** XIAO-001  
**Last updated:** 2026-05-08

---

## Overview

The xiao is built in five stages: blank preparation → bore drilling → exterior turning → embouchure notch → tone hole drilling and voicing. Each stage has a checkpoint in validation.csv. Do not advance to the next stage until the checkpoint passes.

**Critical sequence rule:** Bore before turning. The bore axis becomes the lathe datum. If you turn the outside round first, you lose concentricity between bore and OD.

---

## Stage 1 — Blank Preparation

1. Select and mill stock to 1.5 in × 1.5 in × 26 in. Verify grain runs lengthwise.
2. Mark both faces with a centerline (pencil + marking gauge). Indent centers with an awl at each end.
3. Cut a scrap blank from pine or poplar to identical dimensions. The scrap blank is drilled first — do not skip this step.
4. Label blanks clearly: SCRAP / TONE.

**Checkpoint V-BLANK-LENGTH:** Measure blank length ≥ 25.5 in with steel rule before proceeding.

---

## Stage 2 — Headstock-Driven Deep-Bore Drilling

> This technique is adapted from Uncle Carpenter's pan-flute build method. The drill spins in the headstock; the stationary blank is advanced from the tailstock. See `jigs/headstock-bore-jig.md` and `references/techniques/headstock-driven-deep-bore-drilling.md`.

### 2.1 Lathe setup
1. Mount the Morse-taper Jacobs chuck in the headstock. Check that the chuck taper seats fully.
2. Install the 1/4 in pilot bit (min 18 in). Check runout at the tip: should be < 0.005 in.
3. Mount the tailstock square-stock carrier (V-block or square pocket fixture). Align to spindle axis with a dial indicator.
4. Add the anti-rotation feature (side clamps or square pocket). Friction alone will cause the blank to spin and launch.

### 2.2 Bore sequence — SCRAP BLANK FIRST
1. Bring the scrap blank into the carrier. Advance until the center mark touches the pilot bit tip.
2. Set spindle speed: **conservative** — 500–800 RPM for 1/4 in pilot in wood. Long bits whip at high speed.
3. Start the lathe. Advance the tailstock quill in 1/2 in pecks. Retract after each peck to clear chips.
4. After 3 in depth, stop and measure bore position against the blank edge at the entry point.
5. Complete the pilot bore through. Measure exit position; compute wander.

**Checkpoint V-BORE-SCRAP and V-BORE-WANDER:** Bore wander must be < 0.030 in. If > 1/16 in, re-jig tailstock carrier and repeat on new scrap.

### 2.3 Step drilling to finish diameter
1. Replace pilot with an intermediate bit (e.g., 5/8 in) and repeat peck sequence.
2. Final step: 55/64 in (0.859 in) bit. This undercuts the target bore by 0.007 in — finish with a reamer or lapping dowel.
3. Ream to 0.866 in (Nan Xiao G). Use the adjustable reamer or lap with 220/320 grit strips wrapped on a turned dowel.

**Checkpoint V-BORE-TONE:** Measure bore ID at 3 stations (entry, mid, exit) with a telescoping gauge and calipers. Target 0.866 in ± 0.005 in at all three.

---

## Stage 3 — Exterior Turning

> The bore axis is now the datum. Mount the blank between centers using the drilled bore as the reference, not the original endgrain centers.

1. Turn a live center plug that fits the bore at the tailstock end.
2. Mount blank between lathe centers using bore plug at tailstock, and the endgrain center at headstock.
3. Turn OD to finished diameter: **1.338 in** (= bore 0.866 + 2 × wall 0.236 = 1.338 in).
4. Taper the mouthpiece section (upper 2.5 in) if desired — traditional xiao tapers slightly toward the embouchure. First-order design uses no taper. Mark as TBD.
5. Sand OD to 220 grit while on lathe.

**Checkpoint V-OD-ROUND:** Measure OD at 4 stations along body. Variation < 0.010 in.

---

## Stage 4 — Embouchure Notch

The U-notch is the defining feature of the xiao embouchure. It is cut into the top wall of the mouthpiece section, centered on the bore axis.

### 4.1 Notch geometry (TBD — refine on prototype)
- **Notch width:** ~10–12 mm (0.39–0.47 in) across the flat face of the flute body
- **Notch depth:** 4–6 mm (0.16–0.24 in) below the outer surface, intersecting the bore at the upper edge
- **Notch profile:** U-shaped (router bit) or V-shaped (chisel). U-notch is more forgiving for beginners; V-notch allows faster attack and brighter tone.
- **Inner edge bevel:** The inner edge of the notch (facing the player's lips) should be beveled at ~45° into the bore for a clean jet split.

### 4.2 Procedure
1. Mark the notch center at the mouthpiece end. The notch faces the player (at top when held vertically).
2. Clamp the body in a V-block drilling jig, notch side up.
3. Rough the notch with a small router bit, chisel, or rotary tool.
4. Refine the inner bevel with a sharp chisel. Test the instrument by blowing — listen for the characteristic whistle-hiss of a functional edge tone.
5. Adjust the bevel angle until a stable tone emerges with light breath pressure.

**Checkpoint V-EMBROCHURE:** Notch produces a stable fundamental tone with light breath. No leakage around notch walls.

---

## Stage 5 — Tone Hole Drilling and Voicing

### 5.1 Lay out hole positions
1. Transfer hole positions from cut list / drawing to the body using calipers and a marking pencil.
2. Use the tonehole drilling jig (see `jigs/tonehole-drilling-jig.md`) to hold the body perpendicular during drilling.
3. Verify positions against the validation table before drilling.

> **Tuning margin rule:** Drill holes at the predicted position or 1–2 mm toward the foot (sharpening allowance). It is easier to sharpen a flat note (move hole footward) than to fix a note that is too sharp.

### 5.2 Drilling sequence
- Start with the smallest pilot bit (3 mm / 1/8 in).
- Open to initial diameter: ~6 mm for front holes, ~5 mm for thumb hole (Hole 8).
- Traditional hole sizes: 7–10 mm front, 5–7 mm thumb/pinky. Adjust by ear.

### 5.3 Voicing (undercutting)
- Each hole can be tuned sharp (undercut toward foot) or flat (undercut toward mouthpiece).
- Undercut with a round or tapered file, sharp chisel, or dental pick.
- Measure with strobe tuner after each pass. Record results in validation.csv.

**Checkpoints V-HOLE1 through V-HOLE8:** Each hole ±10 cents of target.

---

## Stage 6 — Finishing

1. Apply bore finish (BLO or shellac) with a rolled-up cloth strip. Work from the foot end. Allow 24 hr dry.
2. Measure fundamental pitch again after bore finishing — finish changes effective diameter slightly.
3. Apply exterior finish (Danish oil or wax). Avoid bore.
4. Optional: Apply traditional wrap at the head joint and at the node points (if bamboo aesthetics desired).
5. Fit foot plug / end cap. Tune by adjusting plug depth: inserting plug raises pitch, removing lowers.

**Final checkpoints:** V-FUND-FREQ, V-OCTAVE, V-STRUCT.

---

## Shop Notes

- Blow to play in before first measurement. Wood instruments change pitch as they warm.
- Take all measurements at 68°F. Every 10°F shift moves pitch ~3–4 cents in wood.
- Record measured values in validation.csv immediately.
- Photo all stages (see photo-shotlist.md).
