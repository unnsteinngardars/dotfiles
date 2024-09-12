local wk = require("which-key")

wk.add({
    {"<leader>w", ":lua require('nvim-window').pick()<CR>", desc = "Pick window", mode = "n"},
})

