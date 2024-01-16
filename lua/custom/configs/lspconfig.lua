local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
-- local base = require("plugins.configs.lspconfig")
-- local on_attach = base.on_attach
-- local capabilities = base.capabilities
local util = require "lspconfig/util"

capabilities.offsetEncoding = { "utf-16" }
local lspconfig = require "lspconfig"

lspconfig.clangd.setup {
  cmd = {
    "clangd",
    "clang-tidy",
    "--background-index",
    "--cross-file-rename"
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
}

local servers = { "html", "cssls", "tsserver", "clangd" , "pyright", "rust_analyzer"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--
-- lspconfig.pyright.setup { blabla}
