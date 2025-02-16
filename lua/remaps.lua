local k = vim.keycode
vim.g.mapleader=k'<Space>'
vim.keymap.set('n', '<leader>E', '<cmd>:Ex<cr>')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>F', builtin.find_files, { desc = 'Telescope find files' })

local builtin = require('telescope.builtin')

local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>h", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>j", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>k", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>l", function() harpoon:list():select(4) end)
