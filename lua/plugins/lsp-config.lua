return {
	{
		--downloads lsps
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		--integrates mason and lspconfig
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = "saghen/blink.cmp",
		lazy = false,
		opts = {
			inlay_hints = {
				enabled = true,
			},
		},
		config = function()
			--pull in nvim cmp deps
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}

			local lspconfig = require("lspconfig")
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				filetypes = { "lua" },
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						completion = {
							callSnippet = "Replace",
						},
						diagnostics = {
							globals = { "vim" },
						},
						format = {
							defaultConfig = {},
						},
						hint = {
							enable = true,
						},
					},
				},
			})

			lspconfig.nil_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.texlab.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.nixd.setup({
				capabilities = capabilities,
				cmd = { "nixd" },
				settings = {
					nixd = {
						nixpkgs = {
							expr = "import <nixpkgs> { }",
						},
						formatting = {
							command = { "nixfmt" },
						},
						options = {
							nixos = {
								expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.k-on.options',
							},
							home_manager = {
								expr = '(builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations."ruixi@k-on".options',
							},
						},
					},
				},
			})
			lspconfig.hls.setup({
				capabilities = capabilities,
			})
			lspconfig.basedpyright.setup({
				capabilities = capabilities,
			})
			lspconfig.zls.setup({
				capabilities = capabilities,
			})
			lspconfig.vtsls.setup({
				capabilities = capabilities,

				settings = {
					typescript = {
						inlayHints = {
							parameterNames = { enabled = "literals" },
							parameterTypes = { enabled = true },
							variableTypes = { enabled = true },
							propertyDeclarationTypes = { enabled = true },
							functionLikeReturnTypes = { enabled = true },
							enumMemberValues = { enabled = true },
						},
					},
				},
			})

			require("ufo").setup()

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end, { desc = "Toggle Inlay Hints" })
		end,
	},
	{
		"folke/trouble.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		config = function()
			local trouble = require("trouble")
			vim.keymap.set("n", "<leader>xq", function()
				trouble.toggle("quickfix")
			end)
			vim.keymap.set("n", "<leader>xx", function()
				trouble.toggle("document_diagnostics")
			end)
		end,
	},
	{
		"yioneko/nvim-vtsls",
		dependencies = "neovim/nvim-lspconfig",
		opts = {},
		config = function()
			require("lspconfig.configs").vtsls = require("vtsls").lspconfig

			require("vtsls").config({
				-- customize handlers for commands
				handlers = {
					source_definition = function(err, locations) end,
					file_references = function(err, locations) end,
					code_action = function(err, actions) end,
				},
				-- automatically trigger renaming of extracted symbol
				refactor_auto_rename = true,
				refactor_move_to_file = {
					-- If dressing.nvim is installed, telescope will be used for selection prompt. Use this to customize
					-- the opts for telescope picker.
					telescope_opts = function(items, default) end,
				},
			})
		end,
	},
}
