-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Disable line wrapping by default
vim.opt.wrap = false

-- Enable relative line numbers like the init.vim configuration
vim.opt.relativenumber = true

-- Neovim key mappings for Omarchy installation
-- F2: write, F3: quit, F4: write and quit

-- Map F2 to :w in normal and insert modes
vim.keymap.set({'n', 'i'}, '<F2>', '<cmd>w<CR>', {silent = true})

-- Map F3 to :q in normal and insert modes
vim.keymap.set({'n', 'i'}, '<F3>', '<cmd>q<CR>', {silent = true})

-- Map F4 to :wq in normal and insert modes
vim.keymap.set({'n', 'i'}, '<F4>', '<cmd>wq<CR>', {silent = true})
