vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- Packer can itself as an option plugin
	use {'wbthomason/packer.nvim', opt = true}

	-- Add colorbuddy for theme management
	use {'tjdevries/colorbuddy.nvim'}

	-- Add color schemes
	use {'tjdevries/gruvbuddy.nvim', requires = 'tjdevries/colorbuddy.nvim'}

	use { 'npxbr/gruvbox.nvim', requires = 'tjdevries/colorbuddy.nvim'}
	
	-- Add nvim-web-devicons
	use { 'kyazdani42/nvim-web-devicons' }

	-- Add Statusline plugins
	use { 'glepnir/galaxyline.nvim', after ='nvim-web-devicons' }
	
	-- Add tree sitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	
	use { 'nvim-telescope/telescope.nvim', requires = {
        {'nvim-lua/popup.nvim'}, 
        {'nvim-lua/plenary.nvim'}, 
        {'nvim-telescope/telescope-fzy-native.nvim'}}
    }
    
    use { 'neovim/nvim-lspconfig', requires = { 
        {'nvim-lua/lsp_extensions.nvim'}, 
        {'nvim-lua/completion-nvim'}}
    }

    --use {'tjdevries/nlua.nvim', requires = {
    --    {'euclidianAce/BetterLua.vim'},
    --    {'tjdevries/manillua.nvim'}}
    --}
    
end)
