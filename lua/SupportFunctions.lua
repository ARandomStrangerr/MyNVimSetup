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

function wrap(char)
	local pairMap = {
		["("] = ")",
		["["] = "]",
		["{"] = "}",
		["<"] = ">",
		["'"] = "'",
		['"'] = '"'
	}
	local closedChar = pairMap[char];
	if closedChar == nil then
		return;
	end

	local selectedStartPos = vim.fn.getpos("'<");
	local selectedEndPos = vim.fn.getpos("'>");
	local startRow = selectedStartPos[2];
	local startCol = selectedStartPos[3];
	local endRow = selectedEndPos[2];
	local endCol = selectedEndPos[3];

	local buf = vim.api.nvim_get_current_buf();
		
	if startRow == endRow then
		local selectedLines = vim.api.nvim_buf_get_lines(buf, startRow-1, endRow, false)[1];
		local before = selectedLines:sub(1, startCol - 1);
		local selected = selectedLines:sub(startCol, endCol);
		local after = selectedLines:sub(endCol + 1);
		local newLine = before .. char .. selected .. closedChar .. after;
		vim.api.nvim_buf_set_lines(buf, startRow - 1, endRow, false, {newLine});
	else
		local firstLine = vim.api.nvim_buf_get_lines(buf, startRow-1, endRow, false)[1];
		firstLine = firstLine:sub(1,startCol - 1) .. char .. firstLine:sub(startCol);
		local lastLine = vim.api.nvim_buf_get_lines(buf, endRow-1, endRow, false)[1];
		lastLine = lastLine:sub(1,endCol - 1) .. closedChar .. lastLine:sub(endCol);
		vim.api.nvim_buf_set_lines(buf, startRow - 1, startRow, false, {firstLine});
		vim.api.nvim_buf_set_lines(buf, endRow - 1, endRow, false, {lastLine});
	end
end

function tab()
	local selectedStartPos = vim.fn.getpos("'<");
	local selectedEndPos = vim.fn.getpos("'>");
	local startRow = selectedStartPos[2];
	local endRow = selectedEndPos[2];

	local buf = vim.api.nvim_get_current_buf();
	local selectedLines = vim.api.nvim_buf_get_lines(buf, startRow-1, endRow, false);

	for i = 1, #selectedLines do
		selectedLines[i] = "\t" .. selectedLines[i];
	end

	vim.api.nvim_buf_set_lines(buf, startRow-1, endRow, false, selectedLines);
end
