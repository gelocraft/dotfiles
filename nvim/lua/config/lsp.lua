if vim.g.enable_native_lsp then
	vim.lsp.config('*', {
		root_markers = {
			'.git',
			'.github',
			'.editorconfig',
		},
	})
	vim.lsp.enable {
		'luals',
		'gopls',
		'pyright',
		'tsserver',
		'terraformls',
	}
end
