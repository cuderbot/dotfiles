local keymap = require('utils.keymap')
local coreKM = require('mappings.core')

local nmap, imap, cmap = keymap.nmap, keymap.imap, keymap.cmap

local insert = {unpack(coreKM.insert)}
local normal = {unpack(coreKM.normal)}
local command = {unpack(coreKM.command)}


-- Setting up normal mode keymaps
nmap(normal)

-- Setting up insert mode keymaps
imap(insert)

-- Setting up command mode keymaps
cmap(command)
