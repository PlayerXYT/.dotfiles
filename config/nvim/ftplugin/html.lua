vim.api.nvim_create_user_command("Start", function(opts)
	vim.api.nvim_buf_set_lines(0, 0, 1, false, {"<!DOCTYPE html>", "<html>", "<head>", "<meta charset='UTF-8'>", "<link rel='stylesheet' href='style.css'>", "<title>Title</title>", "</head>", "<body>", "", "<script src='script.js'></script>", "</body>", "</html>"})
end, {})
print("HTML plugin enabled")

