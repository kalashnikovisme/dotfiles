-- bootstrap lazy.nvim, LazyVim and your plugins
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")

-- Disable line wrapping by default
vim.opt.wrap = false

-- Enable relative line numbers like the init.vim configuration
vim.opt.relativenumber = true

