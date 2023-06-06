local utils = require('utils')

require("nvim-tree").setup({
    renderer = {
        highlight_opened_files = "name",
        highlight_modified = "icon",
        indent_markers = {
            enable = true,
        },
        root_folder_label = ":t"
    },
    diagnostics = {
        enable = true,
    },
    view = {
        -- hide_root_folder = true,
        number = true,
        relativenumber = true,
        preserve_window_proportions = true,
    },
    modified = {
        enable = true,
        show_on_dirs = false,
    },
    update_focused_file = {
        enable = true,
    }
})

utils.map('n', '<C-n>', ':NvimTreeToggle<CR>')
utils.map('n', '<leader>tr', ':NvimTreeRefresh<CR>')
utils.map('n', '<leader>tf', ':NvimTreeFindFile<CR>')
