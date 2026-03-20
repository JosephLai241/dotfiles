return {
	"epwalsh/obsidian.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = {
		"BufReadPre " .. vim.fn.expand("~") .. "/vaults/**.md",
		"BufNewFile " .. vim.fn.expand("~") .. "/vaults/**.md",
	},
	opts = {
		workspaces = {
			{
				name = "vaults",
				path = "~/vaults",
			},
		},
	},
}
