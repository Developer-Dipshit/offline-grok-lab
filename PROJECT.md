# Offline Grok Lab — Project Documentation

**Updated:** 2026-08-03  
**Repo package root:** `/root/var/github_upload_offline_build`  
**Remote:** https://github.com/Developer-Dipshit/offline-grok-lab  

Offline (Termux / proot Ubuntu) abliterated Grok stack: multi-tool local agent, allowlisted chat, master menu, env-healer, and framework staging ladder hooks.

Full documentation is in this file. Install and use:

```bash
git clone https://github.com/Developer-Dipshit/offline-grok-lab.git
cd offline-grok-lab
export PATH="$PWD/bin:$PWD/local-engine/bin:$PATH"
loc status
gmenu-chat --list-tools
```

## Power vs safe

| Path | Role |
|------|------|
| `loc` multi-tool agent | Full operator power (READ/WRITE/SHELL/…) |
| `gmenu-chat` | 29 allowlisted tools, confirm for mutators |
| `device-agent` / `--legacy` | SHELL/SU only |

## Phase A — Multi-tool engine

- `local-engine/lib/grok_local_agent.py`
- `bin/local-engine-bin` default backend `multi`
- Device-safe `LOCAL_AGENT_NUM_CTX=2048`

```bash
loc "goal"
loc tool STATUS
loc run --legacy "goal"
```

## Phase B — gmenu-chat

```bash
gmenu-chat --list-tools
gmenu-chat --run status
gmenu-chat --run engine_repair --confirm
```

## Architecture

Operator surfaces: menu, gmenu, /local skill, gmenu-chat, loc  
→ multi-tool agent or allowlisted chat  
→ Ollama abliterated/offline on 127.0.0.1:11434

Privilege: framework staging ladder when rish/Shizuku offline (not uid=2000).

## Security

- No API tokens or auth.json in repo
- No model weights
- Lab / owned-device contexts only

See repo files after full upload: `README.md`, `bin/`, `local-engine/`, `knowledge/`, `skills/local/`.
