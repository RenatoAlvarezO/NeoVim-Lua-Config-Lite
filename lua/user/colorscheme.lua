-- Default options:
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})

vim.cmd[[
  " set termguicolors
  " let g:gruvbox_contrast_dark = "hard"
  " let g:gruvbox_bold = 1
  " let g:gruvbox_italic = 1
  " let g:gruvbox_underscore = 1
  " let g:gruvbox_transparent_bg = 1
  set background=dark
  let g:everforest_background="hard"
  let g:everforest_better_performance=1
  let g:everforest_enable_italic = 1
  let g:everforest_transparent_background = 1
  let ayucolor = "mirage"
  " hi! Normal ctermbg=NONE guibg=NONE
  colorscheme catppuccin-mocha  
]]


