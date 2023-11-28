-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- vim.g.nvim_tree_icons
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local tree_setup_ok, tree_setup = pcall(require, "nvim-tree-on-attach")

nvim_tree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  on_attach = tree_setup.on_attach,
  open_on_tab = false,
  hijack_cursor = false,
  diagnostics = {
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
    enable = true,
  },
  update_focused_file = {
    enable = true,
    -- update_cwd = true,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  renderer = {
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
      },
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
      }
    },
    highlight_git = true,
    root_folder_modifier = ":t"
  },
  actions = {
    open_file = {
      quit_on_open = false,
      window_picker = {
        enable = false
      }
    }
  },
}
