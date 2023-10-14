return {
 {
        'projekt0n/github-nvim-theme',
        priority = 1000,
        lazy = false,
        config = function()
            require('github-theme').setup({
                options = {
                    transparent = true,
                }
            })

            --vim.cmd.colorscheme 'github_dark_dimmed'
        end
    },
    {
        'ribru17/bamboo.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require("bamboo").setup {
                style = 'vulgaris',
                transparent = true,
            }
            --require("bamboo").load()
        end,
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require('gruvbox').setup {
                transparent_mode = false,
            }
            vim.cmd.colorscheme 'gruvbox'
        end
    },
}
