local M = {}

-- nvim-dap does not process envFile from launch.json.
-- This reads the referenced .env file and merges it into config.env.
function M.apply_env_file(configs)
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

return M
