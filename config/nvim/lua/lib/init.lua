function getftype()
	local fname = vim.fn.expand("%")
	for i=1, string.len(fname) do
		if string.sub(fname, i, i)=="." then
			fname = string.sub(fname, i+1)
		end
	end
	return fname
end
