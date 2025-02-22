return {
	cmd = { 'pyright-langserver', '--stdio' },
	filetypes = { 'python' },
	root_markers = {
		'Pipfile',
		'setup.py',
		'setup.cfg',
		'pyproject.toml',
		'requirements.txt',
		'pyrightconfig.json',
	},
	single_file_support = true,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = 'openFilesOnly',
			},
		},
	},
}
