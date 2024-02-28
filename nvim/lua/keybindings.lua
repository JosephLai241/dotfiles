-- This module contains all custom keybindings.

-- `<leader>F` - Run the `:Format` command to format code.
vim.keymap.set("n", "<leader>F", "<cmd>Format<CR>")

-- `<leader>Z` - Run the `:ZenMode` command to toggle ZenMode.
vim.keymap.set("n", "<leader>Z", "<cmd>ZenMode<CR>")

-- `<C-t>` - Run the `:NERDTreeToggle` command to toggle the tree view pane.
vim.keymap.set("n", "<C-t>", "<cmd>NERDTreeToggle<CR>")

-- `<C-L>` - Run the `:Lazy` command to bring up the Lazy plugin manager UI.
vim.keymap.set("n", "<C-L>", "<cmd>Lazy<CR>")
