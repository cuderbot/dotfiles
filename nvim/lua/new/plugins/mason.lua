-- managing & installing lsp servers, linters & formatters
local M = {
  -- manage lsp servers, linters & formatters
  'williamboman/mason.nvim',
  opts = function ()
    local mason_packages = require('new.utils').mason_packages

    return {
      ensure_installed = mason_packages,
      automatic_installation = true,
		  pip = {
			  upgrade_pip = true,
		  },
		  ui = {
			  border = "rounded",
			  icons = {
				  package_installed = "",
				  package_pending = "‚ûú",
				  package_uninstalled = "‚úó",
			  },
		  },
	  },
  end,
  config = true,
}

return M
