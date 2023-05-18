return {
    'akinsho/bufferline.nvim', 
    version = "*",
    config = function()
        require('bufferline').setup({
            options = {
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        text_align = "center",
                        separator = true,
                    }
                },
                separator_style = "slant",
            }
        })
    end
}
