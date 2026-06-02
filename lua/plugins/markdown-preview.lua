return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_echo_preview_url = 1
      -- You can add any other global mkdp settings here, for example:
      -- vim.g.mkdp_auto_close = 0
    end,
  },
}
