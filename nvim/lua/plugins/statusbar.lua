return {
	'nvim-lualine/lualine.nvim',
	event = 'VeryLazy',
	opts = {
		options = {
			icons_enabled = true,
			theme = 'auto',
			globalstatus = true,
			section_separators = { left = '', right = '' },
			-- component_separators = { left = '', right = '' },
			-- component_separators = { left = '', right = '' },
			component_separators = { left = '│', right = '│' },
			-- component_separators = { left = '┊', right = '' },
			-- section_separators = { left = '', right = '' },
			-- disabled_filetypes = { 'NvimTree' },
		},
		sections = {
			lualine_a = { { 'mode', separator = { left = '', right = '' } } },
			lualine_b = { 'branch', 'diff', 'diagnostics' },
			lualine_c = {
				'%=',
				{
					function() return vim.version() end,
					color = function()
						local modes = {
							['i'] = 'lualine_b_insert',
							['n'] = 'lualine_b_normal',
							['v'] = 'lualine_b_visual',
							['V'] = 'lualine_b_visual',
							['\x16'] = 'lualine_b_visual',
							['R'] = 'lualine_b_replace',
							['c'] = 'lualine_b_command',
							['t'] = 'lualine_b_terminal',
						}
						return modes[vim.fn.mode()]
					end,
					separator = { left = '', right = '' },
				},
			},
			lualine_x = { 'filetype' },
			lualine_y = { 'progress' },
			lualine_z = {
				{ 'location', separator = { left = '', right = '' } },
			},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {
				'%=',
				{
					'branch',
					color = 'lualine_b_normal',
					separator = { left = '', right = '' },
				},
				{
					'filename',
					color = 'lualine_a_normal',
					separator = { left = '', right = '' },
				},
			},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
	},
}
