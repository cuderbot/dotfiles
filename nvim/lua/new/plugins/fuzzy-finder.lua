return {
  {
    -- fuzzy finder
    'nvim-telescope/telescope.nvim',
    dependencies = {
      -- dependency for better sorting performance
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      -- lua functions that many plugins use
      { 'nvim-lua/plenary.nvim', },
    },
    keys = {
      -- find files within current working directory, respects .gitignore
      { '<leader>ff', '<cmd>Telescope find_files<cr>' }, 
      -- find string in current working directory as you type
      { '<leader>fs', '<cmd>Telescope live_grep<cr>' },
      -- find string under in cursor in current working directory
      { '<leader>fc', '<cmd>Telescope grep_string<cr>' },
      -- list open buffers in current neovim instance
      { '<leader>fb', '<cmd>Telescope buffers<cr>' },
      -- list available help tags
      { '<leader>fh', '<cmd>Telescope help_tags<cr>' },
      -- list available keymaps
      { '<leader>fk', '<cmd>Telescope keymaps<cr>' },
    },
    config = function()
      -- telescope actions
      let actions = require('telescope.actions')
      -- configure telescope
      require('telescope').setup({
        -- configure custom mappings
        defaults = {
          mappings = {
            i = {
              ['<C-k>'] = actions.move_selection_previous, -- move to prev result 
              ['<C-j>'] = actions.move_selection_next, -- move to next result
              ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
            }
          }
        }
      })
      telescope.load_extension("fzf")
    end
  },
}
