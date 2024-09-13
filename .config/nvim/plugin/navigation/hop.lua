local wk = require("which-key")

wk.add({
    {"fw", ":HopWord <CR>", desc = "Hop word", mode = "n"},
    {"fp", ":HopPattern <CR>", desc = "Hop pattern", mode = "n"},
    {"ff", ":HopChar1 <CR>", desc = "Hop char 1", mode = "n"},
    {"fg", ":HopChar2 <CR>", desc = "Hop char 2", mode = "n"},
    {"fl", ":HopLine <CR>", desc = "Hop line", mode = "n"},
})
