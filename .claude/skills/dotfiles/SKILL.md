---
name: dotfiles
description: Manage Adrian's dotfiles (bare git repo at ~/.dotfiles)
user_invocable: true
---

# Dotfiles

Bare git repo at `~/.dotfiles` with work tree at `$HOME`. Remote: `https://github.com/ansemb/wt-settings.git`.

**Command:** In PowerShell use `dotfiles` (alias for `git --git-dir=$HOME\.dotfiles --work-tree=$HOME`). In bash:

```bash
git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" <args>
```

## Tracked files

| Path | What |
|---|---|
| `.claude/settings.json` | Claude Code settings (model, statusline, plugins) |
| `.claude/statusline.ps1` | PowerShell status line script (Catppuccin Mocha palette) |
| `.claude/mcp.json` | MCP server config (Playwright/Edge) |
| `.claude/keybindings.json` | Claude Code keybindings (double-tab to cycle mode) |
| `.config/powershell/profile.ps1` | PowerShell profile (starship, keybindings, aliases, zoxide, fnm) |
| `.config/starship.toml` | Starship prompt config |
| `.config/nvim/init.vim` | Neovim config |
| `.config/alacritty/` | Alacritty terminal config + Catppuccin theme submodule |
| `AppData/Roaming/alacritty/alacritty.yml` | Windows Alacritty config |
| `profiles.json` | Windows Terminal settings (gruvbox theme, DejaVuSansMono font) |

## Workflow

1. Read the relevant config file before editing
2. Make surgical edits, preserve existing style
3. Stage with `dotfiles add <file>` — never commit/push without explicit instruction
4. Warn about side effects when configs are coupled (e.g., starship ↔ PowerShell profile)
