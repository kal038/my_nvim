require "nvchad.options"

-- add yours here!
vim.opt.mouse = "a"
vim.opt.relativenumber = true
vim.opt.updatetime = 250
vim.opt.laststatus = 0
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
-- Ensure Neovim's native autoread is enabled
vim.o.autoread = true

-- Automatically trigger file check when Neovim gains focus or enters a buffer
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd "checktime"
    end
  end,
})
