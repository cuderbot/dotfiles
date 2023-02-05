return {
	-- note taking and task workflows plugin
	"phaazon/mind.nvim",
	branch = "v2.2",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = { "MindOpenMain", "MindOpenProject" },
	keys = {
		{ "<leader>no", ":MindOpenMain<cr>" },
		{ "<leader>nc", ":MindClose<cr>" },
	},
	config = true,
}
