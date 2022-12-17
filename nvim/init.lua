-- basic
require('javi.core.options')
require('javi.core.keymap')
require('javi.core.colorscheme')

-- plugins-manager
require('javi.plugins-setup')

-- plugins
require('javi.plugins.autopairs')
require('javi.plugins.comment')
require('javi.plugins.lualine')
require('javi.plugins.nvim-cmp')
require('javi.plugins.nvim-tree')
require('javi.plugins.telescope')
require('javi.plugins.gitsigns')
require('javi.plugins.treesitter')

-- lsp
require('javi.plugins.lsp.mason')
require('javi.plugins.lsp.lspsaga')
require('javi.plugins.lsp.lspconfig')
require('javi.plugins.lsp.null-ls')
