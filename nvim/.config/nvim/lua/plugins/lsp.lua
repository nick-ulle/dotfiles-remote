local config_lspconfig = function()
  local lsp = require("lspconfig")

  -- Lua
  lsp.lua_ls.setup {
    before_init = require("neodev.lsp").before_init,
    settings = {
      Lua = {
      }
    },
  }

  -- R
  lsp.r_language_server.setup {
    settings = {
      r = {
        lsp = {
          diagnostics = false
        }
      }
    }
  }

  -- Python
  lsp.pylsp.setup {
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = {
              "E203", -- whitespace before `:` (and also `,`?)
              "E251", -- spaces around parameter equals
            }
          }
        }
      }
    }
  }

  -- Julia
  lsp.julials.setup {}

  -- Bash
  lsp.bashls.setup {}

  -- JSON
  lsp.jsonls.setup {}
end

return {
  {
    "jmbuhr/otter.nvim",
    enabled = false,
  },
  {
    "quarto-dev/quarto-nvim",
    enabled = false,
    dependencies = {
      "jmbuhr/otter.nvim",
      "hrsh7th/nvim-cmp",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter"
    },
    opts = {
      lspFeatures = {
        enabled = false,
        languages = { "r", "python", "julia" },
        diagnostics = {
          enabled = true,
          triggers = { "BufWrite" }
        },
        completion = {
          enabled = true
        }
      }
    }
  },
  {
    "folke/neodev.nvim",
    enabled = false,
    name = "neodev",
    opts = {
      setup_jsonls = true,
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    enabled = false,
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "lua_ls",
        "bashls",
        "jsonls",
        "julials",
        "pylsp",
        "r_language_server",
      },
    }
  },
  {
    "neovim/nvim-lspconfig",
    enabled = false,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      { "folke/neodev.nvim", name = "neodev", lazy = false },
    },
    config = config_lspconfig
  },
}
