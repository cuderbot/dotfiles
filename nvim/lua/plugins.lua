return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- plugin management

    -- apperative plugins
    use 'hrsh7th/vim-vsnip' -- VSCode(LSP)'s snippet feature
    use 'glepnir/dashboard-nvim' -- Fancy Start Screen
    use 'marko-cerovac/material.nvim' -- Material colorscheme

    -- functional plugins
    use 'neovim/nvim-lspconfig' -- Configs for the Nvim LSP client
    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in language server client.
    use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words.
    use 'hrsh7th/cmp-path' -- nvim-cmp source for filesystem paths.
    use 'hrsh7th/nvim-cmp' -- completion engine
    use 'williamboman/nvim-lsp-installer' -- manage LSP servers
    use 'mfussenegger/nvim-jdtls' -- Extensions for the built-in LSP for eclipse.jdt.ls.
    use 'onsails/lspkind-nvim' -- This tiny plugin adds vscode-like pictograms
    use 'nvim-treesitter/nvim-treesitter' -- better hightlighting syntax
    use 'nvim-treesitter/nvim-treesitter-refactor' -- Refactor modules for nvim-treesitter
    use 'akinsho/nvim-toggleterm.lua' -- persist and toggle multiple terminals
    use 'windwp/nvim-autopairs' -- autocomplete and pair multiple chars
    use 'windwp/nvim-ts-autotag' -- close html tag
    use 'norcalli/nvim-colorizer.lua' -- A high-performance color highlighter
    use 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim' --  toggling the LSP diagnostics
    use 'kdheepak/lazygit.nvim' -- use lazygit in neovim
    use 'terrortylor/nvim-comment' -- Toggle comments in Neovim
    use 'rafamadriz/friendly-snippets' -- Snippets collection for a set of different
    use 'Pocco81/AutoSave.nvim' -- saving your work before the world collapses or you type :qa!
    use {'turbio/bracey.vim', run = 'cd app & npm install --prefix server'} -- plugin for live html, css, and javascript editing in vim
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'} -- Preview markdown on your modern browser
    use 'sbdchd/neoformat' -- for formatting code.
    use {
        'ur4ltz/surround.nvim', -- Provides key mapping to add surrounding characters
        config = function()
            require'surround'.setup {mappings_style = 'surround'}
        end
    }

    use {
        'lewis6991/gitsigns.nvim', -- git decorations
        requires = {
            'nvim-lua/plenary.nvim' -- utility All the lua functions I don't want to write twice.
        }
    }

    use {
        'phaazon/hop.nvim', -- allowing you to jump anywhere in a document with as few keystrokes 
        as = 'hop'
    }

    use {
        'akinsho/nvim-bufferline.lua', -- buffer line (with tabpage integration)
        requires = 'kyazdani42/nvim-web-devicons' -- icons!
    }


    use {
        'hoob3rt/lualine.nvim', --  statusline plugin
        requires = {
            'kyazdani42/nvim-web-devicons', -- icons!
            opt = true
        }
    }

    use {
        'nvim-telescope/telescope.nvim', -- fuzzy finder over list
        requires = {
            'nvim-lua/popup.nvim', -- An implementation of the Popup API from vim in Neovim.
            'nvim-lua/plenary.nvim' -- utility All the lua functions I don't want to write twice.
        }
    }

    use {
        'nvim-telescope/telescope-fzf-native.nvim', -- fzf-native is a c port of fzf
        run = 'make' 
    }

    use {
        'kyazdani42/nvim-tree.lua', -- File Explorer
        requires = 'kyazdani42/nvim-web-devicons', -- icons!
    }

    use_rocks {'lunajson'}

end)
