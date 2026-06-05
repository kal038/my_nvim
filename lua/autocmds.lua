require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd

vim.diagnostic.config { virtual_text = true }

autocmd("FileType", {
  pattern = "qf",
  callback = function()
    -- Helper function to move cursor AND sync the QuickFix active highlight
    local function cycle_qf(direction)
      return function()
        if direction == "next" then
          vim.cmd "normal! j"
        else
          vim.cmd "normal! k"
        end

        -- Tell the quickfix list to update its active index to our current line
        local current_line = vim.fn.line "."
        vim.fn.setqflist({}, "a", { idx = current_line })
      end
    end
    -- Press 'q' to close the window
    vim.keymap.set("n", "q", "<cmd>cclose<CR>", { buffer = true, silent = true, desc = "Close Quickfix" })

    -- Tab to cycle down
    vim.keymap.set("n", "<Tab>", cycle_qf "next", { buffer = true, silent = true, desc = "Next Quickfix Item" })

    -- Shift+Tab to cycle up
    vim.keymap.set("n", "<S-Tab>", cycle_qf "prev", { buffer = true, silent = true, desc = "Prev Quickfix Item" })

    -- Hit Enter to jump to the location AND close the Quickfix window
    vim.keymap.set(
      "n",
      "<CR>",
      "<CR><cmd>cclose<CR>",
      { buffer = true, silent = true, desc = "Jump and Close Quickfix" }
    )
  end,
})
