function getftype()
	local fname = vim.fn.expand("%")
	for i=1, string.len(fname) do
		if string.sub(fname, i, i)=="." then
			fname = string.sub(fname, i+1)
		end
	end
	return fname
end

function nnoremap(lhs, rhs)
	vim.api.nvim_set_keymap('n', lhs, rhs, { noremap = true, silent = true })
end

function inoremap(lhs, rhs)
	vim.api.nvim_set_keymap('i', lhs, rhs, { noremap = true, silent = true })
end

function vnoremap(lhs, rhs)
	vim.api.nvim_set_keymap('v', lhs, rhs, { noremap = true, silent = true })
end
