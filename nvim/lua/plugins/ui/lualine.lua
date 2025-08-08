return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			tabline = {
				lualine_a = { {
					"buffers",
					-- Show the buffer number and filename.
					mode = 4
				} },
				lualine_z = { "tabs" },
			}
		})
	end,
	lazy = false
}
