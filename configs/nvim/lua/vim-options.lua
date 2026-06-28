--vim.cmd("set guicursor=")
--vim.cmd("set number")
--vim.cmd("set relativenumber")
--vim.cmd("set tabstop=4")
--vim.cmd("set softtabstop=4")
--vim.cmd("set shiftwidth=4")
--vim.cmd("set expandtab")
--vim.cmd("set smartindent")
--vim.cmd("set wrap")
--vim.cmd("set noswapfile")
--vim.cmd("set nobackup")
--vim.cmd("set nohlsearch")
--vim.cmd("set incsearch")
--vim.cmd("set scrolloff=8")
--vim.cmd("set signcolumn=yes")
--vim.cmd("set updatetime=50")
--vim.cmd("set colorcolumn=100")
--vim.cmd("set textwidth=80")
--vim.cmd("set shiftwidth=2")

local options = {
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 2,
  completeopt = { "menuone", "noselect" } ,
  conceallevel = 0,
  fileencoding = "utf-8",
  hlsearch = true,
  incsearch = true,
  ignorecase = true,
  ro = false,
  mouse = "a",
  pumheight = 10,
  showmode = false,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 1000,
  undofile = true,
  updatetime = 300,
  writebackup = false,
  expandtab = true,
  shiftwidth = 4,
  tabstop = 4,
  cursorline = false,
  number = true,
  relativenumber = true,
  numberwidth = 4,
  signcolumn = "yes",
  wrap = false,
  scrolloff = 4,
  sidescrolloff = 4,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end


vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false


vim.keymap.set('n', '<leader>dq', vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>fr', vim.lsp.buf.references, { desc = 'Find all references' })
vim.keymap.set('n', 'ge', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })

vim.wo.number = true

