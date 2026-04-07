return {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        keymaps = {
            ["sh"] = { "actions.select", opts = { horizontal = true } },
            ["sv"] = { "actions.select", opts = { vertical = true } },
            ["\\"] = { "actions.open_cwd", mode = "n" },
        },
    },
    keys = {
        -- stylua: ignore 
        { "<leader>e", ":Oil<CR>", desc = "Open Oil" },
    },
    default_file_explorer = true,
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
}
