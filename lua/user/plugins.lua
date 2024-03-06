local fn = vim.fnp
local cmd = vim.cmd


local plugins = {
  -- Extra Functions
  "nvim-lua/plenary.nvim",

  -- TreeSitter (Syntax Highligthing)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  "norcalli/nvim-colorizer.lua",

  --  MultiCursor
  {
      "mg979/vim-visual-multi",
        init = function()
            vim.g.VM_maps = {
                ["Find Under"] = "<C-d>",
                ["Find Subword Under"] = "<C-d>",
            }
        end
    },

  --  Nvim Tree (side tree,
  "nvim-tree/nvim-web-devicons",
  "nvim-tree/nvim-tree.lua",

  --  ColorSchemes
  "rafi/awesome-vim-colorschemes", 
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  "sainnhe/everforest",

  --  AutoPairs
  "windwp/nvim-autopairs",

  --  Comments
  "numToStr/Comment.nvim",

  --  Complition
  "hrsh7th/nvim-cmp", -- The completion plugin
  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-path", -- path completions
  "hrsh7th/cmp-cmdline", -- cmdline completions

  --  Snippets
  "saadparwaiz1/cmp_luasnip", -- snippet completions
  "hrsh7th/cmp-nvim-lsp",
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use
  "L3MON4D3/LuaSnip", --snippet engine

  --  LSP
  "neovim/nvim-lspconfig", -- enable LSPp
  "williamboman/mason-lspconfig.nvim",
  "williamboman/mason.nvim",
  "antoinemadec/FixCursorHold.nvim", -- This is needed to fix lsp doc highlight

  --  UI
  "nvim-lualine/lualine.nvim",
  "akinsho/toggleterm.nvim",
  "akinsho/bufferline.nvim",

  --  Git
  "lewis6991/gitsigns.nvim",
  "jesseduffield/lazygit",
  "APZelos/blamer.nvim",

  --  Telescope
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-ui-select.nvim",

  -- Outline
  "simrat39/symbols-outline.nvim",

  --  Flutter
  "akinsho/flutter-tools.nvim",

  --  Impatient
  "lewis6991/impatient.nvim",

  -- Startup
  "dstein64/vim-startuptime",

  --  DAP
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap"} },
  "leoluz/nvim-dap-go",
}
require("lazy").setup(plugins)
