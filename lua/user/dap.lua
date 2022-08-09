local keymap = vim.api.nvim_set_keymap

keymap("n","<F5>",":lua require'dap'.continue()<cr>",{})
keymap("n","<F10>",":lua require'dap'.step_over()<cr>",{})
keymap("n","<F11>",":lua require'dap'.step_into()<cr>",{})
keymap("n","<F12>",":lua require'dap'.step_out()<cr>",{})
keymap("n","<F6>",":lua require'dap'.toggle_breakpoint()<cr>",{})


dap = require('dap')
dapui = require('dapui')

dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function ()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function ()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function ()
  dapui.close()
end
require('dap-go').setup()
-- require("dapui").setup({ icons = { expanded = "▾", collapsed = "▸" },
--   mappings = {
--     -- Use a table to apply multiple mappings
--     expand = { "<CR>", "<2-LeftMouse>" },
--     open = "o",
--     remove = "d",
--     edit = "e",
--     repl = "r",
--     toggle = "t",
--   },
--   expand_lines = vim.fn.has("nvim-0.7"),
--   layouts = {
--     {
--       elements = {
--         { id = "scopes", size = 0.25 },
--         "breakpoints",
--         "stacks",
--         "watches",
--       },
--       size = 40, -- 40 columns
--       position = "left",
--     },
--     {
--       elements = {
--         "repl",
--         "console",
--       },
--       size = 0.25, -- 25% of total lines
--       position = "bottom",
--     },
--   },
--   floating = {
--     max_height = nil, -- These can be integers or a float between 0 and 1.
--     max_width = nil, -- Floats will be treated as percentage of your screen.
--     border = "single", -- Border style. Can be "single", "double" or "rounded"
--     mappings = {
--       close = { "q", "<Esc>" },
--     },
--   },
--   windows = { indent = 1 },
--   render = {
--     max_type_length = nil, -- Can be integer or nil.
--   }
-- })
