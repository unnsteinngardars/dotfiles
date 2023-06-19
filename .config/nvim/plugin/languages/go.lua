local utils = require('utils')
local map = utils.map

require("go").setup({
    lsp_fmt_async = true,
})

function SetEnv()
    vim.env.GO_TEST = "true"
end

map("n", "<leader>Gb", ":GoBuild<CR>")
map("n", "<leader>Gf", ":GoFillStruct<CR>")
map("n", "<leader>Gt", ":lua vim.env.GO_TEST='true'; vim.cmd('GoTest'); vim.env.GO_TEST=''<CR>")
map("n", "<leader>Gft", ":GoTestFile<CR>")
