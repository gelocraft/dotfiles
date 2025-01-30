return {
	'folke/persistence.nvim',
	opts = {},
	keys = {
		{
			'<leader>Rs',
			function() require('persistence').load() end,
			desc = 'Restore Session',
		},
		{
			'<leader>Rl',
			function() require('persistence').load { last = true } end,
			desc = 'Restore Last Session',
		},
	},
}
