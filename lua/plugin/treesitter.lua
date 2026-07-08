-- Uses the `main` branch: the frozen `master` branch is incompatible with
-- Neovim 0.12+ (match[id] now returns a node list), which crashes injection
-- parsing, e.g. markdown fenced code blocks -> "attempt to call method 'range'".
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")

		-- Install/update parsers (async; skips ones already at the locked revision)
		ts.install({
			"c",
			"cpp",
			"rust",
			"dart",
			"lua",
			"luadoc",
			"kotlin",
			"java",
			"groovy",
			"vim",
			"vimdoc",
			"query",
			"bash",
			"markdown",
			"markdown_inline",
			"json",
			"yaml",
			"toml",
		})

		-- Start highlighting (and experimental indent) per buffer when a parser exists
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				if pcall(vim.treesitter.start, args.buf) then
					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
