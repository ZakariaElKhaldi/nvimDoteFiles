-- neo-tree
require("neo-tree").setup()

--themes
local nvimtheme = 1 
if(nvimtheme==1)
	then
		vim.cmd('colorscheme github_dark_default')
	elseif(nvimtheme==2)
		then
			vim.cmd("colorscheme gruvbox")
	elseif(nvimtheme==3)
		then
			vim.cmd("colorscheme gruvbox-material")
	
	elseif(nvimtheme==4)
		then
			vim.cmd.colorscheme("lackluster")
	end

--theesitter
require("lazy").setup({{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
 }})

