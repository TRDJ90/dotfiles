return {
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { "MunifTanjim/nui.nvim",        lazy = true },
    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree",
        keys = {
            { "<leader>e", "<cmd>Neotree <CR>",       desc = "Focus explorer" },
            { "<leader>b", "<cmd>Neotree toggle<CR>", desc = "Toggle explorer" },
        },
        init = function()
            vim.g.neo_tree_remove_legacy_commands = 1
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function()
            return {
                options = {
                    theme = "auto",
                    globalstatus = true,
                    disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    always_divide_middle = true,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    }
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { 'filename' },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
            }
        end,
        config = function(_, opts)
            local lualine = require("lualine")
            lualine.setup(opts)
        end,
    }
}
