return {
    -- bufferline
    {
        'akinsho/bufferline.nvim',
        event = "VeryLazy",
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
                    component_separators = { left = '', right = ''},
                    section_separators = { left = '', right = ''},
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
                    lualine_b = {'branch', 'diff', 'diagnostics'},
                    lualine_c = {'filename'},
                    lualine_x = {'encoding', 'fileformat', 'filetype'},
                    lualine_y = {'progress'},
                    lualine_z = {'location'}
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

    -- indent guides for neovim
    {
        'lukas-reineke/indent-blankline.nvim',
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            char = '┊',
            filetype_exclude = { "help", "alpha", "dashboard", "NvimTree", "Trouble", "lazy", "mason" },
            show_trailing_blankline_indent = false,
            show_current_context = false,
        },
    },

    -- navic
    {
        'SmiteshP/nvim-navic',
        config = function()
            require('nvim-navic').setup {
                highlight = true,
                depth_limit = 5,
                safe_output = true,
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

    -- code symbols outline
    {
        'simrat39/symbols-outline.nvim',
        config = function()
            require('symbols-outline').setup()
        end
    },

    -- UI elements, icons etc
    {'nvim-lua/plenary.nvim'},

    {
        'nvim-tree/nvim-web-devicons',
        config = function()
            require('nvim-web-devicons').setup({})
        end
    },
}
