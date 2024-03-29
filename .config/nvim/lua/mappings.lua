local utils = require('utils')
local map = utils.map

-- TODO: evaluate the need for this
function MoveLineUp()
    local curr_pos = vim.api.nvim_win_get_cursor(0)
    local new_pos = { curr_pos[1] - 1, curr_pos[2] }
    vim.api.nvim_exec("execute 'normal! ddkP'", false)
    vim.api.nvim_win_set_cursor(0, new_pos)
end

function MoveLineDown()
    local curr_pos = vim.api.nvim_win_get_cursor(0)
    local new_pos = { curr_pos[1] + 1, curr_pos[2] }
    vim.api.nvim_exec("execute 'normal! ddp'", false)
    vim.api.nvim_win_set_cursor(0, new_pos)
end

map("i", "jk", "<esc>")
map("n", "<leader>o", ":%s/<C-r><C-w>//g<Left><Left>")
map("n", "<leader>O", ":%s/<C-r><C-w>//gc<Left><Left><Left>")
map("n", "<leader>OG", ":cfdo %s/<C-r><C-w>//gc<Left><Left><Left>")

-- TODO: Evaulate the need for thi
-- map("n", "<A-j>", ":lua MoveLineDown()<CR>")
-- map("n", "<A-k>", ":lua MoveLineUp()<CR>")

-- From magtastic
-- Split buffers
map("n", "<leader>v", ":vsplit<cr>", { silent = true })
map("n", "<leader>V", ":split<cr>", { silent = true })

-- Buffers movements
map("n", "<leader>h", ":wincmd h<cr>")
map("n", "<leader>j", ":wincmd j<cr>")
map("n", "<leader>k", ":wincmd k<cr>")
map("n", "<leader>l", ":wincmd l<cr>")

-- Resize buffers
map("", "<C-h>", ":vertical resize -5<cr>", { silent = true })
map("", "<C-j>", ":resize +5<cr>", { silent = true })
map("", "<C-k>", ":resize -5<cr>", { silent = true })
map("", "<C-l>", ":vertical resize +5<cr>", { silent = true })
-- <C-x><C-f> in insert mode will display file import suggestions
