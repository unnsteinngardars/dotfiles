local wk = require("which-key")

require("telescope").setup {
    defaults = {
        file_ignore_patterns = { "node_modules", "vendor" },
        dynamic_preview_title = true,
        history = {
            path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
            limit = 100,
        }
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        repo = {
            list = {
                search_dirs = {
                    "~/Repositories",
                    "~/.config"
                }
            }
        }
    }
}

require('telescope').load_extension('repo')
require("telescope").load_extension("yank_history")
require('telescope').load_extension('fzf')
require('telescope').load_extension('project')
require('telescope').load_extension('frecency')

wk.add({
    {"<leader>ff", ":Telescope find_files<CR>", desc = "Find files", mode = "n"},
    {"<leader>fg", ":Telescope live_grep<CR>", desc = "Grep files", mode = "n"},
    {"<leader>fb", ":Telescope buffers<CR>", desc = "List buffers", mode = "n"},
    {"<leader>fh", ":Telescope help_tags<CR>", desc = "Help tags", mode = "n"},
    {"<leader>fk", ":Telescope keymaps<CR>", desc = "Keymaps", mode = "n"},
    {"<leader>fr", ":Telescope resume<CR>", desc = "Resume", mode = "n"},
    {"<leader>fp", ":Telescope project<CR>", desc = "Project", mode = "n"},
    {"<leader>fy", ":Telescope yank_history<CR>", desc = "Yank history", mode = "n"},
    {"<leader>fe", ":Telescope frecency<CR>", desc = "Frecency searh", mode= "n"},
    {"<leader>?", require('telescope.builtin').oldfiles, desc = "[?] Find recently opened files"},
    {"<leader><space>", require('telescope.builtin').buffers, desc = "[ ] Find existing buffers"},
    {"<leader>fw", require('telescope.builtin').grep_string, desc = "[S]earch current [W]ord"},
    {"<leader>fd", require('telescope.builtin').diagnostics, desc = "[S]earch [D]iagnostics"},
    {"<leader>/", function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
        })
    end, desc = "[/] Fuzzily search in current buffer"}
})
