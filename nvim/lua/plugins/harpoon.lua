return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	keys = function()
		local toggle_list = function()
			require('harpoon').ui:toggle_quick_menu(require('harpoon'):list(), {
				border = 'rounded',
				title_pos = 'center',
				ui_width_ratio = 0.50,
			})
		end
		local add_file = function() require('harpoon'):list():add() end
		local select_file = function(number)
			return function() require('harpoon'):list():select(number) end
		end
		return {
			{ '<leader>ha', add_file, desc = 'Harpoon Add File' },
			{ '<leader>ht', toggle_list, desc = 'Harpoon Toggle List' },
			{ '<A-1>', select_file(1), desc = 'Harpoon Buffer 1' },
			{ '<A-2>', select_file(2), desc = 'Harpoon Buffer 2' },
			{ '<A-3>', select_file(3), desc = 'Harpoon Buffer 3' },
			{ '<A-4>', select_file(4), desc = 'Harpoon Buffer 4' },
			{ '<A-5>', select_file(5), desc = 'Harpoon Buffer 5' },
			{ '<A-6>', select_file(6), desc = 'Harpoon Buffer 6' },
			{ '<A-7>', select_file(7), desc = 'Harpoon Buffer 7' },
			{ '<A-8>', select_file(8), desc = 'Harpoon Buffer 8' },
			{ '<A-9>', select_file(9), desc = 'Harpoon Buffer 9' },
			{ '<A-0>', select_file(10), desc = 'Harpoon Buffer 10' },
		}
	end,
	dependencies = { 'nvim-lua/plenary.nvim' },
}
