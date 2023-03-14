local utils = require('utils')
local map = utils.map

map("n", "<leader>na", ":lua require('harpoon.mark').add_file()<CR>")
map("n", "<leader>nt", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
map("n", "<leader>nm", ":lua require('harpoon.ui').nav_file(vim.v.count)<CR>")
map("n", "<leader>np", ":lua require('harpoon.ui').nav_prev()<CR>")
map("n", "<leader>nn", ":lua require('harpoon.ui').nav_next()<CR>")
