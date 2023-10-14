-- Telescope keymaps
vim.keymap.set('n', '<leader>?',  require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/',  require('telescope.builtin').live_grep, { desc = '[/] Fuzzy search current working directory' })
vim.keymap.set('n', '<leader>tf', require('telescope.builtin').find_files, { desc = 'Telescope search Files' })
vim.keymap.set('n', '<leader>th', require('telescope.builtin').help_tags, { desc = 'Telescope search Help' })
vim.keymap.set('n', '<leader>tw', require('telescope.builtin').grep_string, { desc = 'Telescope search Word' })
vim.keymap.set('n', '<leader>tg', require('telescope.builtin').live_grep, { desc = 'Telescope Grep' })
vim.keymap.set('n', '<leader>td', require('telescope.builtin').diagnostics, { desc = 'Telescope Diagnostics' })
vim.keymap.set('n', '<leader>tb', require('telescope.builtin').buffers, { desc = 'Telescope Buffers'})
vim.keymap.set('n', '<leader>tk', require('telescope.builtin').keymaps, { desc = 'Telescope keybindings'})

-- window management 
vim.keymap.set('n', '<leader>w-', ':vsplit<CR>', { desc = 'split vertical' })
vim.keymap.set('n', '<leader>w|', ':split<CR>', { desc = 'split horizontal' })
vim.keymap.set('n', '<leader>wc', '<c-w>c', { desc = 'close window' })

vim.keymap.set('n', '<leader>wh', '<c-w>h', { desc = 'move left' })
vim.keymap.set('n', '<leader>wl', '<c-w>l', { desc = 'move right' })
vim.keymap.set('n', '<leader>wk', '<c-w>k', { desc = 'move up' })
vim.keymap.set('n', '<leader>wj', '<c-w>j', { desc = 'move down' })
