function isNextChar(compareChar)
	local win = vim.api.nvim_get_current_win()
	local row, col = unpack(vim.api.nvim_win_get_cursor(win))
	local bufnr = vim.api.nvim_get_current_buf()
	local lines = vim.api.nvim_buf_get_lines(bufnr, row - 1, row, false)
	if lines[1] and col+1 <= #lines[1] then
		return string.sub(lines[1], col+1, col+1) == compareChar;
	end
	return false;
end

function isPrevChar(compareChar)
	local win = vim.api.nvim_get_current_win()
	local row, col = unpack(vim.api.nvim_win_get_cursor(win))
	local bufnr = vim.api.nvim_get_current_buf()
	local lines = vim.api.nvim_buf_get_lines(bufnr, row - 1, row, false)
	if lines[1] and #lines[1] > 0 then
		return string.sub(lines[1], col, col) == compareChar;
	end
	return false;
end

function enterKeyStroke()
	if vim.fn['coc#pum#visible']() == 1 then
		return vim.fn['coc#pum#confirm']();
	elseif isPrevChar("{") and isNextChar("}") then
		return vim.api.nvim_replace_termcodes('<CR><Up><End><CR>', true, false, true);
	else
		return vim.api.nvim_replace_termcodes('<CR>', true, false, true);
	end
end

function backspaceKeyStroke()
	if isPrevChar("{") and isNextChar("}") or isPrevChar("[") and isNextChar("]") or isPrevChar("(") and isNextChar(")") or isPrevChar("'") and isNextChar("'") or isPrevChar('"') and isNextChar('"') then
		return vim.api.nvim_replace_termcodes('<BS><Del>', true, false, true);
	end
	return vim.api.nvim_replace_termcodes('<BS>', true, false, true);
end

function deleteKeyStroke()
		if isPrevChar("{") and isNextChar("}") or isPrevChar("[") and isNextChar("]") or isPrevChar("(") and isNextChar(")") or isPrevChar("'") and isNextChar("'") or isPrevChar('"') and isNextChar('"') then
		return vim.api.nvim_replace_termcodes('<BS><Del>', true, false, true);
	end
	return vim.api.nvim_replace_termcodes('<Del>', true, false, true)
end

function newLine()
	return vim.api.nvim_replace_termcodes('<End><CR>', true, false, true);
end
