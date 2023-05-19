-- gutter
vim.api.nvim_set_hl(0, 'ColorColumn', { ctermbg = 0, bg="#ef9062" })


-- Telescope
local fg = "#E3E3E3"
local bg = "#1E222A"
local bg_alt = "#3E4452"
local green = "#97C379"
local red = "#DA6A73"

vim.api.nvim_set_hl(0, 'TelescopeBorder',        { fg = bg_alt, bg = bg })
vim.api.nvim_set_hl(0, 'TelescopeNormal',        { bg = bg })
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { fg = bg, bg = bg })
vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', { bg = bg })
vim.api.nvim_set_hl(0, 'TelescopePreviewTitle',  { fg = bg, bg = green })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder',  { fg = bg_alt, bg = bg_alt })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal',  { fg = fg, bg = bg_alt })
vim.api.nvim_set_hl(0, 'TelescopePromptPrefix',  { fg = red, bg = bg_alt })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle',   { fg = bg, bg = red })
vim.api.nvim_set_hl(0, 'TelescopeResultBorder',  { fg = bg, bg = bg })
vim.api.nvim_set_hl(0, 'TelescopeResultNormal',  { bg = fg })
vim.api.nvim_set_hl(0, 'TelescopeResultTitle',   { fg = bg, bg = bg })
