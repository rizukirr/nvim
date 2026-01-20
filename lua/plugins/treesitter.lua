return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        branch = "main",
        build = ":TSUpdate",
        init = function(plugin)
            require("lazy.core.loader").add_to_rtp(plugin)
        end,
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        keys = {
            { "<c-space>", desc = "Increment Selection" },
            { "<bs>", desc = "Decrement Selection", mode = "x" },
        },
        opts = {
            indent = { enable = true }, ---@type lazyvim.TSFeat
            highlight = { enable = true }, ---@type lazyvim.TSFeat
            folds = { enable = true }, ---@type lazyvim.TSFeat
            ensure_installed = {
                "c",
                "cpp",
                "lua",
                "bash",
                "markdown",
                "cmake",
                "toml",
                "yaml",
                "json",
                "markdown_inline",
                "luadoc",
                "luap",
                "vim",
                "vimdoc",
                "query",
                "regex",
                "diff",
                "git_config",
                "git_rebase",
                "gitcommit",
                "gitignore",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        },
        opts_extend = { "ensure_installed" },
    },
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      branch = "main",
      event = "VeryLazy",
      opts = {
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          -- LazyVim extention to create buffer-local keymaps
          keys = {
            goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
            goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
            goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
            goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
          },
        },
      },
  }
}
