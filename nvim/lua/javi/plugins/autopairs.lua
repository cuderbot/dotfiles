local M = {
	-- autoclose parens, brackets, quotes, etc...
	"windwp/nvim-autopairs",
	dependencies = {
		{
			"windwp/nvim-ts-autotag",
			dependencies = {
				"nvim-treesitter",
			},
		},
	},
	opts = {
		check_ts = true, -- enable treesitter
		ts_config = {
			-- don't add pairs in lua string treesitter nodes
			lua = { "string" },
			-- don't add pairs in javascript template_strings treesitter nodes
			javascript = { "template_string" },
			-- don't check treesitter on java
			java = false,
		},
	},
	config = true,
}

return M
