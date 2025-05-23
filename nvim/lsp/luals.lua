return {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = {
		'.stylua.toml',
		'stylua.toml',
		'.luarc.json',
		'.luarc.jsonc',
	},
	settings = {
		Lua = {
			hint = { enable = true },
			hover = { enable = true },
			format = { enable = false },
			telemetry = { enable = false },
			-- completion = { enable = true },
			runtime = { version = 'LuaJIT' },
			workspace = {
				maxPreload = 2000,
				preloadFileSize = 2000,
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME .. '/lua',
					'${3rd}/luv/library',
					'${3rd}/luassert/library',
					'/usr/local/luals/meta/template',
				},
			},
		},
	},
}
