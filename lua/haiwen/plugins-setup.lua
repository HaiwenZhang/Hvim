-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed


-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])


-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- plugin manager
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "lewis6991/impatient.nvim"

  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"

  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff

  -- colorscheme
  use 'folke/tokyonight.nvim'
  use "olimorris/onedarkpro.nvim"

  -- lualine
  use "nvim-lualine/lualine.nvim"
  use "akinsho/bufferline.nvim"

  -- LSP
  use 'neovim/nvim-lspconfig'
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
  use "SmiteshP/nvim-navic"
  use "b0o/schemastore.nvim"
	use "jose-elias-alvarez/typescript.nvim" -- additional functionality for typescript server (e.g. rename file & update imports)
	use "onsails/lspkind.nvim" -- vs-code like icons for autocompletion
  use "kosayoda/nvim-lightbulb" -- code action
  use "ray-x/lsp_signature.nvim" -- show function signature when typing
  use "folke/neodev.nvim"
  use 'jose-elias-alvarez/null-ls.nvim'
  use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
   -- Useful status updates for LSP
  use 'j-hui/fidget.nvim'

  -- completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'  -- buffer completion
  use 'hrsh7th/cmp-path' -- path completion
  use 'hrsh7th/cmp-cmdline' -- cmdline completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use "f3fora/cmp-spell"

  -- snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use "rafamadriz/friendly-snippets"

  -- Telescope
    -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  -- debugger
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'nvim-telescope/telescope-dap.nvim'
  use "jayp0521/mason-nvim-dap.nvim"


  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"
  use "windwp/nvim-ts-autotag"

  -- nvim-surround
  use "kylechui/nvim-surround"

  -- hop
  use 'phaazon/hop.nvim'

  -- indent-blankline
  use "lukas-reineke/indent-blankline.nvim"

  -- Alpha
  use 'goolord/alpha-nvim'

  -- git
  use 'lewis6991/gitsigns.nvim'
  use 'TimUntersberger/neogit'

  -- which-key
  use "folke/which-key.nvim"

  -- symbols-outline
  use 'simrat39/symbols-outline.nvim'

  --  nvim-colorizer
  use 'norcalli/nvim-colorizer.lua'

  -- terminal
  use {"akinsho/toggleterm.nvim", tag = '*'}

  -- Diffview
  use 'sindrets/diffview.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

