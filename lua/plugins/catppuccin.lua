return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin")
			require("catppuccin").setup({
				integrations = {
					blink_cmp = true,
					fidget = true,
					gitsigns = true,
					lsp_trouble = true,
					mason = true,
					markdown = true,
					mini = true,
					-- navic = { enabled = true, custom_bg = "lualine" },
					-- neotest = true,
					-- noice = true,
					-- notify = true,
					semantic_tokens = true,
					telescope = true,
					treesitter = true,
					treesitter_context = true,
					which_key = true,
				},
			})
		end,
	},
}
