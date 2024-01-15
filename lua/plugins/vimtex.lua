return {
  "lervag/vimtex",
  config = function()
    vim.g["vimtex_syntax_enabled"] = 1
    vim.g["vimtex_indent_enabled"] = 0
    vim.g["vimtex_log_ignore"] = {
      "Underfull",
      "Overfull",
      "specifier changed to",
      "Token not allowed in a PDF string",
    }
    vim.g["vimtex_view_method"] = "okular"
  end,
}
