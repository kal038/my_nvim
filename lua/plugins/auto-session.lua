return {
  "rmagatti/auto-session",
  lazy = false,
  config = function()
    require("auto-session").setup {
      auto_session_enabled = true,
      auto_save_enabled = true,
      auto_restore_enabled = true,

      -- This makes sessions separate per git branch
      auto_session_use_git_branch = true,

      -- Optional: ignore dirs you don't want to session-manage
      bypass_session_save_file_types = { "NvimTree", "neo-tree", "alpha" },
    }
  end,
}
