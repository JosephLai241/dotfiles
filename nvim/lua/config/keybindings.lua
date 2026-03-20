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

-- LSP keybindings.
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
vim.keymap.set("n", "]g", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics to Loclist" })
vim.keymap.set("n", "<leader>td", vim.lsp.buf.type_definition, { desc = "Type Definition" })
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
