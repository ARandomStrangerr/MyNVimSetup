local line_ok, feline = pcall(require, "feline")
if not line_ok then
	return
end

<<<<<<< HEAD
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
=======
local catppuccin_frappe = {
	bg = "#363a4f",
	diagnosticWarningsFg = "#f9c74f",
	diagnosticWarningsBg = "",
	diagnosticErrorsFg = "#f94144",
	vimModeBg = "#577590",
	vimModeRightSepFg = "#577590",
	vimModeRightSepBg = "#4d908e",
	fileInfoFg = "#363a4f",
	fileInfoBg = "#4d908e",
	fileInfoRightSepFg = "#4d908e",
	fileInfoRightSepBg = "#43aa8b",
	positionFg = "#363a4f",
	positionBg = "#43aa8b",
	positionRightSepBg = "#363a4f",
	positionRightSepFg = "#43aa8b",
	gitBranchFg = "#363a4f",
	gitBranchBg = "#4d908e",
	gitBranchLeftSepBg = "#90be6d",
	gitBranchLeftSepFg = "#4d908e",
	gitDiffAddedFg = "#363a4f",
	gitDiffAddedBg = "#90be6d",
	gitDiffAddedLeftSepFg = "#90be6d",
	gitDiffAddedLeftSepBg = "#f9c74f",
	gitDiffChangedFg = "#363a4f",
	gitDiffChangedBg = "#f9c74f",
	gitDiffChangedLeftSepBg = "#f9844a",
	gitDiffChangedLeftSepFg = "#f9c74f",
	gitDiffRemovedFg = "#363a4f",
	gitDiffRemovedBg = "#f9844a",
	gitDiffRemovedLeftSepBg = "#363a4f",
	gitDiffRemovedLeftSepFg = "#f9844a",
	diagnosticErrorFg = "#f3722c",
	diagnosticWarningFg = "#f9c74f"
}

local vi_mode_colors = {
	NORMAL = "#8ac926",
	INSERT = "#ffca3a",
	VISUAL = "#6a4c93",
	COMMAND = "#ff595e",
	LINES = "orange",
	BLOCK = "dark_red",
	REPLACE = "red",
	OP = "green",
>>>>>>> 1722aaf (update feline)
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
<<<<<<< HEAD
				--fg = require("feline.providers.vi_mode").get_mode_color(),
				fg = "#363a4f",
				bg = "#b7bdf8",
=======
				fg = require("feline.providers.vi_mode").get_mode_color(),
				--fg = "#363a4f",
				bg = "vimModeBg",
>>>>>>> 1722aaf (update feline)
				style = "bold",
				name = "NeovimModeHLColor",
			}
		end,
		left_sep = "block",
		right_sep =  {
			str = "right_filled",
			hl = {
<<<<<<< HEAD
				fg = "#b7bdf8",
				bg = "#f0c6c6"
=======
				fg = "vimModeRightSepFg",
				bg = "vimModeRightSepBg"
>>>>>>> 1722aaf (update feline)
			}
		}
	},
	gitBranch = {
<<<<<<< HEAD
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
=======
		provider = function()
			return "  " .. require("feline.providers.git").git_branch() or "  " .. "NULL";
		end,
		hl = {
			fg = "gitBranchFg",
			bg = "gitBranchBg",
			style = "bold",
		},
		left_sep = {
			str = "left_filled",
			hl = {
				fg = "gitBranchLeftSepFg",
				bg = "gitBranchLeftSepBg"
			}
		},
		right_sep = "block",
	},
	gitDiffAdded = {
		provider = function()
			return "  " .. require("feline.providers.git").git_diff_added() or "  " .. "0";
		end,
		hl = {
			fg = "gitDiffAddedFg",
			bg = "gitDiffAddedBg",
		},
		left_sep = {
			str = "left_filled",
			hl = {
				fg = "gitDiffAddedLeftSepFg",
				bg = "gitDiffAddedLeftSepBg"
			}
		},
		right_sep = "block",
	},
	gitDiffRemoved = {
		provider = function()
			return "  " .. require("feline.providers.git").git_diff_removed() or " '".."0";
		end,
		provider = "git_diff_removed",
		hl = {
			fg = "gitDiffRemovedFg",
			bg = "gitDiffRemovedBg",
		},
		left_sep = {
			str = "left_filled",
			hl = {
				fg = "gitDiffRemovedLeftSepFg",
				bg = "gitDiffRemovedLeftSepBg"
			}
		},
		right_sep = "block",
	},
	gitDiffChanged = {
		provider = function()
			return "  " .. require("feline.providers.git").git_diff_changed() or "  0";
		end,
		hl = {
			fg = "gitDiffChangedFg",
			bg = "gitDiffChangedBg",
		},
		left_sep = {
			str = "left_filled",
			hl = {
				fg = "gitDiffChangedLeftSepFg",
				bg = "gitDiffChangedLeftSepBg"
			}
		},
		right_sep = "block",
>>>>>>> 1722aaf (update feline)
	},
	separator = {
		provider = "",
	},
<<<<<<< HEAD
	fileinfo = {
=======
	fileInfo = {
>>>>>>> 1722aaf (update feline)
		provider = {
			name = "file_info",
			opts = {
				--type = "relative-short"
				type = "base-only"
			},
		},
		hl = {
<<<<<<< HEAD
			fg = "#363a4f",
			bg = "#f0c6c6"
=======
			fg = "fileInfoFg",
			bg = "fileInfoBg"
>>>>>>> 1722aaf (update feline)
		},
		icon = {
			hl = {
				fg = "#363a4f"
			}
		},
		left_sep = "block",
<<<<<<< HEAD
		right_sep = "right_filled",
=======
		right_sep = {
			str = "right_filled",
			hl = {
				fg = "fileInfoRightSepFg",
				bg = "fileInfoRightSepBg"
			}
		}
>>>>>>> 1722aaf (update feline)
	},
	diagnostic_errors = {
		provider = function()
			local coc_diagnostics = vim.b.coc_diagnostic_info
			if coc_diagnostics == nil then
<<<<<<< HEAD
				return ''
=======
				return '0'
>>>>>>> 1722aaf (update feline)
			end
			local errors = coc_diagnostics.error or 0
			return string.format('%d', errors)
		end,
		hl = {
<<<<<<< HEAD
			fg = "red",
=======
			fg = "diagnosticErrorFg",
>>>>>>> 1722aaf (update feline)
			style = "bold"
		},
		left_sep = "block",
		right_sep = "block"
	},
	diagnostic_warnings = {
		provider = function()
			local coc_diagnostics = vim.b.coc_diagnostic_info
			if coc_diagnostics == nil then
<<<<<<< HEAD
				return ''
=======
				return '0'
>>>>>>> 1722aaf (update feline)
			end
			local warning = coc_diagnostics.warning or 0
			return string.format('%d', warning)
		end,
		hl = {
<<<<<<< HEAD
			fg = "yellow",
=======
			fg = "diagnosticWarningFg",
>>>>>>> 1722aaf (update feline)
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
<<<<<<< HEAD
			fg = "green",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
=======
			bg = "positionBg",
			fg = "positionFg",
			style = "bold",
		},
		left_sep = "block",
		right_sep = {
			str = "right_filled",
			hl = {
				bg = "positionRightSepBg",
				fg = "positionRightSepFg"
			}
		}
>>>>>>> 1722aaf (update feline)
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
<<<<<<< HEAD
	c.fileinfo
=======
	c.fileInfo,
	c.position
>>>>>>> 1722aaf (update feline)
}

local middle = {
	c.diagnostic_errors,
	c.diagnostic_warnings
}

local right = {
<<<<<<< HEAD
	c.gitBranch,
	c.gitDiffAdded,
	c.gitDiffChanged,
	c.gitDiffRemoved,
	c.position,
	c.scroll_bar,
=======
	c.gitDiffRemoved,
	c.gitDiffChanged,
	c.gitDiffAdded,
	c.gitBranch
>>>>>>> 1722aaf (update feline)
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
<<<<<<< HEAD
	theme = one_monokai,
=======
	theme = catppuccin_frappe,
>>>>>>> 1722aaf (update feline)
	vi_mode_colors = vi_mode_colors,
	disable = {
		filetypes = {"NvimTree"}
	}
})
