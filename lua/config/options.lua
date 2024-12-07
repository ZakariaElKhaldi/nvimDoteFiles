local g = vim.g
local opt = vim.opt
local api = vim.api

-- General Settings
g.mapleader = ' '
opt.numberwidth = 1  -- Adjust the space reserved for line numbers (default is 4)

-- Cursor and Mouse
opt.mouse = 'a'                       -- Enable mouse support
opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard

-- Interface
opt.cursorline = true                 -- Highlight current line
opt.number = true                     -- Show line numbers
opt.relativenumber = true             -- Relative line numbers
opt.scrolloff = 25                    -- Keep cursor away from screen edges
opt.colorcolumn = ''                  -- Line length marker (disabled)
opt.splitright = true                 -- Vertical splits to the right
opt.splitbelow = true                 -- Horizontal splits to the bottom
opt.termguicolors = true              -- Enable 24-bit RGB colors
opt.signcolumn = 'yes'                -- Always show the sign column
opt.laststatus = 3                    -- Global statusline
opt.cmdheight = 1                     -- Reduce command-line height
opt.pumheight = 10                    -- Limit popup menu height
opt.winblend = 10                     -- Transparent floating windows
opt.pumblend = 10                     -- Transparent popup menu
opt.showmatch = true                  -- Highlight matching parentheses
opt.wrap = false                      -- Disable line wrapping for code
opt.linebreak = true                  -- Wrap on word boundaries
opt.fillchars = { eob = ' ' }         -- Remove ~ from end-of-buffer
opt.list = true                       -- Show hidden characters
opt.listchars = { tab = '▸ ', trail = '·', nbsp = '+' }

-- Searching
opt.ignorecase = true                 -- Ignore case in searches
opt.smartcase = true                  -- Use case-sensitive search if uppercase used
opt.incsearch = true                  -- Incremental search
opt.hlsearch = true                   -- Highlight search results

-- Tabs and Indentation
opt.expandtab = true                  -- Use spaces instead of tabs
opt.shiftwidth = 3                    -- Shift width for indentation
opt.tabstop = 3                       -- Tab width
opt.smartindent = true                -- Auto-indent new lines

-- Performance
opt.hidden = true                     -- Allow background buffers
opt.history = 100                     -- Command-line history limit
opt.lazyredraw = true                 -- Improve scrolling performance
opt.synmaxcol = 240                   -- Max column for syntax highlighting
opt.updatetime = 250                  -- Faster event triggering
opt.timeoutlen = 300                  -- Faster response for key mappings
opt.ttimeoutlen = 10                  -- Faster timeout for key codes

-- Backups and Undo
opt.swapfile = false                  -- Disable swap files
opt.backup = false                    -- Disable backups
opt.undofile = true                   -- Persistent undo
opt.undodir = vim.fn.stdpath('config') .. '/undo//' -- Undo file directory

-- Keybinding Helpers
opt.shortmess:append "sI"             -- Reduce messages
