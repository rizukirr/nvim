return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                file_ignore_patterns = { "node_modules", ".git/" },
                hidden = true,
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
                live_grep = {
                    additional_args = { "--hidden" },
                },
            },
        })
        telescope.load_extension("fzf")
    end,
    keys = {
        -- Find
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
        { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
        { "<leader>fc", function() require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
        { "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
        { "<leader>,", "<cmd>Telescope buffers<cr>", desc = "Buffers" },

        -- Grep
        { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
        { "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "Grep Word Under Cursor", mode = { "n", "x" } },
        { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer Lines" },

        -- Search
        { '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
        { "<leader>s/", "<cmd>Telescope search_history<cr>", desc = "Search History" },
        { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Autocmds" },
        { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
        { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
        { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
        { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
        { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Highlights" },
        { "<leader>sj", "<cmd>Telescope jumplist<cr>", desc = "Jumps" },
        { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
        { "<leader>sl", "<cmd>Telescope loclist<cr>", desc = "Location List" },
        { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Marks" },
        { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
        { "<leader>sq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix List" },
        { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
        { "<leader>uC", "<cmd>Telescope colorscheme<cr>", desc = "Colorschemes" },
        { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },

        -- LSP
        { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto Definition" },
        { "gD", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Goto Type Definition" },
        { "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
        { "gI", "<cmd>Telescope lsp_implementations<cr>", desc = "Goto Implementation" },
        { "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", desc = "LSP Document Symbols" },
        { "<leader>sS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "LSP Workspace Symbols" },

        -- Git
        { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git Branches" },
        { "<leader>gl", "<cmd>Telescope git_commits<cr>", desc = "Git Commits" },
        { "<leader>gL", "<cmd>Telescope git_bcommits<cr>", desc = "Git Buffer Commits" },
        { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
        { "<leader>gS", "<cmd>Telescope git_stash<cr>", desc = "Git Stash" },
        { "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
    },
}
