return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		vim.lsp.enable("gopls") 

		local map = vim.keymap.set

		map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
		map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
		map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
		map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
		map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
		map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
		map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
	end,
}
