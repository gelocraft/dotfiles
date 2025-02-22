return {
	'folke/lazydev.nvim',
	enabled = vim.g.lazydev_enabled,
	opts = {
		library = { { path = '${3rd}/luv/library', words = { 'vim%.uv' } } },
	},
	ft = 'lua', -- only load on lua files
}
