return {
  "lervag/vimtex",
  --lazy load only on entering LaTeX file
  ft = "tex",
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
    --replace with the pdf viewer that u want to use
    vim.g["vimtex_view_general_viewer"] = "okular"
  end,
}
