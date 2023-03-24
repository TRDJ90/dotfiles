return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                always_show_bufferline = true,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        highlight = "Directory",
                    },
                },
                separator_style = "slope",
            },
            
        },
    },
}
