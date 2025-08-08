return {
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
}
