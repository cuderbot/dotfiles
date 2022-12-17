-- set colorscheme with protected call
local status, _ = pcall(vim.cmd, 'colorscheme gruvbox')
if not status then
  print('ERROR: no se encontro el colorscheme ;(')
  return
end
