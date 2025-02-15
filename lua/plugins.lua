local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use ("wbthomason/packer.nvim") -- Have packer manage itself
	use ({
		'lewis6991/gitsigns.nvim',
		config = function()
			require("gitsigns").setup()
		end
	}) -- provide git sign so that status bar can show git status
	use ({
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup()
		end,
	}) -- install nvim tree
	use({
		"famiu/feline.nvim",
		config = function()
			require("./plugins/felineConfig")
			--require("./plugins/winbarConfig")
		end,
	}) -- install status bar
	use ({
		"nvim-tree/nvim-web-devicons",
		config = function()
			require ("nvim-web-devicons").setup();
		end,
	}) -- install icon packages
	use ({ "catppuccin/nvim", as = "catppuccin-mocha" }) -- install color scheme
	use ({'neoclide/coc.nvim', branch = 'release'}) -- install auto complete

	if PACKER_BOOTSTRAP then
	require("packer").sync()
	end
end)
