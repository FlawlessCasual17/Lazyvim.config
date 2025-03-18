-- bootstrap lazy.nvim, LazyVim and your plugins
require('config.lazy')
-- For Comment.nvim
require('Comment').setup()

-- MOST IMPORTANT
require('lspconfig').lua_ls.setup {}

-- rainbow delimiters
-- This module contains a number of default definitions
---@type rainbow_delimiters.config
vim.g.rainbow_delimiters = {
  highlight = {
    'RainbowDelimiterRed',
    'RainbowDelimiterYellow',
    'RainbowDelimiterBlue',
    'RainbowDelimiterOrange',
    'RainbowDelimiterGreen',
    'RainbowDelimiterViolet',
    'RainbowDelimiterCyan'
  }
}
-- Change the colour of "RainbowDelimiterGreen"
vim.api.nvim_set_hl(0, 'RainbowDelimiterGreen', { fg = '#40a02b' })

-- indent blankline
local highlight = {
  'RainbowRed',
  'RainbowYellow',
  'RainbowBlue',
  'RainbowOrange',
  'RainbowGreen',
  'RainbowViolet',
  'RainbowCyan'
}

local hooks = require('ibl.hooks')
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#ed8796' })
  vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#eed49f' })
  vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#8aadf4' })
  vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#f5a97f' })
  vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#40a02b' })
  vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#c6a0f6' })
  vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#7dc4e4' })
end)

require('ibl').setup { indent = { highlight = highlight } }

require('trim').setup {
  -- if you want to ignore markdown file.
  -- you can specify filetypes.
  ft_blocklist = {
    'markdown'
  },

  -- if you want to remove multiple blank lines
  patterns = {
    [[%s/\(\n\n\)\n\+/\1/]]   -- replace multiple blank lines with a single line
  },

  -- if you want to disable trim on write by default
  trim_on_write = true,

  -- highlight trailing spaces
  highlight = true
}

-- Change default cursor to a line
vim.opt.guicursor = 'i:ver25-iCursor'

-- cspell.nvim
-- local cspell = require('davidmh/cspell.nvim')
-- require("null-ls").setup {
--     sources = {
--         cspell.diagnostics,
--         cspell.code_actions,
--     }
-- }

-- For Ruby development
require('lspconfig').solargraph.setup {}
require('lspconfig').sorbet.setup {}
