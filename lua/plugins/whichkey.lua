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
            { "<leader>a", group = "app/flutter" },
            { "<leader>c", group = "code" },
            { "<leader>d", group = "debug" },
            { "<leader>dp", group = "profiler" },
            { "<leader>f", group = "file/find" },
            { "<leader>g", group = "git" },
            { "<leader>gh", group = "hunks" },
            { "<leader>m", group = "man" },
            { "<leader>q", group = "quit/session" },
            { "<leader>s", group = "search" },
            { "<leader>u", group = "ui" },
            { "<leader>x", group = "diagnostics/quickfix" },
            { "<leader>t", group = "Terminal" },

            -- Bracket navigation
            { "[", group = "prev" },
            { "]", group = "next" },

            -- Goto prefix
            { "g", group = "goto" },
            { "gs", group = "surround" },

            -- Other groups
            { "z", group = "fold" },

            -- Buffer group with expand
            {
                "<leader>b",
                group = "buffer",
                expand = function()
                    return require("which-key.extras").expand.buf()
                end,
            },

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

            -- Hidden/less common
            { "<leader>l", group = "lazy", icon = "󰒲 " },
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
