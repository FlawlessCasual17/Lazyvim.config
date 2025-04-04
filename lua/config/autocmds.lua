-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local function create_augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

-- Get rid of Neovim's stupid cursor change
vim.api.nvim_create_autocmd('VimLeave', {
  group = create_augroup('restore_cursor_shape_on_exit'),
  desc = 'Restore the cursor shape on exit of neovim',
  command = 'set guicursor=a:ver20'
})

-- Enable semantic highlighting
vim.api.nvim_create_autocmd('LspTokenUpdate', {
  group = create_augroup('set_semantic_highlighting'),
  callback = function()
    vim.api.nvim_set_hl(0, '@lsp.type.class', { fg = '#eed49f' })
    vim.api.nvim_set_hl(0, '@lsp.type.parameter', { fg = '#ed8796' })
    vim.api.nvim_set_hl(0, '@lsp.type.typeParameter', { fg = '#ed8796' })
    vim.api.nvim_set_hl(0, '@lsp.type.method', { fg = '#8aadf4' })
    vim.api.nvim_set_hl(0, '@lsp.typemod.variable.global', { fg = '#8bd5ca' })
    vim.api.nvim_set_hl(0, '@lsp.type.event', { fg = '#40a02b' })
    vim.api.nvim_set_hl(0, '@lsp.typemod.variable.defaultLibrary', {
      fg = '#f5a97f', italic = true
    })
    vim.api.nvim_set_hl(0, '@lsp.typemod.parameter.readonly', { italic = true })
    vim.api.nvim_set_hl(0, '@lsp.mod.readonly', { italic = true })
  end
})

-- -- Generate random colors
-- local function random_color()
--   local r = math.random(0, 255)
--   local g = math.random(0, 255)
--   local b = math.random(0, 255)
--   return string.format('#%02X%02X%02X', r, g, b)
-- end
--
-- -- Enable semantic highlighting for variables
-- vim.api.nvim_create_autocmd('LspTokenUpdate', {
--   group = create_augroup('set_semantic_highlighting'),
--   pattern = '*',
--   callback = function()
--     vim.api.nvim_set_hl(0, '@lsp.type.variable', { fg = random_color() })
--   end,
--   once = true
-- })

-- Auto-start for nvim-tree
vim.api.nvim_create_autocmd('VimEnter', {
  group = vim.api.nvim_create_augroup('autostart_nvim_tree', { clear = true }),
  desc = 'Auto-start nvim-tree with directory',
  once = true,
  ---@param data vim.api.create_autocmd.callback.args
  callback = function(data)
    -- Check if the `data` parameter is a table
    if type(data) ~= "table" then return end

    -- buffer is a directory
    if not (vim.fn.isdirectory(data.file) == 1) then return end

    -- change to the directory
    vim.cmd.cd(data.file)

    -- open the tree
    require('nvim-tree.api').tree.open()
  end
})
