
vim.lsp.config("kotlin_language_server", {
  cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/kotlin-language-server") },
  filetypes = { "kotlin" },
  root_markers = { "build.gradle.kts", "build.gradle", "settings.gradle.kts", "settings.gradle" },
})

vim.lsp.enable("kotlin_language_server")
