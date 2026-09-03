local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local servers = { "html", "cssls", "lua_ls", "postgres_lsp" }

-- 1. Default servers using Neovim 0.11 API
for _, lsp in ipairs(servers) do
  -- Safely extend the default configs so we don't overwrite cmds/filetypes
  vim.lsp.config[lsp] = vim.tbl_deep_extend("force", vim.lsp.config[lsp] or {}, {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
  vim.lsp.enable(lsp)
end

-- 2. vtsls specific setup using Neovim 0.11 API
vim.lsp.config.vtsls = vim.tbl_deep_extend("force", vim.lsp.config.vtsls or {}, {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    vtsls = {
      autoUseWorkspaceTsdk = true,
      experimental = {
        completion = { enableServerSideFuzzyMatch = true },
      },
    },
    typescript = {
      updateImportsOnFileMove = { enabled = "always" },
    },
  },
})
vim.lsp.enable "vtsls"
