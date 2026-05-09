# Jig: Tone Hole Drilling — V-Block + Length Stop

**Project:** XIAO-001 · G Nan Xiao  
**Operation:** OP-07  
**Decision basis:** jig-decision.md — Decision 2

---

## Purpose

Hold the round xiao body (OD 1.338 in) perpendicular to the drill press spindle while indexing each hole precisely along the body length from the foot datum.

## Materials

- (1×) Commercial V-block, sized for 1.5 in OD or larger (common machinist V-block works)
- (1×) Clamp to hold V-block to drill press table
- (1×) Length-stop — adjustable stop clamped to drill press fence
- (1×) Steel rule or calipers for stop setting

## Setup Procedure

1. Mount V-block on drill press table; align V groove parallel to drill press column.
2. Clamp the foot stop at the hole-1 distance from drill press spindle centerline (20.48 in from foot face — minus 1–2 mm tuning margin → set at 20.30 in).
3. Place body in V-block, foot end against the stop.
4. Verify body is horizontal and drill bit is perpendicular to body surface (no tilt).
5. Drill hole 1: pilot first, then finish size.
6. Re-set stop for hole 2 (stop distance = 19.15 in, etc. — see operations.csv).
7. Repeat for all 8 holes.

## Stop Distances (with −1 mm tuning margin applied)

| Hole | Note | Model dist (in) | Stop dist (in) |
|---|---|---|---|
| H1 | E4 | 20.48 | 20.44 |
| H2 | F4 | 19.33 | 19.29 |
| H3 | Gb4 | 18.25 | 18.21 |
| H4 | G4 | 17.22 | 17.18 |
| H5 | A4 | 15.34 | 15.30 |
| H6 | B4 | 13.67 | 13.63 |
| H7 | C5 | 12.90 | 12.86 |
| H8 | Db5 (rear) | 12.18 | 12.14 |

> H8 (thumb hole) is drilled through the rear face of the body. Rotate body 180° in V-block, re-clamp, and re-index the same length stop.

## Verification

After drilling all holes, measure center-to-center spacings with calipers and compare to model. Record differences in validation.csv before voicing.
