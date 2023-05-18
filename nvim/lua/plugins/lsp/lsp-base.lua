return {
	-- LSP configuration & Plugins
    {
        'neovim/nvim-lspconfig',
	    dependencies = {
		    { 'williamboman/mason.nvim', config = true },
            { 'williamboman/mason-lspconfig.nvim' },

		    -- Useful status updates for LSP
		    { 'j-hui/fidget.nvim', opts = {} },

		    -- Additional lua configuration, makes nvim stuff amazing!
            { 'folke/neodev.nvim' },
	    },
    },

    {
        'williamboman/mason.nvim',
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)
        end,
        opts = {
            ensure_installed = {
                -- development
                "lua_ls",
                "clangd",
                "omnisharp",
                "rust_analyzer",
                "sqls",

                -- web development
                "html",
                "cssls",
                "emmet_ls",
                "tailwindcss",
                "jsonls",
                "tsserver",
                "volar",

                -- IaaC
                "terraformls",
                "bicep",

                -- markup
                "yamlls",
                "taplo",
                --"marksman",
            }
        }
    }
}
