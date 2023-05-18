return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        version = false,
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            highlight = { enable = true },
            ensure_installed = {
                "lua",
                "c",
                "c_sharp",
                "rust",
                "sql",

                "html",
                "css",
                "typescript",
                "javascript",
                "vue",

                "terraform",
                "bicep",

                "yaml",
                "toml",
                "markdown",
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end
    },
}
