return {
	"lervag/vimtex",
	lazy = false,
	config = function()
		--turn on syntax highlighting
		vim.g["vimtex_syntax_enabled"] = 1
		vim.g["vimtex_indent_enabled"] = 0
		--Get rid of annoying erros
		vim.g["vimtex_log_ignore"] = {
			"Underfull",
			"Overfull",
			"specifier changed to",
			"Token not allowed in a PDF string",
		}
		vim.g["vimtex_quickfix_ignore_filters"] = {
			"Underfull",
			"Overfull",
		}
		--replace with the pdf viewer that u want to use
		vim.g["vimtex_view_general_viewer"] = "zathura"
		vim.g["vimtex_compiler_method"] = "latexmk"
	end,
}
