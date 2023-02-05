-- set leader key
vim.g.mapleader = " "

local km = vim.keymap

--------------------
-- General keymap --
--------------------

km.set("i", "jk", "<esc>") -- use jk to exit from insert mode
km.set("i", "<C-s>", "<esc>:update<cr>") -- save and exit from insert mode
km.set("n", "<C-s>", ":update<cr>") -- save in normal mode
km.set("i", "<A-j>", "<esc>:m-2<cr>") -- move up 1 line
km.set("i", "<A-j>", ":m-2<cr>") -- move up 1 line
km.set("n", "<A-k>", ":m+<cr>") -- move down 1 line
km.set("i", "<A-k>", "<esc>:m+<cr>") -- move down 1 line

-- window managment --
km.set("n", "<leader>sv", "<C-w>v") -- split window horizontally
km.set("n", "<leader>sh", "<C-w>s") -- split window vertically
km.set("n", "<leader>sw", ":close<cr>") -- close current split window

-- buffer-tab managment --
km.set("n", "<leader>to", ":enew<cr>") -- open new tab
km.set("n", "<leader>tw", ":bd<cr>") -- close current tab
km.set("n", "<leader>tn", ":bn<cr>") -- go to next tab
km.set("n", "<leader>tp", ":bp<cr>") -- got to previous tab
