return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      hidden = true,
    },
    pickers = {
      find_files = {
        hidden = false,
        no_ignore = false,   -- or true, depending on your needs
      },
    },
  },
}
