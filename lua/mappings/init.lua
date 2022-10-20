local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }


vim.g.mapleader = ' '

-- nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<CR>', opts)

-- window
map('n', '<C-h>', '<C-w><C-h>', opts)
map('n', '<C-j>', '<C-w><C-j>', opts)
map('n', '<C-k>', '<C-w><C-k>', opts)
map('n', '<C-l>', '<C-w><C-l>', opts)

-- tab
map('n', '<Tab>', ':bn<CR>', opts)
map('n', '<S-Tab>', ':bp<CR>', opts)
map('n', '<C-w>', ':bd<CR>', opts)

map('i', '<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]],   { noremap = true, expr = true })
map('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })

-- scrool
map('n', '<C-d>', '10j', opts)
map('n', '<C-u>', '10k', opts)

-- lightspeed
map('n', '<leader>j', '<Plug>Lightspeed_s', opts)
map('n', '<leader>k', '<Plug>Lightspeed_S', opts)

-- telescope
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
map('n', '<leader><space>', ':Telescope buffers<CR>', opts)
map('n', '<leader>fb', ':Telescope current_buffer_fuzzy_find<CR>', opts)
