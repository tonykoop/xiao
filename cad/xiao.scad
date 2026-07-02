// =============================================================
// Xiao (箫) — G Nan Xiao prototype — OpenSCAD parametric master
// =============================================================
// Authority: pending_measurement. NOT fabrication authority until
// reviewed against a measured prototype (see visual-output-register.csv
// and design.md "Key Assumptions & Open Questions").
//
// SCOPE — BORE + TONE-HOLE ARRAY ONLY.
//   The blowing edge (the end-blown notch/bevel cut into the top of the
//   mouthpiece section) is EXPLICITLY OUT OF SCOPE for this master. No
//   notch, bevel, or embouchure chamfer geometry is modeled here — see
//   RISK-A01 / RISK-S02 in risks.md for why that geometry is deferred
//   (end correction at that end is an unmeasured assumption, and the
//   notch stress-concentration detail needs prototype-driven radii).
//   The mouthpiece section is modeled only as uncut stock length.
//
// Dimension sources (do not edit values without updating the source
// record):
//   - bore_id_in, wall_thickness_in, mouthpiece_length_in, L_bore_in:
//     design.md section 2.3 "Prototype target — G Nan Xiao" table
//     (fully worked from xiao-design-table.xlsx's Nan Xiao / D4-root
//     column, root frequency and end-correction formulas).
//   - root_midi / offsets_semitones / hole formulas: design.md section
//     2.4 "Tone-hole placement" and section 6 "Parametric Formulas".
//   - hole_dia_in: design.md section 5 "Key Assumptions & Open
//     Questions" — explicitly TBD; traditional range ~8-10 mm. Modeled
//     at 9 mm (0.354 in) as a documented ASSUMPTION, not a design-table
//     value. Flag before fabrication.
//   - front/back hole split (7 front + 1 back thumb hole): xiao-design-
//     table.xlsx "Xiao Family" sheet, row 86 ("§3 Geometry & Materials").
//
// KNOWN SOURCE DISCREPANCY (flagged, not silently resolved):
//   xiao-design-table.xlsx row 16 (Nan Xiao Bore ID) column E (D4 root /
//   G4 key — the prototype column) currently evaluates to 0.984 in bore
//   / 0.276 in wall, NOT the 0.866 in / 0.236 in used by design.md's
//   worked table. The xlsx's "End Correction" row (row 33) formula
//   references row 8 (Bei Xiao's bore row) for every column instead of
//   the matching variant's bore row, so the live workbook's acoustic
//   chain is not actually wired to the Nan Xiao bore cells. This master
//   uses design.md's explicitly worked, internally-consistent numbers
//   (0.866 in bore / 0.236 in wall; OD = 0.866 + 2*0.236 = 1.338 in,
//   matching design.md's stated OD). Reconciling the xlsx formula is
//   out of scope for this pass — do not silently pick one without this
//   note. Hole *positions* are unaffected by this discrepancy (they
//   depend only on L_eff and frequency ratios, not on bore_id_in).
//   c = 13504 in/s (design.md section 2.1, fixed at 68F) is used rather
//   than design.md section 6's temperature-parametric formula, which
//   returns ~14400 in/s at 68F when evaluated literally — inconsistent
//   with the section 2.1 constant. Flagged, not used.
//
// Units: inches.
// =============================================================

$fn = 64;

/* [Acoustic model inputs — design.md section 2.1 / 2.3] */
c_in_per_s      = 13504;    // speed of sound at 68F/20C, 0% RH; design.md 2.1 (fixed, see discrepancy note above)
root_midi       = 62;       // D4 root note (G Nan Xiao "4th hole" key); design.md 2.3
hole_offsets    = [2, 3, 4, 5, 7, 9, 10, 11]; // semitones from root, holes 1-8; design.md 2.4/2.6

/* [Bore + stock — design.md section 2.3, Nan Xiao worked table] */
bore_id_in          = 0.866; // design.md 2.3 "Bore ID"; see discrepancy note re: xlsx row16 col E = 0.984
wall_thickness_in   = 0.236; // design.md 2.3 "Wall thickness"; see discrepancy note re: xlsx row17 col E = 0.276
mouthpiece_length_in = 2.5;  // design.md 2.3 / xlsx row20 col E (both sources agree = 2.5 in)
hole_dia_in          = 0.354; // ASSUMPTION (9 mm); design.md 5 "Hole diameter TBD, traditional ~8-10mm"

/* [Tone-hole layout — xiao-design-table.xlsx row 86: 7 front + 1 back thumb] */
back_hole_index = 8; // hole 8 (LH thumb) is the back hole; holes 1-7 are front

// ---------------------------------------------------------------------------
// Derived acoustic geometry (formulas, not baked values — design.md 2.6 / 6)
// ---------------------------------------------------------------------------

function f_root() = 440 * pow(2, (root_midi - 69) / 12);
function L_eff_in() = c_in_per_s / (2 * f_root());
function delta_end_in() = 0.6 * (bore_id_in / 2);          // design.md 2.2
function L_bore_in() = L_eff_in() - 2 * delta_end_in();     // design.md 2.3

function f_hole_in(offset) = 440 * pow(2, (root_midi + offset - 69) / 12);
// Distance measured FROM THE FOOT (open end), per design.md 2.4.
function dist_from_foot_in(offset) = L_eff_in() * (f_root() / f_hole_in(offset));

bore_radius_in = bore_id_in / 2;
body_od_in     = bore_id_in + 2 * wall_thickness_in;

// Body tube = physical acoustic bore + uncut mouthpiece stock at the top
// (blowing-edge notch geometry NOT modeled — see header scope note).
body_total_length_in = L_bore_in() + mouthpiece_length_in;

// ---------------------------------------------------------------------------
// Modules
// ---------------------------------------------------------------------------

// Body stock: a plain cylindrical tube from foot (z=0) to top of the
// mouthpiece stock (z=body_total_length_in). No embouchure notch, no
// exterior turning profile — see header scope note.
module body_tube() {
  difference() {
    cylinder(h = body_total_length_in, d = body_od_in, center = false);
    translate([0, 0, -0.1])
      cylinder(h = body_total_length_in + 0.2, d = bore_id_in, center = false);
  }
}

// One tone hole, drilled radially through the wall at height z from the
// foot. front=true places it on the +X face (RH/LH front holes);
// front=false places it on the -X face (thumb hole).
module tone_hole(z, front = true) {
  x_dir = front ? 1 : -1;
  translate([0, 0, z])
    rotate([0, 90, 0])
      translate([0, 0, -body_od_in])
        cylinder(h = body_od_in * 2 + 0.2, d = hole_dia_in, center = false);
}

// Full 8-hole array, positioned by the acoustic formula above.
module tone_hole_array() {
  for (i = [1 : len(hole_offsets)]) {
    z = dist_from_foot_in(hole_offsets[i - 1]);
    is_back = (i == back_hole_index);
    tone_hole(z, front = !is_back);
  }
}

module xiao_assembly() {
  difference() {
    body_tube();
    tone_hole_array();
  }
}

xiao_assembly();

// Echo the derived acoustic geometry so `openscad` runs double as a
// dimension check against design.md's worked table.
echo(str("f_root_hz=", f_root()));
echo(str("L_eff_in=", L_eff_in()));
echo(str("delta_end_in=", delta_end_in()));
echo(str("L_bore_in=", L_bore_in()));
echo(str("body_od_in=", body_od_in));
for (i = [1 : len(hole_offsets)])
  echo(str("hole_", i, "_dist_from_foot_in=", dist_from_foot_in(hole_offsets[i - 1])));
