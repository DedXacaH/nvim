-- vim: ts=2 sw=2
-- NeoVim standard options:

-- color column at 80 column
vim.opt.colorcolumn = '120'
-- 24-bit colors
vim.opt.termguicolors = true
-- number column
vim.opt.number = true
-- relative numbers at number column
vim.opt.relativenumber = true
-- setting up to use undofile
vim.opt.undofile = true
-- standard split to the right side
vim.opt.splitright = true
-- standard split to the down side
vim.opt.splitbelow = true
-- stop tabs at 2 spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.foldmethod = 'marker'

-- Tagbar settings
vim.g.tagbar_compact = 1
vim.g.tagbar_sort = 0

-- command to set colorsheme
vim.cmd('colorscheme carbonfox')
-- disable wrap lines
vim.cmd('set nowrap')

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.md",
	command = "setlocal wrap textwidth=78"
})
-----------------------------------------
-------------PLUGIN SETUPS---------------
-----------------------------------------

-- NeoTree setup
require('neo-tree').setup({
	close_if_last_window = false,
	popup_border_style = 'rounded',
	enable_git_status = true,
	enable_diagnostics = true,
	enable_normal_mode_for_inputs = false,
	sort_case_insensitive = false,
	sort_function = nil,
	default_component_configs = {
		container = {
			enable_character_fade = true
		},
		indent = {
			indent_size = 2,
			padding = 1, -- extra padding on left hand side
			-- indent guides
			with_markers = true,
			indent_marker = "│",
			last_indent_marker = "└",
			highlight = "NeoTreeIndentMarker",
			-- expander config, needed for nesting files
			with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
			expander_collapsed = "",
			expander_expanded = "",
			expander_highlight = "NeoTreeExpander",
		},
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "󰜌",
			-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
			-- then these will never be used.
			default = "*",
			highlight = "NeoTreeFileIcon"
		},
		modified = {
			symbol = "[+]",
			highlight = "NeoTreeModified",
		},
		name = {
			trailing_slash = false,
			use_git_status_colors = true,
			highlight = "NeoTreeFileName",
		},
		git_status = {
			symbols = {
				-- Change type
				added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
				modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
				deleted   = "✖",-- this can only be used in the git_status source
				renamed   = "󰁕",-- this can only be used in the git_status source
				-- Status type
				untracked = "",
				ignored   = "",
				unstaged  = "󰄱",
				staged    = "",
				conflict  = "",
			}
		},
		-- If you don't want to use these columns, you can set `enabled = false` for each of them individually
		file_size = {
			enabled = true,
			required_width = 64, -- min width of window required to show this column
		},
		type = {
			enabled = true,
			required_width = 122, -- min width of window required to show this column
		},
		last_modified = {
			enabled = true,
			required_width = 88, -- min width of window required to show this column
		},
		created = {
			enabled = true,
			required_width = 110, -- min width of window required to show this column
		},
	},
	commands = {},
	window = {
		position = "left",
		width = 30,
		mapping_options = {
			noremap = true,
			nowait = true,
		}
	},
	git_status = {
		window = {
			position = "float",
			mappings = {
				["A"]  = "git_add_all",
				["gu"] = "git_unstage_file",
				["ga"] = "git_add_file",
				["gr"] = "git_revert_file",
				["gc"] = "git_commit",
				["gp"] = "git_push",
				["gg"] = "git_commit_and_push",
			}
		}
	}
})

-- Set up lualine, mason, mason-lspconfig, Comment
require('lualine').setup()
require('mason').setup()
require('mason-lspconfig').setup()
require('Comment').setup()

-- Set up window picker
require('window-picker').setup({
    hint = 'floating-big-letter',
    selection_chars = 'FJDKSLA;CMRUEIWOQP',
    picker_config = {
        statusline_winbar_picker = {
            selection_display = function(char, windowid)
                return '%=' .. char .. '%='
            end,
            use_winbar = 'never',
        },
        floating_big_letter = {
            font = 'ansi-shadow',
        },
    },
    show_prompt = true,
    prompt_message = 'Pick window: ',
    filter_func = nil,
    filter_rules = {
        autoselect_one = true,
        include_current_win = false,
        bo = {
            filetype = { 'NvimTree', 'neo-tree', 'notify' },
            buftype = { 'terminal' },
        },
        wo = {},
        file_path_contains = {},
        file_name_contains = {},
    },
    highlights = {
        statusline = {
            focused = {
                fg = '#ededed',
                bg = '#e35e4f',
                bold = true,
            },
            unfocused = {
                fg = '#ededed',
                bg = '#44cc41',
                bold = true,
            },
        },
        winbar = {
            focused = {
                fg = '#ededed',
                bg = '#e35e4f',
                bold = true,
            },
            unfocused = {
                fg = '#ededed',
                bg = '#44cc41',
                bold = true,
            },
        },
    },
})

-- Set up noice, nvim-autopairs
require('noice').setup()
require('nvim-autopairs').setup({
	disable_filetype = { 'TelescopePrompt', 'vim' }
})

-- Set up notifications
require("notify").setup()
-- Set up telescope addon 'media_files'
require('telescope').load_extension('media_files')
-- Set up toggleterm
require('toggleterm').setup({
	open_mapping = [[<c-/>]],
	shade_filetypes = {},
	direction = 'float'
})

require("ibl").setup()
