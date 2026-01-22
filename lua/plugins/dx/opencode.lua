local Terminal = require("toggleterm.terminal").Terminal
local opencode = Terminal:new({ cmd = "opencode", hidden = true })

function _OPENCODE_TOGGLE()
	opencode:toggle()
end
