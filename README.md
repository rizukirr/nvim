# Neovim Configuration

Personal Neovim configuration for C/C++, Rust, Flutter/Dart, Python, and Android (Kotlin/Java) development, using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

## Features

- **Modern Neovim setup** with lazy-loading for fast startup
- **C/C++ development** with clangd, clangd_extensions, and clang-format
- **Rust development** with rustaceanvim and crates.nvim
- **Flutter/Dart support** with flutter-tools integration and DAP debugging
- **Python support** with pyright, ruff, and black
- **Android/Kotlin/Java** support via droid-nvim
- **Assembly & CMake** language servers (asm-lsp, neocmake)
- **Smart completion** with blink.cmp
- **AI assistance** with Supermaven
- **Git integration** with gitsigns and Telescope git pickers
- **Beautiful UI** with a transparent Catppuccin theme and a Doom-style dashboard
- **Fast navigation** with Telescope, Flash, and oil.nvim
- **Format on save** with conform.nvim

## Requirements

- Neovim >= 0.11.0 (uses the `vim.lsp.config` / `vim.lsp.enable` API)
- Git and a C compiler / `make` (for `telescope-fzf-native`)
- A [Nerd Font](https://www.nerdfonts.com/) (recommended for icons)
- Language toolchains as needed: `flutter`/`dart`, `rustup` (cargo), `python`
- LSP servers, formatters, and debug adapters are installed automatically via Mason

## Plugins

### LSP, Completion & Formatting
| Plugin | Description |
|--------|-------------|
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP setup (lua_ls, clangd, pyright, ruff, neocmake, asm_lsp, bacon_ls) |
| [mason.nvim](https://github.com/mason-org/mason.nvim) + [mason-lspconfig](https://github.com/mason-org/mason-lspconfig.nvim) | Install and manage LSP servers, formatters, and DAPs |
| [lazydev.nvim](https://github.com/folke/lazydev.nvim) | Lua LS completion for the Neovim API |
| [clangd_extensions.nvim](https://github.com/p00f/clangd_extensions.nvim) | Enhanced C/C++ features for clangd |
| [blink.cmp](https://github.com/saghen/blink.cmp) | Fast completion engine with snippet and LSP support |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Format on save (stylua, clang-format, rustfmt) |
| [fidget.nvim](https://github.com/j-hui/fidget.nvim) | LSP progress notifications |

### Language Support
| Plugin | Description |
|--------|-------------|
| [rustaceanvim](https://github.com/mrcjkb/rustaceanvim) | Rust development (rust-analyzer, DAP via codelldb) |
| [crates.nvim](https://github.com/Saecki/crates.nvim) | `Cargo.toml` dependency management |
| [flutter-tools.nvim](https://github.com/nvim-flutter/flutter-tools.nvim) | Flutter/Dart development and debugging |
| [droid-nvim](https://github.com/rizukirr/droid-nvim) | Android/Kotlin/Java tooling (emulator, run, devices) |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Advanced syntax highlighting and parsing |

### UI & Navigation
| Plugin | Description |
|--------|-------------|
| [catppuccin](https://github.com/catppuccin/nvim) | Soothing pastel theme (transparent background) |
| [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim) | Doom-style start screen |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder (files, grep, LSP, git) with fzf-native + ui-select |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | Edit the filesystem like a buffer |
| [flash.nvim](https://github.com/folke/flash.nvim) | Navigate with search labels |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | Pretty list for diagnostics, references, quickfix |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Displays available keybindings in a popup |

### Editing & Productivity
| Plugin | Description |
|--------|-------------|
| [mini.pairs](https://github.com/nvim-mini/mini.pairs) | Auto-close brackets, quotes, and more |
| [grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim) | Find and replace across files |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlight and search TODO comments |
| [undotree](https://github.com/jiaoshijie/undotree) | Visualize and browse the undo history |

### Git & AI
| Plugin | Description |
|--------|-------------|
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git decorations, hunk staging, and blame |
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

Lazy.nvim will bootstrap itself and install all plugins on first launch. Mason then installs the configured LSP servers, formatters, and debug adapters automatically.

## Post-Installation

After launching Neovim for the first time:

1. Check that tools installed correctly:
   ```vim
   :Mason
   ```

2. Verify configuration health:
   ```vim
   :checkhealth
   ```

3. Explore keybindings via which-key (leader key is `<space>`).

## Key Bindings

Leader is `<space>`. Buffer-local LSP maps attach automatically per language server.

### General
- `<C-h/j/k/l>` - Move between windows
- `<C-arrows>` - Resize window
- `<A-j>` / `<A-k>` - Move line(s) down / up
- `<esc>` - Clear search highlight
- `[b` / `]b` - Previous / next buffer
- `<leader>bd` - Delete current buffer
- `<leader>bb` - Switch to other buffer

### Files & Search (Telescope + oil)
- `<leader>e` - File explorer (oil)
- `<leader><space>` / `<leader>ff` - Find files
- `<leader>fr` - Recent files
- `<leader>fb` / `<leader>,` - Buffers
- `<leader>fc` - Find config file
- `<leader>/` / `<leader>fg` - Live grep
- `<leader>sw` - Grep word under cursor
- `<leader>sr` - Search and replace (grug-far)
- `s` / `S` - Flash jump / Flash treesitter
- `<leader>ft` / `<leader>uC` - Colorscheme picker

### LSP
- `gd` - Goto definition
- `gD` - Goto type definition
- `gr` - References
- `gI` - Goto implementation
- `K` - Hover documentation
- `gK` / `<C-k>` - Signature help
- `<leader>ca` - Code action
- `<leader>cc` - Run codelens
- `<leader>cr` - Rename symbol
- `<leader>cf` - Format buffer
- `<leader>ss` / `<leader>sS` - Document / workspace symbols

### Git
- `<leader>gs` - Git status
- `<leader>gb` - Git branches
- `<leader>gl` / `<leader>gL` - Git commits / buffer commits
- `<leader>gf` - Git files
- `<leader>gS` - Git stash
- `]h` / `[h` - Next / previous hunk
- `<leader>ghs` / `<leader>ghr` - Stage / reset hunk
- `<leader>ghb` - Blame line
- `<leader>ghd` - Diff this

### Diagnostics & Trouble
- `<leader>xx` - Diagnostics (Trouble)
- `<leader>xX` - Buffer diagnostics
- `<leader>xt` / `<leader>xT` - Todo comments (Trouble)
- `<leader>dk` - Line diagnostics (float)
- `<leader>sd` - Search diagnostics
- `]q` / `[q` - Next / previous quickfix/Trouble item
- `]t` / `[t` - Next / previous todo comment

### Language-specific
- `<leader>k` - Rust hover actions
- `<leader>rc` - Open Cargo.toml (Rust)
- `<leader>de` - Android emulator (droid)
- `<leader>dr` - Run (droid)
- `<leader>dd` - Show devices (droid)
- `<leader>u` - Toggle undotree

## Structure

```
init.lua                 -- entry point, loads config modules + transparency
lua/config/
  lazy.lua               -- lazy.nvim bootstrap
  option.lua             -- editor options
  keymap.lua             -- global keymaps
  autocmd.lua            -- autocommands
lua/plugin/              -- one file per plugin spec
```

## Customization

1. **Options**: Edit `lua/config/option.lua`
2. **Keymaps**: Edit `lua/config/keymap.lua`
3. **Plugins**: Add/modify files in `lua/plugin/`
4. **LSP servers**: Edit the `servers` table in `lua/plugin/lsp.lua`
5. **Installed tools**: Edit `ensure_installed` in `lua/plugin/mason.lua`

## License

MIT
