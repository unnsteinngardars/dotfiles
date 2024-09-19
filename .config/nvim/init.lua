require('plugins')
require('options')
require('mappings')

local utils = require('utils')
local map = utils.map

-- Map q for macros to Q and set q to Nop
-- This is done because when in record macro mode, the nvim-cmp autocompletion is not working
map('n', 'Q', 'q')
map('n','q', '<Nop>')

-- vim.cmd("colorscheme dracula")

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])


-- vim.o.background = "light" -- or "light" for light mode
-- vim.cmd([[colorscheme everforest]])


-- The idea here is to close a buffer that has been opended if it is not modified, but there are some issues with the nvim-tree

--- vim.api.nvim_create_autocmd('BufLeave', {
---     callback = function(tbl)
---         local bufnr = vim.api.nvim_get_current_buf()
---         local bufname = vim.api.nvim_buf_get_name(bufnr)
---         if bufname:match("NvimTree") then
---             return
---         end
---         -- Check if the buffer is modified
---         if vim.api.nvim_buf_get_option(bufnr, 'modified') == false then
---             -- Close the buffer if it is not modified
---             print("not modified, should close")
---             vim.api.nvim_buf_delete(bufnr, {})
---         end
---     end
--- })
-- local function close_unmodified_buffers()
--     -- get a list of all buffers
--     local buffers = vim.api.nvim_list_bufs()
--
--     -- get the current buffer id
--     local current_buf = vim.api.nvim_get_current_buf()
--
--     for _, buf in ipairs(buffers) do
--         -- Check if the buffer is loaded (i.e., open in a window)
--         if vim.api.nvim_buf_is_loaded(buf) then
--             -- get the buffer's name
--             local name = vim.api.nvim_buf_get_name(buf)
--
--             -- get the buffer's modification flag
--             local is_modified = vim.api.nvim_buf_get_option(buf, 'modified')
--
--             if name:match("NvimTree") then
--                 return
--             end
--
--             -- if the buffer is not modified, and it's not the current buffer, and its name is not 'NvimTree', delete it
--             if not is_modified and buf ~= current_buf then
--                 -- Use the buffer's name to execute the bdelete command
--                 vim.api.nvim_command('bdelete ' .. buf)
--             end
--         end
--     end
-- end
--
-- vim.api.nvim_create_autocmd('BufReadPost', {
--     callback = function(tbl)
--         close_unmodified_buffers()
--     end
-- })
