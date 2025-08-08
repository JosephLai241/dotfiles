-- This module contains settings for global Vim commands.

-- Make Vim use the indent of the previous line for a newly created line.
vim.opt.autoindent = true
-- Set backspace options.
--   eol    - allow backspacing over line breaks
--   indent - allow backspacing over autoindent
--   start  - allow backspacing over the start of insert
vim.opt.backspace = "eol,indent,start"
-- Display a vertical line at 80 characters.
vim.opt.colorcolumn = "80"
-- Set options for Insert mode completion.
--   menuone  - use the popup menu even when there is only one match
--   noinsert - do not insert any text for a match until the user selects a match from the menu
--   noselect - do not select a match in the menu; force the user to select one
vim.opt.completeopt = "menuone,noinsert,noselect"
-- Set the Nerd Font.
-- vim.opt.setguifont = "Hack Regular Nerd Font Complete 11"
-- Keep the last 1000 commands and search patterns in the history.
vim.opt.history = 1000
-- Highlight matches with the last used search pattern.
vim.opt.hlsearch = true
-- Ignore case when searching for a pattern.
vim.opt.ignorecase = true
-- Display matches for a search pattern while you type.
vim.opt.incsearch = true
-- Disable the mouse.
vim.opt.mouse = ""
-- Display line numbers.
vim.opt.number = true
-- Display relative line numbers.
vim.opt.relativenumber = true
-- Display the current cursor position.
vim.opt.ruler = true
-- Set the number of lines to always keep above or below the cursor when scrolling, kind of like padding.
vim.opt.scrolloff = 8
-- Set this option so that the line number will display along with Git changes.
vim.opt.signcolumn = "yes"
-- Search case is smart (will search for exact match if capital letters are present).
--   NOTE: ONLY WORKS IF `ignorecase` IS SET.
vim.opt.smartcase = true
-- Set number of space characters inserted after indentation.
vim.opt.shiftwidth = 4
-- Display an incomplete command in the lower right corner.
vim.opt.showcmd = true
-- Display the current mode.
vim.opt.showmode = true
-- Set number of spaces in tab while editing.
vim.opt.softtabstop = 4
-- Set tab as four spaces.
vim.opt.tabstop = 4
-- Set terminal colors.
vim.opt.termguicolors = true
-- Set a shorter update time to write the swap file to disk. This improves the
-- responsiveness of `vim-gitgutter`'s markers.
vim.opt.updatetime = 50

-- Switch on syntax highlighting.
vim.cmd("syntax on")
-- Turn on filetype detection, using filetype plugin and indent files.
--   plugin - enable loading the plugin files for specific file types.
--     This may be done by creating a configuration file for a file type,
--     ie. "~/.config/nvim/ftplugin/rust.vim" for Rust file types.
--   indent - enable loading the indent file for specific file types.
vim.cmd("filetype plugin indent on")
