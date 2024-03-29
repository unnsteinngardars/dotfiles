local utils = require('utils')
local map = utils.map

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
-- require('telescope').load_extension('frecency')
require("telescope").load_extension("yank_history")
require('telescope').load_extension('fzf')
require('telescope').load_extension('project')
require('telescope').load_extension('frecency')

map('n', '<leader>ff', ':Telescope find_files<CR>')
map('n', '<leader>fg', ':Telescope live_grep<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
map('n', '<leader>fh', ':Telescope help_tags<CR>')
map('n', '<leader>fk', ':Telescope keymaps<CR>')
map('n', '<leader>fr', ':Telescope resume<CR>')
map('n', '<leader>fp', ':Telescope project<CR>')
map('n', '<leader>fy', ':Telescope yank_history<CR>')



-- taken from nvim-lua/kickstart.nvim
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })
