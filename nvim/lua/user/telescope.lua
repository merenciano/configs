
require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
        }
    }
})

require('telescope').load_extension('fzf')

local telebi = require('telescope.builtin')
vim.keymap.set('n', '<leader><leader>', telebi.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', "<leader>ff", telebi.find_files, { desc = "Telescope find files" }) 
vim.keymap.set('n', "<leader>fg", telebi.live_grep, { desc = "Telescope live grep" }) 
vim.keymap.set('n', '<leader>sw', telebi.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sd', telebi.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>fh', telebi.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>sk', telebi.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>ss', telebi.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sr', telebi.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', telebi.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
--vim.keymap.set('n', '<leader>cs', telebi.colorscheme({layout_strategy='vertical',layout_config={width=0.3}}), { desc = 'List colorschemes and aplies them on <CR>' })

vim.keymap.set('n', '<leader>cs', function()
    telebi.colorscheme(require('telescope.themes').get_dropdown {
        layout_config={height = 0.999},
        enable_preview = true,
        previewer = false,
    })
end, { desc = 'Colorscheme selector' })

vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
    telebi.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
    callback = function(event)
        -- Rename the variable under your cursor.
        --  Most Language Servers support renaming across files, etc.
        --map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
        vim.keymap.set('n', 'grn', vim.lsp.buf.rename, { buffer = event.buf, desc = 'LSP: Rename' })

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        --map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
        vim.keymap.set({'n', 'x'}, 'gra', vim.lsp.buf.code_action, { buffer = event.buf, desc = 'LSP: Execute code action' })

        -- Find references for the word under your cursor.
        --map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        vim.keymap.set('n', 'grr', require('telescope.builtin').lsp_references, { buffer = event.buf, desc = 'LSP: Goto references' })

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        --map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        vim.keymap.set('n', 'gri', require('telescope.builtin').lsp_implementations, { buffer = event.buf, desc = 'LSP: Goto implementation' })

        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        --  To jump back, press <C-t>.
        --map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        vim.keymap.set('n', 'grd', require('telescope.builtin').lsp_definitions, { buffer = event.buf, desc = 'LSP: Goto definition' })

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.
        --map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        vim.keymap.set('n', 'grD', vim.lsp.buf.declaration, { buffer = event.buf, desc = 'LSP: Goto declaration' })

        -- Fuzzy find all the symbols in your current document.
        --  Symbols are things like variables, functions, types, etc.
        --map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
        vim.keymap.set('n', 'gO', require('telescope.builtin').lsp_document_symbols, { buffer = event.buf, desc = 'LSP: Grep symbols in file' })

        -- Fuzzy find all the symbols in your current workspace.
        --  Similar to document symbols, except searches over your entire project.
        --map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
        vim.keymap.set('n', 'gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, { buffer = event.buf, desc = 'LSP: Grep symbols in project' })

        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        --map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')
        vim.keymap.set('n', 'grt', require('telescope.builtin').lsp_type_definitions, { buffer = event.buf, desc = 'LSP: Goto type def' })

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client then --and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
                group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
                callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
                end,
            })
        end

        -- The following code creates a keymap to toggle inlay hints in your
        -- code, if the language server you are using supports them
        --
        -- This may be unwanted, since they displace some of your code
        --if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
        if client then
            vim.keymap.set('n', '<leader>th', function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, { buffer = event.buf, desc = 'LSP: toggle inlay hints' })
        end
    end,
})

