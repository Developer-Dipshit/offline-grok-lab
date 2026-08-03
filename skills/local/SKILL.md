---
name: local
description: >
  Run the offline local Grok multi-tool engine (abliterated Ollama) with full
  command execution. Use when the user runs /local, wants on-device command
  control, offline work, local engine, or "use local model to run commands".
  Triggers: /local, local engine, offline agent, dac, on-device.
argument-hint: "<goal or ask …>"
user-invocable: true
disable-model-invocation: false
allowed-tools:
  - run_terminal_command
  - read_file
  - list_dir
  - grep
metadata:
  short-description: "Offline multi-tool engine + shell control"
---

# /local — Offline multi-tool Grok engine

Route work through the **local abliterated multi-tool agent** (not cloud-only reasoning).

## Required action

Parse arguments after `/local`, then run **exactly one** of these shell commands
using the **full path** (bash reserves the word `local`):

### Default goal (multi-tool agent: READ/WRITE/EDIT/SHELL/SU/…)

```bash
/usr/local/bin/local-engine-bin run <user goal text>
```

### Legacy device-agent only (SHELL/SU)

```bash
LOCAL_ENGINE_BACKEND=device-agent /usr/local/bin/local-engine-bin run <goal>
# or:
/usr/local/bin/local-engine-bin run --legacy <goal>
```

### Q&A only

```bash
/usr/local/bin/local-engine-bin ask <question>
```

### Direct tool (no LLM)

```bash
/usr/local/bin/local-engine-bin tool STATUS
/usr/local/bin/local-engine-bin tool READ /path
/usr/local/bin/local-engine-bin tool SHELL 'uname -a'
```

### Other

```bash
/usr/local/bin/local-engine-bin status
/usr/local/bin/local-engine-bin progress
/usr/local/bin/local-engine-bin heal
```

## Rules

1. Always use `/usr/local/bin/local-engine-bin` — never bare `local` in bash (reserved word).
2. Show full terminal output to the user.
3. If multi-tool fails: `LOCAL_ENGINE_BACKEND=device-agent /usr/local/bin/local-engine-bin run <goal>`
4. Last resort: `/usr/local/bin/device-agent -y <goal>`
5. Stay on-device; do not switch to cloud models for this skill.
6. Afterward, mention any `[progress] ...` path printed.

## Subcommand map

| User types | Shell |
|------------|--------|
| `/local <goal>` | `.../local-engine-bin run <goal>` |
| `/local ask <q>` | `.../local-engine-bin ask <q>` |
| `/local tool …` | `.../local-engine-bin tool …` |
| `/local status` | `.../local-engine-bin status` |
| `/local progress` | `.../local-engine-bin progress` |
