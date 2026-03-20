-- This module contains settings for Neovim's built-in LSP (Neovim v0.11+).

-- Set up Neovim diagnostics
-- See all options: https://neovim.io/doc/user/diagnostic.html#vim.diagnostic.Opts
-- See blog post: https://gpanders.com/blog/whats-new-in-neovim-0-11/#diagnostics
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ", -- nf-md-close_circle
			[vim.diagnostic.severity.WARN] = "󰀪 ", -- nf-md-alert
			[vim.diagnostic.severity.INFO] = "󰋽 ", -- nf-md-information
			[vim.diagnostic.severity.HINT] = "󰌶 ", -- nf-md-lightbulb
		},
		-- Highlight the line number itself
		numhl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
			[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
			[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
			[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
		},
	},
})
