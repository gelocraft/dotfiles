return {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = { '.stylua.toml', 'stylua.toml' },
	settings = {
		Lua = {
			hint = { enable = true },
			telemetry = { enable = false },
			runtime = { version = 'LuaJIT' },
			workspace = {
				maxPreload = 2000,
				preloadFileSize = 2000,
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME .. '/lua',
					'${3rd}/luv/library',
				},
			},
		},
	},
}
