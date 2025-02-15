local line_ok, feline = pcall(require, 'feline');
local winbar = feline.winbar;

local catppuccin_frappe = {
	bg = "#264653"	
}

winbar.setup({
	theme = catppuccin_frappe,
	disable = {
		filetypes = {"NvimTree"}
	}
});
