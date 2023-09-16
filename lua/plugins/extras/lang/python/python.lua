return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      -- vim.list_extend(opts.ensure_installed, { "pyright", "black", "ruff-lsp", "ruff" })
      vim.list_extend(opts.ensure_installed, {
        "black",
        "ruff",
      })
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources, {
        -- Order of formatters matters. They are used in order of appearance.
        nls.builtins.formatting.ruff,
        nls.builtins.formatting.black,
        -- nls.builtins.formatting.black.with({
        --   extra_args = { "--preview" },
        -- }),
        nls.builtins.diagnostics.ruff,
      })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local path = require("mason-registry").get_package("debugpy"):get_install_path()
      require("dap-python").setup(path .. "/venv/Scripts/python")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {},
    opts = {
      format = { timeout = 5000 },
      servers = {
        pyright = {},
        ruff_lsp = {},
        jedi_language_server = {},
      },
      setup = {
        ruff_lsp = function()
          require("lazyvim.util").on_attach(function(client, _)
            if client.name == "ruff_lsp" then
              -- Disable hover in favor of Pyright
              client.server_capabilities.hoverProvider = false
            end
          end)
        end,
        pyright = function()
          require("lazyvim.util").on_attach(function(client, _)
            if client.name == "pyright" then
              -- disable hover in favor of jedi-language-server
              client.server_capabilities.hoverProvider = false
            end
          end)
        end,
      },
    },
  },
}
