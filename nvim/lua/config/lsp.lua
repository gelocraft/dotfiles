if vim.version.ge(vim.version(), '0.11.0-dev') then
	vim.lsp.config('*', {
		root_markers = { '.git', '.github' },
	})
	vim.lsp.enable({ 'luals', 'gopls' }, vim.g.enable_native_lsp)
end
