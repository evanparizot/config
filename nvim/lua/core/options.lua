-----------------------------------------------------------
-- General NeoVim settings and configurations
-----------------------------------------------------------

local g = vim.g
local opt = vim.opt
local api = vim.api

-----------------------------------------------------------
-- General
-----------------------------------------------------------

opt.mouse = 'a'                     -- Enable mouse support
opt.clipboard = 'unnamedplus'       -- Copy/Paste to system
opt.swapfile = false                -- Disable swapfile

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
opt.completeopt = {'menuone', 'noselect', 'noinsert'}
opt.shortmess = vim.opt.shortmess + { c = true}
api.nvim_set_option('updatetime', 150) 

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------

opt.list = true
opt.listchars:append("space:⋅")
-- opt.listchars:append("eol:↴")

opt.relativenumber = true
opt.showmatch = true
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldenable = false
opt.colorcolumn = '80'

opt.cursorline = true
opt.splitright = true
opt.splitbelow = true
opt.ignorecase = true
opt.smartcase = true
opt.linebreak = true
opt.termguicolors = true
opt.laststatus = 3

-----------------------------------------------------------
-- Tabs, Indent
-----------------------------------------------------------

opt.tabstop = 4
opt.smartindent = true
opt.shiftwidth = 4
opt.expandtab = true


-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------

opt.hidden = true
opt.history = 100
opt.lazyredraw = true
opt.synmaxcol = 240
opt.updatetime = 250

-----------------------------------------------------------
-- Vimspector
-----------------------------------------------------------

g.vimspector_sidebar_width = 85
g.vimspector_bottombar_height = 15
g.vimspector_terminal_maxwidth = 70



-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error 
-- Show inlay_hints more frequently 
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
