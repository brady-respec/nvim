local mark = require 'harpoon.mark'
local ui = require 'harpoon.ui'

vim.keymap.set('n', '<leader>m', mark.add_file, { desc = 'Harpoon: Add File' })
vim.keymap.set('n', '<leader>h', ui.toggle_quick_menu, { desc = 'Harpoon: Toggle Quick Menu' })

vim.keymap.set('n', '<leader>j', function()
  ui.nav_file(1)
end, { desc = 'Harpoon: Jump to File 1' })

vim.keymap.set('n', '<leader>k', function()
  ui.nav_file(2)
end, { desc = 'Harpoon: Jump to File 2' })

vim.keymap.set('n', '<leader>l', function()
  ui.nav_file(3)
end, { desc = 'Harpoon: Jump to File 3' })

vim.keymap.set('n', "<leader>'", function()
  ui.nav_file(4)
end, { desc = 'Harpoon: Jump to File 4' })
