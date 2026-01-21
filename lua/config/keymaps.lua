local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Move lines
vim.keymap.set("i", "<C-k>", ":m '>+1<CR>gv=gv", { desc = "Move Up" })
vim.keymap.set("i", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move Down" })
vim.keymap.set({ "v", "n" }, "J", ":m '>+1<CR>gv=gv", { desc = "Move Down" })
vim.keymap.set({ "v", "n" }, "K", ":m '<-2<CR>gv=gv", { desc = "Move Up" })

-- File Explorer
-- keymap.set("n", "<leader>e", "<cmd>Ex<cr>", { desc = "Open File Explorer" })

-- Better up/down
keymap.set(
    { "n", "x" },
    "j",
    "v:count == 0 ? 'gj' : 'j'",
    { desc = "Down", expr = true, silent = true }
)
keymap.set(
    { "n", "x" },
    "k",
    "v:count == 0 ? 'gk' : 'k'",
    { desc = "Up", expr = true, silent = true }
)
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump into half page down" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump into half page up" })

-- Move to window using the <ctrl> hjkl keys
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Yank and Paste
keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste and keep the copy" })
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Better yank" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Better yank" })
keymap.set("n", "<C-a>", "ggVG", { desc = "V to All" })
keymap.set("n", "<C-y>", "ggVG<leader>y", { desc = "Yank all" })

-- Move Lines
keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- buffers
keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
-- Buffer deletion is now handled by Snacks

-- Clear search with <esc>
keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Save file
keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Better indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Snacks keymaps are now defined in the plugin configuration

-- LSP (using Telescope - see plugins/telescope.lua)
-- keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = "Goto Definition" })
-- keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "Goto References" })
-- keymap.set("n", "gI", function() vim.lsp.buf.implementation() end, { desc = "Goto Implementation" })
-- keymap.set("n", "gy", function() vim.lsp.buf.type_definition() end, { desc = "Goto Type Definition" })
keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = "Goto Declaration" })
keymap.set("n", "gs", function()
    vim.lsp.buf.typehierarchy("supertypes")
end, { desc = "Goto Super Types (Interface/Parent)" })
keymap.set("n", "<leader>k", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Hover" })
keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Action" })
keymap.set("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename" })
keymap.set("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format()<cr>", { desc = "Format" })

-- Diagnostics
keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Next Diagnostic" })
keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Prev Diagnostic" })
keymap.set("n", "<C-k>", function()
    vim.diagnostic.open_float(nil, {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "if_many",
        prefix = " ",
        scope = "cursor",
    })
end, { desc = "Show Diagnostic Float" })

-- Quickfix
keymap.set("n", "q", "<cmd>cclose<cr>", { desc = "Close Quickfix" })

-- Terminal toggle
local terminal = {
    horizontal = { buf = nil, win = nil },
    float = { buf = nil, win = nil },
}

local function toggle_horizontal_terminal()
    if terminal.horizontal.win and vim.api.nvim_win_is_valid(terminal.horizontal.win) then
        vim.api.nvim_win_hide(terminal.horizontal.win)
        terminal.horizontal.win = nil
    else
        vim.cmd("botright split")
        vim.cmd("resize 15")
        if terminal.horizontal.buf and vim.api.nvim_buf_is_valid(terminal.horizontal.buf) then
            vim.api.nvim_set_current_buf(terminal.horizontal.buf)
        else
            vim.cmd("terminal")
            terminal.horizontal.buf = vim.api.nvim_get_current_buf()
        end
        terminal.horizontal.win = vim.api.nvim_get_current_win()
        vim.cmd("startinsert")
    end
end

local function toggle_float_terminal()
    if terminal.float.win and vim.api.nvim_win_is_valid(terminal.float.win) then
        vim.api.nvim_win_hide(terminal.float.win)
        terminal.float.win = nil
    else
        local width = math.floor(vim.o.columns * 0.8)
        local height = math.floor(vim.o.lines * 0.8)
        local row = math.floor((vim.o.lines - height) / 2)
        local col = math.floor((vim.o.columns - width) / 2)

        if not terminal.float.buf or not vim.api.nvim_buf_is_valid(terminal.float.buf) then
            terminal.float.buf = vim.api.nvim_create_buf(false, true)
        end

        terminal.float.win = vim.api.nvim_open_win(terminal.float.buf, true, {
            relative = "editor",
            width = width,
            height = height,
            row = row,
            col = col,
            style = "minimal",
            border = "rounded",
        })

        if vim.bo[terminal.float.buf].buftype ~= "terminal" then
            vim.cmd("terminal")
            terminal.float.buf = vim.api.nvim_get_current_buf()
        end
        vim.cmd("startinsert")
    end
end

keymap.set(
    { "n", "t" },
    "<leader>tt",
    toggle_horizontal_terminal,
    { desc = "Toggle Horizontal Terminal" }
)
keymap.set({ "n", "t" }, "<leader>tf", toggle_float_terminal, { desc = "Toggle Float Terminal" })
keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })
