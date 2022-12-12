vim.g.mapleader = ' '

local km = vim.keymap

-- General keymaps
------------------

-- exit from insert mode
km.set("i", "jk", "<ESC>")

-- clear search highlights
km.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
km.set("n", "x", '"_X')

-- window managment
-------------------

-- split window vertically
km.set("n", "<leader>sv", "<C-w>v")
-- split window horizontally
km.set("n", "<leader>sh", "<C-w>s")
-- close current split window
km.set("n", "<leader>sx", ":close<CR>")

-- tab managment
----------------

-- open new tab
km.set("n", "<leader>to", ":tabnew<CR>")
-- close current tab
km.set("n", "<leader>tw", ":tabclose<CR>")
-- go to next tab
km.set("n", "<leader>tn", ":tabn<CR>")
-- go to previous tab
km.set("n", "<leader>tp", ":tabp<CR>")

-- plugins
----------

---------------
---nvim-tree---
---------------
-- toggle the file explorer
km.set("n", "<leader>et", ":NvimTreeToggle<CR>")

---------------
---telescope---
---------------
-- find files within current workstation directory, respects .gitignore
km.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
-- find string in current working directory as you type
km.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>")
-- find string under cursor in current working directory
km.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>")
-- list open buffers in current neovim instance
km.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
-- list available help tags
km.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")

-- Telescope git commands
-- list all git commits
km.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR>")
-- list git commits for current file/buffer
km.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<CR>")
-- list git branches
km.set("n", "<leader>gb", "<cmd>Telescope git_branches<CR>")
-- list current changes per file with diff preview
km.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>")
