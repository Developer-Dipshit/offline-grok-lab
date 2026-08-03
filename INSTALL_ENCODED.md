# Installing full binaries from encoded parts

Large binaries are stored as base64 chunks under `encoded/` (to fit GitHub MCP upload limits).

After clone:

```bash
bash scripts/decode-encoded.sh
# rebuilds:
#   bin/local-engine-bin
#   bin/gmenu-chat
#   local-engine/lib/grok_local_agent.py
#   bin/device-agent
#   bin/gmenu
#   bin/menu
```

Or use the local package tarball on-device:
`/root/var/offline-grok-lab-phase-ab.tgz`

## Docs already on this repo

- [PROJECT.md](./PROJECT.md) — architecture (Phase A+B)
- [README.md](./README.md)
- [knowledge/](./knowledge/)
- [skills/local/](./skills/local/)
- offline-engine-status / offline-engine-repair under `bin/`
