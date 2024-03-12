" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'tpope/vim-fugitive'

Plug 'mbbill/undotree'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdcommenter'
Plug 'ryanoasis/vim-devicons'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }

"colorschemes
Plug 'rafi/awesome-vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'junegunn/seoul256.vim'
Plug 'rebelot/kanagawa.nvim'
Plug 'sainnhe/sonokai'

" Initialize plugin system
call plug#end()

lua << EOF
require('keymaps')
require('colorscheme')
require('misc')
require('settings')

change_color_scheme('OceanicNext', 'dark')

EOF

" vim airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_statusline_ontop=0
let g:airline_theme='deus'
let g:airline#extensions#tabline#formatter = 'default'

