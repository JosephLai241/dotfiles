-- Contains setup for TypeScript LSP.

return {
	cmd = { "typescript-language-server", "--stdio" },
	root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
	filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
}
