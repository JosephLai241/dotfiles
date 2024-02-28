-- This module contains all plugins that are loaded via the `lazy` package manager.

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- `format-on-save` - You can figure out what this one does.
	{
		"elentok/format-on-save.nvim",
		config = function()
			local format_on_save = require("format-on-save")
			local formatters = require("format-on-save.formatters")
			local vim_notify = require("format-on-save.error-notifiers.vim-notify")

			format_on_save.setup({
				formatter_by_ft = {
					css = formatters.lsp,
					html = formatters.lsp,
					javascript = formatters.lsp,
					json = formatters.lsp,
					lua = formatters.lsp,
					markdown = formatters.prettierd,
					python = formatters.black,
					rust = formatters.lsp,
					scss = formatters.lsp,
					sh = formatters.shfmt,
					terraform = formatters.lsp,
					typescript = formatters.prettierd,
					typescriptreact = formatters.prettierd,
					yaml = formatters.lsp,
				},
				error_notifier = vim_notify,
			})
		end,
		lazy = false,
	},

	-- `gruvbox` - A goated theme.
	"ellisonleao/gruvbox.nvim",

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
		},
	},

	-- `lsp-zero.nvim` - Configure an IDE-like experience with the least amount
	-- of effort.
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		config = function()
			local lsp_zero = require("lsp-zero")

			lsp_zero.on_attach(function(client, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr })

				-- Muscle memory is a bitch, Remapping cycling through diagnostics
				-- to `[g` and `]g` since that's what CoC used.
				vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)
				vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
			end)

			-- Configure individually installed language servers.
			local lsp_config = require("lspconfig")

			lsp_config.bashls.setup {}
			lsp_config.dockerls.setup {}
			lsp_config.eslint.setup({
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "EslintFixAll",
					})
				end,
			})
			lsp_config.lua_ls.setup {}
			lsp_config.nginx_language_server.setup {}
			lsp_config.pyright.setup {}
			lsp_config.ruff_lsp.setup {}
			lsp_config.rust_analyzer.setup {}
			lsp_config.tsserver.setup {}
			lsp_config.yamlls.setup {}

			-- Configure settings for `nvim-cmp`.
			local cmp = require("cmp")

			cmp.setup({
				-- Autocomplete dropdown menu settings.
				completion = {
					completeopt = "menu,menuone,noinsert"
				},
				mapping = cmp.mapping.preset.insert({
					-- Enable using the Enter key to confirm a selection in addition
					-- to `<C-y>`.
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				}),
				-- Preselect the first item in the autocomplete dropdown.
				preselect = "item",
			})
		end,
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/nvim-cmp" },
			{ "neovim/nvim-lspconfig" },
			{ "L3MON4D3/LuaSnip" },
		}
	},

	-- `lualine` - A modern and fast Lua statusline.
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				tabline = {
					lualine_a = { {
						"buffers",
						mode = 4
					} },
					lualine_z = { "tabs" },
				}
			})
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
	},

	-- `markdown-preview` - Preview Markdown files in a browser.
	{
		"iamcco/markdown-preview.nvim",
		config = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- `mason` - LSP, linters, formatters, etc.
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		lazy = false
	},


	-- `nerdcommenter` - Quickly comment out code.
	"preservim/nerdcommenter",

	-- `nerdtree` - File browser/tree view sidebar.
	{
		"preservim/nerdtree",
		dependencies = { "Xuyuanp/nerdtree-git-plugin" },
		lazy = false
	},

	-- `nord` - A goated theme.
	{
		"shaunsingh/nord.nvim",
		config = function()
			vim.cmd("colorscheme nord")
		end,
		lazy = false,
		priority = 1000,
	},

	-- `nvim-dap` - Debug Adapter Protocol for Neovim. Required for code debugging,.
	"mfussenegger/nvim-dap",

	-- `nvim-lint` - Asynchronous linter plugin complimentary to the built-in LSP.
	"mfussenegger/nvim-lint",

	-- `nvim-treesitter` - Code parsing and context.
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
			"nvim-treesitter/nvim-treesitter-textobjects"
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
							--size = {
							--width = "90%",
							--height = "60%",
							--},
						},
						vertical = {
							preview_width = 0.57,
							--size = {
							--width = "90%",
							--height = "90%",
							--},
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

	-- `vim-fugitive` - Git integration for Vim.
	"tpope/vim-fugitive",

	-- `vim-gitgutter` - Show Git markers in the sign column.
	{
		"airblade/vim-gitgutter",
		config = function()
			vim.api.nvim_set_var("NERDTreeGitStatusIndicatorMapCustom", {
				Modified  = "M",
				Staged    = "A",
				Untracked = "U",
				Renamed   = "R",
				Unmerged  = "═",
				Deleted   = "D",
				Dirty     = "!",
				Ignored   = "I",
				Clean     = "✔︎",
				Unknown   = "?",
			})
		end
	},

	-- `vim-surround` - Quickly surround text with matching opening/closing characters.
	"tpope/vim-surround",

	-- `Zen Mode` - Distraction-free coding.
	{
		"folke/zen-mode.nvim",
		lazy = false
	},

	-- `vim-devicons` - Adds icons to plugins.
	-- NOTE: This plugin has to be loaded last.
	{
		"ryanoasis/vim-devicons",
		lazy = false,
		priority = 100
	}
})
