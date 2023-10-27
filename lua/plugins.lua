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
	-- Bufferline
	'akinsho/bufferline.nvim',
	-- LSP config
	'neovim/nvim-lspconfig',
	-- LSP installer
	'williamboman/nvim-lsp-installer',
	-- Code completion
	'hrsh7th/nvim-cmp',
	-- Addon for cmp to lsp
	'hrsh7th/cmp-nvim-lsp',
	-- Addon for cmp to search in buffer
	'hrsh7th/cmp-buffer',
	-- Addon for cmp to cmplete path
	'hrsh7th/cmp-path',
	-- Autoclose brackets
	'tpope/vim-surround',
	-- How many search patterns found
	'google/vim-searchindex',
	-- Mason - classic
	'williamboman/mason.nvim',
	-- Addon for cmp to complete cmd
	'hrsh7th/cmp-cmdline',
	-- Addon for cmp to complete with lsp help
	'saadparwaiz1/cmp_luasnip',
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
	-- Markdown previewer in browser
	{
		'iamcco/markdown-preview.nvim',
		build = function() vim.fn['#mkdp#util#install']() end,
	},
	-- Telescope addon for mardown-preview
	'nvim-telescope/telescope-bibtex.nvim',
	-- Calendar window
	'renerocksai/calendar-vim',
	-- Addon for zettelkasten method
	'renerocksai/telekasten.nvim',
	-- Telescope addon for see media files like pictures in telescope
	'nvim-telescope/telescope-media-files.nvim',
	-- Terminal in floating window or any side
	{
		'akinsho/toggleterm.nvim',
		version = '*',
		config = true,
	},
	-- Flutter tools for flutter support
	{
		'akinsho/flutter-tools.nvim',
		lazy = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
			'stevearc/dressing.nvim'
		},
		config = true
	},
	'lukas-reineke/indent-blankline.nvim',
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
		-- since legendary.nvim handles all your keymaps/commands,
		-- its recommended to load legendary.nvim before other plugins
		priority = 10000,
		lazy = false,
		-- sqlite is only needed if you want to use frecency sorting
		-- dependencies = { 'kkharji/sqlite.lua' }
	},
	'NeverI/symfony.nvim',
})
