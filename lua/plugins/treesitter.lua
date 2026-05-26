return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        branch = "main",
        build = ":TSUpdate",
        init = function(plugin)
            require("lazy.core.loader").add_to_rtp(plugin)
        end,
        event = { "BufReadPre", "BufNewFile" },
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        keys = {
            { "<c-space>", desc = "Increment Selection" },
            { "<bs>", desc = "Decrement Selection", mode = "x" },
        },
        config = function(_, opts)
            require("nvim-treesitter").setup(opts)

            vim.filetype.add({ extension = { c3 = "c3" } })

            local nts = require("nvim-treesitter")
            local installed = {}
            for _, p in ipairs(nts.get_installed()) do
                installed[p] = true
            end
            local missing = {}
            for _, p in ipairs(opts.ensure_installed or {}) do
                if not installed[p] then
                    table.insert(missing, p)
                end
            end
            if #missing > 0 then
                nts.install(missing)
            end

            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    local ft = vim.bo[args.buf].filetype
                    if ft == "" then
                        return
                    end
                    local lang = vim.treesitter.language.get_lang(ft) or ft
                    if #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".so", false) == 0 then
                        return
                    end
                    pcall(vim.treesitter.start, args.buf, lang)
                end,
            })
        end,
        opts = {
            indent = { enable = true }, ---@type lazyvim.TSFeat
            highlight = { enable = true }, ---@type lazyvim.TSFeat
            folds = { enable = true }, ---@type lazyvim.TSFeat
            ensure_installed = {
                "c",
                "c3",
                "cpp",
                "lua",
                "rust",
                "ron",
                "go",
                "rust",
                "bash",
                "markdown",
                "cmake",
                "toml",
                "yaml",
                "json",
                "markdown_inline",
                "dart",
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
                    goto_next_start = {
                        ["]f"] = "@function.outer",
                        ["]c"] = "@class.outer",
                        ["]a"] = "@parameter.inner",
                    },
                    goto_next_end = {
                        ["]F"] = "@function.outer",
                        ["]C"] = "@class.outer",
                        ["]A"] = "@parameter.inner",
                    },
                    goto_previous_start = {
                        ["[f"] = "@function.outer",
                        ["[c"] = "@class.outer",
                        ["[a"] = "@parameter.inner",
                    },
                    goto_previous_end = {
                        ["[F"] = "@function.outer",
                        ["[C"] = "@class.outer",
                        ["[A"] = "@parameter.inner",
                    },
                },
            },
        },
    },
}
