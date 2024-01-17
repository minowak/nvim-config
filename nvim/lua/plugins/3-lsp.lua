return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "tsserver", "html" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
		end,
		opts = {
			servers = {
				tailwindcss = {
					filetypes_exclude = { "markdown" },
					filetypes_include = {},
				},
			},
			setup = {
				tailwindcss = function(_, opts)
					local tw = require("lspconfig.server_configurations.tailwindcss")
					opts.filetypes = opts.filetypes or {}

					vim.list_extend(opts.filetypes, tw.default_config.filetypes)

					-- Remove excluded filetypes
					--- @param ft string
					opts.filetypes = vim.tbl_filter(function(ft)
						return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
					end, opts.filetypes)

					vim.list_extend(opts.filetypes, opts.filetypes_include or {})
				end,
			},
		},
		keys = {
			{ "K", vim.lsp.buf.hover, desc = "Hover" },
			{ "gd", vim.lsp.buf.definition, desc = "Go to definition" },
			{ "ca", vim.lsp.buf.code_action, desc = "Code action" },
			{ "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
			-- { "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, desc = "Goto Definition", has = "definition" },
			{ "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
			{ "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
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
			{ "gK", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" },
			{ "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help", has = "signatureHelp" },
			{
				"<leader>cA",
				function()
					vim.lsp.buf.code_action({
						context = {
							only = {
								"source",
							},
							diagnostics = {},
						},
					})
				end,
				desc = "Source Action",
				has = "codeAction",
			},
		},
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.diagnostics.eslint,
					null_ls.builtins.completion.spell,
				},
			})
		end,
		keys = {
			{ "<leader>cf", vim.lsp.buf.format, desc = "Format" },
		},
	},
}
