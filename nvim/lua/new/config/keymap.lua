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

