-- Lightweight yet powerful formatter plugin for Neovim.
return {
	"stevearc/conform.nvim",
	opts = {
		formatters = {
			sqlfluff = {
				command = "sqlfluff",
				args = { "format", "--dialect", "sqlite", "--disable-progress-bar", "-n", "-" },
			},
		},
		formatters_by_ft = {
			css = { "prettier", stop_after_first = true },
			go = { "gofmt" },
			graphql = { "prettier", stop_after_first = true },
			html = { "prettier", stop_after_first = true },
			javascript = { "prettier", stop_after_first = true },
			json = { "prettier", stop_after_first = true },
			jsonc = { "prettier", stop_after_first = true },
			lua = { "stylua" },
			markdown = { "mdformat" },
			python = { "ruff_format", "isort" },
			rust = { "rustfmt", lsp_format = "fallback" },
			sql = { "sqlfluff" },
			svelte = { "prettier-plugin-svelte" },
			typescript = { "prettier", stop_after_first = true },
			-- Use the "_" filetype to run formatters on filetypes that don't
			-- have other formatters configured.
			["_"] = { "trim_whitespace" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
		log_level = vim.log.levels.DEBUG,
		notify_on_error = true,
		notify_no_formatters = true,
	},
}
