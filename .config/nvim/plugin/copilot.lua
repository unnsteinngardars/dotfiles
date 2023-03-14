local utils = require('utils')
local options = { silent = true, expr = true }

vim.g.copilot_no_tab_map = true
utils.map("i", "<C-c>", 'copilot#Accept("<CR>")', options)
utils.map("i", "<C-d>", 'copilot#Dismiss()', options)
utils.map("i", "<C-v>", 'copilot#Previous()', options)
utils.map("i", "<C-b>", 'copilot#Next()', options)
