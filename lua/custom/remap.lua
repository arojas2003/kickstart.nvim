-- "J" always leaves cursor unmoved
vim.keymap.set('n', 'J', 'mzJ`z')

-- Centering stuff that ThePrimeagean uses
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- System Clipboard Yanking
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to System Clipboard' })

-- Delete to void register
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete to Void Register' })

-- Quick Fix List stuff
vim.keymap.set('n', '<A-k>', '<cmd>cprev<CR>zz', { desc = 'Jump to previous item in Quickfix List' })
vim.keymap.set('n', '<A-j>', '<cmd>cnext<CR>zz', { desc = 'Jump to next item in Quickfix List' })

-- Location List stuff
vim.keymap.set('n', '<leader>k', '<cmd>lprev<CR>zz', { desc = 'Jump to previous item in Location List' })
vim.keymap.set('n', '<leader>j', '<cmd>lnext<CR>zz', { desc = 'Jump to next item in Location List' })
