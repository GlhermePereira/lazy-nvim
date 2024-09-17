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

    -- Configuração do LSP para TypeScript e JavaScript
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      filetypes = { 'typescript', 'javascript' },
      root_dir = lspconfig.util.root_pattern('package.json', '.git'),
    })

    -- Configuração do LSP para HTML e Django
    lspconfig.html.setup({
      capabilities = capabilities,
      filetypes = { 'html', 'htmldjango' },
    })

    -- Configuração do LSP para CSS
    lspconfig.cssmodules_ls.setup({
      capabilities = capabilities,
      filetypes = { 'css' },
      root_dir = lspconfig.util.root_pattern('package.json', '.git'),
    })

    -- Configuração do LSP para Lua
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
    })

    -- Configuração do LSP para Python
    lspconfig.pyright.setup({
      capabilities = capabilities,
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

    -- Configuração do LSP para Bash
    lspconfig.bashls.setup({
      capabilities = capabilities,
      filetypes = { 'bash', 'sh' },
      root_dir = lspconfig.util.root_pattern('.git', '*.bashrc', '*.bash_profile'),
    })

    -- Configuração do LSP para PHP (Stimulus)
    lspconfig.stimulus_ls.setup({
      cmd = { "stimulus-language-server", "--stdio" },
      filetypes = { "php", "blade" },
      root_dir = require("lspconfig.util").root_pattern("composer.json", "git"),
    })

    -- Configuração do LSP para Java
    lspconfig.jdtls.setup({
      capabilities = capabilities,
    })

    -- Configuração do LSP para C/C++
    lspconfig.clangd.setup({
      capabilities = capabilities,
    })
      -- Adicionando Blade LSP

      -- Atalhos para LSP
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
