return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = true,
        styles = {
            comments = { "italic" },
            conditionals = { "italic" },
        },
        float = {
            transparent = true,
        },
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")
    end,
}
