return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("ibl").setup()
	end,
	lazy = false,
	main = "ibl",
	opts = {
		char = "┊",
	}
}
