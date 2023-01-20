return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- nvim-telescope
    use 'nvim-lua/plenary.nvim'
    use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' } } }

    -- nvim treesitter
    use ( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'} )
    use { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter'}

    -- nvim ui
    use { 'nvim-tree/nvim-web-devicons' }
    use { 'SmiteshP/nvim-navic' }
    use { 'nvim-tree/nvim-tree.lua' }
    use { 'folke/trouble.nvim', config = function() require("trouble").setup {} end }
    use { "nvim-lualine/lualine.nvim", requires = { 'nvim-tree/nvim-web-devicons', opt = true } }
    use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }
    use { "lewis6991/gitsigns.nvim", config = function() require("gitsigns").setup() end }
    use { "utilyre/barbecue.nvim", after = "nvim-web-devicons", config = function() require("barbecue").setup() end }
    use { "folke/lsp-colors.nvim" }

    -- nvim lsp-zero
    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }


    -- nvim themes
    -- use { 'tanvirtin/monokai.nvim', config = function() require('monokai').setup {} end }

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
