# Neovim Configuration

Personal Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

## Requirements

- Neovim >= 0.9.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (optional, for icons)

## Structure

```
~/.config/nvim/
├── init.lua              # Entry point, bootstraps lazy.nvim
├── lua/
│   ├── config/
│   │   ├── options.lua   # Neovim options
│   │   ├── keymaps.lua   # Key mappings
│   │   └── autocmds.lua  # Autocommands
│   └── plugins/          # Plugin configurations
└── lazy-lock.json        # Plugin version lock file
```

## Plugins

| Plugin | Description |
|--------|-------------|
| autopair | Auto-close brackets and quotes |
| blink-cmp | Completion engine |
| catppuccin | Color scheme |
| clangd-extension | C/C++ language support |
| conform | Code formatting |
| dashboard | Start screen |
| flash | Navigation and search |
| flutter | Flutter development tools |
| gitsign | Git integration |
| grug-far | Search and replace |
| lazygit | Git UI |
| lsp | Language Server Protocol |
| meson | Meson build system support |
| supermaven | AI code completion |
| telescope | Fuzzy finder |
| todo | Todo comments highlighting |
| treesitter | Syntax highlighting |
| trouble | Diagnostics list |
| undotree | Undo history visualizer |
| whichkey | Keybinding hints |
| yazi | File manager integration |

## Installation

1. Backup your existing configuration:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. Clone this repository:
   ```bash
   git clone <repository-url> ~/.config/nvim
   ```

3. Start Neovim:
   ```bash
   nvim
   ```

Lazy.nvim will automatically bootstrap and install all plugins on first launch.

## License

MIT
