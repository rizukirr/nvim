return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
    },
    opts = {
        servers = {
            lua_ls = {},
            clangd = {
                root_markers = {
                    "compile_commands.json",
                    "compile_flags.txt",
                    "configure.ac", -- AutoTools
                    "Makefile",
                    "CMakeLists.txt",
                    "configure.ac",
                    "configure.in",
                    "config.h.in",
                    "meson.build",
                    "meson_options.txt",
                    "build.ninja",
                    ".git",
                },
                capabilities = {
                    offsetEncoding = { "utf-16" },
                },
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                    "--function-arg-placeholders",
                    "--fallback-style=llvm",
                },
                init_options = {
                    usePlaceholders = true,
                    completeUnimported = true,
                    clangdFileStatus = true,
                },
            },
            bashls = {},
            marksman = {},
            dartls = {},
            kotlin_lsp = {
                cmd = { "kotlin-lsp", "--stdio" },
                single_file_support = true,
                filetypes = { "kotlin" },
                root_markers = { "build.gradle", "build.gradle.kts", "pom.xml" },
            },
            neocmake = {},
        },
        setup = {
            clangd = function(_, opts)
                -- Manual "fetch" of ext opts: Start with plugin defaults, then merge user overrides.
                local clangd_ext_opts = {}

                -- Mimic user overrides: Require your custom opts file (e.g., lua/plugins/clangd.lua).
                -- Assume it returns a table like { inlay_hints = { inline = false } }.
                local user_opts = {}
                local ok, custom = pcall(require, "plugins.lang.clangd")
                if ok and type(custom) == "table" then
                    user_opts = custom
                end

                -- Merge: defaults + user + server opts.
                clangd_ext_opts = vim.tbl_deep_extend("force", clangd_ext_opts, user_opts)
                require("clangd_extensions").setup(
                    vim.tbl_deep_extend("force", clangd_ext_opts, { server = opts })
                )
                return false
            end,
        },
    },
    config = function(_, opts)
        -- Setup mason-lspconfig with automatic_enable disabled
        -- We'll manually enable servers to have more control
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "clangd",
                "bashls",
                "marksman",
                "neocmake",
                -- kotlin_lsp is excluded here as we use system-installed version
            },
            automatic_installation = true,
            automatic_enable = false, -- Disable automatic enabling to use manual control
        })

        -- Get the list of Mason-installed servers
        local mason_lspconfig = require("mason-lspconfig")
        local installed_servers = mason_lspconfig.get_installed_servers()

        -- Configure and enable all servers (both Mason and non-Mason)
        for server_name, server_config in pairs(opts.servers) do
            -- Skip if server is explicitly disabled
            if server_config.enabled == false then
                goto continue
            end

            -- Handle custom setup functions (like clangd)
            if opts.setup[server_name] then
                if opts.setup[server_name](server_name, server_config) then
                    goto continue
                end
            end

            -- Deep copy config to avoid mutations
            local config = vim.deepcopy(server_config)

            -- Add blink.cmp capabilities
            config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)

            -- Use vim.lsp.config for configuration
            vim.lsp.config(server_name, config)

            -- Enable the server
            vim.lsp.enable(server_name)

            ::continue::
        end

        vim.o.winborder = "rounded"

        vim.diagnostic.config({
            underline = true,
            update_in_insert = false,
            virtual_text = false, -- Disable virtual text, use floating window instead
            severity_sort = true,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "✘",
                    [vim.diagnostic.severity.WARN] = "▲",
                    [vim.diagnostic.severity.HINT] = "⚑",
                    [vim.diagnostic.severity.INFO] = "»",
                },
            },
            float = {
                border = "rounded",
                source = "if_many",
                header = "",
                prefix = "",
            },
        })
    end,
}
