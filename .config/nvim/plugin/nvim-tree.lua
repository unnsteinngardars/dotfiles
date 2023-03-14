local utils = require('utils')

require("nvim-tree").setup({
    hijack_unnamed_buffer_when_opening = true,
    renderer = {
        highlight_opened_files = "name",
        highlight_modified = "icon",
        indent_markers = {
            enable = true,
        },
    },
    diagnostics = {
        enable = true,
    },
    view = {
        -- hide_root_folder = true,
        number = true,
        relativenumber = true,
    },
    modified = {
        enable = true,
        show_on_dirs = false,
    }
})

utils.map('n', '<C-n>', ':NvimTreeToggle<CR>')
utils.map('n', '<leader>tr', ':NvimTreeRefresh<CR>')
utils.map('n', '<leader>tf', ':NvimTreeFindFile<CR>')
