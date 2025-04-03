return {
  -- No config plugins go here
  'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',
  'nvim-tree/nvim-web-devicons',
  'nvimtools/none-ls-extras.nvim',
  'cappyzawa/trim.nvim',
  'Tastyep/structlog.nvim',
  'JoosepAlviste/nvim-ts-context-commentstring',
  'Issafalcon/neotest-dotnet',
  'debugloop/telescope-undo.nvim',
  -- Plugins with configs go here
  {
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    config = function ()
      local nvim_surround = require('nvim-surround')

      nvim_surround.setup {
        keymaps = {
          insert = '<Nop>',
          insert_line = '<Nop>',
          normal = 'gs',
          normal_cur = 'gss',
          normal_line = 'gsS',
          normal_cur_line = 'gsSs',
          visual = 'gss',
          visual_line = 'gsS',
          delete = 'gsd',
          change = 'gsc',
          change_line = 'gsC'
        }
      }
    end
  },
  {
    'aznhe21/actions-preview.nvim',
    config = true
  },
  {
    'numToStr/Comment.nvim',
    config = true
  },
  {
    'nanotee/zoxide.vim',
    init = function() vim.g.zoxide_use_select = 1 end
  },
  { -- Set syntax highlighting for logs
    'fei6409/log-highlight.nvim',
    config = true
  },
  {
    'rmagatti/auto-session',
    lazy = false,
    ---enables autocomplete for opts
    ---@module 'auto-session'
    ---@type AutoSession.Config
    opts = { suppressed_dirs = { '~/', '/' } }
  },
  {
    'antosha417/nvim-lsp-file-operations',
    config = true
  },
  {
    'chrisgrieser/nvim-scissors',
    opts = { snippetDir = '~/MEGA/' }
  },
  {
    'akinsho/toggleterm.nvim',
    config = true
  },
  { -- Needed by neotree
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    config = true
  },
  {
    'catgoose/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = {}
  },
  {
    'luckasRanarison/tailwind-tools.nvim',
    name = 'tailwind-tools',
    build = ':UpdateRemotePlugins',
    opts = {} -- your configuration
  },
  {
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = true,
      -- keymaps = { show_help = '<f1>' }
    },
    -- 👇 if you use `open_for_directories=true`, this is recommended
    init = function()
      -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
      -- vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end
  },
  {
    'soulis-1256/eagle.nvim',
    opts = {
      show_lsp_info = false
    }
  },
  {
    'm-demare/hlargs.nvim',
    config = function()
      -- Will modify later...
      require('hlargs').setup {}
    end
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function ()
      require('ufo').setup {
        provider_selector = function(bufnr, filetype, buftype)
          return { 'treesitter', 'indent' }
        end
      }
    end
  },
  {
    'zbirenbaum/neodim',
    event = 'LspAttach',
    config = function()
      require('neodim').setup {
        hide = {
          underline = true,
          virtual_text = false,
          signs = true
        }
      }
    end
  },
  {
    'AckslD/muren.nvim',
    config = true
  },
  {
    'zeioth/garbage-day.nvim',
    event = 'VeryLazy',
    opts = {} -- For later configuration
  },
  {
    'windwp/nvim-ts-autotag',
    config = function ()
      require('nvim-ts-autotag').setup {}
    end
  },
  {
    'glepnir/nerdicons.nvim',
    cmd = 'NerdIcons',
    config = function()
      require('nerdicons').setup {}
    end
  },
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup {}
    end
  },
  {
    'Wansmer/treesj',
    keys = { '<leader>m', '<leader>j', '<leader>a' },
    config = function()
      require('treesj').setup({})
    end
  },
  {
    'nacro90/numb.nvim',
    config = function()
      require('numb').setup {}
    end
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {}
  },
  {
    'gbprod/substitute.nvim',
    opts = {} -- For configuring later
  },
  -- Configuration for plugins already installed by LazyExtras
  { -- Copied and modified from https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/editor/neo-tree.lua
    'nvim-neo-tree/neo-tree.nvim',
    --- @module 'neo-tree'
    --- @type neotree.Config
    opts = {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        hijack_netrw_behavior = 'open_current',
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false
        }
      }
    }
  },
  {
    'folke/snacks.nvim',
    opts = {
      explorer = { enabled = false }
    }
  },
  {
    'folke/noice.nvim',
    ---@module 'noice'
    ---@type NoiceConfig
    opts = {
      lsp = {
        hover = { silent = true },
        message = { silent = true }
      }
    }
  },
  {
    'neovim/nvim-lspconfig',
    opts = {
      inlay_hints = { enabled = false }
    }
  },
  -- Disabled plugins go here
  {
    'echasnovski/mini.ai',
    enabled = false
  },
  {
    'stevearc/conform.nvim',
    enabled = false
  },
  {
    'mfussenegger/nvim-lint',
    enabled = false
  },
  {
    'mini.icons',
    enabled = false
  },
  {
    'mini.pairs',
    enabled = false
  }
  --- Might use again if needed.
  -- {
  --   'iabdelkareem/csharp.nvim',
  --   config = function()
  --     ROSLYN_LSP = os.getenv('ROSLYN_LSP')
  --
  --     -- Don't even bother loading if ROSLYN_LSP is not set
  --     if ROSLYN_LSP == nil then return end
  --
  --     require('csharp').setup {
  --       lsp = {
  --         omnisharp = { enable = false },
  --         roslyn = {
  --           enable = true,
  --           cmd_path = ROSLYN_LSP .. '/Microsoft.CodeAnalysis.LanguageServer.dll'
  --         }
  --       }
  --     }
  --   end
  -- },
  -- {
  --   'mfussenegger/nvim-lint',
  --   config = function()
  --     require('lint').linters_by_fit = {}
  --   end
  -- },
  -- {
  --   'pmizio/typescript-tools.nvim',
  --   opts = {}
  -- },
  -- {
  --   'mcauley-penney/visual-whitespace.nvim',
  --   version = '>=0.11',
  --   config = true,
  --   opts = { space_char = '·' }
  -- },
  -- {
  --   'kosayoda/nvim-lightbulb',
  --   config = function ()
  --     require('nvim-lightbulb').setup {
  --       autocmd = { enabled = true }
  --     }
  --   end
  -- },
  -- {
  --   'ray-x/navigator.lua',
  --   dependencies = { 'ray-x/guihua.lua' },
  --   config = function ()
  --     require('navigator').setup()
  --   end
  -- },
}
