local dap = require("dap")
local env = require("plugins.dap.environment")

-- netcoredbg adapter (install via :MasonInstall netcoredbg)
dap.adapters.coreclr = {
	type = "executable",
	command = vim.fn.stdpath("data") .. "/mason/bin/netcoredbg",
	args = { "--interpreter=vscode" },
}

-- Clear default configurations; only launch.json configs will be used.
dap.configurations.cs = {}

-- Load .vscode/launch.json if it exists in the project root.
-- Re-runs on DirChanged so it picks up the right config when switching projects.
local function load_vscode_launch()
	local launch = vim.fn.getcwd() .. "/.vscode/launch.json"
	if vim.fn.filereadable(launch) == 1 then
		require("dap.ext.vscode").load_launchjs(launch, { coreclr = { "cs" } })
		env.apply_env_file(dap.configurations.cs)
	end
end

load_vscode_launch()

vim.api.nvim_create_autocmd("DirChanged", {
	callback = load_vscode_launch,
})
