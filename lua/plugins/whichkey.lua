return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts_extend = { "spec" },
    opts = {
        preset = "helix",
        defaults = {},
        spec = {
            mode = { "n", "x" },
            -- Leader groups
            { "<leader><tab>", group = "tabs" },
            { "<leader>a", group = "app/flutter", icon = "" },
            { "<leader>b", group = "buffer" },
            { "<leader>c", group = "code" },
            { "<leader>d", group = "debug" },
            { "<leader>f", group = "file/find" },
            { "<leader>g", group = "git", icon = "" },
            { "<leader>l", group = "lazy", icon = "󰒲 " },
            { "<leader>p", group = "profiler", icon = "" },
            { "<leader>s", group = "search" },
            { "<leader>t", group = "terminal" },
            { "<leader>u", group = "ui/toggle" },
            { "<leader>x", group = "diagnostics/quickfix" },
            { "<leader>m", group = "markdown" },

            -- Bracket navigation
            { "[", group = "prev" },
            { "]", group = "next" },

            -- Goto prefix
            { "g", group = "goto" },
            { "ga", group = "calls" },
            { "gs", group = "surround" },

            -- Other groups
            { "z", group = "fold" },

            -- Windows group with proxy
            {
                "<leader>w",
                group = "windows",
                proxy = "<c-w>",
                expand = function()
                    return require("which-key.extras").expand.win()
                end,
            },

            -- Better descriptions for built-in keys
            { "gx", desc = "Open with system app" },
        },
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Keymaps (which-key)",
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
    end,
}
