-- Nvim window keymaps
vim.keymap.set('n', '<leader>wv', ':vsplit<CR>', { desc = 'split vertical' })
vim.keymap.set('n', '<leader>ws', ':split<CR>', { desc = 'split horizontal' })
vim.keymap.set('n', '<leader>wc', '<c-w>c', { desc = 'close window' })

vim.keymap.set('n', '<leader>wh', '<c-w>h', { desc = 'move left' })
vim.keymap.set('n', '<leader>wl', '<c-w>l', { desc = 'move right' })
vim.keymap.set('n', '<leader>wk', '<c-w>k', { desc = 'move up' })
vim.keymap.set('n', '<leader>wj', '<c-w>j', { desc = 'move down' })

-- Nvim Telescope keymaps
local extensions = require('telescope').extensions
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope search files', noremap = true} )
vim.keymap.set('n', '<leader>fe', extensions.file_browser.file_browser, { desc = 'Telescope file explorer', noremap = true } )
vim.keymap.set('n', '<leader>b',  builtin.buffers, {desc = 'Telescope list buffers', noremap = true} )
vim.keymap.set('n', '<leader>cl', builtin.commands, {desc = 'Telescope list commands', noremap = true})
vim.keymap.set('n', '<leader>km', builtin.keymaps, {desc = 'Telescope list keymappings', noremap = true})

-- Nvim trouble keymaps
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
