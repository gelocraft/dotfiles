return {
	'stevearc/oil.nvim',
	enabled = vim.g.file_explorer == 'oil.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	cmd = { 'Oil' },
	keys = { { '<leader>e', '<cmd>Oil<cr>', desc = 'File Explorer' } },
	opts = {
		view_options = { show_hidden = true },
		default_file_explorer = false,
		use_default_keymaps = false,
		keymaps = {
			['?'] = 'actions.show_help',
			['q'] = 'actions.close',
			['-'] = 'actions.parent',
			['_'] = 'actions.open_cwd',
			['<cr>'] = 'actions.select',
		},
	},
}
