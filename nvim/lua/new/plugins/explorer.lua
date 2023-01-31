return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    -- vs-code icons 
    "nvim-tree/nvim-web-devicons", 
  },
  keys = {
    -- toggle file explorer
    { '<leader>et', ":NvimTreeToggle<cr>", },
    -- focus file explorer
    { '<leader>ef', ':NvimTreeFocus<cr>', }
  },
  config = true, -- this is  equal to function() require('nvim-tree').setup() end 
}
