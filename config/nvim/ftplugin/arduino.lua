
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
	os.execute("arduino --upload "..vim.fn.expand("%").." > /dev/null")
end, {})

vim.api.nvim_create_user_command("Start", function(opts)
	vim.api.nvim_buf_set_lines(0, 0, 1, false, {"", "void setup() {", "\t", "}", "", "", "void loop() {", "\t", "}"})
end, {})

vim.api.nvim_create_user_command("Import", function(opts)
	vim.api.nvim_buf_set_lines(0, 0, 1, false, {"", "#include <"..opts.args..".h>"})
end, { nargs=1 })

print("Arduino plugin enabled")

