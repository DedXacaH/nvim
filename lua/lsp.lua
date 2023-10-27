-- Set up lsp and mason-lspconfig
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['clangd'].setup ({
	capabilities = capabilities
})

require('lspconfig')['lua_ls'].setup({
	capabilities = capabilities
})

require('mason-lspconfig').setup({
	ensure_installed = { 'lua_ls', 'clangd' }
})
