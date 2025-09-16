local wk = require("which-key")

require("lspsaga").setup({
    outline = {
        win_position = "right",
        win_width = "60",
    },
    finder = {
        min_width = 20,
    }
})

wk.add({
      { "gh", "<cmd>Lspsaga finder<CR>" , desc = "Find all references for item", mode = "n" },
      { "<leader>ca", "<cmd>Lspsaga code_action<CR>", desc = "Show code actions", mode = "n"},
      { "<leader>ca", "<cmd>Lspsaga code_action<CR>", desc = "Show code actions", mode = "v"},
      { "<leader>r", "<cmd>Lspsaga rename<CR>", desc = "Rename", mode = "n"},
      { "<leader>ra", "<cmd>Lspsaga rename ++project<CR>", desc = "Rename in project", mode = "n"},
      { "gpd", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek definition", mode = "n"},
      { "gd", "<cmd>Lspsaga goto_definition<CR>", desc = "Go to definition", mode = "n"},
      { "gt", "<cmd>Lspsaga goto_type_definition<CR>", desc = "Go to type definition", mode = "n"},
      { "gpt", "<cmd>Lspsaga peek_type_definition<CR>", desc = "Peek type definition", mode = "n"},
      { "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show line diagnostics", mode = "n"},
      { "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", desc = "Show cursor diagnostics", mode = "n"},
      { "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", desc = "Show buffer diagnostics", mode = "n"},
      { "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Jump to previous diagnostic", mode = "n"},
      { "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Jump to next diagnostic", mode = "n"},
      { "<leader>o", "<cmd>Lspsaga outline<CR>", desc = "Show outline", mode = "n"},
      { "<leader>K", "<cmd>Lspsaga hover_doc<CR>", desc = "Show hover documentation", mode = "n"},
      { "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>", desc = "Show incoming calls", mode = "n"},
      { "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>", desc = "Show outgoing calls", mode = "n"},
      { "<A-d>", "<cmd>Lspsaga term_toggle<CR>", desc = "Toggle terminal", mode = "n"},
      { "<A-d>", "<cmd>Lspsaga term_toggle<CR>", desc = "Toggle terminal", mode = "t"},
  })
