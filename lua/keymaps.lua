-- Setting up leader key
vim.g.mapleader = ' '

-- Telescope standard keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Show Neotree window
vim.keymap.set('n', '<leader>e', ':Neotree<CR>', {})
-- Show Tagbar window
vim.keymap.set('n', '<leader>t', ':TagbarToggle<CR>', {})
-- Show Mason window
vim.keymap.set('n', '<leader>m', ':Mason<CR>', {})
-- Exit from INSERT mode
vim.keymap.set('i', 'jj', '<ESC>', {noremap = true, silent = true})
-- Show help
vim.keymap.set('n', '<leader>w', ':W<CR>', {})

-- Buffer close
vim.keymap.set('n', '<leader>bc', ':bd<CR>', {})

-- Cheatsheet open
vim.keymap.set('n', '<leader>cs', ':Cheatsheet<CR>', {})

-- Disabling highlights after search
vim.keymap.set('n', '<leader>h', ':noh<CR>', {})

-- Moving between opened windows
vim.keymap.set('n', '<leader>wk', '<C-w>k', {noremap = true, silent = true}) -- Up
vim.keymap.set('n', '<leader>wj', '<C-w>j', {noremap = true, silent = true}) -- Down
vim.keymap.set('n', '<leader>wh', '<C-w>h', {noremap = true, silent = true}) -- Left
vim.keymap.set('n', '<leader>wl', '<C-w>l', {noremap = true, silent = true}) -- Right

-- Show Calendar window
vim.keymap.set('n', '<leader>cal', ':CalendarVR<CR>', {noremap = true, silent = true})

vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
vim.keymap.set("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
vim.keymap.set("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
vim.keymap.set("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
vim.keymap.set("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
vim.keymap.set("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
