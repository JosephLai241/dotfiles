return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			actions = {
				open_file = {
					quit_on_open = true
				}
			}
		})

		local nvim_tree_api = require("nvim-tree.api")
		-- Create a new node in the tree (create a new file).
		vim.keymap.set("n", "<leader>C", nvim_tree_api.fs.create, {})
		-- Delete a node from the tree (delete a file).
		vim.keymap.set("n", "<leader>D", nvim_tree_api.fs.remove, {})
		-- Rename a node in the tree (rename file or directory).
		vim.keymap.set("n", "<leader>R", nvim_tree_api.fs.rename, {})
		-- Open a node in the tree in a horizontal split.
		vim.keymap.set("n", "<leader>S", nvim_tree_api.node.open.horizontal, {})
		-- Open a node in the tree in a vertical split.
		vim.keymap.set("n", "<leader>V", nvim_tree_api.node.open.vertical, {})
	end,
	dependencies = {
		-- `nvim-web-devicons` -  Lua fork of `vim-devicons` for Neovim.
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	priority = 10000,
	version = "*"
}
