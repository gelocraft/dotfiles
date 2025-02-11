return {
	'folke/snacks.nvim',
	event = { 'BufReadPost', 'BufNewFile' },
	lazy = vim.fn.argc(-1) == 0,
	opts = {
		dim = {},
		indent = {},
		quickfile = {},
	},
}
