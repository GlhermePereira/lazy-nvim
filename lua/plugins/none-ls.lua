return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Adiciona suporte para diferentes ferramentas de formatação e diagnóstico
        null_ls.builtins.formatting.black, -- Formatação com black para Python
        null_ls.builtins.diagnostics.mypy.with({
          extra_args = function()
            local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
            return { "--python-executable", virtual .. "/bin/python3" }
          end,
        }), -- Diagnóstico com mypy para Python
        -- Adicione outras fontes conforme necessário
      },
      debug = true, -- Habilita o modo de depuração para ajudar a identificar problemas
    })

    -- Define um atalho para formatação
    vim.keymap.set("n", "<leader>gf", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "Format with null-ls" })
  end,
}

