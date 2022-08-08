require "user.options"

local status_ok, impatient = pcall(require, "impatient")
if status_ok then
  impatient.enable_profile()
end

require "user.plugins"
require "user.colorscheme"

-- require "user.cmp"
-- require "user.lsp"
require "user.nvim-tree"
require "user.autopairs"
require "user.lualine"
require "user.treesitter"
require "user.gitsigns"
require "user.gitblamer"
require "user.multi-cursor"
require "user.toggleterm"
require "user.outline"
require "user.snippets"
require "user.keymaps"
