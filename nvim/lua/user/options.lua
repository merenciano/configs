
vim.opt.number = true
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
vim.o.breakindent = true
vim.opt.termguicolors = true
vim.opt.syntax = "on"
vim.opt.background = "dark"

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.scrolloff = 10
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.completeopt = 'menuone,noselect'


vim.o.splitright = true
vim.o.splitbelow = true

vim.o.inccommand = 'split'
vim.o.confirm = true

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Diagnostic Config, see :help vim.diagnostic.Opts
vim.diagnostic.config {
    virtual_text = false,
    update_in_insert = true
}

