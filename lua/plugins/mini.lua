return {
	{
		"echasnovski/mini.nvim",
		config = function()
			--require("mini.comment").setup()
			require("mini.surround").setup()
			require("mini.cursorword").setup()
			require("mini.move").setup()
			require("mini.icons").setup()
		end,
	},
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		config = function()
			require("mini.pairs").setup({
				modes = { insert = true, command = true, terminal = false },
				-- skip autopair when next character is one of these
				skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
				-- skip autopair when the cursor is inside these treesitter nodes
				skip_ts = { "string" },
				-- skip autopair when next character is closing pair
				-- and there are more closing pairs than opening pairs
				skip_unbalanced = true,
				-- better deal with markdown code blocks
				markdown = true,
			})
		end,
	},
}
