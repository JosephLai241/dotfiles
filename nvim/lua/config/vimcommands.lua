-- This module contains settings for global Vim options.

-- Display a vertical line at 80 characters.
vim.opt.colorcolumn = "80"
-- Set options for Insert mode completion.
--   menuone  - use the popup menu even when there is only one match
--   noinsert - do not insert any text for a match until the user selects a match from the menu
--   noselect - do not select a match in the menu; force the user to select one
vim.opt.completeopt = "menuone,noinsert,noselect"
-- Enable highlighting of the current line.
vim.opt.cursorline = true
-- Keep the last 1000 commands and search patterns in the history.
vim.opt.history = 1000
-- Ignore case when searching for a pattern.
vim.opt.ignorecase = true
-- Disable the mouse.
vim.opt.mouse = ""
-- Display line numbers.
vim.opt.number = true
-- Display relative line numbers.
vim.opt.relativenumber = true
-- Set the number of lines to always keep above or below the cursor when scrolling.
vim.opt.scrolloff = 8
-- Set this option so that the line number will display along with Git changes.
vim.opt.signcolumn = "yes"
-- Search case is smart (will search for exact match if capital letters are present).
--   NOTE: ONLY WORKS IF `ignorecase` IS SET.
vim.opt.smartcase = true
-- Set number of space characters inserted after indentation.
vim.opt.shiftwidth = 4
-- Display the current mode.
vim.opt.showmode = true
-- Set number of spaces in tab while editing.
vim.opt.softtabstop = 4
-- Set tab as four spaces.
vim.opt.tabstop = 4
-- Set terminal colors.
vim.opt.termguicolors = true
-- Set a shorter update time to write the swap file to disk.
vim.opt.updatetime = 50
