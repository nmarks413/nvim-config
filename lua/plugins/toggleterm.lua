return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup()

		vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

		vim.api.nvim_set_keymap(
			"t",
			"<C-t>",
			"<C-\\><C-n>:ToggleTerm direction=float<CR>",
			{ noremap = true, silent = true }
		)

		vim.keymap.set("n", "<C-t>", "<cmd>:ToggleTerm direction=float<CR>", {})
		--vim.keymap.set("t", "<leader>tm",":ToggleTerm direction=float<CR>",{})
	end,
}
