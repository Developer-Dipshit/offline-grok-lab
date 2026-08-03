# GitHub upload status

**Repo:** https://github.com/Developer-Dipshit/offline-grok-lab

## On GitHub
- PROJECT.md, README.md, INSTALL_ENCODED.md
- knowledge/, skills/local/
- bin/offline-engine-status, bin/offline-engine-repair
- scripts/decode-encoded.sh, encoded/MANIFEST.json
- encoded/*.b64.* (base64 parts — run decode after clone)

## Full tree offline
Local package: device path `github_upload_offline_build`
Tarball on device: `offline-grok-lab-phase-ab.tgz`

```bash
bash scripts/decode-encoded.sh   # rebuild large binaries from encoded/
```
