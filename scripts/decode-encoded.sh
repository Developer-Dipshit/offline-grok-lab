#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
python3 - "$ROOT" <<'ENDPY'
import base64, sys
from pathlib import Path
root = Path(sys.argv[1])
parts_dir = root / "encoded"
items = [
  ("bin/local-engine-bin", "bin__local-engine-bin"),
  ("bin/gmenu-chat", "bin__gmenu-chat"),
  ("local-engine/lib/grok_local_agent.py", "local-engine__lib__grok_local_agent.py"),
  ("bin/device-agent", "bin__device-agent"),
  ("bin/gmenu", "bin__gmenu"),
  ("bin/menu", "bin__menu"),
]
for out_rel, prefix in items:
  chunks = sorted(parts_dir.glob(prefix + ".b64.*"), key=lambda p: int(p.name.rsplit(".", 1)[-1]))
  if not chunks:
    print("skip missing", out_rel)
    continue
  data = base64.b64decode("".join(c.read_text() for c in chunks))
  out = root / out_rel
  out.parent.mkdir(parents=True, exist_ok=True)
  out.write_bytes(data)
  out.chmod(0o755)
  print("wrote", out, len(data))
print("decode complete")
ENDPY
