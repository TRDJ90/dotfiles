return {
    {
        'projekt0n/github-nvim-theme',
        --priority = 1000,
        lazy = false,
        config = function()
            require('github-theme').setup({
                options = {
                    transparent = false,
                }
            })

            --vim.cmd.colorscheme 'github_dark_dimmed'
        end
    },
    {
        'rebelot/kanagawa.nvim',
        priority = 1000,
        lazy = false,
        config = function()
            require('kanagawa').setup({
                compile = false,             -- enable compiling the colorscheme
                undercurl = true,            -- enable undercurls
                commentStyle = { italic = true },
                functionStyle = {},
                keywordStyle = { italic = true},
                statementStyle = { bold = true },
                typeStyle = {},
                transparent = false,         -- do not set background color
                dimInactive = true,         -- dim inactive window `:h hl-NormalNC`
                terminalColors = true,       -- define vim.g.terminal_color_{0,17}
            })

            vim.cmd.colorscheme 'kanagawa-dragon'
        end
    }
}







































