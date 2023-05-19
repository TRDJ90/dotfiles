return {
    -- lsp-zero
    {
        'VonHeikemen/lsp-zero.nvim',
        lazy = true,
        branch = 'v2.x',
        config = function()
            require('lsp-zero.settings').preset({})
        end
    },
    
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            {'L3MON4D3/LuaSnip'},
            {'onsails/lspkind.nvim'},
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            -- The arguments for .extend() have the same shape as `manage_nvim_cmp`: 
            -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp

            require('lsp-zero.cmp').extend()

            -- And you can configure cmp even more, if you want to.
            local cmp = require('cmp')
            local cmp_action = require('lsp-zero.cmp').action()
            local lspkind = require('lspkind')

            cmp.setup({
                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'symbol',
                        maxwidth = 50,
                        ellipsis_char = '...',
                    })
                },
                mapping = {
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                }
            })
        end
    },

    -- Specific language lsp plugins
    -- TODO: maybe seperate this to something else.
    {'simrat39/rust-tools.nvim'},
    {'jose-elias-alvarez/typescript.nvim'},

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = 'LspInfo',
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
            {'williamboman/mason-lspconfig.nvim'},
            {
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
        },
        config = function()
        -- This is where all the LSP shenanigans will live

            local lsp = require('lsp-zero').preset({})
            local navic = require('nvim-navic')

            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({buffer = bufnr})
                navic.attach(client, bufnr)
            end)

            lsp.ensure_installed({
                 -- development
                "lua_ls",
                "clangd",
                "omnisharp",
                "rust_analyzer",
                "sqlls",

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
                "marksman",
            })

            -- Configure specific language server for neovim
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

            -- Skip server because language specific lsp plugin has better features..
            lsp.skip_server_setup({'rust_analyzer'})
            lsp.skip_server_setup({'tsserver'})

            lsp.setup()

            -- Setup language specific lsp plugins.
            local rust_tools = require('rust-tools')
            rust_tools.setup({
                server = {
                    on_attach = function(client, bufnr)
                        vim.keymap.set('n', '<leader>ca', rust_tools.hover_actions.hover_actions, {buffer = bufnr})
                        navic.attach(client, bufnr)
                    end
                }
            })

            local typescript = require('typescript')
            typescript.setup({
                server = {
                    on_attach = function(client, bufnr)
                        vim.keymap.set('n', '<leader>ci', '<cmd>TypescriptAddMissingImports<cr>', {buffer = bufnr})
                        navic.attach(client, bufnr)
                    end
                }
            })
        end
    }
}
