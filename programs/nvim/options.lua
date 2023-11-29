local g = vim.g
local opt = vim.o

-- disables netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- sets leader to space
g.mapleader = ' '
g.maplocalleader = ' '

-- use system clipboard
opt.clipboard = 'unnamedplus'

opt.number = true

opt.tabstop = 4
opt.shiftwidth = 4

opt.termguicolors = true
