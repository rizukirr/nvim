return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({ async = true })
            end,
            mode = { "n", "v" },
            desc = "Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            c = { "clang_format" },
            cpp = { "clang_format" },
            sh = { "shfmt" },
            dart = { "dart_format" },
            bash = { "shfmt" },
            json = { "prettier" },
            yaml = { "prettier" },
            toml = { "taplo" },
        },
        formatters = {
            clang_format = {
                prepend_args = { "--style=file" },
            },
        },
        format_on_save = {
            timeout_ms = 1000,
            lsp_format = "fallback",
        },
    },
    init = function(plugin)
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
