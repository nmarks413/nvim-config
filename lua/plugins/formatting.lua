return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {},
	config = function()
		require("conform").setup({
			format = {
				timeout_ms = 3000,
				async = false, -- not recommended to change
				quiet = false, -- not recommended to change
				lsp_format = "fallback", -- not recommended to change
			},
			format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
			formatters_by_ft = {
				lua = { "stylua" },
				fish = { "fish_indent" },
				sh = { "shfmt" },
				nix = { "alejandra" },
				tex = { "latexindent" },
				rust = { "rustfmt" },
				cpp = { "clang-format " },
				c = { "clang-format" },
				python = { "ruff_format" },
				haskell = { "ormolu" },
			},
		})
	end,
}
