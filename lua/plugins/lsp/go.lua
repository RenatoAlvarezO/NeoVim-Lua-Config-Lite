local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local opts = {}

local function open_interfaces()
  require("telescope.builtin").lsp_dynamic_workspace_symbols({
    prompt_title = "Implement Go Interface",
    symbols = { "Interface" },
    workspace_symbol = {
      scope = "workspace"
    },
    attach_mappings = function(prompt_bufrn, map)
      local function run_goimpl()
        local entry = action_state.get_selected_entry()
        actions.close(prompt_bufrn)

        if not entry or not entry.symbol_name then
          return
        end

        local iface = entry.symbol_name
        local pkg = vim.fn.fnamemodify(entry.filename, ":h:t")
        vim.cmd(string.format(
          "GoImpl %s.%s",
          pkg,
          iface
        ))
      end
      actions.select_default:replace(run_goimpl)
      return true
    end
  })
end

opts.setup = function()
  vim.keymap.set("n", "<leader>i", function() open_interfaces() end, { desc = "Go interfaces (workspace)" })
end

return opts
