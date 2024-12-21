return {
	'folke/flash.nvim',
	keys = function()
		return {
			{
				'<leader>s',
				'<cmd>lua require("flash").jump()<cr>',
				desc = 'Flash Jump',
			},
			{
				'<leader>tf',
				'<cmd>lua require("flash").toggle()<cr>',
				desc = 'Flash Toggle',
			},
		}
	end,
	opts = {
		label = { rainbow = { enabled = true } },
		modes = { char = { enabled = false } },
	},
}
