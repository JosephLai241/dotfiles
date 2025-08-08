-- Contains setup for rust-analyzer LSP.

return {
	cmd = { "rust-analyzer" },
	root_markers = { "Cargo.toml", "Cargo.lock", ".git" },
	filetypes = { "rust" },
}
