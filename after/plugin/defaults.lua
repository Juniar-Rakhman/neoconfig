local api = vim.api
local g = vim.g
local opt = vim.opt

-- Remap leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = ","

opt.backspace = vim.opt.backspace + { "nostop" }-- Don't stop backspace at insert
opt.clipboard = "unnamedplus"-- Connection to the system clipboard
opt.completeopt = { "menuone", "noselect" } -- Options for insert mode completion
opt.copyindent = true -- Copy the previous indentation on autoindenting
opt.cursorline = true -- Highlight the text line of the cursor
opt.expandtab = true -- Enable the use of space in tab
opt.fileencoding = "utf-8" -- File content encoding for the buffer
opt.fillchars = { eob = " " } -- Disable `~` on nonexistent lines
opt.history = 100 -- Number of commands to remember in a history table
opt.ignorecase = true -- Case insensitive searching
opt.laststatus = 3 -- globalstatus
opt.lazyredraw = true -- lazily redraw screen
opt.mouse = "a" -- Enable mouse support
opt.number = true -- Show numberline
opt.preserveindent = true -- Preserve indent structure as much as possible
opt.pumheight = 10 -- Height of the pop up menu
opt.relativenumber = true -- Show relative numberline
opt.scrolloff = 8 -- Number of lines to keep above and below the cursor
opt.shiftwidth = 2 -- Number of space inserted for indentation
opt.showmode = false -- Disable showing modes in command line
opt.sidescrolloff = 8 -- Number of columns to keep at the sides of the cursor
opt.signcolumn = "yes" -- Always show the sign column
opt.smartcase = true -- Case sensitivie searching
opt.splitbelow = true -- Splitting a new window below the current one
opt.splitright = true -- Splitting a new window at the right of the current one
opt.swapfile = false -- Disable use of swapfile for the buffer
opt.tabstop = 2 -- Number of space in a tab
opt.termguicolors = true -- Enable 24-bit RGB color in the TUI
opt.timeoutlen = 300 -- Length of time to wait for a mapped sequence
opt.undofile = true -- Enable persistent undo
opt.updatetime = 300 -- Length of time to wait before triggering the plugin
opt.wrap = false -- Disable wrapping of lines longer than the width of window
opt.writebackup = false -- Disable making a backup before overwriting a file

-- AUTO COMMANDS

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

