-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false -- Remove annoying autoformat

-- Set font family and font size (For Neovide and Neovim-Qt)
vim.opt.guifont = { 'JetBrainsMono Nerd Font', ':h16' }
-- Set softwrapping to always be true
vim.opt.wrap = true

-- -- Set leader key
-- vim.g.mapleader = ","

-- Change default cursor to a line
vim.opt.guicursor = 'i:ver25-iCursor'

-- Set lazyvim picker to fzf
vim.g.lazyvim_picker = 'fzf'
