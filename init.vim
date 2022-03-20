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
" 			Personal plugins 			
" ===============================================================

" ------------------------------------> VIM Enhancements
Plug 'machakann/vim-highlightedyank'
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'

" ------------------------------------> GUI Enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'

" ------------------------------------> Search Enhancements
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'

" ------------------------------------> Language Support
" Plug 'neovim/nvim-lspconfig'
" Plug 'dense-analysis/ale'

" Plug 'nvim-lua/lsp_extensions.nvim'
" Plug 'hrsh7th/nvim-cmp' " Autocompletion framework
" Plug 'hrsh7th/cmp-nvim-lsp' " cmp LSP completion
" Plug 'hrsh7th/cmp-vsnip' " cmp Snippet completion
" Plug 'hrsh7th/cmp-path' " cmp Path completion
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-vsnip', {'branch':'main'}
" Plug 'hrsh7th/vim-vsnip'
" Plug 'ray-x/lsp_signature.nvim'
" 
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
colorscheme dracula

