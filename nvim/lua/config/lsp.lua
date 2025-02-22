if vim.version.ge(vim.version(), '0.11.0-dev') then
	vim.lsp.config('*', {
		root_markers = {
			'.git',
			'.github',
			'.editorconfig',
		},
	})
	vim.lsp.enable({
		'luals',
		'gopls',
		'terraformls',
	}, vim.g.enable_native_lsp)
end
