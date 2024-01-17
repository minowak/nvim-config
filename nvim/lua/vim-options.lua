vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.o.laststatus = 3

vim.opt.relativenumber = true
vim.opt.number = true
vim.api.nvim_set_hl(0, 'LineNr', { fg = "white" })

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
