"""Check the recorded source/PDF pairing. This does not verify mathematics."""
from pathlib import Path
import hashlib, json

repo = Path(__file__).resolve().parents[2]
manifest = json.loads((repo / "verification/build_manifest.json").read_text(encoding="utf-8-sig"))
for kind in ("source", "pdf"):
    path = repo / manifest[kind]
    if hashlib.sha256(path.read_bytes()).hexdigest() != manifest[f"{kind}_sha256"]:
        raise SystemExit(f"{kind} changed since the recorded build. Rebuild with verification/scripts/build.ps1.")
    if kind == "pdf" and not path.read_bytes().startswith(b"%PDF-"):
        raise SystemExit("The manuscript is not a PDF.")
json.loads((repo / "prompts_and_logs/conversation.json").read_text(encoding="utf-8-sig"))
for name in ("README.md", "LICENSE", "prompts_and_logs/system_prompt.txt", "prompts_and_logs/cost_summary.md"):
    if not (repo / name).is_file():
        raise SystemExit(f"Missing required file: {name}")
print("Source/PDF hashes, PDF header, provenance JSON, and required files pass. Mathematics is not checked.")
