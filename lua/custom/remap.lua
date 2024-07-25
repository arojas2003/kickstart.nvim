-- "J" always leaves cursor unmoved
vim.keymap.set('n', 'J', 'mzJ`z')

-- Centering stuff that ThePrimeagean uses
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
