local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- vim.lsp.set_log_level("debug")

local mygroup = vim.api.nvim_create_augroup("ziglings", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "[0123456789][0123456789][0123456789]_*.zig" },
  group = mygroup,
  callback = function(t)
    local file = vim.fn.fnamemodify(t.file, ":t")
    local n = file:sub(0, 3)
    n = string.format("%i", n)
    vim.o.makeprg = "zig build -Dn=" .. n

    local nf = vim.fn.glob(string.format("%03i_*", n + 1))
    local pf = vim.fn.glob(string.format("%03i_*", n - 1))

    vim.keymap.set("n", "<leader>n", "<cmd>e " .. nf .. "<cr>")
    vim.keymap.set("n", "<leader>p", "<cmd>e " .. pf .. "<cr>")

    vim.keymap.set("n", "<leader>m", "<cmd>vert sp term://zig build -Dn=" .. n .. "<cr>")
  end,
})

require("vim-options")
require("lazy").setup("plugins")
