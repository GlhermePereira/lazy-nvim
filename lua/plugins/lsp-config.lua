return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      -- LSPs configurados
      lspconfig.ts_ls.setup({ capabilities = capabilities })    -- JavaScript/TypeScript
      lspconfig.html.setup({ capabilities = capabilities })        -- HTML
      lspconfig.cssmodules_ls.setup({ capabilities = capabilities }) -- CSS
      lspconfig.lua_ls.setup({ capabilities = capabilities })      -- Lua
      -- Python
local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  root_dir = require("lspconfig.util").root_pattern(
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    ".git"
  ),
  settings = {
    python = {
      analysis = {
        diagnosticMode = "workspace",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        stubPath = "typings",
        typeCheckingMode = "basic",
        logLevel = "Information",
      },
    },
  },
})


      lspconfig.jdtls.setup({ capabilities = capabilities })       -- Java
      lspconfig.clangd.setup({ capabilities = capabilities })      -- C/C++
      lspconfig.intelephense.setup({ capabilities = capabilities })-- PHP (Intelephense)

      -- Atalhos para LSP
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}

