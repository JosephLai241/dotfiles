-- Contains setup for Bash LSP.

return {
	cmd = { "bash-language-server", "start" },
	root_markers = { ".git", ".bashrc", ".bash_profile" },
	filetypes = { "sh" },
}
