local lsp_status_ok, lsp_installer = pcall(require, "mason")
if not lsp_status_ok then
    print 'LSP INSTALLER ERROR'
    return
end

local lsp_mason_status_ok, lsp_mason = pcall(require, "mason-lspconfig")
if not lsp_mason_status_ok then
    print 'LSP MASON ERROR'
    return
end

lsp_mason.setup {}

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

lsp_installer.setup();

local my_servers = lsp_mason.get_installed_servers()
for _, value in pairs(my_servers) do
    vim.lsp.config(value, opts)
    -- lspconfig[value].setup(opts)
    -- if value == 'volar' then
    --     local ts_opts = vim.tbl_deep_extend("force", {}, opts)
    --     ts_opts.init_options = {
    --         vue = {
    --             hybridMode = false,
    --         },
    --     }
    --     lspconfig[value].setup(ts_opts)
    -- end
end

require("user.handlers.lsp").setup()
