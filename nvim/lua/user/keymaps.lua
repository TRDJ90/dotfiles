-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?',  require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', require('telescope.builtin').live_grep, { desc = '[/] Fuzzy search current working directory' })

vim.keymap.set('n', '<leader>tf', require('telescope.builtin').find_files, { desc = 'Telescope search Files' })
vim.keymap.set('n', '<leader>th', require('telescope.builtin').help_tags, { desc = 'Telescope search Help' })
vim.keymap.set('n', '<leader>tw', require('telescope.builtin').grep_string, { desc = 'Telescope search Word' })
vim.keymap.set('n', '<leader>tg', require('telescope.builtin').live_grep, { desc = 'Telescope Grep' })
vim.keymap.set('n', '<leader>td', require('telescope.builtin').diagnostics, { desc = 'Telescope Diagnostics' })
vim.keymap.set('n', '<leader>tb', require('telescope.builtin').buffers, { desc = 'Telescope Buffers'})

--code symbols outline
vim.keymap.set('n', '<leader>cso', ':SymbolsOutline<CR>', { desc = '[c] Symbols Outline'})

-- nerd tree toggle
vim.keymap.set('n', '<leader>e', ':NeoTreeFocusToggle<CR>', { desc = '[e] Toggle Explorer' })
