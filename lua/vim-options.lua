vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.background = "light"
-- Definir clipboard para usar o clipboard do sistema
vim.opt.clipboard = "unnamedplus"
-- Mapear 'Y' para copiar até o final da linha para o clipboard do sistema
vim.api.nvim_set_keymap('n', 'Y', '"+y$', { noremap = true, silent = true })

-- Mapear 'yy' para copiar a linha inteira para o clipboard do sistema
vim.api.nvim_set_keymap('n', 'yy', '"+yy', { noremap = true, silent = true })

-- Mapear 'p' para colar do clipboard do sistema
vim.api.nvim_set_keymap('n', 'p', '"+p', { noremap = true, silent = true })

-- Mapear 'P' para colar do clipboard do sistema antes do cursor
vim.api.nvim_set_keymap('n', 'P', '"+P', { noremap = true, silent = true })

-- Mapear 'p' para colar do clipboard do sistema em modo visual
vim.api.nvim_set_keymap('v', 'p', '"+p', { noremap = true, silent = true })

-- Mapear 'P' para colar do clipboard do sistema antes do cursor em modo visual
vim.api.nvim_set_keymap('v', 'P', '"+P', { noremap = true, silent = true })
--salvar arquivo
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>i', { noremap = true, silent = true })
--undo
vim.api.nvim_set_keymap('n', '<C-z>', 'u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-z>', '<Esc>ua', { noremap = true, silent = true }) -- Também funciona no modo de inserção

-- Refazer no modo normal
vim.api.nvim_set_keymap('n', '<C-y>', '<C-r>', { noremap = true, silent = true })

-- Refazer no modo de inserção
vim.api.nvim_set_keymap('i', '<C-y>', '<Esc><C-r>', { noremap = true, silent = true })
--salvar e sair
vim.api.nvim_set_keymap('n', '<C-x>', ':wq<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-x>', '<Esc>:wq<CR>', { noremap = true, silent = true }) -- Também funciona no modo de inserção
vim.api.nvim_set_keymap('n', '<C-l>', ':Telescope registers<CR>', { noremap = true, silent = true })
--recortar uma linha
vim.api.nvim_set_keymap('v', 'X', '"+d', { noremap = true, silent = true })
vim.opt.swapfile = false
-- sair do nvim
vim.api.nvim_set_keymap('n', '<C-q>', ':q<CR>', { noremap = true, silent = true })

-- sair do nvim sem salvar
--vim.api.nvim_set_keymap('n', '<C->', ':q!<CR>', { noremap = true, silent = true })
-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true
