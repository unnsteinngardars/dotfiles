local wk = require("which-key")
require("go").setup({
    lsp_fmt_async = true,
})

function SetEnv()
    vim.env.GO_TEST = "true"
end

wk.add({
    {"<leader>Gb", ":GoBuild cmd/**/main.go && rm main<CR>", desc = "Build", mode = "n"},
    {"<leader>Gl", ":GoLint<CR>", desc = "Lint", mode = "n"},
    {"<leader>Gf", ":GoFillStruct<CR>", desc = "Fill struct", mode = "n"},
    {"<leader>Gt", ":GoTest<CR>", desc = "Test", mode = "n"},
    {"<leader>Gft", ":GoTestFile<CR>", desc = "Test file", mode = "n"},
})
