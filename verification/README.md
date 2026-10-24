# Verification status

The scripts rebuild the manuscript and check the recorded source/PDF hashes. They do not verify any mathematical claim. No numerical verification scripts or proof-assistant formalization have been supplied.

Run `powershell -File verification/scripts/build.ps1` from the repository root with the stated TeX engine installed, then `python verification/scripts/verify.py`. Inspect the resulting PDF. The build disables shell escape and stops on LaTeX errors or unresolved references after three passes. The `.build/` directory retains local logs and is ignored by Git.

Commit `papers/paper_v1.pdf` and `verification/build_manifest.json` with each source revision. The manifest records a build pairing, not bit-for-bit reproducibility across TeX distributions.
