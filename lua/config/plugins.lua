local fn = vim.fnp
local cmd = vim.cmd

local plugins = {
  { import = "plugins.syntax.init" },
  { import = "plugins.dx.init" },
  { import = "plugins.snippets.init" },
  { import = "plugins.completion.init" },
  { import = "plugins.ui.init" },
  { import = "plugins.lsp.init" },
  { import = "plugins.colorscheme.init" },
}

require("lazy").setup(plugins)

require "plugins.completion.cmp"

require "plugins.ui.nvim-tree"
require "plugins.ui.bufferline"
require "plugins.ui.lualine"

require "plugins.dx.autopairs"
require "plugins.dx.outline"
require "plugins.dx.telescope"
require "plugins.dx.toggleterm"
require "plugins.dx.lazygit"

require "plugins.lsp.lsp"
require "plugins.lsp.go"

require "plugins.colorscheme.gruvbox"
require "plugins.colorscheme.apply"
