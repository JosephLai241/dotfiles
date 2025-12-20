return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},
		})
	end,
	dependencies = {
		-- `nvim-treesitter-context` - Lightweight alternative to `context.vim`.
		"nvim-treesitter/nvim-treesitter-context",
		-- `nvim-treesitter-textobjects` - Syntax aware text-objects, select,
		-- move, swap, and peek support.
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	lazy = false,
	priority = 10000,
	tag = "v0.10.0",
}
