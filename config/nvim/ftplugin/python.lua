-- Using:
-- python-lsp-server (Server): https://archlinux.org/packages/extra/any/python-lsp-server
-- flake8 (Error checking): https://archlinux.org/packages/extra/any/flake8
vim.lsp.start({
	name = 'python',
	cmd = {'pylsp'}
})

print("Python plugin enabled")
