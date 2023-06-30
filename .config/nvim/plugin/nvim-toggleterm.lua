local utils    = require('utils')
local map      = utils.map
local buf_map  = utils.buf_map
local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({
        cmd = "lazygit",
        hidden = true,
        direction = "float",
    })

function toggle_lazygit()
    lazygit:toggle()
end

require('toggleterm').setup {
    open_mapping = [[<C-\>]],
    insert_mappings = false,
    direction = 'vertical',
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.3
        end
    end,
}

function set_terminal_keymaps()
    buf_map('t', '<esc>', [[<C-\><C-n>]])
    buf_map('t', 'jk', [[<C-\><C-n>]])
    buf_map('t', '<C-h>', [[<C-\><C-n><C-W>h]])
    buf_map('t', '<C-j>', [[<C-\><C-n><C-W>j]])
    buf_map('t', '<C-k>', [[<C-\><C-n><C-W>k]])
    buf_map('t', '<C-l>', [[<C-\><C-n><C-W>l]])
end

map("n", "<leader>tg", ":lua toggle_lazygit()<CR>")

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
