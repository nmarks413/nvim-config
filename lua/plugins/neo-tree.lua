return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left toggle<CR>", {noremap=true, silent=true})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {noremap=true, silent = true})
	end,
}
