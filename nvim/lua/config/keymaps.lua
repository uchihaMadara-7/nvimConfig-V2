-- set leader key to space
vim.g.mapleader = " "

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
-- vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
-- vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- vim.keymap.set("n", "x", '"_x')

-- increment/decrement numbers
-- vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
-- vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "close current split" }) -- close current split window

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "go to next tab" }) --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "open current buffer in new tab" }) --  move current buffer to new tab

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "select all" })

-- reselect after indetation
vim.keymap.set("v", ">", ">gv", { desc = "foward indent" })
vim.keymap.set("v", "<", "<gv", { desc = "backward indent" })

-- jump 6 lines up and down with Alt+arrow keys
vim.keymap.set("n", "<M-Down>", "6j", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Up>", "6k", { noremap = true, silent = true })

-- jump to next words quickly
vim.keymap.set("n", "<M-Right>", "W", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Left>", "B", { noremap = true, silent = true })

-- buffer commands
vim.keymap.set("n", "<leader>pb", "<cmd>b#<CR>", { desc = "previous buffer" })
