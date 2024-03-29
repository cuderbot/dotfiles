-- formatting & linting
local M = {
	-- configure formatters & linters
	"jose-elias-alvarez/null-ls.nvim",
	opts = function()
		local null_ls = require("null-ls")

		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		-- local code_actions = null_ls.builtins.code_actions
		-- local completion = null_ls.builtins.completion

		-- to setup format on save
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

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
					condition = function(utils)
						-- change file extension if you use something else
						return utils.root_has_file(".eslintrc.js")
					end,
				}),
			},
			-- configure format on save
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									--  only use null-ls for formatting instead of lsp server
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		}
	end,
}

return M
