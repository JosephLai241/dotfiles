return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			sh = { "shellcheck" },
			bash = { "shellcheck" },
		}

		-- Default to bash for files without a shebang.
		lint.linters.shellcheck.args = { "--shell=bash", "--format=json", "-" }

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
