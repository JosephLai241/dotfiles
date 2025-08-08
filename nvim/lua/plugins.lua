-- This module contains all plugins that are loaded via the `lazy` package manager.

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- `copilot` - Crazy AI shit.
	"github/copilot.vim",

	-- `format-on-save` - You can figure out what this one does.
	{
		"elentok/format-on-save.nvim",
		config = function()
			local format_on_save = require("format-on-save")
			local formatters = require("format-on-save.formatters")
			local vim_notify = require("format-on-save.error-notifiers.vim-notify")

			format_on_save.setup({
				formatter_by_ft = {
					css = formatters.prettierd,
					html = formatters.prettierd,
					javascript = formatters.prettierd,
					json = formatters.prettierd,
					lua = formatters.lsp,
					markdown = formatters.prettierd,
					python = formatters.black,
					rust = formatters.lsp,
					scss = formatters.lsp,
					sh = formatters.shfmt,
					terraform = formatters.lsp,
					toml = formatters.lsp,
					typescript = formatters.prettierd,
					typescriptreact = formatters.prettierd,
					yaml = formatters.lsp,
				},
				error_notifier = vim_notify,
			})
		end,
		lazy = false
	},

	-- `gruvbox` - A goated theme.
	{
		"ellisonleao/gruvbox.nvim",
		--config = function()
		--vim.cmd("colorscheme gruvbox")
		--end
	},

	-- `indent-blankline.nvim` - Add indentation marks.
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup()
		end,
		lazy = false,
		main = "ibl",
		opts = {
			char = "┊",
		}
	},

	-- `kanagawa.nvim` - A goated theme.
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none"
							}
						}
					}
				},
				overrides = function(colors)
					local theme = colors.theme
					return {
						-- Set more uniform colors for the popup menu.
						Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
						PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
						PmenuSbar = { bg = theme.ui.bg_m1 },
						PmenuThumb = { bg = theme.ui.bg_p2 },

						-- Override configurations for `Telescope`.
						TelescopeTitle = { fg = theme.ui.special, bold = true },
						TelescopePromptNormal = { bg = theme.ui.bg_p1 },
						TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
						TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
						TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
						TelescopePreviewNormal = { bg = theme.ui.bg_dim },
						TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
					}
				end,
			})

			vim.cmd("colorscheme kanagawa")
		end,
		lazy = false,
		priority = 10000
	},

	-- `lualine` - A modern and fast Lua statusline.
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				tabline = {
					lualine_a = { {
						"buffers",
						-- Show the buffer number and filename.
						mode = 4
					} },
					lualine_z = { "tabs" },
				}
			})
		end,
		lazy = false
	},

	-- `nerdcommenter` - Quickly comment out code.
	"preservim/nerdcommenter",

	-- `nord` - A goated theme.
	{
		"shaunsingh/nord.nvim",
		--config = function()
		--vim.cmd("colorscheme nord")
		--end
	},

	-- `nvim-colorizer` - A color preview plugin. So useful for frontend work.
	"norcalli/nvim-colorizer.lua",

	-- `nvim-dap` - Debug Adapter Protocol for Neovim. Required for code debugging.
	"mfussenegger/nvim-dap",

	-- `nvim-lint` - Asynchronous linter plugin complimentary to the built-in LSP.
	"mfussenegger/nvim-lint",

	-- `nvim-tree` - A fast file browser/tree view.
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				actions = {
					open_file = {
						quit_on_open = true
					}
				}
			})

			local nvim_tree_api = require("nvim-tree.api")
			-- Create a new node in the tree (create a new file).
			vim.keymap.set("n", "<leader>C", nvim_tree_api.fs.create, {})
			-- Delete a node from the tree (delete a file).
			vim.keymap.set("n", "<leader>D", nvim_tree_api.fs.remove, {})
			-- Rename a node in the tree (rename file or directory).
			vim.keymap.set("n", "<leader>R", nvim_tree_api.fs.rename, {})
			-- Open a node in the tree in a horizontal split.
			vim.keymap.set("n", "<leader>S", nvim_tree_api.node.open.horizontal, {})
			-- Open a node in the tree in a vertical split.
			vim.keymap.set("n", "<leader>V", nvim_tree_api.node.open.vertical, {})
		end,
		dependencies = {
			-- `nvim-web-devicons` -  Lua fork of `vim-devicons` for Neovim.
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
		priority = 10000,
		version = "*"
	},

	-- `nvim-treesitter` - Code parsing and context.
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			-- `nvim-treesitter-context` - Lightweight alternative to `context.vim`.
			"nvim-treesitter/nvim-treesitter-context",
			-- `nvim-treesitter-textobjects` - Syntax aware text-objects, select,
			-- move, swap, and peek support.
			"nvim-treesitter/nvim-treesitter-textobjects"
		},
		lazy = false,
		priority = 10000
	},

	-- `obsidian.nvim` - Use Obsidian features from within Neovim.
	{
		"epwalsh/obsidian.nvim",
		event = { "VeryLazy" },
		ft = "markdown",
		--lazy = true,
		version = "*"
	},

	-- `peek.nvim` - Markdown preview plugin.
	{
		"toppair/peek.nvim",
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup({
				app = "browser"
			})

			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
		event = { "VeryLazy" },
		keys = {
			-- `<leader>MO` - Open the Markdown preview in a new `webview` window.
			{ "<leader>MO", "<cmd>:PeekOpen<CR>" },
			-- `<leader>MC` - Close the Markdown preview `webview` window.
			{ "<leader>MC", "<cmd>:PeekClose<CR>" }
		}
	},

	-- `telescope` - Fuzzy finder.
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		config = function()
			require("telescope").setup({
				defaults = {
					layout_config = {
						flex = { preview_width = 0.57 },
						horizontal = {
							preview_width = 0.57,
						},
					},
					layout_strategy = "flex",
					preview = {
						mime_hook = function(filepath, bufnr, opts)
							local is_image = function(filepath)
								local image_extensions = { "png", "jpg" } -- Supported image formats
								local split_path = vim.split(filepath:lower(), ".", { plain = true })
								local extension = split_path[#split_path]
								return vim.tbl_contains(image_extensions, extension)
							end
							if is_image(filepath) then
								local term = vim.api.nvim_open_term(bufnr, {})
								local function send_output(_, data, _)
									for _, d in ipairs(data) do
										vim.api.nvim_chan_send(term, d .. "\r\n")
									end
								end
								vim.fn.jobstart(
									{
										"catimg", filepath -- Terminal image viewer command
									},
									{ on_stdout = send_output, stdout_buffered = true, pty = true })
							else
								require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid,
									"Binary cannot be previewed")
							end
						end
					},
				},
			})

			local builtin = require("telescope.builtin")

			-- File pickers.
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

			-- Git pickers.
			vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
			vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
			vim.keymap.set("n", "<leader>gbc", builtin.git_bcommits, {})
			vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
			vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false
	},

	-- `twilight.nvim` - Dim inactive sections of code.
	"folke/twilight.nvim",

	-- `vim-fugitive` - Git integration for Vim.
	"tpope/vim-fugitive",

	-- `vim-gitgutter` - Show Git markers in the sign column.
	"airblade/vim-gitgutter",

	-- `vim-surround` - Quickly surround text with matching opening/closing characters.
	"tpope/vim-surround",

	-- `Zen Mode` - Distraction-free coding.
	{
		"folke/zen-mode.nvim",
		lazy = false,
		opts = {
			window = {
				width = 140
			}
		}
	}
})
