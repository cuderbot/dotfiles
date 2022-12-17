-- set leader key
vim.g.mapleader = ' '


local km = vim.keymap

--------------------
-- General keymap --
--------------------

km.set('i', 'jk', '<esc>') -- use jk to exit from insert mode
km.set('i', '<C-s>', '<esc>:update<cr>') -- save and exit from insert mode

-- window managment --
km.set('n', '<leader>sv', '<C-w>v') -- split window horizontally
km.set('n', '<leader>sh', '<C-w>s') -- split window vertically
km.set('n', '<leader>sw', ':close<cr>') -- close current split window

-- tab managment --
km.set('n', '<leader>to', ':tabnew<cr>') -- open new tab
km.set('n', '<leader>tw', ':tabclose<cr>') -- close current tab
km.set('n', '<leader>tn', ':tabn<cr>') -- go to next tab
km.set('n', '<leader>tp', ':tabp<cr>') -- got to previous tab

-------------
-- plugins --
-------------

-- vim-maximizer
km.set('n', '<leader>sm', ':MaximizerToggle<cr>')

-- nvim-tree
km.set('n', '<leader>et', ':NvimTreeToggle<cr>') -- toggle file explorer
km.set('n', '<leader>ef', ':NvimTreeFocus<cr>') -- focus file explorer

-- telescope 
km.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>') -- find files within current working directory, respects .gitignore
km.set('n', '<leader>fs', '<cmd>Telescope live_grep<cr>') -- find string in current working directory as you type
km.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>') -- find string under cursor in current working directory
km.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>') -- list open buffers in current neovim instance
km.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>') -- list available help tags
km.set('n', '<leader>fk', '<cmd>Telescope keymaps<cr>') -- list of keymaps available

-- telescope general
km.set('n', '<leader>gc', '<cmd>Telescope colorscheme<cr>') -- change colorscheme in the session
km.set('n', '<leader>gk', '<cmd>Telescope keymaps<cr>') -- show the keymaps

-- telescope git commands
km.set('n', '<leader>gcb', '<cmd>Telescope git_bcommits<cr>') -- list git commits for current file/buffers
km.set('n', '<leader>gb', '<cmd>Telescope git_branches<cr>') -- list git branches
km.set('n', '<leader>gs', '<cmd>Telescope git_status<cr>') -- list current changes per file with diff preview
