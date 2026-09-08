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
    opts = function()
        local ret = {
            diagnostics = {
                underline = true,
                update_in_insert = false,
                virtual_text = false,
                severity_sort = true,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "✘",
                        [vim.diagnostic.severity.WARN] = "▲",
                        [vim.diagnostic.severity.HINT] = "⚑",
                        [vim.diagnostic.severity.INFO] = "»",
                    },
                },
            },
            -- LSP Server Settings
            -- Sets the default configuration for an LSP client (or all clients if the special name "*" is used).
            servers = {
                -- configuration for all lsp servers
                ["*"] = {
                    capabilities = {
                        workspace = {
                            fileOperations = {
                                didRename = true,
                                willRename = true,
                            },
                        },
                    },
          -- stylua: ignore
          keys = {
            { "K", function() return vim.lsp.buf.hover() end, desc = "Hover" },
            { "gK", function() return vim.lsp.buf.signature_help() end, desc = "Signature Help", has = "signatureHelp" },
            { "<c-k>", function() return vim.lsp.buf.signature_help() end, mode = "i", desc = "Signature Help", has = "signatureHelp" },
            { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "x" }, has = "codeAction" },
            { "<leader>cc", vim.lsp.codelens.run, desc = "Run Codelens", mode = { "n", "x" }, has = "codeLens" },
            { "<leader>cr", vim.lsp.buf.rename, desc = "Rename", has = "rename" },
          },
                },
                setup = {},
                marksman = {},
                stylua = {},
                lua_ls = {},
                clangd = {},
                bacon_ls = {},
                neocmake = {},
                pyright = {},
                ruff = {},
                black = {},
                rust_analyzer = { enabled = false },
                asm_lsp = {
                    filetypes = { "asm", "vmasm", "s", "S" },
                },
            },
        }
        return ret
    end,
    config = function(_, opts)
        -- Apply diagnostic settings (signs, underline, etc.)
        vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

        -- Register buffer-local LSP keymaps from the "*" server spec's `keys`
        -- table. Runs per-buffer on attach so `has` capability guards can be
        -- checked against the client that just attached. Without this, the
        -- `keys` table is never consumed and Neovim's built-in defaults
        -- (grr/grn/gra/...) take over.
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(ev)
                local client = vim.lsp.get_client_by_id(ev.data.client_id)
                local keys = (opts.servers["*"] or {}).keys or {}
                for _, spec in ipairs(keys) do
                    -- Skip mappings gated on a capability the server lacks.
                    if
                        spec.has
                        and not (client and client:supports_method("textDocument/" .. spec.has))
                    then
                        goto continue
                    end
                    vim.keymap.set(spec.mode or "n", spec[1], spec[2], {
                        buffer = ev.buf,
                        desc = spec.desc,
                        nowait = spec.nowait,
                    })
                    ::continue::
                end
            end,
        })

        -- Configure and enable all servers (both Mason and non-Mason)
        for server_name, server_config in pairs(opts.servers) do
            -- Skip if server is explicitly disabled
            if server_config.enabled == false then
                goto continue
            end

            -- Deep copy config to avoid mutations
            local config = vim.deepcopy(server_config)

            -- Add blink.cmp capabilities
            config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)

            -- Use vim.lsp.config for configuration
            vim.lsp.config(server_name, config)

            -- Enable the server ("*" is a wildcard default merged into all
            -- servers, so it registers config but cannot be enabled directly)
            if server_name ~= "*" then
                vim.lsp.enable(server_name)
            end

            ::continue::
        end
    end,
}
