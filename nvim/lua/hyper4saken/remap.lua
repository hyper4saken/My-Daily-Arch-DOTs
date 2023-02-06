vim.g.mapleader = " "

local keymap = vim.keymap --for conciseness

-- general keymaps for insert mode
keymap.set("i", "jk", "<ESC>") 
keymap.set("i", "<C-b>", "<ESC>^i") -- begining of line
keymap.set("i", "<C-e>", "<END>") --end of line

-- Cursor movement in insert mode
keymap.set("i", "<C-h>", "<Left>") -- move left 
keymap.set("i", "<C-l>", "<Right>") -- move right
keymap.set("i", "<C-j>", "<Down>") --  move down
keymap.set("i", "<C-k>", "<Up>") -- move up

-- general keymaps for normal mode
keymap.set("n", "<leader>pv", vim.cmd.Ex)
keymap.set("n", "<leader>nh", ":nohl<CR>") -- clear search
keymap.set("n", "<leader>sf", ":w<CR>") -- save file in normal mode
keymap.set("n", "<leader>wq", ":wq<CR>") --  write and quit nvim
keymap.set("n", "x", '"_x')

-- window split

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically 
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally 
keymap.set("n", "<leader>se", "<C-w>=") -- make split window  equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- make split window  equal width


-- tabs
keymap.set("n", "<leader>to", ":tabnew<CR>") --  open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- plugin keymaps

-- vim-maximizer
keymap.set("n","<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
