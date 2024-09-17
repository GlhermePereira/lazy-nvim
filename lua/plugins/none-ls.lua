
return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Formatação com black
        null_ls.builtins.formatting.black.with({
          command = "/home/glherme/Fatec/web_3/primeiro-projeto-django/venv/bin/black", -- Caminho atualizado para black
          filetypes = { "python" },
        }),

        -- Diagnóstico com mypy
        null_ls.builtins.diagnostics.mypy.with({
          command = "/home/glherme/Fatec/web_3/primeiro-projeto-django/venv/bin/mypy", -- Caminho atualizado para mypy
          extra_args = function()
            return { "--python-executable", "/home/glherme/Fatec/web_3/primeiro-projeto-django/venv/bin/python" }
          end,
        }),

        -- Formatação com clang_format para Java
        null_ls.builtins.formatting.clang_format.with({
          filetypes = { "java" },
        }),

        -- Adicione outras fontes conforme necessário
      },
      
      debug = true, -- Habilita o modo de depuração para ajudar a identificar problemas
    })

    -- Define um atalho para formatação
    vim.keymap.set("n", "<leader>r", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "Format with null-ls" })

    -- Adiciona formatação automática ao sair do modo de inserção
    vim.api.nvim_create_autocmd("InsertLeave", {
      pattern = "*",
      callback = function()
        vim.lsp.buf.format({ async = true })
      end,
    })
  end,
}

