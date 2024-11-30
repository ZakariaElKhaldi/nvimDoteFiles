return {
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = "all", -- or specify languages
                highlight = { enable = true },
            }
        end,
    },
}

