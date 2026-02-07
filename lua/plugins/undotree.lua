return {
    "jiaoshijie/undotree",
    opts = {
        position = "right",
        keymaps = {
            ["j"] = "move_next",
            ["k"] = "move_prev",
            ["-"] = "move2parent",
            ["<C-n>"] = "move_change_next",
            ["<C-p>"] = "move_change_prev",
            ["<cr>"] = "action_enter",
            ["p"] = "enter_diffbuf", -- this can switch between preview and undotree window
            ["q"] = "quit",
            ["S"] = "update_undotree_view",
        },
    },
    keys = { -- load the plugin only when using it's keybinding:
        { "<leader>ut", "<cmd>lua require('undotree').toggle()<cr>" },
    },
}
