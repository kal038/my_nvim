return {
  {
    "sindrets/diffview.nvim",
    -- Performance optimization: Only load the plugin when you explicitly run these commands
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- Renders the file status icons (Modified, Added, Deleted)
    },
    keys = {
      -- Open the VS Code style file tree review dashboard
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git Diff Open" },
      -- Instantly close the dashboard and restore your clean workspace layout
      { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Git Diff Close" },
    },
    opts = {
      enhanced_diff_hl = true, -- Improves syntax highlighting inside the side-by-side splits
      view = {
        default = {
          -- "diff2_horizontal" forces the exact side-by-side layout you see in VS Code
          layout = "diff2_horizontal",
        },
      },
      file_panel = {
        listing_style = "tree", -- "tree" gives you directories; change to "list" for flat files
        tree_options = {
          flatten_dirs = true, -- Flattens empty nested folders to keep the sidebar compact
          folder_statuses = "only_folded",
        },
        win_config = {
          position = "left", -- Places the file tree on the left side, exactly like VS Code
          width = 35, -- Sets the width of the review sidebar
        },
      },
    },
  },
}
