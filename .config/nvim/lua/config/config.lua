vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true
vim.opt.incsearch = true
vim.opt.smartindent = true

-- Close quickfix menu after select an item.
vim.api.nvim_create_autocmd("FileType", {
	pattern={"qf"},
	command=[[nnoremap <buffer> <CR> <CR>:cclose<CR>]]
})
