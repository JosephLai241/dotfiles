return {
	"toppair/peek.nvim",
	build = "deno task --quiet build:fast",
	config = function()
		require("peek").setup({
			app = "browser"
		})

		vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
		vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
	end,
	event = { "VeryLazy" },
	keys = {
		-- `<leader>MO` - Open the Markdown preview in a new `webview` window.
		{ "<leader>MO", "<cmd>:PeekOpen<CR>" },
		-- `<leader>MC` - Close the Markdown preview `webview` window.
		{ "<leader>MC", "<cmd>:PeekClose<CR>" }
	}
}
