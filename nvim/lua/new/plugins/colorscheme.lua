return {
  {
    'morhetz/gruvbox',
    lazy = true,
  },
  {
    'navarasu/onedark.nvim',
    config = function()
      vim.cmd('colorscheme onedark')
    end

  },
  {
    'jacoborus/tender.vim',
    lazy = true,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = true,
  }
}
