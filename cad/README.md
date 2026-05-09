# Xiao — CAD Folder

**Status:** Placeholder — CAD not yet created.

## Planned files

| File | Description | Status |
|---|---|---|
| `xiao-body-nan.SLDPRT` | SolidWorks part — Nan Xiao body (G key) | TBD |
| `xiao-body-bei.SLDPRT` | SolidWorks part — Bei Xiao body | TBD |
| `xiao-body-qin.SLDPRT` | SolidWorks part — Qin Xiao body | TBD |
| `xiao-foot-plug.SLDPRT` | Foot plug part | TBD |
| `xiao-assembly.SLDASM` | Full assembly with plug | TBD |
| `sw-design-table.xlsx` | SolidWorks design table generated from xiao-design-table.xlsx | TBD |

## Workflow

1. Generate SW design table: `python3 scripts/generate_sw_design_table.py . --output cad/sw-design-table.xlsx --part-name XIAO-001_NanXiao`
2. Create SolidWorks part from bore and OD dimensions in design.md
3. Drive all dimensions from the design table (bore ID, OD, wall, total length, hole positions)
4. Export STEP/STL for reference if needed

See `references/solidworks-integration.md` for Tony's SolidWorks workflow conventions.
