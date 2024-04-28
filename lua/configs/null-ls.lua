local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
  sources = {
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.prettier.with({
      filetypes = {
        "javascript", "javascriptreact",
        "typescript", "typescriptreact",
        "css", "scss", "html", "json",
        "yaml",
        "markdown", "md", "txt",
        "graphql",
      },
      only_local = "node_modules/.bin",
    }),
    null_ls.builtins.formatting.stylua.with({
      filetypes = { "lua", },
      args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
    }),
    null_ls.builtins.formatting.terraform_fmt,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({bufnr = bufnr})
        end,
      })
    end
  end,
}

return opts
