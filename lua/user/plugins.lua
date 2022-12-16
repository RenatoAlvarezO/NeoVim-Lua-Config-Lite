local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(
  function(use)
    -- Extra Functions
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    -- TreeSitter (Syntax Highligthing)
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    }
    use "norcalli/nvim-colorizer.lua"
    --  MultiCursor
    use "mg979/vim-visual-multi"
    --  Nvim Tree (side tree)
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"
    --  ColorSchemes
    use "rafi/awesome-vim-colorschemes"
    --  AutoPairs
    use "windwp/nvim-autopairs"
    --  Comments
    use "numToStr/Comment.nvim"
    --  Complition
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    --  Snippets
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
    use "L3MON4D3/LuaSnip" --snippet engine
    --  LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/mason-lspconfig.nvim"
    use "williamboman/mason.nvim"
    use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
    --  UI
    use "nvim-lualine/lualine.nvim"
    use "akinsho/toggleterm.nvim"
    use "akinsho/bufferline.nvim"
    --  Git
    use "lewis6991/gitsigns.nvim"
    use "jesseduffield/lazygit"
    use "APZelos/blamer.nvim"
    --  Telescope
    use "nvim-telescope/telescope.nvim"
    -- Outline
    use "simrat39/symbols-outline.nvim"
    --  Flutter
    use "akinsho/flutter-tools.nvim"
    -- use "thosakwe/vim-flutter"
    --  Impatient
    use "lewis6991/impatient.nvim"
    -- Startup 
    use "dstein64/vim-startuptime"
    --  DAP
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use "leoluz/nvim-dap-go"
  end)

