# Offline Grok Lab Stack

On-device (Termux/proot) offline abliterated Grok engine, multi-tool `/local` agent, allowlisted `gmenu-chat`, env-healer, master menu, and ladder hooks.

**Full project doc:** [PROJECT.md](./PROJECT.md)

## Quick use

```bash
# Power path — multi-tool agent (default)
loc "check ollama and write status to /tmp/out.txt"
loc tool STATUS
loc tool READ /path

# Legacy SHELL/SU only
loc run --legacy "goal"

# Safe allowlisted chat tools
gmenu-chat --list-tools
gmenu-chat --run status
gmenu-chat --run engine_repair --confirm

# Heal / menu
env-healer auto --once --skip-llm
menu
```

## Components

| Path | Description |
|------|-------------|
| `PROJECT.md` | Full architecture + Phase A/B docs |
| `local-engine/lib/grok_local_agent.py` | Multi-tool offline agent |
| `local-engine/bin/grok-local-agent` | Agent entrypoint |
| `bin/local-engine-bin` | `/local` CLI (`loc`) — default backend `multi` |
| `bin/gmenu-chat` | Allowlisted system chatbot (29 tools) |
| `bin/device-agent` | Legacy SHELL/SU loop |
| `bin/gmenu` | Offline commander |
| `bin/menu` | Master menu |
| `env-healer/` | Scan → classify → patch → auto-heal |
| `skills/local/` | Grok TUI skill: `/local` |
| `knowledge/` | Design/status docs |
| `profile.d/` | Shell aliases |
| `sovereign-grok/` | Offline wrappers (no cloud binary) |

## Install

```bash
git clone https://github.com/Developer-Dipshit/offline-grok-lab.git
cd offline-grok-lab
export PATH="$PWD/bin:$PWD/local-engine/bin:$PATH"
for f in bin/*; do sudo ln -sfn "$(pwd)/$f" /usr/local/bin/$(basename "$f"); done
sudo ln -sfn "$(pwd)/local-engine/bin/grok-local-agent" /usr/local/bin/grok-local-agent
# Ollama + abliterated model required separately
offline-engine-status
loc status
```

## Phase A/B (2026-08-03)

- `loc` default: multi-tool agent (`READ`/`WRITE`/`EDIT`/`SHELL`/…)
- Legacy: `LOCAL_ENGINE_BACKEND=device-agent` or `loc run --legacy`
- Device-safe LLM: `LOCAL_AGENT_NUM_CTX=2048` (avoids 16k wedge)
- Safe chat: `gmenu-chat --list-tools` / `--run <tool>`

## Security

- Do **not** commit API tokens or `auth.json`.
- Grok core binary and Ollama model weights are **not** included.
- Ladder privilege is offline staging unless Shizuku is live.

## Docs

- [PROJECT.md](./PROJECT.md) — architecture, tools, install, troubleshooting  
- [knowledge/LOCAL_SLASH_COMMAND.md](./knowledge/LOCAL_SLASH_COMMAND.md)  
- [knowledge/GMENU_CHAT_TOOLS.md](./knowledge/GMENU_CHAT_TOOLS.md)  
