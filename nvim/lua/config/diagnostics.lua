-- Diagnostic Config
vim.diagnostic.config {
	severity_sort = true,
	float = { border = 'rounded' },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = '󰅚 ',
			[vim.diagnostic.severity.WARN] = '󰀪 ',
			[vim.diagnostic.severity.INFO] = '󰋽 ',
			[vim.diagnostic.severity.HINT] = '󰌶 ',
		},
	},
	virtual_text = {
		source = 'if_many',
		format = function(diagnostic)
			local diagnostic_message = {
				[vim.diagnostic.severity.ERROR] = '󰅚 ' .. diagnostic.message,
				[vim.diagnostic.severity.WARN] = '󰀪 ' .. diagnostic.message,
				[vim.diagnostic.severity.INFO] = '󰋽 ' .. diagnostic.message,
				[vim.diagnostic.severity.HINT] = '󰌶 ' .. diagnostic.message,
			}
			return diagnostic_message[diagnostic.severity]
		end,
	},
}
