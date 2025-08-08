-- This module contains settings for Neovim's built-in LSP (Neovim v0.11+).

-- Set up Neovim diagnostics
-- See all options: https://neovim.io/doc/user/diagnostic.html#vim.diagnostic.Opts
-- See blog post: https://gpanders.com/blog/whats-new-in-neovim-0-11/#diagnostics
vim.diagnostic.config({
	virtual_text = true
})
