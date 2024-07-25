-- "J" always leaves cursor unmoved
vim.keymap.set('n', 'J', 'mzJ`z')

-- Centering stuff that ThePrimeagean uses
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Awesome: System Clipboard Yanking
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to System Clipboard' })

-- Delete to void register (might conflict with [D]ocument)
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete to Void Register' })
