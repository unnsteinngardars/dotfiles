local wk = require('which-key')
local utils = require('utils')
local options = { silent = true, expr = true }

vim.g.copilot_no_tab_map = true

-- NOTE: These are not working, C-c only inserts the text copilot#Accept
-- wk.add({
--     { "<C-c>", "copilot#Accept", desc = "Copilot accept", mode = "i" },
--     { "<C-d>", "copilot#Dismiss", desc = "Copilot dismiss", mode = "i" },
--     { "<C-v>", "copilot#Previous", desc = "Copilot previous", mode = "i" },
--     { "<C-b>", "copilot#Next", desc = "Copilot next", mode = "i" },
-- })

utils.map("i", "<C-c>", 'copilot#Accept("<CR>")', options)
utils.map("i", "<C-d>", 'copilot#Dismiss()', options)
utils.map("i", "<C-v>", 'copilot#Previous()', options)
utils.map("i", "<C-b>", 'copilot#Next()', options)
