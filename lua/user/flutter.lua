-- vim.cmd[[
-- let g:flutter_autoscroll=1
-- let g:flutter_command = "/home/renato/Documentos/Trabajo/2022/FlutterSDK/flutter_2.2.2/bin/flutter"
-- ]]
local flutter = require("flutter-tools")

flutter.setup(
  {
    debugger = {
      enabled = true,
      register_configurations = function(_)
        require("dap").configurations.dart = {
          {
            name = "App",
            request = "launch",
            type = "dart"
          },
          {
            name = "App (profile mode)",
            request = "launch",
            type = "dart",
            flutterMode = "profile"
          },
          {
            name = "App (release mode)",
            request = "launch",
            type = "dart",
            flutterMode = "release"
          }
        }
      end,
    }
  }
)
