local utils = require('utils')
local options = { silent = true }

require("barbar").setup({
    no_name_title = "I AM TAB"
})

vim.api.nvim_create_autocmd('FileType', {
    callback = function(tbl)
        local set_offset = require('bufferline.api').set_offset

        local bufwinid
        local last_width
        local autocmd = vim.api.nvim_create_autocmd('WinScrolled', {
                callback = function()
                    bufwinid = bufwinid or vim.fn.bufwinid(tbl.buf)
                    local current_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
                    local width = vim.api.nvim_win_get_width(bufwinid)
                    if width ~= last_width then
                        set_offset(width, current_dir)
                        last_width = width
                    end
                end,
            })

        vim.api.nvim_create_autocmd('BufWipeout', {
            buffer = tbl.buf,
            callback = function()
                vim.api.nvim_del_autocmd(autocmd)
                set_offset(0)
            end,
            once = true,
        })
    end,
    pattern = 'NvimTree', -- or any other filetree's `ft`
})

utils.map("n", "<A-,>", ":BufferPrevious<CR>", options)
utils.map("n", "<A-.>", ":BufferNext<CR>", options)
utils.map("n", "<C-,>", ":BufferPrevious<CR>", options)
utils.map("n", "<C-.>", ":BufferNext<CR>", options)

utils.map("n", "<A-<>", ":BufferMovePrevious<CR>", options)
utils.map("n", "<A->>", ":BufferMoveNext<CR", options)
utils.map("n", "<A-1>", ":BufferGoto 1<CR>", options)
utils.map("n", "<A-2>", ":BufferGoto 2<CR>", options)
utils.map("n", "<A-3>", ":BufferGoto 3<CR>", options)
utils.map("n", "<A-4>", ":BufferGoto 4<CR>", options)
utils.map("n", "<A-5>", ":BufferGoto 5<CR>", options)
utils.map("n", "<A-6>", ":BufferGoto 6<CR>", options)
utils.map("n", "<A-7>", ":BufferGoto 7<CR>", options)
utils.map("n", "<A-8>", ":BufferGoto 8<CR>", options)
utils.map("n", "<A-9>", ":BufferGoto 9<CR>", options)
utils.map("n", "<A-p>", ":BufferPin<CR>", options)

utils.map("n", "<M-c>", ":BufferClose<CR>", options)
utils.map("n", "<M-w>", ":BufferClose<CR>", options)
utils.map("n", "<C-c>", ":BufferClose<CR>", options)

utils.map("n", "<A-C>", ":BufferCloseAllButCurrent<CR>", options)
utils.map("n", "<A-W>", ":BufferCloseAllButCurrent<CR>", options)
