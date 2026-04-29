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
      { "<leader>db", ":DBUIToggle<CR>", desc = "Toggle Dadbod UI" },
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
    config = function()
      -- This sets up autocomplete strictly for SQL files
      -- It prevents "Text" or "Snippet" noise when you just want tables/columns
      local autocomplete_group = vim.api.nvim_create_augroup("vim_dadbod_completion", { clear = true })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "dbout",
        callback = function()
          vim.keymap.set("n", "q", ":bd<CR>", { buffer = true, silent = true })
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql" },
        callback = function()
          local cmp = require "cmp"

          -- Global sources (like LSP or snippets) can sometimes crowd out DB results.
          -- This config prioritizes the DB completion source for SQL files.
          cmp.setup.buffer {
            sources = {
              { name = "vim-dadbod-completion" },
              { name = "buffer" },
            },
          }
        end,
        group = autocomplete_group,
      })
    end,
  },
}
