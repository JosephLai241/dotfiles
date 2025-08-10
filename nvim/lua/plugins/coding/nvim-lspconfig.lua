return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.enable("cssls")
		vim.lsp.enable("dockerls")
		vim.lsp.enable("docker_compose_language_service")
		vim.lsp.enable("eslint")
		vim.lsp.enable("html")
		vim.lsp.enable("jsonls")
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("marksman")
		vim.lsp.enable("nginx_language_server")
		vim.lsp.enable("pyright")
		vim.lsp.enable("ruff")
		vim.lsp.enable("rust_analyzer")
		vim.lsp.enable("sql-language-server")
		vim.lsp.enable("taplo")
		vim.lsp.enable("tsserver")
	end,
}
