return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        "vtsls",
        "html-lsp",
        "css-lsp",
        "lua-language-server",
        "postgres-language-server",
        "prettier",
        "stylua",
        "black",
      },
    },
  }
