return {
    "mrcjkb/rustaceanvim",
    ft = { "rust" },
    opts = {
        server = {
            on_attach = function(_, bufnr)
                vim.keymap.set("n", "<leader>rsa", function()
                    vim.cmd.RustLsp("codeAction")
                end, { desc = "Code Action", buffer = bufnr })
                vim.keymap.set("n", "<leader>rsd", function()
                    vim.cmd.RustLsp("debuggables")
                end, { desc = "Rust Debuggables", buffer = bufnr })
                vim.keymap.set("n", "<leader>k", function()
                    vim.cmd.RustLsp({ "hover", "actions" })
                end, { desc = "Hover Actions", buffer = bufnr })
                vim.keymap.set("n", "<leader>dk", function()
                    vim.cmd.RustLsp({ "renderDiagnostic", "current" })
                end, { desc = "Explain Error", buffer = bufnr })
                vim.keymap.set("n", "<leader>rsc", function()
                    vim.cmd.RustLsp("openCargo")
                end, { desc = "Open Cargo", buffer = bufnr })
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
                    checkOnSave = true,
                    -- Enable diagnostics if using rust-analyzer
                    diagnostics = {
                        enable = true,
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
    keys = {
        { "<leader>rr", ":Cargo run<CR>", desc = "Run" },
    },
    config = function(_, opts)
        local codelldb = vim.fn.exepath("codelldb")
        local codelldb_lib_ext = io.popen("uname"):read("*l") == "Linux" and ".so" or ".dylib"
        local library_path = vim.fn.expand("$MASON/opt/lldb/lib/liblldb" .. codelldb_lib_ext)
        opts.dap = {
            adapter = require("rustaceanvim.config").get_codelldb_adapter(codelldb, library_path),
        }
        vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
    end,
}
