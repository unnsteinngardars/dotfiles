require('plugins')
require('options')
require('mappings')

vim.cmd("colorscheme dracula")

-- The idea here is to close a buffer that has been opended if it is not modified, but there are some issues with the nvim-tree
-- vim.api.nvim_create_autocmd('BufLeave', {
--     callback = function(tbl)
--         local bufnr = vim.api.nvim_get_current_buf()
--         local bufname = vim.api.nvim_buf_get_name(bufnr)
--         if bufname:match("NvimTree") then
--             return
--         end
--         -- Check if the buffer is modified
--         if vim.api.nvim_buf_get_option(bufnr, 'modified') == false then
--             -- Close the buffer if it is not modified
--             print("not modified, should close")
--             vim.api.nvim_buf_delete(bufnr, {})
--         end
--     end
-- })
