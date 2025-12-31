local opts = {}

opts.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" , level = vim.diagnostic.severity.ERROR},
    { name = "DiagnosticSignWarn", text = "", level = vim.diagnostic.severity.WARN},
    { name = "DiagnosticSignHint", text = "", level = vim.diagnostic.severity.HINT},
    { name = "DiagnosticSignInfo", text = "", level = vim.diagnostic.severity.INFO},
  }

  local config_signs = {
    text = {},
    linehl = {},
    numhl = {}
  }

  for _, sign in ipairs(signs) do
    config_signs.text[sign.level] = sign.text
    config_signs.linehl[sign.level] = sign.name
    config_signs.numhl[sign.level] = ""
  end

  local config = {
    virtual_text = true,
    underline = true,
    signs = {
      active = signs,
      update_in_insert = true,
      underline = true,
      text = config_signs.text,
      numhl = config_signs.numhl,
    }
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded", })
end

local function lsp_highlight_document(client)
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_hightlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]] ,
      false
    )
  end
end


opts.on_attach = function(client, buffer)
  lsp_highlight_document(client)
  vim.lsp.inlay_hint.enable(true, {bufnr = buffer})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp = require "cmp_nvim_lsp"

opts.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return opts
