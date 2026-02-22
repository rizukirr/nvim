return {
    -- "rrxxyz/droid-nvim",
    dir = "~/Projects/droid-nvim",
    ft = { "kotlin", "java", "groovy" },
    dependencies = {
        "mfussenegger/nvim-lint",
        "nvim-treesitter/nvim-treesitter",
        "mason-org/mason.nvim", -- Recommended for auto-installing LSPs
    },
    opts = {},
    keys = {
        { "<leader>de", ":DroidEmulator<CR>", desc = "Emulator" },
        { "<leader>dr", ":DroidRun<CR>", desc = "Run" },
        { "<leader>dd", ":DroidDevices<CR>", desc = "Show Available Devices" },
    },
}
