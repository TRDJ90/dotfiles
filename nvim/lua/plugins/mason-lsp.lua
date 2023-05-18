return {
  --[[
    {
    'williamboman/mason.nvim',
    build = ":MasonUpdate",
    config = function()
        require("mason").setup()
    end
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function(_, opts)
        require("mason-lspconfig").setup(opts)
    end,
    opts = {
      ensure_installed = {
        -- development
        "lua_ls",
        "clangd",
        "omnisharp",
        "rust_analyzer",
        "sqls",

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
        --"marksman",
      }
    }
  }--]]
}
