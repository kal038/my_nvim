return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require "harpoon"

    harpoon:setup {
      settings = {
        -- This ensures that when you close the Harpoon menu,
        -- any changes (deletions, reordering) are saved.
        save_on_toggle = true,

        -- Optional: Syncs the list across different Neovim instances
        sync_on_ui_close = false,
      },
    }
    -- FORCE SAVE ON BUFFER LEAVE
    vim.api.nvim_create_autocmd("BufLeave", {
      pattern = "harpoon",
      callback = function()
        vim.schedule(function()
          harpoon.ui.save()
        end)
      end,
    })

    -- Keymaps
    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end, { desc = "Harpoon add file" })

    vim.keymap.set("n", "<leader>m", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon quick menu" })

    -- Quickly jump to files
    vim.keymap.set("n", "<leader>1", function()
      harpoon:list():select(1)
    end)
    vim.keymap.set("n", "<leader>2", function()
      harpoon:list():select(2)
    end)
    vim.keymap.set("n", "<leader>3", function()
      harpoon:list():select(3)
    end)
    vim.keymap.set("n", "<leader>4", function()
      harpoon:list():select(4)
    end)
  end,
}
