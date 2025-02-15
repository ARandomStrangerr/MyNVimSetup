local line_ok, feline = pcall(require, "feline")
if not line_ok then
	return
end

local catppuccin_frappe = {
	bg = "#363a4f",
	diagnosticWarningsFg = "#f9c74f",
	diagnosticWarningsBg = "",
	diagnosticErrorsFg = "#f94144",
	vimModeBg = "#43aa8b",
	vimModeRightSepFg = "#43aa8b",
	vimModeRightSepBg = "#90be6d",
	fileInfoFg = "#363a4f",
	fileInfoBg = "#90be6d",
	fileInfoRightSepFg = "#90be6d",
	fileInfoRightSepBg = "#f9c74f",
	positionFg = "#363a4f",
	positionBg = "#f9c74f",
	positionRightSepBg = "#363a4f",
	positionRightSepFg = "#f9c74f",
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
				fg = require("feline.providers.vi_mode").get_mode_color(),
				--fg = "#363a4f",
				bg = "vimModeBg",
				style = "bold",
				name = "NeovimModeHLColor",
			}
		end,
		left_sep = "block",
		right_sep =  {
			str = "right_filled",
			hl = {
				fg = "vimModeRightSepFg",
				bg = "vimModeRightSepBg"
			}
		}
	},
	gitBranch = {
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
	},
	separator = {
		provider = "",
	},
	fileInfo = {
		provider = {
			name = "file_info",
			opts = {
				file_icon = true
			}
		},
		hl = {
			fg = "fileInfoFg",
			bg = "fileInfoBg",
			style = "bold"
		},
		icon = {
			hl = {
				fg = "#ece4db",
				bg = "#2ec4b6"
			}
		},
		left_sep = "block",
		right_sep = {
			str = "right_filled",
			hl = {
				fg = "fileInfoRightSepFg",
				bg = "fileInfoRightSepBg"
			}
		}
	},
	diagnostic_errors = {
		provider = function()
			local coc_diagnostics = vim.b.coc_diagnostic_info
			if coc_diagnostics == nil then
				return '0'
			end
			local errors = coc_diagnostics.error or 0
			return string.format('%d', errors)
		end,
		hl = {
			fg = "diagnosticErrorFg",
			style = "bold"
		},
		left_sep = "block",
		right_sep = "block"
	},
	diagnostic_warnings = {
		provider = function()
			local coc_diagnostics = vim.b.coc_diagnostic_info
			if coc_diagnostics == nil then
				return '0'
			end
			local warning = coc_diagnostics.warning or 0
			return string.format('%d', warning)
		end,
		hl = {
			fg = "diagnosticWarningFg",
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
			fg = "fileInfoFg",
			bg = "fileInfoBg",
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
	c.file_type,
	c.fileInfo,
	c.position
}

local middle = {
	c.diagnostic_errors,
	c.diagnostic_warnings
}

local right = {
	c.gitDiffRemoved,
	c.gitDiffChanged,
	c.gitDiffAdded,
	c.gitBranch
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
	theme = catppuccin_frappe,
	vi_mode_colors = vi_mode_colors,
	disable = {
		filetypes = {"NvimTree"}
	}
})
