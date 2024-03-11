local kset = vim.keymap.set

-- vim
kset('n', '<leader>nt', ':lua NumberToggle()<CR>', { noremap = true, silent = true })

-- Telescope
kset('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
kset('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
kset('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })
kset('n', '<leader>fs', '<cmd>Telescope git_status<cr>', { noremap = true })

-- ctrl-c ctrl-v
kset('v', '<C-c>', 'y<Esc>')
kset('v', '<C-x>', 'd')
kset('n', '<C-v>', 'p')
kset('i', '<C-v>', '<Esc>pi')
kset('v', '<C-v>', 'p')

kset('n', '<leader>hl', '<cmd>GitGutterLineHighlightsToggle<cr><cmd>GitGutterLineNrHighlightsToggle<cr>', { noremap = true })
kset('n', '<leader>e', '<cmd>Ex<cr>')

kset('n', '<M-Right>', ':bn<cr>', { noremap = true })
kset('n', '<M-Left>', ':bp<cr>', { noremap = true })
kset('n', '<C-x>', ':bp |bd #<cr>', { noremap = true })

