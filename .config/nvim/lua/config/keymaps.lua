-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap.del

-- Remove A-j and A-k in normal and visual modes
-- This can be removed if the set -sg escape-time 10 in .tmux.conf works
keymap("n", "<A-j>")
keymap("n", "<A-k>")
keymap("v", "<A-j>")
keymap("v", "<A-k>")
