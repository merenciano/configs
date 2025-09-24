
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('nvim-lua/plenary.nvim')
Plug('nvim-treesitter/nvim-treesitter')
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8' })
Plug('stevearc/oil.nvim')

-- themes
Plug('Mofiqul/adwaita.nvim')
Plug('mellow-theme/mellow.nvim')
Plug('sainnhe/gruvbox-material')
Plug('AlexvZyl/nordic.nvim')
Plug('samharju/serene.nvim')
Plug('phha/zenburn.nvim')
Plug "https://gitlab.com/sxwpb/halfspace.nvim"
Plug('miikanissi/modus-themes.nvim')
Plug('nyoom-engineering/oxocarbon.nvim')
Plug('rockerBOO/boo-colorscheme-nvim')
Plug('shaunsingh/nord.nvim')
Plug('projekt0n/github-nvim-theme')
Plug('savq/melange-nvim')
Plug('kvrohit/substrata.nvim')
Plug('kyazdani42/blue-moon')
Plug('datsfilipe/vesper.nvim')
Plug('rose-pine/neovim')
Plug('kvrohit/rasmus.nvim')
Plug('ramojus/mellifluous.nvim')
Plug('olivercederborg/poimandres.nvim')
Plug('killitar/obscure.nvim')

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

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.scrolloff = 10
vim.o.list = true

vim.g.mapleader = " "

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Use <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Colorscheme
vim.opt.background = "dark"

--vim.g.adwaita_darker = true 
--vim.g.adwaita_transparent = false
--vim.g.mellow_italic_comments = false
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_better_performance = 1
vim.g.boo_colorscheme_italic = false
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_italic = false 
vim.g.nord_bold = false 
vim.g.rasmus_italic_comments = false

require('vesper').setup {
    italics = {
        comments = false,
        keywords = false,
        functions = false,
        strings = false,
        variables = false
    }
}

require('rose-pine').setup {
    variant = 'moon',
    styles = {
        bold = false,
        italic = false
    }
}

require('mellifluous').setup {
    colorset = "mellifluous", -- "mountain"
    plugins = {
        nvim_tree = {
            enabled = true
        },
        telescope = {
            enabled = true
        }
    }
}

require('obscure').setup {
    styles = {
        keywords = { italic = false },
        comments = { italic = false }
    }
}

-- Themes:
--  * sorbet     # default
--  * adwaita
--  * serene
--  * mellow
--  * gruvbox-material
--  * nordic
--  * zenburn
--  * halfspace
--  * modus
--  * oxocarbon
--  * boo, sunset_cloud, radioactive_waste, forest_stream, crimson_moonlight
--  * blue-moon
--  * substrata
--  * vesper
--  * melange
--  * nord
--  * github_dark, github_dark_high_contrast, github_dark_tritanopia
--  * github_light, github_light_high_contrast, github_light_tritanopia
--  * rose-pine
--  * rasmus
--  * mellifluous
--  * poimandres
--  * obscure

vim.cmd([[colorscheme adwaita]])


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

require('oil').setup({
    default_file_explorer = true,
    delete_to_trash = false,
    use_default_keymaps = true,
    view_options = {
        show_hidden = true,
    },
})

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua" },
    sync_install = false,
    auto_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

-- Create a command `:GitBlameLine` 
vim.api.nvim_create_user_command('GitBlameLine', function()
    local line_number = vim.fn.line('.')
    local filename = vim.api.nvim_buf_get_name(0)
    print(vim.fn.system({ 'git', 'blame', '-L', line_number .. ',+1', filename }))
end, { desc = 'Print the git blame for the current line' })
vim.keymap.set('n', '<leader>gb', ':GitBlameLine<CR>', { desc = 'Print the git blame for the current line' })


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
        -- NOTE: Remember that Lua is a real programming language, and as such it is possible
        -- to define small helper and utility functions so you don't have to repeat yourself.
        --
        -- In this case, we create a function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
        local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

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

-- Diagnostic Config, see :help vim.diagnostic.Opts
vim.diagnostic.config {
    severity_sort = true,
    float = { border = 'rounded', source = 'if_many' },
    underline = { severity = vim.diagnostic.severity.ERROR },
    signs = vim.g.have_nerd_font and {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
    } or {},
    virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function(diagnostic)
            local diagnostic_message = {
                [vim.diagnostic.severity.ERROR] = diagnostic.message,
                [vim.diagnostic.severity.WARN] = diagnostic.message,
                [vim.diagnostic.severity.INFO] = diagnostic.message,
                [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
        end,
    },
}

