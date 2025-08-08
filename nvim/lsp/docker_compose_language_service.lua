-- Contains setup for docker-compose LSP.

return {
	cmd = { "docker-compose-langserver", "--stdio" },
	filetypes = { "yaml" },
	root_dir = function(fname)
		return vim.fs.root(fname, { "docker-compose.yml", "docker-compose.yaml" })
	end,
}
