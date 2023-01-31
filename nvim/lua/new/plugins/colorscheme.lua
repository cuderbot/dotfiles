return {
  {
    'morhetz/gruvbox',
    enable = false,
  },
  {
    'navarasu/onedark.nvim',
    enable = false,
  },
  {
    'jacoborus/tender.vim',
    enable = false,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    config = function()
      vim.cmd('colorscheme catppuccin-mocha')
      require('catppuccin').setup({
        flavour = 'mocha',
        colour_overrides = {
          mocha = {
            crust = '#00000',
            mantle = '#00000',
            base = '#00000',
          },
        },
      })
    end
  }
}
