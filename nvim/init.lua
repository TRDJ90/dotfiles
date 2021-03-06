-- requires
require('plugins')

-- Locals
local utils = require'utils'
local indents = 4
local cmd = vim.cmd

-- setup internal vim setups
vim.wo.number = true
vim.wo.relativenumber = true

-- setup leader keybinding
vim.g.mapleader = " "

vim.o.completeopt='menuone,noinsert,noselect'
vim.wo.signcolumn='yes'

-- options
cmd 'hi Normal guibg=NONE ctermbg=NONE'
cmd 'highlight clear LineNr'
cmd 'highlight clear SignColumn'

vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.expandtab = true
vim.bo.smartindent = true

vim.api.nvim_set_option('updatetime', 300)


local nvim_lsp = require('lspconfig')

-- Show diagnostic popup on cursor hold
-- cmd 'autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()'

-- attach function for lsp --
local on_attach = function(client, bufnr)
    require'completion'.on_attach(client)
    
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', '<leader>gD',    '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    buf_set_keymap('n', '<leader>gd',    '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    buf_set_keymap('n', '<leader>k',     '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    buf_set_keymap('n', '<leader>gi',    '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    buf_set_keymap('n', '<leader>td',    '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    buf_set_keymap('n', '<leader>gr',    '<cmd>lua vim.lsp.buf.references()<cr>', opts)

    buf_set_keymap('n', '[d',    '<cmd>lua vim.lsp.diagnostics.goto_prev()<cr>', opts)
    buf_set_keymap('n', ']d',    '<cmd>lua vim.lsp.diagnostics.goto_next()<cr>', opts)

    buf_set_keymap('n', '<leader>ga',    '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end

-- Enable rust analyzer
nvim_lsp.rust_analyzer.setup{ on_attach=on_attach}

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = true,
        update_in_insert = true,
    }
)

-- Completion tab bindings
local function t(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab_next()
	return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
end

function _G.smart_tab_prev()
    return vim.fn.pumvisible() == 1 and t'<C-p>' or '<S-Tab>'
end

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab_next()', {expr = true, noremap = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.smart_tab_prev()', {expr = true, noremap = true})


-- setup nvim-treesitter
require'nvim-treesitter.configs'.setup {
	ensure_installed = {"lua", "rust", "c_sharp"},
	highlight = {
		enabled = true
	},
}

-- set color scheme
require('colorbuddy').colorscheme('gruvbuddy')

vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
vim.cmd('highlight clear LineNr')
vim.cmd('highlight clear SignColumn')

-- Telescope setup
require('telescope').load_extension('fzy_native')
vim.api.nvim_set_keymap('n', '<leader>ff', [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
