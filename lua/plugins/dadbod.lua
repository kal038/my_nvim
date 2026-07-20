return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    keys = {
      -- Core UI Actions
      { "<leader>du", "<cmd>DBUI<cr>", desc = "Open Dadbod UI" },
      { "<leader>dt", "<cmd>DBUIToggle<cr>", desc = "Toggle Dadbod UI" },
      { "<leader>da", "<cmd>DBUIAddConnection<cr>", desc = "Dadbod Add Connection" },
      { "<leader>df", "<cmd>DBUIFindBuffer<cr>", desc = "Dadbod Find Buffer" },

      -- Panel Control Actions
      {
        "<leader>dc",
        function()
          vim.cmd "pclose | cclose | lclose"
          for _, w in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(w)
            if vim.bo[buf].filetype == "dbout" then
              vim.api.nvim_win_close(w, true)
            end
          end
        end,
        desc = "Close Dadbod Results Panel",
      },
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
}
