local utils = require('utils')
local map = utils.map

require("go").setup({
    lsp_fmt_async = true,
})
-- require("go.format").goimport() -- goimport + gofmt

-- Run gofmt + goimport on save
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        require('go.format').goimport()
    end,
    group = format_sync_grp,
})


map("n", "<leader>Gb", ":GoBuild cmd/**/main.go && rm main<CR>")
map("n", "<leader>Gf", ":GoFillStruct<CR>")
map("n", "<leader>Gt", ":GoTest<CR>")
