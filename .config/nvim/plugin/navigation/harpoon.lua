local wk = require("which-key")

wk.add({
    {"<leader>na", ":lua require('harpoon.mark').add_file()<CR>", desc = "Add file", mode = "n"},
    {"<leader>nt", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Toggle quick menu", mode = "n"},
    {"<leader>nm", ":lua require('harpoon.ui').nav_file(vim.v.count)<CR>", desc = "Navigate file", mode = "n"},
    {"<leader>np", ":lua require('harpoon.ui').nav_prev()<CR>", desc = "Navigate previous", mode = "n"},
    {"<leader>nn", ":lua require('harpoon.ui').nav_next()<CR>", desc = "Navigate next", mode = "n"},
})

