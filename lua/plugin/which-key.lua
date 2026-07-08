return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts_extend = { "spec" },
	opts = {
		preset = "helix",
		defaults = {},
		spec = {
			mode = { "n", "x" },
			-- Leader groups
			{ "<leader>b", group = "buffer" },
			{ "<leader>c", group = "code" },
			{ "<leader>d", group = "debug" },
			{ "<leader>f", group = "file/find" },
			{ "<leader>g", group = "goto/git", icon = "" },
			{ "<leader>gh", group = "git hunk", icon = "" },
			{ "<leader>l", group = "lazy", icon = "󰒲 " },
			{ "<leader>u", group = "undotree" },
			{ "<leader>x", group = "diagnostics/quickfix" },

			-- Bracket navigation
			{ "[", group = "prev" },
			{ "]", group = "next" },

			-- Goto prefix
			{ "g", group = "goto" },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
	end,
}
