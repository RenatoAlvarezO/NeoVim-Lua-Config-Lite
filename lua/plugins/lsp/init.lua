return {
  {
      "mason-org/mason-lspconfig.nvim",
      opts = {},
      dependencies = {
          { "mason-org/mason.nvim", opts = {} },
          "neovim/nvim-lspconfig",
      },
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    opts = {},
    build = function()
        vim.cmd.GoInstallDeps()
      end,
  },
}
