
vim.lsp.config("ui5_ls", {
  cmd = { "node", "/home/renato/.npm-global/lib/node_modules/@ui5-language-assistant/language-server/lib/src/server.js", "--stdio" },
  filetypes = { "xml" },
  root_markers = { "ui5.yaml", "package.json" },
})


vim.lsp.enable("ui5_ls")
