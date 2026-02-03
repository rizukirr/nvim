# Neovim Configuration

Personal Neovim configuration optimized for C/C++ and Flutter/Dart development using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

## Features

- **Modern Neovim setup** with lazy-loading for fast startup
- **C/C++ development** with clangd LSP and clang-format
- **Flutter/Dart support** with flutter-tools integration
- **Smart completion** with blink.cmp
- **AI assistance** with Supermaven
- **Git integration** with lazygit and gitsigns
- **Beautiful UI** with Catppuccin theme and dashboard
- **Advanced navigation** with Telescope and Flash
- **Code formatting** on save with conform.nvim

## Requirements

- Neovim >= 0.9.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (optional but recommended for icons)
- Optional: `clangd`, `flutter`, `stylua` (installed via Mason)

## Plugins

### Core Functionality
| Plugin | Description |
|--------|-------------|
| [snacks.nvim](https://github.com/folke/snacks.nvim) | Swiss army knife - dashboard, picker, lazygit, explorer, notifications |
| [blink.cmp](https://github.com/saghen/blink.cmp) | Fast completion engine with snippet and LSP support |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Format on save with stylua, clang-format, prettier, etc. |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Displays available keybindings in popup |

### Language Support
| Plugin | Description |
|--------|-------------|
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configurations (lua_ls, clangd, bashls, kotlin_ls) |
| [clangd_extensions.nvim](https://github.com/p00f/clangd_extensions.nvim) | Enhanced C/C++ features for clangd |
| [flutter-tools.nvim](https://github.com/akinsho/flutter-tools.nvim) | Flutter development integration |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Advanced syntax highlighting and parsing |
| [meson.nvim](https://github.com/igorgue/meson.nvim) | Meson build system support |

### UI & Navigation
| Plugin | Description |
|--------|-------------|
| [catppuccin](https://github.com/catppuccin/nvim) | Soothing pastel theme with multiple flavors |
| [flash.nvim](https://github.com/folke/flash.nvim) | Navigate code with search labels |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | Pretty list for diagnostics, references, quickfix |
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) | Preview markdown in browser |
| [mini.icons](https://github.com/echasnovski/mini.icons) | Icon provider |

### Editing & Productivity
| Plugin | Description |
|--------|-------------|
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets, quotes, and more |
| [grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim) | Find and replace across files |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlight and search TODO comments |
| [hardtime.nvim](https://github.com/m4xshen/hardtime.nvim) | Establish good Vim habits |

### Git Integration
| Plugin | Description |
|--------|-------------|
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git decorations and hunk operations |
| [codediff.nvim](https://github.com/esmuellert/codediff.nvim) | Git diff viewer with conflict resolution |
| lazygit | Git UI (via snacks.nvim) |

### AI & Completion
| Plugin | Description |
|--------|-------------|
| [supermaven-nvim](https://github.com/supermaven-inc/supermaven-nvim) | AI-powered code completion |

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

## Post-Installation

After launching Neovim for the first time:

1. Install language servers and formatters:
   ```vim
   :Mason
   ```

2. Check configuration health:
   ```vim
   :checkhealth
   ```

3. View keybindings:
   ```vim
   <leader>?
   ```
   (Leader key is `<space>`)

## Key Bindings

### General
- `<leader>e` - File explorer (snacks explorer)
- `<leader><space>` - Smart find files
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>,` - Switch buffers
- `<leader>/` - Search in files
- `<leader>?` - Show keybindings

### LSP
- `gd` - Go to definition
- `gD` - Go to declaration
- `gr` - Find references
- `gI` - Go to implementation
- `K` - Hover documentation
- `<leader>ca` - Code actions
- `<leader>cf` - Format buffer
- `<leader>cr` - Rename symbol

### Git
- `<leader>lg` - Open lazygit
- `<leader>gd` - Git diff toggle
- `<leader>gb` - Git branches
- `<leader>gl` - Git log
- `<leader>gs` - Git status
- `]h` / `[h` - Next/previous hunk

### Diagnostics
- `<leader>xx` - Toggle diagnostics
- `]d` / `[d` - Next/previous diagnostic
- `<leader>sd` - Search diagnostics

### Search
- `<leader>sb` - Search buffer lines
- `<leader>sc` - Command history
- `<leader>sh` - Help pages
- `<leader>sk` - Keymaps
- `<leader>ss` - LSP symbols

See `lua/config/keymaps.lua` for all keybindings.

## Customization

This configuration is designed to be easily customizable:

1. **Options**: Edit `lua/config/options.lua`
2. **Keymaps**: Edit `lua/config/keymaps.lua`
3. **Plugins**: Add/modify files in `lua/plugins/`
4. **LSP**: Customize servers in `lua/plugins/lsp.lua`

## License

MIT
