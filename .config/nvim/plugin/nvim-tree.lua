local utils = require('utils')

require("nvim-tree").setup({
    -- hijack_unnamed_buffer_when_opening = true,
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
        -- relativenumber = true,
        preserve_window_proportions = true,
    },
    modified = {
        enable = true,
        show_on_dirs = false,
    },
    update_focused_file = {
        enable = true,
    },
    -- actions = {
    --     open_file = {
    --         quit_on_open = true
    --     }
    -- }
})

utils.map('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })
utils.map('n', '<leader>tr', ':NvimTreeRefresh<CR>', { silent = true })
utils.map('n', '<leader>tf', ':NvimTreeFindFile<CR>', { silent = true })
