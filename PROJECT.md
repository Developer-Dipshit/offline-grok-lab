# Offline Grok Lab — Project Documentation

**Updated:** 2026-08-03  
**Remote:** https://github.com/Developer-Dipshit/offline-grok-lab  

Offline (Termux / proot Ubuntu) abliterated Grok stack: multi-tool local agent, allowlisted chat, master menu, env-healer, and framework staging ladder hooks.

## Purpose

| Need | Solution |
|------|----------|
| Grok-style agent on-device without cloud | `loc` multi-tool agent |
| Safe system ops without free shell | `gmenu-chat` allowlist |
| Repair Ollama + offline model | `offline-engine-repair`, `env-healer` |
| Operator TUI | `menu`, `gmenu` |

## Power vs safe

| Path | Role |
|------|------|
| **`loc`** (default multi) | READ/WRITE/EDIT/SHELL/SU/GREP/… full operator |
| **`gmenu-chat`** | 29 allowlisted tools + confirm for mutators |
| **`--legacy` / device-agent** | SHELL/SU loop only |

## Quick use

```bash
loc "goal"
loc tool STATUS
loc run --legacy "goal"
gmenu-chat --list-tools
gmenu-chat --run status
env-healer auto --once --skip-llm
menu
```

## Architecture

```
menu / gmenu / /local / gmenu-chat / loc
        | power              | safe
        v                    v
 local-engine-bin         gmenu-chat (29 tools)
   multi agent               |
   READ WRITE SHELL…         |
        |                    |
        +--------+-----------+
                 v
         Ollama abliterated/offline
         127.0.0.1:11434 (num_ctx≈2048 device-safe)
```

Privilege: framework staging **ladder** when rish/Shizuku offline (not uid=2000).

## Phase A — Multi-tool engine

- `local-engine/lib/grok_local_agent.py`
- `bin/local-engine-bin` default `LOCAL_ENGINE_BACKEND=multi`
- Device-safe: `LOCAL_AGENT_NUM_CTX=2048`

Actions: SHELL, SU, READ, WRITE, EDIT, LS, GREP, FIND, GIT, MENU, HEAL, STATUS, TODO, DONE

## Phase B — gmenu-chat

- Default model probes abliterated/offline
- `--list-tools`, `--run <tool> [--confirm]`
- No free shell

## Install

```bash
git clone https://github.com/Developer-Dipshit/offline-grok-lab.git
cd offline-grok-lab
bash scripts/decode-encoded.sh   # rebuild large bins from encoded/
export PATH="$PWD/bin:$PWD/local-engine/bin:$PATH"
# link to /usr/local/bin as needed
# Ollama + abliterated model required separately
loc status
```

Full offline package on lab device also ships as tarball `offline-grok-lab-phase-ab.tgz`.

## Security

- No API tokens / auth.json / model weights in repo
- Lab / owned-device contexts only
- Mutating allowlist tools need confirm

## Docs

- README.md, INSTALL_ENCODED.md, GITHUB_UPLOAD.md
- knowledge/LOCAL_SLASH_COMMAND.md, knowledge/GMENU_CHAT_TOOLS.md
- skills/local/SKILL.md
