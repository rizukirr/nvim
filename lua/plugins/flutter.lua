return {
    {
        "dart-lang/dart-vim-plugin",
        ft = { "dart" },
        init = function()
            vim.g.dart_format_on_save = true
            vim.g.dart_html_in_string = true
            vim.g.dart_style_guide = 2
        end,
        keys = {
            { "<leader>cf", "<cmd>DartFmt<cr>", desc = "Dart: Format" },
        },
    },
    {
        "nvim-flutter/flutter-tools.nvim",
        ft = { "dart" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim", -- Better UI for vim.ui.select
        },
        opts = {
            ui = {
                border = "rounded",
                notification_style = "native",
            },
            decorations = {
                statusline = {
                    app_version = true,
                    device = true,
                    project_config = true,
                },
            },
            debugger = {
                enabled = true,
                run_via_dap = true,
                exception_breakpoints = {},
                register_configurations = function(_)
                    require("dap").configurations.dart = {}
                end,
            },
            flutter_path = vim.fn.expand("$HOME/Flutter/flutter"),
            fvm = false, -- Disabled - not using FVM
            widget_guides = {
                enabled = true,
            },
            closing_tags = {
                highlight = "Comment",
                prefix = "// ",
                enabled = true,
            },
            dev_log = {
                enabled = true,
                open_cmd = "tabedit",
            },
            dev_tools = {
                autostart = false,
                auto_open_browser = false,
            },
            outline = {
                open_cmd = "30vnew",
                auto_open = false,
            },
            lsp = {
                color = {
                    enabled = false,
                },
                cmd = { vim.fn.expand("$HOME/Flutter/flutter/bin/dart"), "language-server", "--protocol=lsp" },
                on_attach = function(_, bufnr)
                    -- LSP navigation keymaps handled by Telescope (see plugins/telescope.lua)
                    local opts = { buffer = bufnr, silent = true }
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
                end,
                capabilities = function()
                    return require("blink.cmp").get_lsp_capabilities()
                end,
                settings = {
                    showTodos = true,
                    completeFunctionCalls = true,
                    analysisExcludedFolders = {
                        vim.fn.expand("$HOME/.pub-cache"),
                    },
                    renameFilesWithClasses = "prompt",
                    enableSnippets = true,
                    updateImportsOnRename = true,
                },
            },
        },
        keys = {
            -- Core Flutter commands
            { "<leader>ar", "<cmd>FlutterRun<cr>", desc = "Flutter: Run" },
            { "<leader>ad", "<cmd>FlutterDevices<cr>", desc = "Flutter: Select Device" },
            { "<leader>ae", "<cmd>FlutterEmulators<cr>", desc = "Flutter: Select Emulator" },
            { "<leader>aR", "<cmd>FlutterReload<cr>", desc = "Flutter: Hot Reload" },
            { "<leader>aS", "<cmd>FlutterRestart<cr>", desc = "Flutter: Hot Restart" },
            { "<leader>aq", "<cmd>FlutterQuit<cr>", desc = "Flutter: Quit" },

            -- Debugging and DevTools
            { "<leader>aD", "<cmd>FlutterDevTools<cr>", desc = "Flutter: DevTools" },
            { "<leader>aA", "<cmd>FlutterAttach<cr>", desc = "Flutter: Attach to App" },
            { "<leader>aT", "<cmd>FlutterDetach<cr>", desc = "Flutter: Detach from App" },

            -- Widget outline and navigation
            { "<leader>ao", "<cmd>FlutterOutlineToggle<cr>", desc = "Flutter: Toggle Outline" },
            { "<leader>aO", "<cmd>FlutterOutlineOpen<cr>", desc = "Flutter: Open Outline" },

            -- LSP and utilities
            { "<leader>aL", "<cmd>FlutterLspRestart<cr>", desc = "Flutter: Restart LSP" },
            { "<leader>an", "<cmd>FlutterRename<cr>", desc = "Flutter: Rename File" },
            {
                "<leader>aC",
                "<cmd>FlutterCopyProfilerUrl<cr>",
                desc = "Flutter: Copy Profiler URL",
            },

            -- Dev log
            { "<leader>av", "<cmd>FlutterDevLog<cr>", desc = "Flutter: Show Dev Log" },
            { "<leader>aV", "<cmd>FlutterDevLogClear<cr>", desc = "Flutter: Clear Dev Log" },
        },
    },
}
