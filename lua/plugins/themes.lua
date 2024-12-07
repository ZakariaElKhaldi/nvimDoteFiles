return {
  { "morhetz/gruvbox" },
  { "sainnhe/gruvbox-material" },
  { "arcticicestudio/nord" },
  { "dracula/vim" },
  { "joshdick/onedark.vim" },
  { "rose-pine/neovim" },
  { "mellow-theme/mellow.nvim" },
  { "javiorfo/nvim-nyctophilia" },
  { "bettervim/yugen.nvim" },
  { "aktersnurra/no-clown-fiesta.nvim",

    config = function()
      vim.cmd([[colorscheme gruvbox-material]])
    end
  },
}


