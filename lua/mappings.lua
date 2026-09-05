require "nvchad.mappings"

local map = vim.keymap.set
local del = vim.keymap.del

-- ==========================================
-- Normal Mode Mappings
-- ==========================================
-- Window Splitting
map("n", "<leader>|", "<cmd>vsplit<cr>", { desc = "Vertical split" })
map("n", "<leader>-", "<cmd>split<cr>", { desc = "Horizontal split" })

-- Buffer Deletions
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Close buffer" })

-- Fast close for the current buffer. Overrides Vim's rarely used Ex-mode key.
map("n", "Q", "<cmd>bdelete<cr>", { desc = "Close buffer" })

-- Close every buffer in the current tab. Modified buffers still prompt before closing.
map("n", "<leader>bD", function()
  require("nvchad.tabufline").closeAllBufs()
end, { desc = "Close all buffers" })

del("n", "<leader>x")

-- Utility
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
map("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "Close Quickfix" })

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

-- ==========================================
-- Visual Mode Mappings
-- ==========================================

-- Disable arrow keys
map("v", "<Up>", "<nop>", { desc = "Disable Up" })
map("v", "<Down>", "<nop>", { desc = "Disable Down" })
map("v", "<Left>", "<nop>", { desc = "Disable Left" })
map("v", "<Right>", "<nop>", { desc = "Disable Right" })
