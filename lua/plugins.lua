-- vim: ts=2 sw=2

-- Add lazy.nvim to plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install plugins
require('lazy').setup({
	-- Colortheme
	'EdenEast/nightfox.nvim',
	-- NeoTree with dependencies
	{
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v3.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons',
			'MunifTanjim/nui.nvim'
		},
	},
	-- Telescope with dependecies
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
			'BurntSushi/ripgrep',
		}
	},
	-- For see help for keymaps with short description
	'folke/which-key.nvim',
	-- Down lualine
	'nvim-lualine/lualine.nvim',
	-- Tagbar
	'preservim/tagbar',
	-- LSP config
	{
		'neovim/nvim-lspconfig',
		config = function()
			require "lsp"
		end,
	},
	-- LSP installer
	'williamboman/nvim-lsp-installer',
	-- Code completion
	{
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          require "configs.luasnip"
        end,
      },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    opts = function()
      return require "configs.cmp"
    end,
  },
	-- Autoclose brackets
	'tpope/vim-surround',
	-- How many search patterns found
	'google/vim-searchindex',
	-- Mason - classic
	'williamboman/mason.nvim',
	-- Snippets
	'L3MON4D3/LuaSnip',
	-- Window picker for NeoTree
	{
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
	},
	-- Base plugin for some other plugins with modal windows
	'MunifTanjim/nui.nvim',
	-- Cheatsheet(helper) for all plugins and standard nvim commands
	{
		'doctorfree/cheatsheet.nvim',
		event = 'VeryLazy',
		dependencies = {
			{ 'nvim-telescope/telescope.nvim' },
			{ 'nvim-lua/popup.nvim' },
			{ 'nvim-lua/plenary.nvim' },
		},
		config = function()
			local ctactions = require('cheatsheet.telescope.actions')
			require('cheatsheet').setup({
				bundled_cheetsheets = {
					enabled = { 'default', 'lua', 'markdown', 'regex', 'netrw', 'unicode' },
					disabled = { 'nerd-fonts' },
				},
				bundled_plugin_cheatsheets = {
					enabled = {
						'auto-session',
						'goto-preview',
						'octo.nvim',
						'telescope.nvim',
						'vim-easy-align',
						'vim-sandwich',
					},
					disabled = { 'gitsigns' },
				},
				include_only_installed_plugins = true,
				telescope_mappings = {
					['<CR>'] = ctactions.select_or_fill_commandline,
					['<A-CR>'] = ctactions.select_or_execute,
					['<C-Y>'] = ctactions.copy_cheat_value,
					['<C-E>'] = ctactions.edit_user_cheatsheet,
				},
			})
		end,
	},
	-- Pretty command line and search
	{
		'folke/noice.nvim',
		event = 'VeryLazy',
		dependencies = {
			'MunifTanjim/nui.nvim',
			'rcarriga/nvim-notify',
		}
	},
	-- Comment all in visual mode with 'gc'
	'numToStr/Comment.nvim',
	-- Autocomplete brackets
	{
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		opts = {}
	},
	-- Mason lsp configuration
	'williamboman/mason-lspconfig.nvim',
	-- Telescope addon for mardown-preview
	'nvim-telescope/telescope-bibtex.nvim',
	-- Calendar window
	'renerocksai/calendar-vim',
	-- Telescope addon for see media files like pictures in telescope
	'nvim-telescope/telescope-media-files.nvim',
	-- Terminal in floating window or any side
	{
		'akinsho/toggleterm.nvim',
		version = '*',
		config = true,
	},
	{
    'mikesmithgh/kitty-scrollback.nvim',
    enabled = true,
    lazy = true,
    cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
    -- version = '*', -- latest stable version, may have breaking changes if major version changed
    -- version = '^1.0.0', -- pin major version, include fixes and features that do not have breaking changes
    config = function()
      require('kitty-scrollback').setup()
    end,
  },
	{
		'startup-nvim/startup.nvim',
		config = function()
			require('startup').setup()
		end
	},
	'ixru/nvim-markdown',
	{
    'kawre/leetcode.nvim',
    build = ':TSUpdate html',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-telescope/telescope.nvim',
        'nvim-lua/plenary.nvim', -- required by telescope
        'MunifTanjim/nui.nvim',

        -- optional
        'nvim-tree/nvim-web-devicons',

        -- recommended
        'rcarriga/nvim-notify',
    },
	},
	{
		'ellisonleao/glow.nvim',
		config = true,
		cmd = 'Glow'
	},
	{
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {}, -- Loads default behaviour
          ['core.concealer'] = {}, -- Adds pretty icons to your documents
          ['core.dirman'] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = '~/notes',
              },
            },
          },
        },
      }
    end,
  },
	{
		'mrjones2014/legendary.nvim',
		priority = 10000,
		lazy = false,
		-- sqlite is only needed if you want to use frecency sorting
		-- dependencies = { 'kkharji/sqlite.lua' }
	},
	'NeverI/symfony.nvim',
	{
    "prettier/vim-prettier",
    build = {
      "yarn install --frozen-lockfile --production",
    },
    branch = "release/0.x",
    cmd = { "Prettier", "PrettierAsync", "PrettierCli", "PrettierCliPath", "PrettierCliVersion", "PrettierVersion" },
  },
  {
    "sbdchd/neoformat",
    cmd = { "Neoformat" },
    config = function()
      vim.cmd [[
      let g:neoformat_enabled_yaml = ['prettier']
      let g:neoformat_enabled_js = ['prettier']
      let g:neoformat_enabled_twig = ['prettier']
        ]]
    end,
  },
	{
    "rhysd/vim-clang-format",
    ft = { "cpp", "c", "h" },
    init = function()
      vim.cmd [[let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "BreakBeforeBraces" : "Stroustrup"}]]
    end,
  },
	{
		'lukas-reineke/indent-blankline.nvim',
		main = 'ibl',
		---@module 'ibl'
		---@type ibl.config
		opts = {},
	}
})
