
local dir = vim.fn.stdpath('data') .. '/site/'

if vim.fn.isdirectory(dir .. '/autoload/plug.vim') == 0 then
    vim.fn.system({
	'curl',
	'-fLo',
	dir .. '/autoload/plug.vim',
	'--create-dirs',
	'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    })
end

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

require('oil').setup({
    default_file_explorer = true,
    delete_to_trash = false,
    use_default_keymaps = true,
    view_options = {
        show_hidden = true,
    },
})
vim.keymap.set('n', '-', function() require('oil').open() end, { desc = 'Open parent directory' })

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua" },
    sync_install = false,
    auto_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

