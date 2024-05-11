return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls", "lua-language-server", "stylua",
        "html-lsp", "css-lsp", "prettier", "terraform-ls",
        "typescript-language-server", "codelldb",
        -- for nix, gotta install this through configuration.nx
        "rust-analyzer",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc", "go", "markdown",
        "html", "css", "hcl", "terraform", "typescript",
        "tsx", "javascript", "properties", "c", "rust", "json"
        -- this seems to mess up file loading, not sure why
        -- "jsx"
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"go", "terraform", "typescript", "javascript", "javascriptreact", "typescriptreact", "rust" },
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Downloads", "/", "/etc" },
      }
    end,
  },
}
