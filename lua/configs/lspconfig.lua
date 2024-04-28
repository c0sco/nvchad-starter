-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local util = require "lspconfig/util"

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "rust_analyzer" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- terraform
lspconfig.terraformls.setup{
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = {"terraform-ls", "serve"},
  root_dir = util.root_pattern("main.tf", ".git"),
}

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  root_dir = util.root_pattern("package.json", "yarn.lock", ".git")
}

-- golang
lspconfig.gopls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}
