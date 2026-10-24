# Nadel vanishing on singular complex spaces

**Nadel Vanishing on Singular Complex Spaces via the Grauert–Riemenschneider Canonical Sheaf**  
**Author:** Zhijian Chen  
**Manuscript date:** October 24, 2026

[Read the paper](papers/paper_v1.pdf) · [LaTeX source](papers/src/nadel_vanishing_note.tex) · [Personal website](https://chen-zhijian.github.io/)

## Overview

This research note formulates Nadel vanishing for reduced, pure-dimensional, weakly pseudoconvex Kähler complex spaces. It uses the weighted Grauert–Riemenschneider canonical sheaf to combine the canonical factor and the multiplier condition, describes that sheaf on a resolution, and derives vanishing from two stated analytic inputs: a weighted L²-Dolbeault resolution and a global ∂̄ estimate.

The discussion makes the positivity required near the singular locus explicit. It also explains why pulling back to a resolution does not by itself prove vanishing, and gives a cusp example showing the failure of a naive tensor-product formulation.

## Scope and limitations

- The Kähler, exhaustion, and curvature assumptions remain part of the vanishing statement. The note does not impose normality, a Q-Gorenstein condition, or rational singularities.
- The weighted resolution and global estimate are cited analytic inputs. In particular, the global estimate from the cited July 15, 2026 version of Watanabe’s preprint is used rather than reproved.
- The manuscript records the relevant prior results and the resolution-theoretic comparison. This repository does not establish a separate peer-review status or priority claim.
- A successful LaTeX build checks document compilation; it does not verify the mathematical arguments. No proof-assistant formalization is included.

## Repository contents

| Path | Contents |
| --- | --- |
| `papers/paper_v1.pdf` | Current compiled manuscript at the stable website link |
| `papers/src/nadel_vanishing_note.tex` | Self-contained LaTeX source, including its bibliography |
| `verification/scripts/build.ps1` | Manuscript build script |
| `verification/build_manifest.json` | Source/PDF hashes from the recorded build |
| `verification/lean/README.md` | Explicit status: no Lean formalization is included |
| `prompts_and_logs/conversation.json` | Selected visible ChatGPT research and compilation-repair messages |
| `prompts_and_logs/README.md` | Provenance coverage, transformations, and remaining gaps |
| `LICENSE` and `NOTICE` | Apache-2.0 licensing terms and notices |
| `README.md` | Project overview, scope, and maintenance instructions |

No external bibliography database, figure files, or private working documents are needed to build the manuscript. Author credit follows the supplied source.

## Provenance

The related ChatGPT conversation “Establish Nadel Vanishing Theorem” was recovered through its visible-message view on October 24, 2026. The [selected export](prompts_and_logs/conversation.json) contains ten user and assistant messages across five turns: the initial literature-and-theorem request, the note’s preparation, and compilation failures and subsequent repairs. No returned message was truncated. Local paths have been redacted, and unavailable citation markers and attachment links are documented in the export metadata.

This is a partial provenance record, not a complete original chat archive. It excludes tool records, hidden reasoning, and platform instructions. The exact model, historical system prompt, token totals, and costs were not available; none have been inferred. Historical assistant statements about mathematical validity or compilation are preserved as historical claims. Current source/PDF build checks are recorded separately under `verification/`.

## Build

Install a TeX distribution with XeLaTeX and the standard packages used in the source, including `amsart`, `fontspec`, Latin Modern fonts, `geometry`, `mathtools`, `mathrsfs`, `microtype`, `fancyhdr`, `hyperref`, and `bookmark`. From the repository root, run the PowerShell build script:

```powershell
./verification/scripts/build.ps1
```

The script builds `papers/src/nadel_vanishing_note.tex` with XeLaTeX and refreshes `papers/paper_v1.pdf`. The source also supports pdfLaTeX and LuaLaTeX, but the repository build uses XeLaTeX. Repeated compilation resolves cross-references.

## Maintain the website link

Edit the source in this repository, rebuild and inspect the PDF, then commit and push both source and PDF to `main`. The personal website points to `papers/paper_v1.pdf` in this repository, so it reaches the updated manuscript without copying a PDF into the website repository. Update the website separately if the title, summary, scope, author credit, or link path changes.

## License

Licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) and [NOTICE](NOTICE).
