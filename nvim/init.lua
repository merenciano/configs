
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require('user.options')
require('user.keymaps')
require('user.lsp')
require('user.plugins')
require('user.themes')
require('user.telescope')

