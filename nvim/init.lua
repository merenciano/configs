
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8' })

vim.call('plug#end')

vim.opt.nu = true
vim.opt.title = true
vim.opt.mouse = "a"
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.softtabstop = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.syntax = "on"

vim.cmd("colorscheme sorbet")

vim.lsp.config("*", {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            },
        },
    },
    root_markers = { ".git" },
})

vim.lsp.enable({ "clangd" })

require('telescope').setup({
  extensions = {
    fzf = {
      fuzzy = true,
    }
  }
})

require('telescope').load_extension('fzf')

