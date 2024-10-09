local line_ok, feline = pcall(require, "feline")
if not line_ok then
	return
end

local one_monokai = {
	fg = "#abb2bf",
	bg = "#414559",
	green = "#98c379",
	yellow = "#e5c07b",
	purple = "#c678dd",
	orange = "#d19a66",
	peanut = "#f6d5a4",
	red = "#e06c75",
	aqua = "#61afef",
	darkblue = "#282c34",
	dark_red = "#f75f5f",
}

local vi_mode_colors = {
	NORMAL = "green",
	OP = "green",
	INSERT = "yellow",
	VISUAL = "purple",
	LINES = "orange",
	BLOCK = "dark_red",
	REPLACE = "red",
	COMMAND = "aqua",
}

local c = {
	vim_mode = {
		provider = {
			name = "vi_mode",
			opts = {
				show_mode_name = true,
				-- padding = "center", -- Uncomment for extra padding.
			},
		},
		hl = function()
			return {
				--fg = require("feline.providers.vi_mode").get_mode_color(),
				fg = "#363a4f",
				bg = "#b7bdf8",
				style = "bold",
				name = "NeovimModeHLColor",
			}
		end,
		left_sep = "block",
		right_sep =  {
			str = "right_filled",
			hl = {
				fg = "#b7bdf8",
				bg = "#f0c6c6"
			}
		}
	},
	gitBranch = {
		provider = "git_branch",
		hl = {
			fg = "peanut",
			bg = "darkblue",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffAdded = {
		provider = "git_diff_added",
		hl = {
			fg = "green",
			bg = "darkblue",
		},
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffRemoved = {
		provider = "git_diff_removed",
		hl = {
			fg = "red",
			bg = "darkblue",
		},
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffChanged = {
		provider = "git_diff_changed",
		hl = {
			fg = "fg",
			bg = "darkblue",
		},
		left_sep = "block",
		right_sep = "right_filled",
	},
	separator = {
		provider = "",
	},
	fileinfo = {
		provider = {
			name = "file_info",
			opts = {
				--type = "relative-short"
				type = "base-only"
			},
		},
		hl = {
			fg = "#363a4f",
			bg = "#f0c6c6"
		},
		icon = {
			hl = {
				fg = "#363a4f"
			}
		},
		left_sep = "block",
		right_sep = "right_filled",
	},
	diagnostic_errors = {
		provider = function()
			local coc_diagnostics = vim.b.coc_diagnostic_info
			if coc_diagnostics == nil then
				return ''
			end
			local errors = coc_diagnostics.error or 0
			return string.format('%d', errors)
		end,
		hl = {
			fg = "red",
			style = "bold"
		},
		left_sep = "block",
		right_sep = "block"
	},
	diagnostic_warnings = {
		provider = function()
			local coc_diagnostics = vim.b.coc_diagnostic_info
			if coc_diagnostics == nil then
				return ''
			end
			local warning = coc_diagnostics.warning or 0
			return string.format('%d', warning)
		end,
		hl = {
			fg = "yellow",
			style = "bold"
		},
		left_sep = "block",
		right_sep = "block"
	},
	diagnostic_hints = {
		provider = "diagnostic_hints",
		hl = {
			fg = "aqua",
		},
	},
	diagnostic_info = {
		provider = "diagnostic_info"
	},
	lsp_client_names = {
		provider = "lsp_client_names",
		hl = {
			fg = "purple",
			bg = "darkblue",
			style = "bold",
		},
		left_sep = "left_filled",
		right_sep = "block",
	},
	file_type = {
		provider = {
			name = "file_type",
			opts = {
				filetype_icon = true,
				case = "titlecase",
			},
		},
		hl = {
			fg = "red",
			bg = "darkblue",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	file_encoding = {
		provider = "file_encoding",
		hl = {
			fg = "orange",
			bg = "darkblue",
			style = "italic",
		},
		left_sep = "block",
		right_sep = "block",
	},
	position = {
		provider = "position",
		hl = {
			fg = "green",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	line_percentage = {
		provider = "line_percentage",
		hl = {
			fg = "aqua",
			bg = "darkblue",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	scroll_bar = {
		provider = function()
			local chars = setmetatable({" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",}, { __index = function() return " " end })
			local line_ratio = vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
			local position = math.floor(line_ratio * 100)
			local icon = chars[math.floor(line_ratio * #chars)] .. position
			if position <= 5 then
				icon = " TOP"
			elseif position >= 95 then
				icon = " BOT"
			end
			return icon
		end,
		hl = function()
			local position = math.floor(vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0) * 100)
			local fg
			local style
			if position <= 5 then
				fg = "aqua"
				style = "bold"
			elseif position >= 95 then
				fg = "red"
				style = "bold"
			else
				fg = "purple"
				style = nil
			end
			return {
				fg = fg,
				style = style,
				bg = "bg",
			}
		end,
		left_sep = "block",
		right_sep = "block",
	}
}

local left = {
	c.vim_mode,
	c.fileinfo
}

local middle = {
	c.diagnostic_errors,
	c.diagnostic_warnings
}

local right = {
	c.gitBranch,
	c.gitDiffAdded,
	c.gitDiffChanged,
	c.gitDiffRemoved,
	c.position,
	c.scroll_bar,
}

local components = {
	active = {
		left,
		middle,
		right,
	},
	inactive = {
		left,
		middle,
		right,
	},
}

feline.setup({
	components = components,
	theme = one_monokai,
	vi_mode_colors = vi_mode_colors,
	disable = {
		filetypes = {"NvimTree"}
	}
})
