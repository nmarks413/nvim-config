vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.relativenumber = true
vim.opt.undofile = true

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.opt.number = true

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Enable spell check
vim.opt.spell = false
vim.opt.spelllang = { "en_us" }

vim.o.winborder = "rounded"
vim.diagnostic.config({ virtual_text = true })

--commands for adding things to spellchecker
--[[
    :set spell – Turn on spell checking
    :set nospell – Turn off spell checking
    ]s – Jump to the next misspelled word
    [s – Jump to the previous misspelled word
    z= – Bring up the suggested replacements
    zg – Good word: Add the word under the cursor to the dictionary
    zw – Woops! Undo and remove the word from the dictionary
--]]
