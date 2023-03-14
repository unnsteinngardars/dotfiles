local utils = require('utils')
local map = utils.map

map('n', '<leader>w', ':lua require("nvim-window").pick()<CR>', { silent = true })
