vim.g.mapleader = ' '

local km = vim.keymap

-- General keymaps
------------------

km.set("i", "jk", "<ESC>") -- exit from insert mode 
km.set("n", "<leader>nh", ":nohl<CR>") -- clear search highlights
km.set("n", "x", '"_X') -- delete single character without copying into register


-- window managment
-------------------

km.set("n", "<leader>sv", "<C-w>v") -- split window vertically
km.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
km.set("n", "<leader>sx", ":close<CR>") -- close current split window


-- tab managment
----------------

km.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
km.set("n", "<leader>tw", ":tabclose<CR>") -- close current tab
km.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
km.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab


-- plugins
----------

---------------
---nvim-tree---
---------------
km.set("n", "<leader>et", ":NvimTreeToggle<CR>") -- toggle the file explorer
km.set("n", "<leader>ef", ":NvimTreeFocus<CR>") -- focus the file explorer

---------------
---telescope---
---------------
km.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>") -- find files within current workstation directory, respects .gitignore
km.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>") -- find string in current working directory as you type
km.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>") -- find string under cursor in current working directory
km.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>") -- list open buffers in current neovim instance
km.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>") -- list available help tags

-- Telescope git commands
km.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR>") -- list all git commits
km.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<CR>") -- list git commits for current file/buffer
km.set("n", "<leader>gb", "<cmd>Telescope git_branches<CR>") -- list git branches
km.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>") -- list current changes per file with diff preview

