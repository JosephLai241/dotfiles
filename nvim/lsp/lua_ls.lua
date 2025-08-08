-- Contains setup for Lua LSP.

return {
	cmd = { "lua-language-server" },
	root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
	filetypes = { "lua" },
}
