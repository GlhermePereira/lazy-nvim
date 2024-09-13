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

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

