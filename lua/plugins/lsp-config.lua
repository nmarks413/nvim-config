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

			-- lspconfig.rust_analyzer.setup({
			-- 	on_attach = function(client, bufnr)
			-- 		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
			-- 	end,
			-- 	settings = {
			-- 		["rust-analyzer"] = {
			-- 			diagnostics = {
			-- 				enable = true,
			-- 			},
			-- 			imports = {
			-- 				granularity = {
			-- 					group = "module",
			-- 				},
			-- 				prefix = "self",
			-- 			},
			-- 			cargo = {
			-- 				buildScripts = {
			-- 					enable = true,
			-- 				},
			-- 			},
			-- 			procMacro = {
			-- 				enable = true,
			-- 			},
			-- 		},
			-- 	},
			-- 	capabilities = capabilities,
			-- })
			lspconfig.nil_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.texlab.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.denols.setup({
				capabilities = capabilities,
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
}
