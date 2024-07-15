return {
	-- Cool crate integration
	{
		"Saecki/crates.nvim",
		--lazy load only on loading cargo.toml
		event = { "BufRead Cargo.toml" },
		tag = "stable",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^3", -- Recommended
		-- ft = { "rust" },
		-- config = function()
		-- 	--vim.g["vimtex_view_method"] = "okular"
		-- 	vim.g.rustaceanvim = { -- Plugin configuration
		-- 		tools = {},
		-- 		-- LSP configuration
		-- 		server = {
		-- 			on_attach = function(client, bufnr)
		-- 				-- you can also put keymaps in here
		-- 			end,
		-- 			settings = {
		-- 				-- rust-analyzer language server configuration
		-- 				["rust-analyzer"] = {},
		-- 			},
		-- 		},
		-- 		-- DAP configuration
		-- 		dap = {},
		-- 	}
		-- 	-- vim.keymap.set("n", "<leader>em", function()
		-- 	--   vim.cmd.RustLsp("expandMacro")
		-- 	-- end, { silent = true, buffer = vim.api.nvim_get_current_buf() })
		-- end,
	},
}
