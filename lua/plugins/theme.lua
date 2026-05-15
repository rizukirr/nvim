return {
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
        vim.cmd.colorscheme("moonfly")
    end,
}
