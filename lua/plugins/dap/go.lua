local dap = require("dap")
local dapui = require("dapui")

-- nvim-dap-go setup (uses delve)
require("dap-go").setup({
	dap_configurations = {},
	delve = {
		detached = vim.fn.has("win32") == 0,
	},
})

-- Clear default configurations injected by nvim-dap-go; only launch.json configs will be used.
dap.configurations.go = {}

-- nvim-dap does not process envFile from launch.json.
-- This reads the referenced .env file and merges it into config.env.
local function apply_env_file(configs)
	for _, config in ipairs(configs or {}) do
		if config.envFile then
			local path = config.envFile
				:gsub("${workspaceFolder}", vim.fn.getcwd())
				:gsub("${env:([%w_]+)}", function(v) return os.getenv(v) or "" end)
			if vim.fn.filereadable(path) == 1 then
				config.env = config.env or {}
				for line in io.lines(path) do
					line = vim.trim(line)
					if line ~= "" and not vim.startswith(line, "#") then
						local key, value = line:match("^([^=]+)=(.*)")
						if key then
							value = vim.trim(value or "")
							value = value:match('^"(.*)"$') or value:match("^'(.*)'$") or value
							config.env[vim.trim(key)] = value
						end
					end
				end
			end
			config.envFile = nil
		end
	end
end

-- Load .vscode/launch.json if it exists in the project root.
-- Re-runs on DirChanged so it picks up the right config when switching projects.
local function load_vscode_launch()
	local launch = vim.fn.getcwd() .. "/.vscode/launch.json"
	if vim.fn.filereadable(launch) == 1 then
		require("dap.ext.vscode").load_launchjs(launch, { go = { "go" } })
		apply_env_file(dap.configurations.go)
	end
end

load_vscode_launch()

vim.api.nvim_create_autocmd("DirChanged", {
	callback = load_vscode_launch,
})

-- dapui setup
dapui.setup({
	icons = { expanded = "", collapsed = "", current_frame = "" },
	layouts = {
		{
			elements = {
				{ id = "scopes",      size = 0.4 },
				{ id = "breakpoints", size = 0.2 },
				{ id = "stacks",      size = 0.2 },
				{ id = "watches",     size = 0.2 },
			},
			size = 40,
			position = "left",
		},
		{
			elements = {
				{ id = "repl",    size = 0.5 },
				{ id = "console", size = 0.5 },
			},
			size = 10,
			position = "bottom",
		},
	},
})

-- Breakpoint signs
vim.fn.sign_define("DapBreakpoint",          { text = "●", texthl = "DapBreakpoint",          linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected",  { text = "●", texthl = "DapBreakpointRejected",  linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint",            { text = "◉", texthl = "DapLogPoint",            linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped",             { text = "▶", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" })

vim.api.nvim_set_hl(0, "DapBreakpoint",          { link = "DiagnosticError" })
vim.api.nvim_set_hl(0, "DapBreakpointCondition", { link = "DiagnosticWarn" })
vim.api.nvim_set_hl(0, "DapBreakpointRejected",  { link = "Comment" })
vim.api.nvim_set_hl(0, "DapLogPoint",            { link = "DiagnosticInfo" })
vim.api.nvim_set_hl(0, "DapStopped",             { link = "DiagnosticOk" })
vim.api.nvim_set_hl(0, "DapStoppedLine",         { link = "CursorLine" })

-- Auto open/close dapui with debug sessions
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- Keymaps
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<F5>",       dap.continue,          vim.tbl_extend("force", opts, { desc = "DAP: Continue" }))
keymap("n", "<F10>",      dap.step_over,         vim.tbl_extend("force", opts, { desc = "DAP: Step Over" }))
keymap("n", "<F11>",      dap.step_into,         vim.tbl_extend("force", opts, { desc = "DAP: Step Into" }))
keymap("n", "<F12>",      dap.step_out,          vim.tbl_extend("force", opts, { desc = "DAP: Step Out" }))
keymap("n", "<A-b>", dap.toggle_breakpoint, vim.tbl_extend("force", opts, { desc = "DAP: Toggle Breakpoint" }))
keymap("n", "<leader>dB", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, vim.tbl_extend("force", opts, { desc = "DAP: Conditional Breakpoint" }))
keymap("n", "<leader>du", dapui.toggle,          vim.tbl_extend("force", opts, { desc = "DAP: Toggle UI" }))
keymap("n", "<leader>dr", dap.repl.open,         vim.tbl_extend("force", opts, { desc = "DAP: Open REPL" }))
keymap("n", "<leader>dt", dap.terminate,         vim.tbl_extend("force", opts, { desc = "DAP: Terminate" }))

-- Go-specific: debug test under cursor / last test
keymap("n", "<leader>dgt", function() require("dap-go").debug_test() end,
	vim.tbl_extend("force", opts, { desc = "DAP Go: Debug Test" }))
keymap("n", "<leader>dgl", function() require("dap-go").debug_last_test() end,
	vim.tbl_extend("force", opts, { desc = "DAP Go: Debug Last Test" }))
