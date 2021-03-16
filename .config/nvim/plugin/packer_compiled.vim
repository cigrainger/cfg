" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/chris/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/chris/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/chris/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/chris/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/chris/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["completion-nvim"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nâ\3\0\0\6\0\24\0+6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0004\4\3\0005\5\6\0>\5\1\4=\4\b\0034\4\3\0005\5\t\0>\5\1\4=\4\n\0034\4\3\0005\5\v\0>\5\1\4=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\19\0025\3\20\0004\4\0\0=\4\b\0034\4\0\0=\4\n\0035\4\21\0=\4\f\0035\4\22\0=\4\14\0034\4\0\0=\4\16\0034\4\0\0=\4\18\3=\3\23\2B\0\2\1K\0\1\0\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\1\0\rfilename\16file_status\2\14lualine_b\1\2\1\0\vbranch\ticon\bî‚ \14lualine_a\1\0\0\1\2\1\0\tmode\nupper\2\foptions\1\0\0\1\0\2\18icons_enabled\2\ntheme\tnord\vstatus\flualine\frequire\0" },
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nord-vim"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/nord-vim"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/telescope-github.nvim"
  },
  ["telescope-ultisnips.nvim"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/telescope-ultisnips.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/vim-dadbod"
  },
  ["vim-elixir"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/vim-elixir"
  },
  ["vim-endwise"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/vim-endwise"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-peekaboo"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/vim-peekaboo"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-slime"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/vim-slime"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-speeddating"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/vim-speeddating"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-terraform"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/vim-terraform"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/Users/chris/.local/share/nvim/site/pack/packer/start/vim-vinegar"
  }
}

-- Config for: lualine.nvim
try_loadstring("\27LJ\2\nâ\3\0\0\6\0\24\0+6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0004\4\3\0005\5\6\0>\5\1\4=\4\b\0034\4\3\0005\5\t\0>\5\1\4=\4\n\0034\4\3\0005\5\v\0>\5\1\4=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\19\0025\3\20\0004\4\0\0=\4\b\0034\4\0\0=\4\n\0035\4\21\0=\4\f\0035\4\22\0=\4\14\0034\4\0\0=\4\16\0034\4\0\0=\4\18\3=\3\23\2B\0\2\1K\0\1\0\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\1\0\rfilename\16file_status\2\14lualine_b\1\2\1\0\vbranch\ticon\bî‚ \14lualine_a\1\0\0\1\2\1\0\tmode\nupper\2\foptions\1\0\0\1\0\2\18icons_enabled\2\ntheme\tnord\vstatus\flualine\frequire\0", "config", "lualine.nvim")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
