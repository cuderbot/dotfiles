-- managing & installing lsp servers, linters & formatters
local M = {
  -- managing lsp servers, linters & formatters
	"williamboman/mason.nvim",
	opts = {
		pip = {
			upgrade_pip = true,
		},
		ui = {
			border = "rounded",
		},
	},
	config = function(_, opts)
		require("mason").setup(opts)
		local utils = require("javi.utils")
		local mr = require("mason-registry")
		local packages = utils.mason_packages
		for _, package in ipairs(packages) do
			local p = mr.get_package(package)
			if not p:is_installed() then
				p:install()
			end
		end
	end,
}

return M
