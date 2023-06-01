require("lib")

vim.o.number = true
vim.o.relativenumber = true
--vim.o.clipboard = 'unnamedplus' Removed, doesn't work, the "custom" clipboard buffer was a bad idea
vim.o.ignorecase = true
vim.o.history = 25
vim.o.splitright = true
vim.o.splitbelow = true

-- Custom command:
-- :four will make a + split
vim.api.nvim_create_user_command("Four", function(opts)
	vim.cmd('vsp')
	vim.cmd('edit .')
	vim.cmd('sp')
	-- I don't know how to add another... 
end, {})

if getftype()=="ino" then
	vim.api.nvim_create_user_command("Verify", function(opts)
		vim.cmd("w")
		local handle = io.popen("arduino --verify "..vim.fn.expand("%")) -- Run the command to verify the code
		local result = handle:read("*a")
		handle:close()
		if string.find(result, "exit status 1") then
			print("Could not verify")
		end
	end, {})

	vim.api.nvim_create_user_command("Upload", function(opts)
		vim.cmd("w")
		os.execute("arduino --upload "..vim.fn.expand("%"))
	end, {})

	vim.api.nvim_create_user_command("Start", function(opts)
		vim.api.nvim_buf_set_lines(0, 0, 1, false, {"", "void setup() {", "\t", "}", "", "", "void loop() {", "\t", "}"})
	end, {})

	vim.api.nvim_create_user_command("Import", function(opts)
		vim.api.nvim_buf_set_lines(0, 0, 1, false, {"", "#include <"..opts.args..".h>"})
	end, { nargs=1 })

	print("Arduino plugin enabled")

elseif getftype()=="java" then
	vim.api.nvim_create_user_command("Import", function(opts)
		print("No importing yet!")
	end, {})
	print("Java plugin enabled")
elseif getftype()=="html" then
	vim.api.nvim_create_user_command("Start", function(opts)
		vim.api.nvim_buf_set_lines(0, 0, 1, false, {"<!DOCTYPE html>", "<html>", "<head>", "<meta charset='UTF-8'>", "<link rel='stylesheet' href='style.css'>", "<title>Title</title>", "</head>", "<body>", "", "<script src='script.js'></script>", "</body>", "</html>"})
	end, {})
	print("HTML plugin enabled")
elseif getftype()=="c" or getftype()=="cpp" then
	vim.api.nvim_create_user_command("Start", function(opts)
		vim.api.nvim_buf_set_lines(0, 0, 1, false, {"", "#include <stdio.h>", "#include <stdlib.h>", "", "int main(int argc, char* argv[]) {", "\t", "\treturn 0;", "}"})
	end, {})
	vim.api.nvim_create_user_command("Import", function(opts)
		vim.api.nvim_buf_set_lines(0, 0, 1, false, {"", "#include <"..opts.args..".h>"})
	end, { nargs=1 })
	print("C plugin enabled")
end

-- test
