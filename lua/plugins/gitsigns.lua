return {
  {
    "lewis6991/gitsigns.nvim",
    -- Performance optimization: Only load when opening a real file buffer
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- Clean VS Code style margin markers
      signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      signcolumn = true, -- Always show the sign column to prevent text jumping
      numhl = false, -- Turn off line number highlighting (reduces visual noise)
      linehl = false, -- Turn off full line highlighting (keeps it minimal)
      word_diff = false, -- Toggle with a keymap if needed instead of forcing it globally
      watch_gitdir = {
        follow_files = true,
      },
      auto_attach = true,
      attach_to_untracked = false,
      current_line_blame = true, -- Optional: Shows inline VS Code-style git blame text at end of line
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- End of line
        delay = 1000, -- Show after half a second of hovering on a line
      },

      -- Keymaps specifically for navigating and handling code changes locally
      on_attach = function(bufnr)
        local gitsigns = require "gitsigns"

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation: Jump between hunks (changes) quickly
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.feedkeys("]c", "n")
          else
            gitsigns.nav_hunk "next"
          end
        end, { desc = "Next Git Change" })

        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.feedkeys("[c", "n")
          else
            gitsigns.nav_hunk "prev"
          end
        end, { desc = "Previous Git Change" })

        -- Actions: Stage, Reset, and Preview Inline
        map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Stage Hunk" })
        map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset Hunk" })
        map("v", "<leader>gs", function()
          gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
        end, { desc = "Stage Selected Lines" })
        map("v", "<leader>gr", function()
          gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
        end, { desc = "Reset Selected Lines" })

        -- The VS Code inline preview we discussed earlier
        map("n", "<leader>gp", gitsigns.preview_hunk_inline, { desc = "Preview Hunk Inline" })
      end,
    },
  },
}
