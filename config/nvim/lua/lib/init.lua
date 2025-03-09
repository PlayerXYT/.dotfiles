-- Define remapping functions
function nnoremap(lhs, rhs)
	vim.api.nvim_set_keymap('n', lhs, rhs, { noremap = true, silent = true })
end

function inoremap(lhs, rhs)
	vim.api.nvim_set_keymap('i', lhs, rhs, { noremap = true, silent = true })
end

function vnoremap(lhs, rhs)
	vim.api.nvim_set_keymap('v', lhs, rhs, { noremap = true, silent = true })
end
