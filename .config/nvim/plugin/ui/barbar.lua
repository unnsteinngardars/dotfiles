local wk = require("which-key")

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

wk.add({
    {"<A-,>", ":BufferPrevious<CR>", desc = "Previous buffer", mode = "n"},
    {"<A-.>", ":BufferNext<CR>", desc = "Next buffer", mode = "n"},
    {"<C-,>", ":BufferPrevious<CR>", desc = "Previous buffer", mode = "n"},
    {"<C-.>", ":BufferNext<CR>", desc = "Next buffer", mode = "n"},
    {"<A-<>", ":BufferMovePrevious<CR>", desc = "Move buffer left", mode = "n"},
    {"<A->>", ":BufferMoveNext<CR>", desc = "Move buffer right", mode = "n"},
    {"<A-1>", ":BufferGoto 1<CR>", desc = "Goto buffer 1", mode = "n"},
    {"<A-2>", ":BufferGoto 2<CR>", desc = "Goto buffer 2", mode = "n"},
    {"<A-3>", ":BufferGoto 3<CR>", desc = "Goto buffer 3", mode = "n"},
    {"<A-4>", ":BufferGoto 4<CR>", desc = "Goto buffer 4", mode = "n"},
    {"<A-5>", ":BufferGoto 5<CR>", desc = "Goto buffer 5", mode = "n"},
    {"<A-6>", ":BufferGoto 6<CR>", desc = "Goto buffer 6", mode = "n"},
    {"<A-7>", ":BufferGoto 7<CR>", desc = "Goto buffer 7", mode = "n"},
    {"<A-8>", ":BufferGoto 8<CR>", desc = "Goto buffer 8", mode = "n"},
    {"<A-9>", ":BufferGoto 9<CR>", desc = "Goto buffer 9", mode = "n"},
    {"<A-p>", ":BufferPin<CR>", desc = "Pin buffer", mode = "n"},
    {"<M-c>", ":BufferClose<CR>", desc = "Close buffer", mode = "n"},
    {"<M-w>", ":BufferClose<CR>", desc = "Close buffer", mode = "n"},
    {"<C-c>", ":BufferClose<CR>", desc = "Close buffer", mode = "n"},
    {"<A-C>", ":BufferCloseAllButCurrent<CR>", desc = "Close all but current buffer", mode = "n"},
    {"<A-W>", ":BufferCloseAllButCurrent<CR>", desc = "Close all but current buffer", mode = "n"},
})
