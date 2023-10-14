return {
    -- UI elements, icons etc
    {'nvim-lua/plenary.nvim'},

    {'MunifTanjim/nui.nvim'},

    {
        'nvim-tree/nvim-web-devicons',
        config = function()
            require('nvim-web-devicons').setup({})
        end
    },

    -- Bufferline
    {
        'akinsho/bufferline.nvim',
        event = "VeryLazy",
        version = "*",
        config = function()
            require('bufferline').setup({
            options = {
            }
        })
        end
    },


    -- statusline 
    {
        'nvim-lualine/lualine.nvim',
        event = "VeryLazy",
        config = function()
            local navic = require('nvim-navic')

            require('lualine').setup({
                options = {
                    icons_enabled = true,
                    theme = 'seoul256',
                    component_separators = { left = '', right = ''},
                    section_separators = { left = '', right = ''},
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = true,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    }
                },

                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch'},
                    lualine_c = {{
                        'buffers',
                        use_mode_colors = false,
                    }},
                    lualine_x = {'encoding', 'fileformat', 'filetype', 'diff', 'diagnostics'},
                    lualine_y = {},
                    lualine_z = {'datetime'}
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {'filename'},
                    lualine_x = {'location'},
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {
                    lualine_c = {
                        {
                            function()
                                return navic.get_location()
                            end,
                            cond = function()
                                return navic.is_available()
                            end,
                            draw_empty = true,
                        },
                    }
                },
                inactive_winbar = {},
                extensions = {}
            })
        end
    },

    -- navic
    {
        'SmiteshP/nvim-navic',
        config = function()
            require('nvim-navic').setup {
                highlight = true,
                depth_limit = 5,
                safe_output = true,
                padding = {
                    left = 0,
                    right = 0,
                },
                icons = {
                    File = ' ',
                    Module = ' ',
                    Namespace = ' ',
                    Package = ' ',
                    Class = ' ',
                    Method = ' ',
                    Property = ' ',
                    Field = ' ',
                    Constructor = ' ',
                    Enum = ' ',
                    Interface = ' ',
                    Function = ' ',
                    Variable = ' ',
                    Constant = ' ',
                    String = ' ',
                    Number = ' ',
                    Boolean = ' ',
                    Array = ' ',
                    Object = ' ',
                    Key = ' ',
                    Null = ' ',
                    EnumMember = ' ',
                    Struct = ' ',
                    Event = ' ',
                    Operator = ' ',
                    TypeParameter = ' '
                }
            }
        end
    },
}
