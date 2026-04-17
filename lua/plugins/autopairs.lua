-- lua/plugins/autopairs.lua
return {
  "windwp/nvim-autopairs",
  event = "InsertEnter", -- Only loads when you start typing!
  config = function()
    require("nvim-autopairs").setup {
      check_ts = true,
      -- your other hardcore configs
    }
  end,
}
