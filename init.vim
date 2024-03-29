set shell=/bin/bash
call plug#begin('~/.vim/plugged')

" ------------------------------------> Color Scheme Imports 
Plug 'Mofiqul/dracula.nvim'
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/seoul256.vim'


" ------------------------------------> VIM Enhancements
" Plug 'ciaranm/securemodelines'
" Plug 'editorconfig/editorconfig-vim'
" Plug 'justinmk/vim-sneak'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'feline-nvim/feline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-fugitive'

" ------------------------------------> GUI Enhancements
" Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'

" ------------------------------------> Search Enhancements
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'

" ------------------------------------> Language Support
Plug 'neovim/nvim-lspconfig'
" Plug 'dense-analysis/ale'
" Plug 'lervag/vimtex'

Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'hrsh7th/nvim-cmp', {'branch': 'main'} " Autocompletion framework
Plug 'hrsh7th/cmp-nvim-lsp' , {'branch': 'main'} " cmp LSP completion
Plug 'hrsh7th/cmp-path', {'branch': 'main'}  " cmp Path completion
Plug 'hrsh7th/cmp-buffer', {'branch': 'main'} 

Plug 'simrat39/rust-tools.nvim'

Plug 'hrsh7th/cmp-vsnip', {'branch': 'main'} " cmp Snippet completion
Plug 'hrsh7th/vim-vsnip'
Plug 'tpope/vim-fugitive'
" Plug 'ray-x/lsp_signature.nvim'

" Plug 'cespare/vim-toml'
" Plug 'stephpy/vim-yaml'
" Plug 'rust-lang/rust.vim'
" Plug 'rhysd/vim-clang-format'
" Plug 'dag/vim-fish'
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'

call plug#end()


" ===============================================================
" Personal Configuration
" ===============================================================
set number
set tabstop=4 shiftwidth=4 expandtab
set cursorline
set mouse=a
colorscheme dracula
" colorscheme nord
" colorscheme seoul256
" set background=dark

set completeopt=menuone,noinsert,noselect
set shortmess+=c
set signcolumn=yes
set updatetime=300
" autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })

let mapleader = "\<Space>"
noremap <silent> <leader>h :bprevious<CR>
noremap <silent> <leader>l :bnext<CR>
" noremap <leader>t :set ts=2 noet <bar> retab! <bar> set et ts=4 <bar> retab <CR>

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.diagnostic.goto_next()<CR>


" ===============================================================
" Rust Language Settings 
" ===============================================================

lua <<EOF
-- nvim_lsp object
local nvim_lsp = require'lspconfig'

local opts = {
        tools = {
                autoSetHints = true,
                hover_with_actions = true,
                runnables = {
                        use_telescope = true
                },
                inlay_hints = {
                        show_parameter_hints = false,
                        parameter_hints_prefix = "",
                        other_hints_prefix = "",
                },
        },

        -- all the opts to send to nvim-lspconfig
        -- these override the defaults set by rust-tools.nvim
        -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
        server = {
                -- on_attach is a callback called when the language server attachs to the buffer
                -- on_attach = on_attach,
                settings = {
                        -- to enable rust-analyzer settings visit:
                        -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
                        ["rust-analyzer"] = {
                                -- enable clippy on save
                                checkOnSave = {
                                        command = "clippy"
                                },
                        }
                }
        },
}

require('rust-tools').setup(opts)

EOF

" Code navigation shortcuts
" as found in :help lsp
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K         <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD        <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD       <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr        <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0        <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW        <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd        <cmd>lua vim.lsp.buf.definition()<CR>

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF
local cmp = require'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Add tab support
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        })
    },

    -- Installed sources
    sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'path' },
        { name = 'buffer' },
    },
})
EOF


" ===============================================================
" nvim-tree configuration
" ===============================================================
"  https://github.com/kyazdani42/nvim-tree.lua

noremap <C-n> :NvimTreeToggle<CR>
noremap <leader>r :NvimTreeRefresh<CR>
noremap <leader>f :NvimTreeFocus<CR>

lua << EOF
require('nvim-tree').setup { -- BEGIN_DEFAULT_OPTS
    auto_close = false,
    auto_reload_on_write = true,
    disable_netrw = false,
    hide_root_folder = false,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    open_on_setup = false,
    open_on_tab = false,
    sort_by = "name",
    update_cwd = false,
    view = {
        width = 30,
        height = 30,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        mappings = {
            custom_only = false,
            list = {
                -- user mappings go here
            },
        },
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    update_focused_file = {
        enable = false,
        update_cwd = false,
        ignore_list = {},
    },
    ignore_ft_on_setup = {},
    system_open = {
        cmd = nil,
        args = {},
    },
    diagnostics = {
        enable = false,
        show_on_dirs = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    filters = {
        dotfiles = false,
        custom = {},
        exclude = {},
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 400,
    },
    actions = {
        change_dir = {
            enable = true,
            global = false,
        },
        open_file = {
            quit_on_open = false,
            resize_window = false,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            git = false,
        },
    },
} -- END_DEFAULT_OPTS
EOF


" ===============================================================
" bufferline configuration
" ===============================================================
" https://github.com/akinsho/bufferline.nvim

set termguicolors
lua << EOF
require("bufferline").setup{
        options = {
                mode = "buffers",
                separator_style = "slant"
        }
}
EOF


" ===============================================================
" nvim-treesitter configuration
" ===============================================================
" https://github.com/nvim-treesitter/nvim-treesitter

lua << EOF
require("nvim-treesitter.configs").setup {
        ensure_installed = "maintained",
        highlight = {
                enable = true,
                disable = {"rust", "c", "java"}, 
                additional_vim_regex_highlighting = false,
        }, 
        indent = {
                enable = false
        }
}

EOF


" ===============================================================
" Autopairs configuration
" ===============================================================
" https://github.com/windwp/nvim-autopairs

lua << EOF
require("nvim-autopairs").setup {}
EOF


" ===============================================================
" indent-blankline configuration 
" ===============================================================
"  https://github.com/lukas-reineke/indent-blankline.nvim

lua << EOF
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")
vim.opt.termguicolors = true
vim.cmd [[highlight context guibg=#61AFEF gui=nocombine]]

require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
    show_trailing_blankline_indent = false,
    -- space_char_blankline = " ",
}
EOF


" ===============================================================
" Feline configuration 
" ===============================================================
" https://github.com/feline-nvim/feline.nvim

lua << EOF
require('feline').setup{}
EOF

