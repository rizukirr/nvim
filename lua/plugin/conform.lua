return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true })
			end,
			mode = { "n", "v" },
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			c = { "clang_format" },
			cpp = { "clang_format" },
			rust = { "rustfmt" },
		},
		format_on_save = {
			lsp_format = "fallback",
		},
	},
	init = function(_)
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
