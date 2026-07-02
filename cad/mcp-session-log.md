# CAD / MCP Session Log — xiao

No external MCP or creative-tool sessions have produced artifacts in this packet as of 2026-05-29.
All SVGs in `drawings/` were generated from the design-table by prior sprint agents without an
interactive OpenSCAD MCP, Blender MCP, Illustrator MCP, or image-gen session.

When an OpenSCAD MCP, Blender MCP, or image-gen session produces or modifies a repo artifact,
add a row to the table below before committing that artifact.

| session_id | tool | input_authority | outputs | role | authority_result | review_status | notes |
|---|---|---|---|---|---|---|---|
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) | xiao-design-table.xlsx, design.md | bom.csv, sourcing.csv, cut-list.csv, validation.csv | packet_refresh | fabrication | self_checked | V5 refresh pass; tabular packet data reviewed against design table |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) + OpenSCAD CLI | xiao-design-table.xlsx, design.md | cad/xiao.scad | cad_authoring | pending_measurement | self_checked | New parametric master authored (no prior cad/xiao.scad existed). Bore + tone-hole array scoped only; blowing-edge notch explicitly out of scope. Hole positions and L_eff/L_bore reproduced by formula from design.md 2.3/2.4/2.6 and verified against design.md's published table via OpenSCAD echo output (exact match). Flags a bore_id/wall_thickness discrepancy between design.md's worked table (0.866 in / 0.236 in) and xiao-design-table.xlsx row16/17 column E (0.984 in / 0.276 in) — used design.md's internally-consistent values, discrepancy documented in cad/xiao.scad header for reconciliation. OpenSCAD render check: pass (`openscad -o /tmp/xiao-check.stl cad/xiao.scad`, exit 0). |
