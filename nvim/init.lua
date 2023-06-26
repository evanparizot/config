require("plugins/_plugins").setup()
require("plugins/cmp")

require("lsp/mason")
require("lsp/lspconfig")
require("lsp/rust")

require("core/options")
require("core/keys")

-- Treesitter Plugin Setup 
require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "rust", "toml" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting=false,
  },
  ident = { enable = true }, 
  rainbow = {
      enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}

require('monokai').setup {
    palette = require('monokai').pro 
}

require('indent_blankline').setup {
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
    show_trailing_blankline_indent = false,
}

require('nvim-tree').setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

require("bufferline").setup {
    options = {
        mode = "buffers",
        separator_style = "slant",
        diagnostics = "nvim_lsp",
    }
}

