-- Lightweight yet powerful formatter plugin for Neovim.
return {
	"stevearc/conform.nvim",
	opts = {
		formatters = {
			injected = { options = { ignore_errors = true } },
			sqlfluff = {
				command = "sqlfluff",
				args = { "format", "--dialect", "sqlite", "--disable-progress-bar", "-n", "-" },
			},
		},
		formatters_by_ft = {
			-- enables formatting of embedded code blocks
			["*"] = { "injected" },
			lua = { "stylua" },
			markdown = { "mdformat" },
			python = { "isort", "black" },
			rust = { "rustfmt", lsp_format = "fallback" },
			sql = { "sqlfluff" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
