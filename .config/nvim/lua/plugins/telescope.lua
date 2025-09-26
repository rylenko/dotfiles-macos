return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		require("telescope").setup({
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--hidden",
					"--smart-case",
				},
			},
		})

		local builtin = require('telescope.builtin')
		local map = vim.keymap.set

		map(
			'n',
			'ff',
			function()
				builtin.find_files({hidden=true})
			end,
			{ desc = 'Telescope find files' }
		)
		map('n', 'fg', builtin.live_grep, { desc = 'Telescope live grep' })
	end,
}
