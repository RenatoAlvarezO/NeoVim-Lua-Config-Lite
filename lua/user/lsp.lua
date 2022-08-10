local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  print 'LSP CONFIG ERROR'
  return
end

local lsp_status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not lsp_status_ok then
  print 'LSP INSTALLER ERROR'
  return
end

local opts = {
  on_attach = require("user.handlers.lsp").on_attach,
  capabilities = require("user.handlers.lsp").capabilites,
}

local config = {
  signs = {
    active = signs
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
}

lsp_installer.on_server_ready(function(server)

  vim.diagnostic.config(config)

  server:setup(opts)
end)

lspconfig['pasls'].setup{
  on_attach = opts.on_attach,
  capabilities = opts.capabilities
};



require("user.handlers.lsp").setup()
