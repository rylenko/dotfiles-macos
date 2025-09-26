return {
	'olivercederborg/poimandres.nvim',
	lazy = false,
	priority = 1000,
	config = function()
		require("poimandres").setup({
			disable_background = true,
			disable_float_background = true,
			disable_italics = false,
		})
	end,
	init = function()
		vim.cmd.colorscheme "poimandres"
		vim.opt.nu = true
		vim.opt.termguicolors = true
		vim.o.guicursor = "a:ver25"
	end,
}
