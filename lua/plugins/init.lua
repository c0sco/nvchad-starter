return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  --
  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
  			"gopls", "lua-language-server", "stylua",
  			"html-lsp", "css-lsp" , "prettier", "terraform-ls",
        "typescript-language-server"
  		},
  	},
  },
  --
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc", "go", "markdown",
        "html", "css", "hcl", "terraform", "typescript",
        "tsx", "javascript", "jsx",
  		},
  	},
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"go", "terraform", "typescript", "javascript", "javascriptreact", "typescriptreact", "markdown"},
    opts = function()
      return require "configs.null-ls"
    end,
  },
}
