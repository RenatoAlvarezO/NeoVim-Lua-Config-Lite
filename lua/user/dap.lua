local keymap = vim.api.nvim_set_keymap

keymap("n", "<F5>", ":lua require'dap'.continue()<cr>", {})
keymap("n", "<F10>", ":lua require'dap'.step_over()<cr>", {})
keymap("n", "<F11>", ":lua require'dap'.step_into()<cr>", {})
keymap("n", "<F12>", ":lua require'dap'.step_out()<cr>", {})
keymap("n", "<F6>", ":lua require'dap'.toggle_breakpoint()<cr>", {})


local dap = require('dap')
local dapui = require('dapui')


dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
-- require('dap-go').setup()

--  Handlers 
--  TODO: put in another file

--  Go
dap.configurations.go = {
  {
    type = 'go';
    request = 'launch';
    name = "Launch file";
    program = "${file}";
  },
}

dap.adapters.go = function(callback)
  vim.loop.spawn(
    'dlv',
    { stdio = { nil, 0 },
      args = { "dap", "-l", "127.0.0.1:44334" },
      detached = true
    },
    function()
    end)
  vim.defer_fn(
    function()
      callback(
        {
          type = 'server';
          host = '127.0.0.1';
          port = '44334'
        }
      )
    end
    , 100
  )
end

--  Dart/Flutter
local flutter_sdk_path = "/home/renato/Documentos/Trabajo/2022/FlutterSDK/flutter_2.2.2/bin/"
-- local dart_debugger_dir = path.join(flutter_sdk_path,"cache","dart-code")
dap.adapters.dart = {
    type = "executable",
    command = "/home/renato/Documentos/Trabajo/2022/FlutterSDK/flutter_2.2.2/bin/flutter",
    args = {"debug_adapter"}
  }
  dap.configurations.dart = {
    {
      type = "dart",
      request = "launch",
      name = "Launch Flutter Program",
      program = "${file}",
      cwd = "${workspaceFolder}",
      toolArgs = {"-d", "linux"}
    }
  }
