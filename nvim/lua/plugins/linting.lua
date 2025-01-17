return {
	'mfussenegger/nvim-lint',
	lazy = vim.fn.argc(-1) == 0,
	event = 'BufReadPost',
	config = function()
		require('lint').linters_by_ft = {
			sh = { 'shellcheck' },
			yaml = { 'yamllint' },
			python = { 'pylint' },
			terraform = { 'tflint' },
			javascript = { 'eslint' },
			typescript = { 'eslint' },
			javascriptreact = { 'eslint' },
			typescriptreact = { 'eslint' },
			['yaml.ansible'] = { 'ansible_lint' },
		}

		-- PerformLinting
		vim.api.nvim_create_autocmd(
			{ 'BufReadPost', 'BufNewFile', 'ModeChanged', 'BufWritePost' },
			{
				group = vim.api.nvim_create_augroup(
					'PerformLinting',
					{ clear = true }
				),
				callback = function()
					require('lint').try_lint(nil, { ignore_errors = true })
				end,
			}
		)
	end,
}
