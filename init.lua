--import needed files
require ("plugins");
local supportFunctions = require("./SupportFunctions");

-- color scheme
vim.opt.termguicolors = true;
vim.cmd.colorscheme "catppuccin-frappe";

-- configurations
vim.wo.number = true;
vim.opt.tabstop = 2;
vim.opt.shiftwidth = 2;

-- keymaps
vim.keymap.set('n', 't', ':NvimTreeToggle<CR>', {}); -- toggle nvim tree
vim.keymap.set('n', '<C-Right>', ':tabnext<CR>', {}); -- set next tab while in view mode
vim.keymap.set('i', '<C-Right>', ':tabnext<CR>', {}); -- set next tab while in edit mode
vim.keymap.set('n', '<C-Left>', ':tabprevious<CR>', {}); -- set previous tab while in view mode
vim.keymap.set('i', '<C-Left>', ':tabprevious<CR>', {}); -- set previous tab while in edit mode
vim.api.nvim_set_keymap('i', '<Tab>', 'coc#pum#visible() ? coc#pum#confirm() : "<Tab>"', {expr=true, noremap=true, silent=true}); -- tab to confirm auto suggest
vim.api.nvim_set_keymap('i', '<CR>', 'v:lua.enterKeyStroke()', {expr=true, noremap=true, silent=true}); -- handle shortcut for enter key
vim.api.nvim_set_keymap('i', '<BS>', 'v:lua.backspaceKeyStroke()', {expr=true, noremap=true, silent=true}) -- handle shortcut for backspace key
vim.api.nvim_set_keymap('i', '<Del>', 'v:lua.deleteKeyStroke()', {expr=true, noremap=true, silent=true}) -- handle shortcut for delete key
vim.api.nvim_set_keymap('i', '(', '()<Left>', {noremap=true, silent=true}); -- auto complete open and close brace
vim.api.nvim_set_keymap('i', '[', '[]<Left>', {noremap=true, silent=true}); -- auto complete open and close square brace
vim.api.nvim_set_keymap('i', '{', '{}<Left>', {noremap=true, silent=true}); -- auto complete open and close curly brace
vim.api.nvim_set_keymap('i', '"', 'v:lua.isNextChar(\'\"\') ? "<Right>" : \'""<Left>\'', {expr=true, noremap=true, silent=true}); -- auto complete open and close quote
vim.api.nvim_set_keymap('i', "'", "v:lua.isNextChar(\"\'\") ? '<Right>' : \"''<left>\"", {expr=true, noremap=true, silent=true}); -- auto complete open and close single quote
vim.api.nvim_set_keymap('i', ')', "v:lua.isNextChar(')') ? '<Right>' : ')'", {expr=true, noremap=true, silent=true}); -- move out when close brace
vim.api.nvim_set_keymap('i', ']', "v:lua.isNextChar(']') ? '<Right>' : ']'", {expr=true, noremap=true, silent=true}); -- move out when close square brace
vim.api.nvim_set_keymap('i', '}', "v:lua.isNextChar('}') ? '<Right>' : '}'", {expr=true, noremap=true, silent=true}); -- move out when close curly brace
