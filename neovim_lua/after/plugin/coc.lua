vim.g.coc_global_extensions = {
    'coc-snippets',
    'coc-pairs',
    'coc-tsserver',
    'coc-eslint',
    'coc-prettier',
    'coc-json',
    'coc-python'
}

vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.cmdheight = 2
vim.opt.updatetime = 300
vim.opt.shortmess:append('c')
vim.opt.signcolumn = 'yes'

function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

vim.keymap.set('i', '<C-Space>', 'coc#refresh()', {expr = true})


local function show_documentation()
    if vim.bo.filetype == 'vim' or vim.bo.filetype == 'help' then
        vim.cmd('h ' .. vim.fn.expand('<cword>'))
    else
        vim.fn.CocAction('doHover')
    end
end

function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

vim.keymap.set("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

local function toggle_diagnostics()
    if vim.fn['coc#util#get_config']('diagnostic').enable then
        vim.opt.signcolumn = 'yes'
        vim.fn['coc#config']('diagnostic', {enable = false})
    else
        vim.opt.signcolumn = 'yes'
        vim.fn['coc#config']('diagnostic', {enable = true})
    end
    vim.cmd('silent call coc#rpc#restart()')
end

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

-- GoTo code navigation
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})

vim.keymap.set('n', '<leader>f2', '<Plug>(coc-rename)', {})
vim.keymap.set('x', '<leader>fo', '<Plug>(coc-format-selected)', {})
vim.keymap.set('n', '<leader>fo', '<Plug>(coc-format-selected)', {})

vim.opt.statusline:prepend('%{coc#status()}%{get(b:,"coc_current_function","")}')

vim.keymap.set('n', '<space>a', ':CocList diagnostics<CR>', {silent = true})
vim.keymap.set('n', '<space>e', ':CocList extensions<CR>', {silent = true})
vim.keymap.set('n', '<space>c', ':CocList commands<CR>', {silent = true})
vim.keymap.set('n', '<space>o', ':CocList outline<CR>', {silent = true})
vim.keymap.set('n', '<space>s', ':CocList -I symbols<CR>', {silent = true})
vim.keymap.set('n', '<space>j', ':CocNext<CR>', {silent = true})
vim.keymap.set('n', '<space>k', ':CocPrev<CR>', {silent = true})
vim.keymap.set('n', '<space>p', ':CocListResume<CR>i', {silent = true})

vim.g.coc_diagnostic_disable = 1
