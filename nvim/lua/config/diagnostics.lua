-- Diagnostic Config
vim.diagnostic.config {
	severity_sort = true,
	jump = { float = false },
	float = { border = 'rounded', source = 'if_many' },
	underline = { severity = vim.diagnostic.severity.ERROR },
	signs = vim.g.have_nerd_font and {
		text = {
			[vim.diagnostic.severity.ERROR] = '󰅚 ',
			[vim.diagnostic.severity.WARN] = '󰀪 ',
			[vim.diagnostic.severity.INFO] = '󰋽 ',
			[vim.diagnostic.severity.HINT] = '󰌶 ',
		},
	} or {},
	virtual_lines = vim.g.diagnostic.virtual_lines.enabled and {
		current_line = false,
		format = function(diagnostic)
			local diagnostic_message = {
				[vim.diagnostic.severity.ERROR] = '󰅚 ' .. diagnostic.message,
				[vim.diagnostic.severity.WARN] = '󰀪 ' .. diagnostic.message,
				[vim.diagnostic.severity.INFO] = '󰋽 ' .. diagnostic.message,
				[vim.diagnostic.severity.HINT] = '󰌶 ' .. diagnostic.message,
			}
			return diagnostic_message[diagnostic.severity]
		end,
	} or nil,
	virtual_text = vim.g.diagnostic.virtual_text.enabled and {
		source = 'if_many',
		current_line = false,
		spacing = 1,
		format = function(diagnostic)
			local diagnostic_message = {
				[vim.diagnostic.severity.ERROR] = diagnostic.message,
				[vim.diagnostic.severity.WARN] = diagnostic.message,
				[vim.diagnostic.severity.INFO] = diagnostic.message,
				[vim.diagnostic.severity.HINT] = diagnostic.message,
			}
			return diagnostic_message[diagnostic.severity]
		end,
	} or nil,
}
