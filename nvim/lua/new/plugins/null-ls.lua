-- formatting & linting 
local M = {
  -- configure formatters & linters
  'jose-elias-alvarez/null-ls.nvim',
  opts = function ()
    local null_ls = require('null-ls')

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions
    local completion = null_ls.builtins.completion

    return {
      -- setup formatters & linters
      sources = {
        -- js/ts formatter
        formatting.prettier,
        -- lua formatter
        formatting.stylua,
        -- js/ts linter
        diagnostics.eslint_d.with({
          -- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
          condition = function (utils)
            -- change file extension if you use something else
            return utils.root_has_file(".eslintrc.js") 
          end
        })
      }
    }
  end
}


return M
