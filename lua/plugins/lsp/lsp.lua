local handler = require("plugins.lsp.handler")

local opts = {
	on_attach = handler.on_attach,
	capabilities = handler.capabilities,
}

vim.lsp.config("*", opts)

require("plugins.lsp.langs.ui5_ls")

handler.setup()
