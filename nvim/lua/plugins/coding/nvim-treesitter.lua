return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		-- `nvim-treesitter-context` - Lightweight alternative to `context.vim`.
		"nvim-treesitter/nvim-treesitter-context",
		-- `nvim-treesitter-textobjects` - Syntax aware text-objects, select,
		-- move, swap, and peek support.
		"nvim-treesitter/nvim-treesitter-textobjects"
	},
	lazy = false,
	priority = 10000
}
