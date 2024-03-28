vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"

vim.opt.breakindent = true
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", space = "." }

vim.opt.statuscolumn = "%=%{v:relnum?v:relnum:v:lnum} %s"

vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})


-- Auto cmds
vim.api.nvim_create_autocmd({ "FileType" }, {
    callback = function()
        if require("nvim-treesitter.parsers").has_parser() then
            vim.opt.foldmethod = "expr"
            vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        else
            vim.opt.foldmethod = "syntax"
        end
    end,
})

-- Themes
local theme = {
    {
        "blazkowolf/gruber-darker.nvim",
        priority = 1000,
        init = function()
            vim.cmd.colorscheme("gruber-darker")
            vim.cmd.hi("Comment gui=none")
        end,
    },
    {
        "rebelot/kanagawa.nvim",
    },
}


-- Editor
local editor = {
    { "numToStr/Comment.nvim", opts = {} },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup()
        end,
    },
    {
        "akinsho/bufferline.nvim",
        config = function()
            local bufferline = require("bufferline")
            bufferline.setup()
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        config = function()
            require("ibl").setup({
                indent = {
                    char = "▏"
                }
            })
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "│" },
                change = { text = "│" },
                delete = { text = "│" },
                topdelete = { text = "┆" },
                changedelete = { text = "┆" },
                untracked = { text = "┆" },
            },
        },
    },

    {
        "folke/which-key.nvim",
        event = "VimEnter",
        config = function()
            require("which-key").setup()

            -- Document existing key chains
            require("which-key").register({
                ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
                ["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
                ["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
                ["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
                ["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
            })
        end,
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },

    {
        "folke/trouble.nvim",
        opts = {},
    },
    {

        "stevearc/conform.nvim",
        opts = {
            notify_on_error = false,
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
            formatters_by_ft = {
                lua = { "stylua" },
            },
        },
    },

    -- Highlight todo, notes, etc in comments
    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { signs = false },
    },
}


-- Telescope
local telescope = {
    {
        "nvim-telescope/telescope.nvim",
        event = "VimEnter",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = function()
                    return vim.fn.executable("make") == 1
                end,
            },
            { "nvim-telescope/telescope-ui-select.nvim" },

            { "nvim-tree/nvim-web-devicons" },
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    prompt_prefix = '  ',
                    selection_caret = '>  ',
                    border = true,
                    theme = "center",
                    sorting_strategy = "ascending",
                    layout_config = {
                        horizontal = {
                            prompt_position = "top",
                            preview_width = 0.55,
                        },
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                },
            })

            -- Enable telescope extensions, if they are installed
            pcall(require("telescope").load_extension, "fzf")
            pcall(require("telescope").load_extension, "ui-select")

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
            vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
            vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
            vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
            vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
            vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
            vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
            vim.keymap.set("n", "<leader>sr.", builtin.resume, { desc = "[S]earch [R]esume" })
            vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
            vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

            -- override default behavior and theme
            vim.keymap.set("n", "<leader>/", function()
                builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                    winblend = 10,
                    previewer = false,
                }))
            end, { desc = "[/] Fuzzily search in current buffer" })

            vim.keymap.set("n", "<leader>s/", function()
                builtin.live_grep({
                    grep_open_files = true,
                    prompt_title = "Live Grep in Open Files",
                })
            end, { desc = "[S]earch [/] in Open Files" })

            vim.keymap.set("n", "<leader>sn", function()
                builtin.find_files({ cwd = vim.fn.stdpath("config") })
            end, { desc = "[S]earch [N]eovim files" })


            -- Custom highlights
            local green = "#37ad39"
            local blue = "#0985de"
            local red = "#DC2626"

            local previewer_bg = "#1E1E1E"

            local prompt_bg = "#1E293B"
            local prompt_text = "#FFFBDB"

            local result_bg = "#282828"
            local text_color = "#FFFFF4"

            -- Prompt highlights
            vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = prompt_bg, bg = prompt_bg })
            vim.api.nvim_set_hl(0, "TelescopePromptNormal", { fg = prompt_text, bg = prompt_bg })
            vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = text_color, bg = green })
            vim.api.nvim_set_hl(0, "TelescopePromptCounter", { fg = prompt_text, bg = prompt_bg })
            vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = prompt_text, bg = prompt_bg })

            -- Result highlights
            vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = result_bg, bg = result_bg })
            vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { fg = text_color, bg = result_bg })
            vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = text_color, bg = blue })
            vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = red, bg = result_bg })

            -- Preview highlights
            vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = previewer_bg, bg = previewer_bg })
            vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { fg = text_color, bg = previewer_bg })
            vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = text_color, bg = red })
        end,
    },
}

-- Treesitter
local treesitter = {
    { -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        "nvim-treesitter/nvim-treesitter-textobjects",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "bash", "c", "html", "lua", "markdown", "vim", "vimdoc", "zig", "rust" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            textobjects = {
                move = {
                    enable = true,
                    set_jumps = true,

                    goto_next_start = {
                        [']M'] = '@function.outer',
                    },
                    goto_previous_start = {
                        ['[M'] = '@function.outer',
                    },
                },
            },

        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}

-- LSPConfig and autocompletion
local lsp_config = {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "lvimuser/lsp-inlayhints.nvim",
            { 'j-hui/fidget.nvim', opts = {} },
            { 'folke/neodev.nvim', opts = {} },
        },
        config = function()
            local lspconfig = require("lspconfig")
            local inlayhints = require("lsp-inlayhints")


            vim.api.nvim_create_autocmd("LspAttach", {
                desc = 'LSP actions',
                callback = function(event)
                    local bufnr = event.buf
                    local client = vim.lsp.get_client_by_id(event.data.client_id)

                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
                    end

                    map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
                    map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                    map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
                    map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
                    map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
                    map(
                        "<leader>ws",
                        require("telescope.builtin").lsp_dynamic_workspace_symbols,
                        "[W]orkspace [S]ymbols"
                    )
                    map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
                    map("K", vim.lsp.buf.hover, "Hover Documentation")
                    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

                    inlayhints.on_attach(client, bufnr)

                    if client and client.server_capabilities.documentHighlightProvider then
                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            buffer = bufnr,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                            buffer = bufnr,
                            callback = vim.lsp.buf.clear_references,
                        })
                    end
                end,
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

            lspconfig.lua_ls.setup({
                on_init = function(client)
                    local path = client.workspace_folders[1].name
                    if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                        return
                    end

                    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                        runtime = {
                            version = 'LuaJIT'
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME
                            }
                        }
                    })
                end,
                settings = {
                    Lua = {
                        hint = {
                            enable = true,
                        }
                    }
                },
                capabilities = capabilities,
            })

            lspconfig.zls.setup({
                capabilities = capabilities
            })
        end
    },
    {
        "hrsh7th/nvim-cmp",
        event = 'InsertEnter',
        dependencies = {
            {
                "L3MON4D3/LuaSnip",
                build = (function()
                    if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
                        return
                    end
                    return 'make install_jsregexp'
                end)(),
            },
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
        },
        config = function()
            local cmp = require "cmp"
            local luasnip = require "luasnip"
            luasnip.config.setup({})

            cmp.setup {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                completion = { completeopt = 'menu,menuone,noinsert' },
                mapping = cmp.mapping.preset.insert {
                    ['<Up>'] = cmp.mapping.select_prev_item(),
                    ['<Down'] = cmp.mapping.select_next_item(),

                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-n>'] = cmp.mapping.select_next_item(),

                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),

                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),

                    -- <C-l> will move us to the right and <C-h> will move us to the left of the expansion locations of the current snippet.
                    ['<C-l>'] = cmp.mapping(function()
                        if luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        end
                    end, { 'i', 's' }),

                    ['<C-h>'] = cmp.mapping(function()
                        if luasnip.expand_or_locally_jumpable(-1) then
                            luasnip.expand_or_jump(-1)
                        end
                    end, { 'i', 's' }),
                },
                sources = {
                    { name = 'path' },
                    { name = "nvim_lsp" },
                    { name = 'buffer' },
                    { name = 'luasnip' }
                },
            }
        end
    }
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    theme,
    editor,
    telescope,
    lsp_config,
    treesitter,
})
