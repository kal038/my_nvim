return {
  {
    "vimpostor/vim-tpipeline",
    lazy = false, -- Load immediately so Tmux can grab it on startup
    init = function()
      -- Auto-embed the statusline into tmux
      vim.g.tpipeline_autoembed = 1

      -- Hide Neovim's native statusline so you don't get duplicates
      -- (one in Neovim, one in Tmux)
      vim.opt.laststatus = 0

      -- Optional: Hide the command line for even more screen real estate
      vim.opt.cmdheight = 0
    end,
  },

  -- Clean up Lualine separators so they render properly in Tmux
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.component_separators = ""
      opts.options.section_separators = ""
    end,
  },
}
