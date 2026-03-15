return {
    {
        "mrcjkb/rustaceanvim",
        version = "^8", -- Recommended
        ft = { "rust" },
        opts = {
            server = {
                on_attach = function(_, bufnr)
                    vim.keymap.set("n", "<leader>ra", function()
                        vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
                        -- or vim.lsp.buf.codeAction() if you don't want grouping.
                    end, { silent = true, buffer = bufnr })
                    vim.keymap.set(
                        "n",
                        "<leader>k", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
                        function()
                            vim.cmd.RustLsp({ "hover", "actions" })
                        end,
                        { silent = true, buffer = bufnr }
                    )
                end,
                default_settings = {
                    -- rust-analyzer language server configuration
                    ["rust-analyzer"] = {
                        cargo = {
                            allFeatures = true,
                            loadOutDirsFromCheck = true,
                            buildScripts = {
                                enable = true,
                            },
                        },
                        -- Add clippy lints for Rust if using rust-analyzer
                        checkOnSave = diagnostics == "rust-analyzer",
                        -- Enable diagnostics if using rust-analyzer
                        diagnostics = {
                            enable = diagnostics == "rust-analyzer",
                        },
                        procMacro = {
                            enable = true,
                        },
                        files = {
                            exclude = {
                                ".direnv",
                                ".git",
                                ".jj",
                                ".github",
                                ".gitlab",
                                "bin",
                                "node_modules",
                                "target",
                                "venv",
                                ".venv",
                            },
                            -- Avoid Roots Scanned hanging, see https://github.com/rust-lang/rust-analyzer/issues/12613#issuecomment-2096386344
                            watcher = "client",
                        },
                    },
                },
            },
        },
        config = function(_, opts)
            vim.g.rustaceanvim = opts
        end,
    },
    {
        "Saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        opts = {
            completion = {
                crates = {
                    enabled = true,
                },
            },
            lsp = {
                enabled = true,
                actions = true,
                completion = true,
                hover = true,
            },
        },
    },
}
