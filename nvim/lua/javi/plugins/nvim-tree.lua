local status, nvimtree = pcall(require, 'nvim-tree')
if not status then
  print('ERROR: no se encontro nvim-tree')
  return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- configure nvim-tree
nvimtree.setup({
  open_on_setup = true,
})

