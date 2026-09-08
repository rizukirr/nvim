return {
    {
        "mason-org/mason.nvim",
        cmd = "Mason",
        build = ":MasonUpdate",
        opts = {
            ensure_installed = {
                -- Lua
                "stylua",
                "lua-language-server",
                -- Debug
                "codelldb",
                -- Clangd
                "clangd",
                "clang-format",
                "neocmakelsp",
                -- asm
                "asm-lsp",
                -- python
                "pyright",
                "ruff",
                "black",
                -- kotlin
                "ktlint",
            },
            automatic_installation = true,
            automatic_enable = false, -- Disable automatic enabling to use manual control
            formatters = {
                clang_format = {
                    prepend_args = { "--style=file" },
                },
            },
        },
        config = function(_, opts)
            require("mason").setup(opts)
            local mr = require("mason-registry")
            mr:on("package:install:success", function()
                vim.defer_fn(function()
                    require("lazy.core.handler.event").trigger({
                        event = "FileType",
                        buf = vim.api.nvim_get_current_buf(),
                    })
                end, 100)
            end)

            mr.refresh(function()
                for _, tool in ipairs(opts.ensure_installed) do
                    local p = mr.get_package(tool)
                    if not p:is_installed() then
                        p:install()
                    end
                end
            end)
        end,
    },
}
