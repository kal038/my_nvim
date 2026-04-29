require "nvchad.mappings"

local map = vim.keymap.set

-- ==========================================
-- Normal Mode Mappings
-- ==========================================
-- Window Splitting
map("n", "<leader>|", "<cmd>vsplit<cr>", { desc = "Vertical split" })
map("n", "<leader>-", "<cmd>split<cr>", { desc = "Horizontal split" })

-- Buffer
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Close buffer" })
vim.keymap.del("n", "<leader>x")

-- Utility
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- Disable arrow keys
map("n", "<Up>", "<nop>", { desc = "Disable Up" })
map("n", "<Down>", "<nop>", { desc = "Disable Down" })
map("n", "<Left>", "<nop>", { desc = "Disable Left" })
map("n", "<Right>", "<nop>", { desc = "Disable Right" })

-- ==========================================
-- Insert Mode Mappings
-- ==========================================
map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
map("i", "<Up>", "<nop>", { desc = "Disable Up" })
map("i", "<Down>", "<nop>", { desc = "Disable Down" })
map("i", "<Left>", "<nop>", { desc = "Disable Left" })
map("i", "<Right>", "<nop>", { desc = "Disable Right" })
-- The "No-Plugin" Escape
map("i", "<C-l>", "<Right>")
map("i", "<C-h>", "<Left>")

-- ==========================================
-- Visual Mode Mappings
-- ==========================================

-- Disable arrow keys
map("v", "<Up>", "<nop>", { desc = "Disable Up" })
map("v", "<Down>", "<nop>", { desc = "Disable Down" })
map("v", "<Left>", "<nop>", { desc = "Disable Left" })
map("v", "<Right>", "<nop>", { desc = "Disable Right" })
