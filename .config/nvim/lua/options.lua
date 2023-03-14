vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.confirm = true

vim.o.encoding = "UTF-8"
vim.o.wildmenu = true
vim.o.wildmode = "longest:full,full"
vim.o.termguicolors = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.hidden = true
vim.o.number = true
vim.o.relativenumber = true
vim.g.confirm = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'
-- ctermbg = NONE
-- guibg = NONE

vim.cmd("syntax enable")
