return {
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
