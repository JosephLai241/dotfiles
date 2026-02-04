-- This module contains all custom keybindings.

-- `<leader>bdo` - Delete all buffers except for the current one.
vim.keymap.set("n", "<leader>bdo", "<cmd>%bd|e#|bd#<CR>")

-- `<leader>col` - Run the `:ColorizerToggle` command to toggle color previews.
vim.keymap.set("n", "<leader>col", "<cmd>ColorizerToggle<CR>")

-- `<leader>L` - Run the `:Lazy` command to bring up the Lazy plugin manager UI.
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<CR>")

-- `<leader>T` - Run the `:NvimTreeToggle` command to toggle the tree view pane.
vim.keymap.set("n", "<leader>T", "<cmd>NvimTreeToggle<CR>")

-- `<leader>Z` - Run the `:ZenMode` command to toggle ZenMode.
vim.keymap.set("n", "<leader>Z", "<cmd>ZenMode<CR>")

-- Override default keybindings for LSP functionality.
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]g", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
