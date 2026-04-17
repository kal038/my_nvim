return {
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    config = function()
      require("smart-splits").setup({
        ignored_filetypes = { "NvimTree", "NvimTree_1" },
      })
      local ss = require("smart-splits")

      -- Move between splits
      vim.keymap.set("n", "<C-h>", ss.move_cursor_left)
      vim.keymap.set("n", "<C-l>", ss.move_cursor_right)
      vim.keymap.set("n", "<C-k>", ss.move_cursor_up)
      vim.keymap.set("n", "<C-j>", ss.move_cursor_down)

      -- Resize splits
      vim.keymap.set("n", "<C-M-h>", ss.resize_left)
      vim.keymap.set("n", "<C-M-l>", ss.resize_right)
      vim.keymap.set("n", "<C-M-k>", ss.resize_up)
      vim.keymap.set("n", "<C-M-j>", ss.resize_down)
    end,
  },
}
