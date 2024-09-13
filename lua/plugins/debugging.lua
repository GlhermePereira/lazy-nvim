return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    {
      "microsoft/vscode-js-debug",
      opt = true,
      run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
    }
  },
  config = function()
    -- Configuração do DAP e DAP-UI
    local dap, dapui = require("dap"), require("dapui")

    dap.adapters.python = function(cb, config)
      if config.request == 'attach' then
        local port = (config.connect or config).port
        local host = (config.connect or config).host or '127.0.0.1'
        cb({
          type = 'server',
          port = assert(port, '`connect.port` is required for a python `attach` configuration'),
          host = host,
          options = {
            source_filetype = 'python',
          },
        })
      else
        local pythonPath = os.getenv("VIRTUAL_ENV") and (os.getenv("VIRTUAL_ENV") .. "/bin/python") or '/home/glherme/.virtualenvs/debugpy/bin/python'
        cb({
          type = 'executable',
          command = pythonPath,
          args = { '-m', 'debugpy.adapter' },
          options = {
            source_filetype = 'python',
          },
        })
      end
    end

    dap.configurations.python = {
      {
        type = 'python',
        request = 'launch',
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
            return cwd .. '/venv/bin/python'
          elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
            return cwd .. '/.venv/bin/python'
          else
            return os.getenv("VIRTUAL_ENV") and (os.getenv("VIRTUAL_ENV") .. "/bin/python") or '/usr/bin/python'
          end
        end,
      },
    }

    dap.adapters.firefox = {
      type = 'executable',
      command = 'node',
      args = { os.getenv('HOME') .. '/vscode-firefox-debug/dist/adapter.bundle.js' },
    }

    dap.configurations.typescript = {
      {
        name = 'Debug with Firefox',
        type = 'firefox',
        request = 'launch',
        reAttach = true,
        url = 'http://localhost:3000',
        webRoot = '${workspaceFolder}',
        firefoxExecutable = '/usr/bin/firefox', -- ou o caminho do Firefox na sua máquina
      },
    }

    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end

    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end

    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set('n', '<F4>', function() dap.toggle_breakpoint() end, { noremap = true, silent = true })
    vim.keymap.set('n', '<F5>', function() dap.continue() end, { noremap = true, silent = true })
  end,
}

