return {
    -- Fuzzy Finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
            'fdschmidt93/telescope-egrepify.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
        },
        config = function()
          local telescope = require('telescope')
          local themes = require('telescope.themes')

          telescope.setup {
            border = true,
            extensions = {
              fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
              },
              file_browser = {
                hijack_netrw = true,
                display_stat = false,
                git_status = false,
              },
              ["ui-select"] = {
                  themes.get_dropdown{}
              }
            }
          }

          telescope.load_extension "file_browser"
          telescope.load_extension "fzf"
          telescope.load_extension "ui-select"
          telescope.load_extension "egrepify"
        end
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    }
}
