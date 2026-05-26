return {
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        lazy = false,
        priority = 1000,
        config = function()
            vim.o.pumborder = "single"
            vim.g.moonflyNormalFloat = true
            vim.g.moonflyNormalPmenu = true
            vim.g.moonflyUnderlineMatchParen = true
            vim.g.moonflyVirtualTextColor = true
            vim.g.moonflyTransparent = true
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "night",
            transparent = true,
        },
        config = function(_, opts)
            require("tokyonight").setup(opts)
            vim.cmd.colorscheme("tokyonight")
        end,
    },
}
