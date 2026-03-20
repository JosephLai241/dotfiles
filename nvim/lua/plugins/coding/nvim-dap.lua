return {
	"mfussenegger/nvim-dap",
	dependencies = {
		-- Virtual text for variable values inline.
		"theHamsta/nvim-dap-virtual-text",

		-- Auto-install debug adapters via Mason.
		"jay-babu/mason-nvim-dap.nvim",

		-- Language-specific helpers.
		"mfussenegger/nvim-dap-python",
		"leoluz/nvim-dap-go",
	},
	keys = {
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Toggle Breakpoint",
		},
		{
			"<leader>dB",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "Conditional Breakpoint",
		},
		{
			"<leader>dc",
			function()
				require("dap").continue()
			end,
			desc = "Continue",
		},
		{
			"<leader>di",
			function()
				require("dap").step_into()
			end,
			desc = "Step Into",
		},
		{
			"<leader>do",
			function()
				require("dap").step_over()
			end,
			desc = "Step Over",
		},
		{
			"<leader>dO",
			function()
				require("dap").step_out()
			end,
			desc = "Step Out",
		},
		{
			"<leader>dr",
			function()
				require("dap").repl.open()
			end,
			desc = "Open REPL",
		},
		{
			"<leader>dl",
			function()
				require("dap").run_last()
			end,
			desc = "Run Last",
		},
		{
			"<leader>dx",
			function()
				require("dap").terminate()
			end,
			desc = "Terminate",
		},
	},
	config = function()
		local dap = require("dap")

		-- Virtual text (inline variable values).
		require("nvim-dap-virtual-text").setup()

		-- Mason: auto-install debug adapters.
		require("mason-nvim-dap").setup({
			ensure_installed = {
				"python", -- debugpy
				"codelldb", -- Rust / C / C++
				"delve", -- Go
				"js", -- js-debug-adapter (JS/TS)
			},
			automatic_installation = true,
		})

		----------------------------------------------------------------------
		-- Python (debugpy via nvim-dap-python)
		----------------------------------------------------------------------
		local debugpy_path = require("mason-registry").get_package("debugpy"):get_install_path()
		require("dap-python").setup(debugpy_path .. "/venv/bin/python")

		----------------------------------------------------------------------
		-- Rust / C / C++ (codelldb)
		----------------------------------------------------------------------
		-- mason-nvim-dap registers the codelldb adapter automatically.
		-- We only need the launch configurations.
		dap.configurations.rust = {
			{
				name = "Launch (Rust)",
				type = "codelldb",
				request = "launch",
				program = function()
					-- Build first, then ask for the binary.
					vim.fn.jobwait({ vim.fn.jobstart("cargo build") })
					return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		----------------------------------------------------------------------
		-- Go (delve via nvim-dap-go)
		----------------------------------------------------------------------
		require("dap-go").setup()

		----------------------------------------------------------------------
		-- JavaScript / TypeScript (js-debug-adapter)
		----------------------------------------------------------------------
		-- Adapter: pwa-node (Node.js debugging via vscode-js-debug).
		local js_debug_path = require("mason-registry").get_package("js-debug-adapter"):get_install_path()

		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "node",
				args = { js_debug_path .. "/js-debug/src/dapDebugServer.js", "${port}" },
			},
		}

		-- Shared configurations for all JS/TS filetypes.
		local js_ts_configs = {
			{
				name = "Launch File (Node)",
				type = "pwa-node",
				request = "launch",
				program = "${file}",
				cwd = "${workspaceFolder}",
				sourceMaps = true,
			},
			{
				name = "Attach to Process (Node)",
				type = "pwa-node",
				request = "attach",
				processId = require("dap.utils").pick_process,
				cwd = "${workspaceFolder}",
				sourceMaps = true,
			},
		}

		for _, lang in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
			dap.configurations[lang] = js_ts_configs
		end

		----------------------------------------------------------------------
		-- Signs (breakpoint icons)
		----------------------------------------------------------------------
		vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = "◆", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
		)
		vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DapStopped", linehl = "DapStopped", numhl = "" })
	end,
}
