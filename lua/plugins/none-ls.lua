return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    --Format on write
    null_ls.setup({
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format()
            end,
          })
        end
      end,
      sources = {
        null_ls.builtins.formatting.stylua,
        --nix format/diag
        null_ls.builtins.formatting.alejandra,
        null_ls.builtins.diagnostics.statix,
        --Latex format/diagnostics
        null_ls.builtins.diagnostics.chktex,
        null_ls.builtins.formatting.latexindent,
        --null_ls.builtins.formatting.prettier,
        --null_ls.builtins.diagnostics.eslint_d,
        --null_ls.builtins.diagnostics.rubocop,
        --null_ls.builtins.formatting.rubocop,
        null_ls.builtins.formatting.clang_format,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
