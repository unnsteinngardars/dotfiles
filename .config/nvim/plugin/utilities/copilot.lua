local wk = require("which-key")

vim.g.copilot_no_tab_map = true

wk.add({
    {"<C-c>", ":copilot#Accept()<CR>", desc = "Accept copilot suggestion", mode = "i"},
    {"<C-d>", ":copilot#Dismiss()<CR>", desc = "Dismiss copilot suggestion", mode = "i"},
    {"<C-v>", ":copilot#Previous()<CR>", desc = "Previous copilot suggestion", mode = "i"},
    {"<C-b>", ":copilot#Next()<CR>", desc = "Next copilot suggestion", mode = "i"},
    {"<C-b>", ":copilot#Next()<CR>", desc = "Next copilot suggestion", mode = "n"},
})

