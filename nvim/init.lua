-- Neovim config

-- Load all Vim command settings.
require("vimcommands")

-- Load all Neovim diagnostics settings.
require("diagnostics")

-- Load all plugins.
require("plugins")

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
