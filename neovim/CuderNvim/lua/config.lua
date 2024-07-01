local M = {
  name = "gruvbox-baby"
}

local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
if not status_ok then
  return
end
