require'lspconfig'.nixd.setup{}
require'lspconfig'.lua_ls.setup{
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
}
