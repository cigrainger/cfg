-- Aliases
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables

-- Plugins
local execute = vim.api.nvim_command
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

cmd 'autocmd BufWritePost plugins.lua PackerCompile'
require('plugins')

-- Options
--[[
Citation: https://oroques.dev/notes/neovim-init/
The Neovim Lua API provide 3 tables to set options:

vim.o for setting global options
vim.bo for setting buffer-scoped options
vim.wo for setting window-scoped options

Unfortunately setting an option is not as straightforward in Lua as in Vimscript. In Lua you need to update the global table then either the buffer-scoped or the window-scoped table to ensure that an option is correctly set. Otherwise some option like expandtab will only be valid for the starting buffer of a new Neovim instance.

Fortunately the Neovim team is working on an universal and simpler option interface. In the meantime you can use this function as a workaround:
--]]
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

local indent = 2
opt('b', 'expandtab', true)                           -- Use spaces instead of tabs
opt('b', 'shiftwidth', indent)                        -- Size of an indent
opt('b', 'smartindent', true)                         -- Insert indents automatically
opt('b', 'tabstop', indent)                           -- Number of spaces tabs count for
opt('o', 'completeopt', 'menuone,noinsert,noselect')  -- Completion options (for deoplete)
opt('o', 'hidden', true)                              -- Enable modified buffers in background
opt('o', 'ignorecase', true)                          -- Ignore case
opt('o', 'joinspaces', false)                         -- No double spaces with join after a dot
opt('o', 'scrolloff', 4 )                             -- Lines of context
opt('o', 'shiftround', true)                          -- Round indent
opt('o', 'sidescrolloff', 8 )                         -- Columns of context
opt('o', 'smartcase', true)                           -- Don't ignore case with capitals
opt('o', 'splitbelow', true)                          -- Put new windows below current
opt('o', 'splitright', true)                          -- Put new windows right of current
opt('o', 'termguicolors', true)                       -- True color support
opt('o', 'wildmode', 'list:longest')                  -- Command-line completion mode
opt('w', 'list', true)                                -- Show some invisible characters (tabs...)
opt('w', 'number', true)                              -- Print line number

-- completion-nvim
cmd 'autocmd BufEnter * lua require"completion".on_attach()'
g.completion_enable_snippet = 'UltiSnips'

-- lsp-status.nvim
local lsp_status = require('lsp-status')
-- completion_customize_lsp_label as used in completion-nvim
-- Optional: customize the kind labels used in identifying the current function.
-- g:completion_customize_lsp_label is a dict mapping from LSP symbol kind
-- to the string you want to display as a label
-- lsp_status.config { kind_labels = vim.g.completion_customize_lsp_label }

-- Register the progress handler
lsp_status.register_progress()

-- Nord
cmd 'colorscheme nord'
g.nord_uniform_diff_background = 1
g.nord_italic = 1
g.nord_italic_comments = 1
g.nord_underline = 1

-- vim-slime
g.slime_target = 'tmux'
g.slime_default_config = {socket_name = 'default', target_pane = '{right-of}'}
g.slime_python_ipython = 1

-- Mappings
--[[
Citation: https://oroques.dev/notes/neovim-init/
The vim.api.nvim_set_keymap() function allows you to define a new mapping. Specific behaviors such as noremap must be passed as a table to that function. Here is a helper to create mappings with the noremap option set to true by default:
--]]
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--mapleaderapleader to space. Needs to be before other mappings.
map('n', '<space>', '<nop>')
g.mapleader = ' '

-- <Tab> to navigate the completion menu
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true})

map('n', '<leader>l', '<cmd>noh<CR>')                 -- Clear highlights
map('n', '<leader>o', 'm`o<Esc>``')                   -- Insert a newline in normal mode

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<CR>')
map('n', '<leader>fg', ':Telescope live_grep<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
map('n', '<leader>fh', ':Telescope help_tags<CR>')

-- Kill the arrows.
map('n', '<up>', '<nop>')
map('n', '<down>', '<nop>')
map('n', '<left>', '<nop>')
map('n', '<right>', '<nop>')
map('i', '<up>', '<nop>')
map('i', '<down>', '<nop>')
map('i', '<left>', '<nop>')
map('i', '<right>', '<nop>')

-- nvim-tree.lua
map('n', '<C-n>', ':NvimTreeToggle<CR>')
map('n', '<leader>r', ':NvimTreeRefresh<CR>')
map('n', '<leader>n', ':NvimTreeFindFile')

-- Treesitter
local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}

-- LSP
local lsp = require 'lspconfig'

-- root_dir is where the LSP server will start: here at the project root otherwise in current folder
lsp.pyright.setup{
  root_dir = lsp.util.root_pattern('.git', fn.getcwd())
}

lsp.elixirls.setup{
  cmd = {'/Users/chris/code/elixir-ls/language_server.sh'},
  root_dir = lsp.util.root_pattern('.git', fn.getcwd()),
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
}

lsp.bashls.setup{
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
}

lsp.terraformls.setup{
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
}

lsp.dockerls.setup{
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
}

lsp.html.setup{
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
}

require('lua-language-server') -- Lua's language server requires a bit more so it's in a separate file

map('n', '<leader>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<leader>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<leader>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<leader>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
