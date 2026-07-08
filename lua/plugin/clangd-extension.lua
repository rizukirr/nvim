return {
	"p00f/clangd_extensions.nvim",
	ft = { "c", "cpp", "objc", "objcpp", "cuda", "h", "hpp" },
	opts = {
		inlay_hints = {
			inline = false,
		},
		ast = {
			role_icons = {
				type = "",
				declaration = "",
				expression = "",
				specifier = "",
				statement = "",
				["template argument"] = "",
			},
			kind_icons = {
				Compound = "",
				Recovery = "",
				TranslationUnit = "",
				PackExpansion = "",
				TemplateTypeParm = "",
				TemplateTemplateParm = "",
				TemplateParamObject = "",
			},
		},
	},
	keys = {
		{
			"gh",
			"<cmd>ClangdSwitchSourceHeader<CR>",
			desc = "[C/C++] Swith between source and header file",
			ft = { "c", "cpp", "objc", "objcpp", "cuda", "h", "hpp" },
		},
	},
}
