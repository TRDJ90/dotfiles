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
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>tf', require('telescope.builtin').find_files, { desc = '[T]elescope search [F]iles' })
vim.keymap.set('n', '<leader>th', require('telescope.builtin').help_tags, { desc = '[T]elescope search [H]elp' })
vim.keymap.set('n', '<leader>tw', require('telescope.builtin').grep_string, { desc = '[T]elescope search current [W]ord' })
vim.keymap.set('n', '<leader>tg', require('telescope.builtin').live_grep, { desc = '[T]elescope search by [G]rep' })
vim.keymap.set('n', '<leader>td', require('telescope.builtin').diagnostics, { desc = '[T]elescope search [D]iagnostics' })


--code symbols outline
vim.keymap.set('n', '<leader>cso', ':SymbolsOutline<CR>', { desc = '[c] Symbols Outline'})

-- nerd tree toggle
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = '[e] Toggle Explorer' })
