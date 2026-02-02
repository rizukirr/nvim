return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    ft = { "markdown", "quarto" },
    keys = {
        { "<leader>mr", ":RenderMarkdown<CR>", desc = "Render Markdown" },
    },
}
