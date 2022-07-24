-- insures packer is installed
local function setup_packer()
    local execute = vim.api.nvim_command
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
        execute('packadd packer.nvim')
    end
end

setup_packer()

-- Setup for packer
require('plugins.startup')

-- Configs of plugins
require('plugins.configs.treesitter')
require('plugins.configs.autopairs')
require('plugins.configs.colour')
require('plugins.configs.toggleTerm')
require('plugins.configs.lualine')
require('plugins.configs.colorizer')
require('plugins.configs.toggle_lsp_diagnostics')
require('plugins.configs.lsp_config.lsp-cmp')
require('plugins.configs.lsp_config.lsp-config')
require('plugins.configs.lsp_config.lsp-installer')
require('plugins.configs.lazygit')
require('plugins.configs.comment')
require('plugins.configs.bufferline')
require('plugins.configs.hop')
require('plugins.configs.gitsigns')
require('plugins.configs.autosave')
require('plugins.configs.dashboard')
require('plugins.configs.nvim-tree')
require('plugins.configs.telescope')
require('plugins.configs.cheatsheet')
