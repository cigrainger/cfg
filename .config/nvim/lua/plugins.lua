vim.cmd [[packadd packer.nvim]]
local use = require('packer').use

return require('packer').startup(function()
  use {'SirVer/ultisnips'}
  use {'airblade/vim-rooter'}
  use {'arcticicestudio/nord-vim'}
  use {'christoomey/vim-tmux-navigator'}
  use {'editorconfig/editorconfig-vim'}
  use {'elixir-editors/vim-elixir'}
  use {'fhill2/telescope-ultisnips.nvim'}
  use {'hashivim/vim-terraform'}
  use {'honza/vim-snippets'}
  use {'jpalardy/vim-slime'}
  use {'junegunn/vim-peekaboo'}
  use {'neovim/nvim-lspconfig'}
  use {'nvim-lua/completion-nvim'}
  use {'nvim-lua/lsp-status.nvim'}
  use {'nvim-telescope/telescope-github.nvim'}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'nvim-treesitter/nvim-treesitter-textobjects'}
  use {'tpope/vim-abolish'}
  use {'tpope/vim-commentary'}
  use {'tpope/vim-dadbod'}
  use {'tpope/vim-endwise'}
  use {'tpope/vim-eunuch'}
  use {'tpope/vim-fugitive'}
  use {'tpope/vim-repeat'}
  use {'tpope/vim-rhubarb'}
  use {'tpope/vim-speeddating'}
  use {'tpope/vim-surround'}
  use {'tpope/vim-unimpaired'}
  use {'tpope/vim-vinegar'}
  use {'wbthomason/packer.nvim', opt = true}

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require('lualine').status{
        options = {
          theme = 'nord',
          section_separators = nil,
          component_separators = nil,
          icons_enabled = true,
        },
        sections = {
          lualine_a = { {'mode', upper = true} },
          lualine_b = { {'branch', icon = ''} },
          lualine_c = { {'filename', file_status = true} },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location'  },
        },
        inactive_sections = {
          lualine_a = {  },
          lualine_b = {  },
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {  },
          lualine_z = {   }
        }
      }
    end
  }
end)
