
-- Colorscheme
vim.g.adwaita_darker = true 
vim.g.adwaita_transparent = false
vim.g.mellow_italic_comments = false
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

