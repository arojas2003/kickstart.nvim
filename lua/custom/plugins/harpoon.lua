vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim', -- harpoon dependency
  {
    src = 'https://github.com/ThePrimeagen/harpoon',
    version = 'harpoon2',
  },
})

local harpoon = require 'harpoon'
harpoon:setup()

vim.keymap.set('n', '<leader>a', function()
  harpoon:list():add()
end, { desc = 'Harpoon: List [A]dd' })

vim.keymap.set('n', '<C-e>', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Harpoon: Toggle Quick M[e]nu' })

for i = 1, 8 do
  vim.keymap.set({ 'n', 'i', 'v' }, string.format('<A-%d>', i), function()
    harpoon:list():select(i)
  end, { desc = string.format('Harpoon: Navigate to file %d', i) })

  -- Only have this keymap in normal mode: in insert mode, having a leader
  -- keymap causes huge amounts of lag when pressing `space`
  vim.keymap.set('n', string.format('<leader><A-%d>', i), function()
    harpoon:list():replace_at(i)
  end, { desc = string.format('Harpoon: Replace file %d', i) })
end
