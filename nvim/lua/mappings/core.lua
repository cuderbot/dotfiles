local keymap = require('utils.keymap')
local opts = keymap.new_opts
local cmd = keymap.cmd

local M = {}

-- Normal mode
M.normal = {
    -- close buffer
    { '<C-w>', cmd('bdelete'), opts(noremap, silent) },
    -- window jump
    { '<C-h>', '<C-w>h', opts(noremap) },
    { '<C-l>', '<C-w>l', opts(noremap) },
    { '<C-j>', '<C-w>j', opts(noremap) },
    { '<C-k>', '<C-w>k', opts(noremap) },
}

-- Insert mode
M.insert = {
}

-- Command mode
M.command = {
}

return M
