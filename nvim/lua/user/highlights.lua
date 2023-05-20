-- gutter
vim.api.nvim_set_hl(0, 'ColorColumn', { bg="#ef9062" })
--vim.api.nvim_set_hl(0, 'SignColumn', { bg="#292D34"})
--vim.api.nvim_set_hl(0, 'LineNr', { bg="#292D34"})

-- Telescope
local fg = "#E3E3E3"
local bg = "#222222"
local bg_alt = "#3E4452"
local bg_previewer = "#171717"
local green = "#97C379"
local red = "#DA6A73"

vim.api.nvim_set_hl(0, 'TelescopeBorder',         { fg = bg_alt, bg = bg })
vim.api.nvim_set_hl(0, 'TelescopeNormal',         { bg = bg })
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder',  { fg = bg_previewer, bg = bg_previewer })
vim.api.nvim_set_hl(0, 'TelescopePreviewNormal',  { bg = bg_previewer})
vim.api.nvim_set_hl(0, 'TelescopePreviewTitle',   { fg = bg, bg = green })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder',   { fg = bg_alt, bg = bg_alt })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal',   { fg = fg, bg = bg_alt })
vim.api.nvim_set_hl(0, 'TelescopePromptPrefix',   { fg = red, bg = bg_alt })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle',    { fg = bg, bg = red })
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder',  { fg = bg, bg = bg })
vim.api.nvim_set_hl(0, 'TelescopeResultsNormal',  { fg = fg, bg = bg })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle',   { fg = bg, bg = red })

-- LSP warning, error, code actions signs
vim.fn.sign_define("DiagnosticSignError", {text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",  {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",  {text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",  {text = "", texthl = "DiagnosticSignHint"})


