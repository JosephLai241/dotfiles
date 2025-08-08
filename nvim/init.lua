-- Neovim config

-- Load all Vim command settings.
require("vimcommands")

-- Load all Neovim diagnostics settings.
require("diagnostics")

-- Load all custom keybindings.
local keybindings = require("keybindings")
-- Then call the `setup_lsp_keymaps()`function to override default keybindings.
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		keybindings.setup_lsp_keymaps(ev.buf)
	end,
})

-- Load all Neovim LSPs.
vim.lsp.enable({
	"cssls",
	"dockerls",
	"docker_compose_language_service",
	"eslint",
	"html",
	"jsonls",
	"lua_ls",
	"marksman",
	"nginx_language_server",
	"pyright",
	"ruff",
	"rust_analyzer",
	"taplo",
	"tsserver",
})

-- Enable auto-completion.
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

-- Load all plugins.
require("plugins")
