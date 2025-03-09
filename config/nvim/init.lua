require("lib")

-- Center whenusing j and k
nnoremap("j", "jzz")
nnoremap("k", "kzz")
vnoremap("j", "jzz")
vnoremap("k", "kzz")

-- Basic setup
vim.o.number = true
vim.o.relativenumber = true
vim.o.clipboard = 'unnamedplus'
vim.o.ignorecase = true
vim.o.history = 25
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.cmd("colorscheme vim")
vim.cmd("set notermguicolors")
vim.cmd("hi EndOfBuffer ctermfg=black")

-- Remove auto comment
vim.opt.formatoptions:remove("c")
vim.opt.formatoptions:remove("r")
vim.opt.formatoptions:remove("o")

-- Define Cb type
vim.filetype.add({
	extension = {
		cb = 'cb'
	}
})
