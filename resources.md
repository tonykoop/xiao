# Xiao — Resources and Provenance

**Project:** XIAO-001 · G Nan Xiao  
**Date:** 2026-05-08

This document records cultural context, acoustic references, design provenance, and learning resources used to inform this packet. It is part of the v4.3 public-readiness adjunct set.

---

## Cultural Provenance

The xiao (箫, also 洞箫 *dòngxiāo*, "cave flute") is one of the oldest and most studied Chinese wind instruments. Its lineage traces to at least the Tang Dynasty (7th–10th century CE) and likely earlier — possibly descended from Qiang ethnic-minority end-blown flutes of western China. The instrument figures prominently in Chinese court music, literati culture, and Daoist ritual practice, where its dark, breathy tone was considered closest to the human voice.

Three main regional and functional variants appear in the design table:

- **Bei Xiao (北箫)** — Northern style; relatively large bore, capped U-notch mouthpiece. Brighter and more projecting than the southern variant.
- **Nan Xiao (南箫)** — Southern style; the most widely played variant; open bamboo-root end, slightly larger bore, sweet and breathy character. The G Nan Xiao (root D4) is the most common teaching instrument.
- **Qin Xiao (琴箫)** — Guqin companion; narrow bore, longer mouthpiece section, refined and intimate tone used in chamber settings alongside the guqin (古琴) zither.

The xiao naming convention (key = 4th hole note) diverges from Western flute convention and from NAF convention. This is captured in the design table header and in design.md §2.6.

**Cultural review note:** This packet targets a **CNC-wood prototype** of a traditionally bamboo instrument. The design does not claim to reproduce the tonal characteristics of a historically sourced bamboo instrument. It is an engineering study using the xiao's acoustic geometry as the subject. Any public-facing documentation should make this distinction clearly.

---

## Acoustic References

| Reference | Notes |
|---|---|
| Benade, A.H. — *Fundamentals of Musical Acoustics* (1990) | Open-pipe model, tone-hole cutoff frequency, end-correction theory |
| Fletcher & Rossing — *The Physics of Musical Instruments* (2nd ed, 1998) | Woodwind bore acoustics, jet–edge interaction at the embouchure |
| Nederveen, C.J. — *Acoustical Aspects of Woodwind Instruments* (rev. 1998) | Tone hole lattice, effective length corrections, conical vs cylindrical bore |
| Wolfe, J. — UNSW Musical Acoustics (online) | Free online calculator for flute acoustics; useful for end-correction crosscheck |
| Yoshikawa, S. — papers on shakuhachi acoustics (J. Acoust. Soc. Am.) | Edge-tone and embouchure jet physics relevant to notch-type embouchures |

Recommended cross-check: [UNSW Flute Acoustics](https://www.phys.unsw.edu.au/music/flute/) — the open cylindrical flute calculator provides an independent estimate of hole positions that can validate the first-order model in design.md.

---

## Design Provenance

| Item | Source | Location |
|---|---|---|
| Bore dimensions (all 3 variants) | xiao-design-table.xlsx | `xiao-design-table.xlsx` |
| Open-pipe acoustic model | instrument-maker-v4 acoustic-models.md | Skill reference |
| Headstock drilling technique | Uncle Carpenter pan-flute video (YouTube) | `references/techniques/headstock-driven-deep-bore-drilling.md` |
| Tone-hole scale offsets | acoustic-models.md — Xiao 8-Hole Chromatic row | +2,+3,+4,+5,+7,+9,+10,+11 |
| Naming convention | acoustic-models.md — Naming conventions | Key = 4th hole note |
| Wolfram notebook spec | xiao-design-table.xlsx §5–6 | Embedded in design table |

---

## Learning Resources

| Resource | URL / Location | Notes |
|---|---|---|
| UNSW Musical Acoustics — Flute | https://www.phys.unsw.edu.au/music/flute/ | Open-pipe hole position calculator |
| Chinese Music Society of North America | https://www.chinesemusic.net | Cultural context, performance practice |
| Flute acoustics intro (Joe Wolfe) | https://www.phys.unsw.edu.au/jw/fluteacoustics.html | Accessible introduction to woodwind physics |
| Xiao tutorial (YouTube — various) | Search: '箫 教学' or 'xiao tutorial' | Embouchure formation, hand position |
| instrument-maker repo | https://github.com/tonykoop/instrument-maker | Parent skill and catalog |
| Heifer Zephyr instrument catalog | GitHub — tonykoop | Cross-instrument family reference |

---

## Open Review Items

- [ ] **Bamboo vs wood tuning delta:** Internal lacquer on bamboo xiao shrinks effective bore and shifts pitch flat. Quantify this for the wooden prototype by applying BLO and re-measuring. Add correction to validation.csv.
- [ ] **Regional tuning pitch:** Traditional Chinese pitch may not be A=440 Hz. Some professional xiao are tuned to A=442. Confirm target pitch standard before final voicing.
- [ ] **Makerspae cultural signage:** If the xiao is displayed or demonstrated at Maker Nexus, include a brief provenance card explaining the instrument's origin and the engineering/materials divergence from traditional bamboo.
