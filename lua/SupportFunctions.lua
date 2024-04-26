function isNextChar(compareChar)
	local win = vim.api.nvim_get_current_win()
	local row, col = unpack(vim.api.nvim_win_get_cursor(win))
	local bufnr = vim.api.nvim_get_current_buf()
	local lines = vim.api.nvim_buf_get_lines(bufnr, row - 1, row, false)
	if lines[1] and col+1 <= #lines[1] then
		return string.sub(lines[1], col+1, col+1) == compareChar;
	else
		return false;
	end
end

