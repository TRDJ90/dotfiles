return {
    -- Comment
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

    -- gitsigns
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                numhl = true,
            })
        end
    },

    -- auto pairs
    {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup({})
        end
    },

    -- neo-tree
    {
        'nvim-neo-tree/neo-tree.nvim',
        config = function()
            vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1]])

            require('neo-tree').setup({
                source_selector = {
                    winbar = true,
                    statusline = false,
                }
            })
        end
    }
}

