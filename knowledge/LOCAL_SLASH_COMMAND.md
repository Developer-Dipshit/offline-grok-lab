# `/local` — Offline multi-tool Grok engine

**Updated:** 2026-08-03 (Phase A: multi-tool default)

## Important: bash keyword

The word `local` is reserved in bash functions. Prefer:

```bash
loc "goal"                    # alias
local-engine "goal"
/usr/local/bin/local-engine-bin run "goal"
```

In Grok TUI the slash command is still: **`/local <goal>`** (skill loads and runs the binary path).

## Invoke

| Surface | Command |
|---------|---------|
| Grok TUI | `/local <goal>` |
| Shell | `loc "goal"` or `local-engine run "goal"` |
| Direct tools | `loc tool STATUS` / `loc tool READ /path` |
| Legacy | `loc run --legacy "goal"` or `LOCAL_ENGINE_BACKEND=device-agent loc "goal"` |
| Menu | AI → **h) /local engine** |

## Subcommands

```bash
loc "check ollama and write /tmp/x"     # multi-tool agent (default)
loc run --legacy "..."                  # device-agent SHELL/SU only
loc ask "what is disk free?"            # LLM only
loc tool STATUS                         # no LLM
loc tool READ /usr/local/bin/menu 1:40
loc tool SHELL 'df -h /'
loc status | loc progress
loc directive add "Prefer ladder offline"
loc objective add "harden termux"
loc heal
loc shell 'uname -m'
```

## Flow (default multi)

1. Ensures Ollama + abliterated model  
2. Applies fixed directives from `/root/local-engine/state/directives.txt`  
3. Runs **`grok_local_agent`** so the local model can issue structured tools:  
   `SHELL` / `SU` / `READ` / `WRITE` / `EDIT` / `LS` / `GREP` / `FIND` / `GIT` / `MENU` / `HEAL` / `STATUS` / `TODO` / `DONE`  
4. Saves progress under `/root/local-engine/state/progress/`  

## Legacy flow

`device-agent -y` with `SHELL:` / `SU:` / `DONE:` only.

## Operator mode

```bash
loc directive add "Never claim uid=2000 without rish"
loc "verify offline engine and summarize to /tmp/status.txt"
loc progress
```

## Power vs safe chat

| Path | Role |
|------|------|
| `loc` / multi-tool | Full operator power |
| `gmenu-chat` | Allowlisted tools only (safer) |
