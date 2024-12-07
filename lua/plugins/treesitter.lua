return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c",
          "cpp",
          "lua",
          "python",
          "javascript",
          "html",
          "css",
          "bash",
          "json",
          "yaml",
          "markdown",
        },
        highlight = {
          enable = true, -- Enable syntax highlighting
          additional_vim_regex_highlighting = false, -- Avoid conflict with Vim's built-in highlighting
        },
        indent = {
          enable = true, -- Enable Treesitter-based indentation
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            scope_incremental = "<TAB>",
            node_decremental = "<S-TAB>",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
        },
      })
    end,
  },
}
