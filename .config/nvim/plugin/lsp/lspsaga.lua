local utils = require('utils')
local options = { silent = true }

require("lspsaga").setup({
    outline = {
        win_position = "right",
    },
    finder = {
        min_width = 20,
    }
})

-- Lsp Finder
utils.map('n', 'gh', '<cmd>Lspsaga finder<CR>', nil)
--
-- Code Actions
utils.map('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', options)
utils.map('v', '<leader>ca', '<cmd>Lspsaga code_action<CR>', options)

-- Rename
utils.map('n', '<leader>r', '<cmd>Lspsaga rename<CR>', options)
utils.map('n', '<leader>ra', '<cmd>Lspsaga rename ++project<CR>', options)
--
-- Definitions
utils.map('n', 'gpd', '<cmd>Lspsaga peek_definition<CR>', options)
utils.map('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', options)
utils.map('n', 'gt', '<cmd>Lspsaga goto_type_definition<CR>', options)
utils.map('n', 'gpt', '<cmd>Lspsaga peek_type_definition<CR>', options)

-- Diagnostics
utils.map('n', '<leader>sl', '<cmd>Lspsaga show_line_diagnostics<CR>', options)
utils.map('n', '<leader>sc', '<cmd>Lspsaga show_cursor_diagnostics<CR>', options)
utils.map('n', '<leader>sb', '<cmd>Lspsaga show_buf_diagnostics<CR>', options)
utils.map('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', options)
utils.map('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>', options)

-- Outline
utils.map('n', '<leader>o', '<cmd>Lspsaga outline<CR>', options)

-- Doc
utils.map('n', '<leader>K', '<cmd>Lspsaga hover_doc<CR>', options)

-- Incomming/Outgoing
utils.map('n', '<leader>ci', '<cmd>Lspsaga incoming_calls<CR>', options)
utils.map('n', '<leader>co', '<cmd>Lspsaga outgoing_calls<CR>', options)

-- Terminal
utils.map('n', '<A-d>', '<cmd>Lspsaga term_toggle<CR>', options)
utils.map('t', '<A-d>', '<cmd>Lspsaga term_toggle<CR>', options)
