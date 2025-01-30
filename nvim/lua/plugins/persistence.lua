return {
	'folke/persistence.nvim',
	init = function()
		local nvim_sessions = vim.fn.stdpath 'state' .. '/sessions/'
		local tmux_sessions = vim.fn.expand '~/.local/share/tmux/resurrect/'

		local tmux_sessions_exists = vim.fn.empty(
			vim.fn.globpath(tmux_sessions, '*')
		) == 0

		local nvim_sessions_exists = vim.fn.empty(
			vim.fn.globpath(nvim_sessions, '*')
		) == 0

		local is_inside_tmux = vim.env.TMUX ~= nil

		if nvim_sessions_exists and tmux_sessions_exists and is_inside_tmux then
			-- Restore neovim sessions
			vim.schedule(function() require('persistence').load() end)
		end
	end,
	config = true,
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
