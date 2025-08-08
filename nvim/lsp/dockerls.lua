-- Contains setup for Docker LSP.

return {
	cmd = { "docker-langserver", "--stdio" },
	filetypes = { "dockerfile" },
}
