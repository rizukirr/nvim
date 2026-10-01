return {
    {
        "nvim-flutter/flutter-tools.nvim",
        ft = { "dart" },
        dependencies = {
            "nvim-lua/plenary.nvim",
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
            fvm = true, -- Disabled - not using FVM
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
    },
}
