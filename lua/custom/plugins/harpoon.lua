return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Harpoon: List [A]dd' })

    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon: Toggle Quick M[e]nu' })

    -- Sets ALT-<num> to navigate to file <num> in Harpoon
    local keymap_set_nav = function(num)
      vim.keymap.set({ 'n', 'i', 'v' }, string.format('<A-%d>', num), function()
        harpoon:list():select(num)
      end, { desc = string.format('Harpoon: Navigate to file %d', num) })
    end

    -- Sets <leader> ALT-<num> to replace <num> in Harpoon
    local keymap_set_replace_nav = function(num)
      vim.keymap.set('n', string.format('<leader><A-%d>', num), function()
        harpoon:list():replace_at(num)
      end, { desc = string.format('Harpoon: Replace file %d', num) })
    end

    for i = 1, 8 do
      keymap_set_nav(i)
      keymap_set_replace_nav(i)
    end
  end,
}
