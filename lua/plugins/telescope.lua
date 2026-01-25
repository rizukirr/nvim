return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- optional but recommended
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    cmd = "Telescope",
    config = function()
        local actions = require("telescope.actions")

        local function find_command()
            if 1 == vim.fn.executable("rg") then
                return { "rg", "--files", "--color", "never", "-g", "!.git" }
            elseif 1 == vim.fn.executable("fd") then
                return { "fd", "--type", "f", "--color", "never", "-E", ".git" }
            elseif 1 == vim.fn.executable("fdfind") then
                return { "fdfind", "--type", "f", "--color", "never", "-E", ".git" }
            elseif 1 == vim.fn.executable("find") and vim.fn.has("win32") == 0 then
                return { "find", ".", "-type", "f" }
            end
        end

        require("telescope").setup({
            defaults = {
                prompt_prefix = " ",
                selection_caret = "> ",
                layout_strategy = "vertical",
                layout_config = {
                    vertical = {
                        prompt_position = "bottom",
                    },
                },
                sorting_strategy = "ascending",
                file_ignore_patterns = {
                    "node_modules",
                    ".git/",
                    ".cache",
                    ".idea",
                    ".env.*",
                    ".env",
                },
                preview = {
                    filesize_limit = 1,
                    timeout = 250,
                },
                get_selection_window = function()
                    local wins = vim.api.nvim_list_wins()
                    table.insert(wins, 1, vim.api.nvim_get_current_win())
                    for _, win in ipairs(wins) do
                        local buf = vim.api.nvim_win_get_buf(win)
                        if vim.bo[buf].buftype == "" then
                            return win
                        end
                    end
                    return 0
                end,
                mappings = {
                    i = {
                        ["<C-Down>"] = actions.cycle_history_next,
                        ["<C-Up>"] = actions.cycle_history_prev,
                        ["<C-f>"] = actions.preview_scrolling_down,
                        ["<C-b>"] = actions.preview_scrolling_up,
                    },
                    n = {
                        ["q"] = actions.close,
                    },
                },
            },
            pickers = {
                find_files = {
                    find_command = find_command,
                    hidden = true,
                },
                buffers = {
                    mappings = {
                        i = {
                            ["<C-d>"] = actions.delete_buffer,
                        },
                        n = {
                            ["dd"] = actions.delete_buffer,
                        },
                    },
                },
            },
        })
        pcall(require("telescope").load_extension, "fzf")
    end,
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Telescope find files" },
        { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Telescope live grep" },
        { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Telescope buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Telescope help tags" },
        { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
        { "<leader>fD", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Buffer Diagnostics" },
        -- LSP
        {
            "gd",
            function()
                require("telescope.builtin").lsp_definitions({ reuse_win = true })
            end,
            desc = "Goto Definition",
        },
        { "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
        {
            "gI",
            function()
                require("telescope.builtin").lsp_implementations({ reuse_win = true })
            end,
            desc = "Goto Implementation",
        },
        {
            "gy",
            function()
                require("telescope.builtin").lsp_type_definitions({ reuse_win = true })
            end,
            desc = "Goto T[y]pe Definition",
        },
        -- git
        { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Commits" },
        { "<leader>gl", "<cmd>Telescope git_commits<CR>", desc = "Commits" },
        { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Status" },
        { "<leader>gS", "<cmd>Telescope git_stash<cr>", desc = "Git Stash" },
        -- Man pages
        { "<leader>mp", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
        -- Quickfix
        { "<leader>xq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix List" },
    },
}
