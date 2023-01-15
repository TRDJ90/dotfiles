return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- nvim-telescope
    use 'nvim-lua/plenary.nvim'
    use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' } } }

    -- nvim treesitter
    use ( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'} )
    use { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter'}

    -- nvim ui
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-tree/nvim-tree.lua'
    use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } }

    -- Themes
    use({
        'projekt0n/github-nvim-theme',
        config = function()
            require('github-theme').setup({
                theme_style = "dimmed",
                dark_sidebar = true,
            })
        end
    })

    if packer_bootstrap then
      require('packer').sync()
    end
  end)
