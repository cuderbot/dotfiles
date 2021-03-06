local nvim_lsp = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = { 'pyright', 'arduino_language_server', 'tsserver', 'hls', 'cmake', 'html', 'cssls', 'rust_analyzer',
  'sumneko_lua', 'bashls', 'ccls', 'marksman' }

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
    root_dir = function() return vim.loop.cwd() end
  }
end
