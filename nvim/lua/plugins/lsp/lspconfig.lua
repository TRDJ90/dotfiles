return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config= function()
            local vim = vim
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            require('lspconfig.ui.windows').default_options.border = 'single'

            -- lsp on attach function.
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    --vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>",              { buffer = ev.buf, noremap = true, silent = true, desc = "Show LSP references" })
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration,                          { buffer = ev.buf, noremap = true, silent = true, desc = "Go to declaration"})
                    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>",             { buffer = ev.buf, noremap = true, silent = true, desc = "Show LSP definitions"})
                    vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>",         { buffer = ev.buf, noremap = true, silent = true, desc = "Show LSP implementations"})
                    vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>",        { buffer = ev.buf, noremap = true, silent = true, desc = "Show LSP type definitions"})
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action,         { buffer = ev.buf, noremap = true, silent = true, desc = "See available code actions"})
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,                       { buffer = ev.buf, noremap = true, silent = true, desc = "Smart rename"})
                    vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>",  { buffer = ev.buf, noremap = true, silent = true, desc = "Show buffer diagnostics"})
                    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float,                 { buffer = ev.buf, noremap = true, silent = true, desc = "Show line diagnostics"})
                    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev,                         { buffer = ev.buf, noremap = true, silent = true, desc = "Go to previous diagnostic"})
                    vim.keymap.set("n", "]d", vim.diagnostic.goto_next,                         { buffer = ev.buf, noremap = true, silent = true, desc = "Go to next diagnostic"})
                    vim.keymap.set("n", "K", vim.lsp.buf.hover,                                 { buffer = ev.buf, noremap = true, silent = true, desc = "Show documentation for what is under cursor"})
                end
            })

            local capabilities = cmp_nvim_lsp.default_capabilities()
            local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }

            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            lspconfig["html"].setup({
                capabilities = capabilities,
            })

            lspconfig["emmet_ls"].setup({
                capabilities = capabilities,
                filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss"},
            })

            local lua_ls = require('lsp-clients.lua-ls')
            lspconfig.lua_ls.setup(lua_ls)
        end
    }
}
