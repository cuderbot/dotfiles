local status, gitsigns = pcall(require, 'gitsigns')
if not status then
  return
end

-- enable/setup gitsigns
gitsigns.setup()
