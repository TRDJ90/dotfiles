return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "BufReadPost",
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
        opts = {
            ensure_installed = {
                -- TODO: Maybe place languages in a some config table so i have one place to defines languages...

                -- web
                "html",
                "css",
                "typescript",
                "json",
                "vue",
                -- backend
                "c_sharp",
                "rust",
                -- Lua for nvim
                "lua",
                -- Mark up languages
                "markdown",
                "toml",
                -- infra as code
                "bicep",
                "terraform"
            },
            additional_vim_regex_highlighting = false,
            highlight = { enable = true }
        }
    }
}
