return {
	"mfussenegger/nvim-lint",
	event = "BufEnter",
	config = function()
		require("lint").linters_by_ft = {
			python = { "ruff" },
			nix = { "statix" },
			tex = { "chktex" },
			haskell = { "hlint" },
		}
		-- vim.api.nvim_create_autocmd(opts.events, {
		-- 	group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
		-- 	callback = M.debounce(100, M.lint),
		-- })
		--
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				-- try_lint without arguments runs the linters defined in `linters_by_ft`
				-- for the current filetype
				require("lint").try_lint()
			end,
		})
	end,
}
