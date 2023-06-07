local utils = require('utils')
local map = utils.map

require("winshift").setup()

map("n", "<A-s>", ":WinShift swap<CR>")
map("n", "<A-h>", ":WinShift left<CR>")
map("n", "<A-l>", ":WinShift right<CR>")
map("n", "<A-k>", ":WinShift up<CR>")
map("n", "<A-j>", ":WinShift down<CR>")
