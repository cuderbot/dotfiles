return {
  {
    -- autoclose parens, brackets, quotes, etc...
    'windwp/nvim-autopairs',
    opts = {
        check_ts = true, -- enable treesitter
        ts_config = {
          -- don't add pairs in lua string treesitter nodes
          lua = { 'string' }, 
          -- don't add pairs in javascript template_strings treesitter nodes 
          javascript = { 'template_string' },
          -- don't check treesitter on java
          java = false, 
        }
    },
    config = function(_, opts)
      local autopairs = require('nvim-autopairs')
      autopairs.setup(opts)
    end
  },
  {
    -- autoclose tags
    'windwp/nvim-ts-autotag',
    dependencies = {
      'nvim-treesitter'
    }
  },
  {
  -- syntax highlighting
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  opts = {
      -- enable syntax highlighting
      highlighting = { enable = true },
      -- enable indentation 
      indent = { enable = true },
      -- enable autotagging (w / nvim-ts-autotag plugin)
      autotag = { enable = true },
      -- ensure these language parser are installed
      ensure_installed = {
        'json',
        'javascript',
        'typescript',
        'tsx',
        'yaml',
        'html',
        'css',
        'markdown',
        'svelte',
        'graphql',
        'bash',
        'lua',  
        'vim',
        'dockerfile',
        'gitignore',
      },
      -- auto install above language parser
      auto_install = true,
    }
  ,
  config = function(_, opts)
    -- configure treesitter
    require('nvim-treesitter.configs').setup(opts)
  end
  }
}
