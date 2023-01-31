return {
  {
    'morhetz/gruvbox',
    enabled = false,
  },
  {
    'navarasu/onedark.nvim',
    enabled = false,
  },
  {
    'jacoborus/tender.vim',
    enabled = false,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    opts = {
        flavour = 'mocha',
        colour_overrides = {
          mocha = {
            crust = '#00000',
            mantle = '#00000',
            base = '#00000',
          },
        },
    },
    config = function(_, opt)
      local catppuccin = require('catppuccin')
      catppuccin.setup(opt)
      catppuccin.load('mocha')
    end,
  }
}
