-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "solarized_osaka",

	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}

-- Set our shell depending on OS
if vim.loop.os_uname().sysname == "Windows_NT" then
  -- https://www.reddit.com/r/neovim/comments/pc7in0/detect_os_in_lua/
  vim.o.shell = "pwsh.exe"
  vim.o.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[\'Out-File:Encoding\']=\'utf8\';"
  vim.o.shellredir = '2>&1 | %{ "$_" } | Out-File %s; exit $LastExitCode'
  vim.o.shellpipe = '2>&1 | %{ "$_" } | Tee-Object %s; exit $LastExitCode'
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
elseif vim.loop.os_uname().sysname == "Linux" then
  vim.o.shell = "zsh"
end

-- vim settings
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.ai = true
vim.o.si = true
vim.o.wrap = true
vim.cmd('set lbr')

-- Start `insert` mode automatically when entering a terminal buffer
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"term://*"},
  command = "startinsert"
})

-- Don't let auto-session add line numbers to terminals
vim.api.nvim_create_autocmd({"TermOpen"}, {
  command = "setlocal listchars= nonumber norelativenumber"
})

-- Reread file changes from disk
-- From https://unix.stackexchange.com/a/760218
vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
  command = "checktime"
})

vim.api.nvim_create_autocmd({"BufEnter", "FocusGained"}, {
  command = "checktime"
})

return M
