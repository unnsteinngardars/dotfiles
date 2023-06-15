local utils = require('utils')
local map = utils.map

require("winshift").setup()

map("n", "<leader>s", ":WinShift swap<CR>")
map("n", "<leader>h", ":WinShift left<CR>")
map("n", "<leader>l", ":WinShift right<CR>")
map("n", "<leader>k", ":WinShift up<CR>")
map("n", "<leader>j", ":WinShift down<CR>")
