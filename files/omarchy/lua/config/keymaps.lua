-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Free up the "s" key for custom usage in normal and visual modes
vim.keymap.del("n", "s")
vim.keymap.del("x", "s")

-- Omarchy-specific function key mappings for saving and quitting
vim.keymap.set({ "n", "i" }, "<F2>", "<cmd>w<CR>", { silent = true, desc = "Save file" })
vim.keymap.set({ "n", "i" }, "<F3>", "<cmd>q<CR>", { silent = true, desc = "Quit" })
vim.keymap.set({ "n", "i" }, "<F4>", "<cmd>wq<CR>", { silent = true, desc = "Save and quit" })
