-- Contains setup for Pyright LSP.

return {
	cmd = { "pyright-langserver", "--stdio" },
	root_markers = { "pyproject.toml", "requirements.txt", "setup.py", ".git" },
	filetypes = { "python" },
}
