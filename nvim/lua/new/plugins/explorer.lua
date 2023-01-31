return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  },
  keys = {
    { '<leader>et', ":NvimTreeToggle<cr>", },
    { '<leader>ef', ':NvimTreeFocus<cr>', }
  },
  config = function()
    require('nvim-tree').setup()
  end
}
