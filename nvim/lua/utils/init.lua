local utils = { }

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

function utils.opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

function utils.map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl.extend('force', options, opt) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

return utils
