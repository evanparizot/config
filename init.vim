" This is n example on how rust-analyzer can be configure using lsp-config
set shell=/bin/bash
let mapleader = "\<Space>"

" Prerequisites:
" - neovim >= 0.5
" - rust-analyzer: https://rust-analyzer.github.io/manual.html#rust-analyzer-language-server-binary

" Steps:
" - :PlugInstall
" - Restart

call plug#begin('~/.vim/plugged')

" Some color scheme other then default
" Plug 'arcticicestudio/nord-vim'
Plug 'Mofiqul/dracula.nvim'

" ===============================================================
"           Personal plugins            
" ===============================================================

" ------------------------------------> VIM Enhancements
Plug 'machakann/vim-highlightedyank'
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'feline-nvim/feline.nvim'

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

Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'hrsh7th/nvim-cmp', {'branch': 'main'} " Autocompletion framework
Plug 'hrsh7th/cmp-nvim-lsp' , {'branch': 'main'} " cmp LSP completion
Plug 'hrsh7th/cmp-path', {'branch': 'main'}  " cmp Path completion
Plug 'hrsh7th/cmp-buffer', {'branch': 'main'} 

Plug 'hrsh7th/cmp-vsnip', {'branch': 'main'} " cmp Snippet completion
Plug 'hrsh7th/vim-vsnip'
Plug 'ray-x/lsp_signature.nvim'
 
" Plug 'cespare/vim-toml'
" Plug 'stephpy/vim-yaml'
" Plug 'rust-lang/rust.vim'
" Plug 'rhysd/vim-clang-format'
" Plug 'dag/vim-fish'
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'

" ===============================================================

call plug#end()

" Personal Configuration
set number
set tabstop=4 shiftwidth=4 expandtab
colorscheme dracula


" ---------------------------------------------> nvim-tree
"  https://github.com/kyazdani42/nvim-tree.lua

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

" ---------------------------------------------> bufferline.nvim
"  https://github.com/akinsho/bufferline.nvim

set termguicolors
lua << EOF
require("bufferline").setup{}
EOF


" ---------------------------------------------> indent-blankline.nvim
"  https://github.com/lukas-reineke/indent-blankline.nvim
lua << EOF
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = false,
    -- space_char_blankline = " ",
}
EOF



" ---------------------------------------------> feline.nvim
"
lua << EOF
require('feline').setup()
EOF
