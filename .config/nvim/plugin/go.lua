local utils = require('utils')
local map = utils.map

require("go").setup({
    lsp_fmt_async = true,
})


map("n", "<leader>Gb", ":GoBuild cmd/**/main.go && rm main<CR>")
map("n", "<leader>Gf", ":GoFillStruct<CR>")
map("n", "<leader>Gt", ":GoTest<CR>")
