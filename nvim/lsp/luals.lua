return {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = { '.stylua.toml', 'stylua.toml' },
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME .. '/lua',
					'${3rd}/luv/library',
				},
			},
		},
	},
}
