local status, lualine = pcall(require, 'lualine')
if not status then
  print('ERROR: no se encontro lualine')
  return
end

local lualine_theme = require('lualine.themes.gruvbox')

-- configure lualine 
lualine.setup({
  options = {
    theme = lualine_theme
  }
})
