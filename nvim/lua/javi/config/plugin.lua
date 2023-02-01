local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
    spec = {
        { import = "javi.plugins" },
    },
    colorscheme = 'catpuccin',
    checker = { enabled = true, notify = false },
    dev = {
        path = "~/code/plugins"
    },
    install = {
      -- install missing plugins on startup. This doesn't increase startup time.
      missing = true, 
      -- try to load one of these colorschemes when starting an installation during startup
      colorscheme = { 'catppuccin' },
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
