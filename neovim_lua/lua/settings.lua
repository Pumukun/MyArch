local g = vim.g
local opt = vim.opt

opt.mouse = 'a'
opt.number = true
opt.hidden = true
opt.cursorline = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.encoding = 'utf8'
opt.history = 5000
opt.clipboard = 'unnamedplus'

-- |, ¦, ┆, ┊
vim.cmd'set list lcs=tab:\\¦\\ '
