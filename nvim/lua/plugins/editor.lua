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
            require('gitsigns').setup()
        end
    },

    -- nvim tree aka file explorer
    {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require('nvim-tree').setup()
        end
    }
}
