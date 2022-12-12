-- set colorscheme with protected call
-- in case it isn't installed
local status, _ = pcall(vim.cmd, "colorscheme tender")
if not status then
  print("no se encontro el colorscheme")
  return
end

