-- This module contains all custom keybindings.

-- `<leader>bdo` - Delete all buffers except for the current one.
vim.keymap.set("n", "<leader>bdo", "<cmd>%bd|e#|bd#<CR>")

-- `<leader>col` - Run the `:ColorizerToggle` command to toggle color previews.
vim.keymap.set("n", "<leader>col", "<cmd>ColorizerToggle<CR>")

-- `<leader>F` - Run the `:Format` command to format code.
vim.keymap.set("n", "<leader>F", "<cmd>Format<CR>")

-- `<leader>L` - Run the `:Lazy` command to bring up the Lazy plugin manager UI.
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<CR>")

-- `<leader>T` - Run the `:NvimTreeToggle` command to toggle the tree view pane.
vim.keymap.set("n", "<leader>T", "<cmd>NvimTreeToggle<CR>")

-- `<leader>Z` - Run the `:ZenMode` command to toggle ZenMode.
vim.keymap.set("n", "<leader>Z", "<cmd>ZenMode<CR>")
