return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					["javascript"] = { "prettier" },
					["javascriptreact"] = { "prettier" },
					["typescript"] = { "prettier" },
					["typescriptreact"] = { "prettier" },
					["vue"] = { "prettier" },
					["css"] = { "prettier" },
					["scss"] = { "prettier" },
					["less"] = { "prettier" },
					["html"] = { "prettier" },
					["json"] = { "prettier" },
					["jsonc"] = { "prettier" },
					["yaml"] = { "prettier" },
					["markdown"] = { "prettier" },
					["markdown.mdx"] = { "prettier" },
					["graphql"] = { "prettier" },
					["handlebars"] = { "prettier" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
	},
}
