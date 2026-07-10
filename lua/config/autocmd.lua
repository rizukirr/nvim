local function augroup(name)
	return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Restore line numbers on normal files, so opening a file from netrw doesn't
-- inherit the explorer window's `nonumber` (window-local option leak)
vim.api.nvim_create_autocmd("BufWinEnter", {
	group = augroup("restore_number"),
	callback = function(ev)
		if vim.bo[ev.buf].buftype == "" then
			vim.wo.number = true
			vim.wo.relativenumber = true
		end
	end,
})

-- Enable inlay hints
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
		end
	end,
})
