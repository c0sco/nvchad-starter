require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- Escape in terminal mode should leave insert mode, not close the buffer (which happens if this isn't here)
map("t", "<Esc>", "<C-\\><C-n>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
