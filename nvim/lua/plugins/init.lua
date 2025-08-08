-- This module recursively walks all sub-directories within the plugins/ directory
-- and creates a master imports table that will be consumed by Lazy.nvim.

-- Get the absolute path to this directory.
local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"

-- This will store { import = "plugins.*.*.lua" } entries.
local imports = {}

-- Recursively walk subdirectories for all .lua files.
for path, _ in vim.fs.dir(plugins_dir, { depth = math.huge }) do
	if path:sub(-4) == ".lua" and not path:match("init.lua$") then
		-- Convert file path to require path: "plugins/foo/bar.lua" -> "plugins.foo.bar".
		local relative = path:gsub("^" .. vim.pesc(plugins_dir) .. "/", "")
		local module = "plugins." .. relative:gsub("%.lua$", ""):gsub("/", ".")

		table.insert(imports, { import = module })
	end
end

return imports
