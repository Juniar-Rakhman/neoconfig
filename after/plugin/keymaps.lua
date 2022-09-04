local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Better escape using jk in insert and terminal mode
-- keymap("i", "jk", "<ESC>", default_opts)
-- keymap("t", "jk", "<C-\\><C-n>", default_opts)

-- better bol and eol keys
keymap("", "<S-h>", "^", default_opts)
keymap("", "<S-l>", "$", default_opts)

-- Center search results
keymap("n", "n", "nzz", default_opts)
keymap("n", "N", "Nzz", default_opts)

-- Visual line wraps
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts)
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)

-- Better indent
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dP', default_opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)



-- BUFFER RELATED

-- Switch buffer
keymap("n", "<A-h>", ":bprevious<CR>", default_opts)
keymap("n", "<A-l>", ":bnext<CR>", default_opts)



-- PANES RELATED ---

-- Resizing panes
--
keymap("n", "<C-Left>", ":vertical resize +1<CR>", default_opts)
keymap("n", "<C-Right>", ":vertical resize -1<CR>", default_opts)
keymap("n", "<C-Up>", ":resize -1<CR>", default_opts)
keymap("n", "<C-Down>", ":resize +1<CR>", default_opts)

keymap("n", "<C-h>", "<C-w>h", default_opts)
keymap("n", "<C-j>", "<C-w>j", default_opts)
keymap("n", "<C-k>", "<C-w>k", default_opts)
keymap("n", "<C-l>", "<C-w>l", default_opts)

keymap("n", "<C-o>", ":only<CR>", default_opts)

