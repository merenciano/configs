
-- Use <Esc> to clear search text
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Use <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
--vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
--vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
--vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
--vim.keymap.set('n', '<leader>Q', vim.diagnostic.setqflist)

-- Create a command `:GitBlameLine` 
vim.api.nvim_create_user_command('GitBlameLine', function()
    local line_number = vim.fn.line('.')
    local filename = vim.api.nvim_buf_get_name(0)
    print(vim.fn.system({ 'git', 'blame', '-L', line_number .. ',+1', filename }))
end, { desc = 'Print the git blame for the current line' })
vim.keymap.set('n', '<leader>gb', ':GitBlameLine<CR>', { desc = 'Print the git blame for the current line' })

