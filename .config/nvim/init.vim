#: ix-config
#: to: $HOME/.config/nvim


syntax on

set smartindent		" Indent based on programming language
set autoindent		" For smartindent
set tabstop=4		" Number of visual spaces per tab
set shiftwidth=4	" Number of spaces when shift indenting
set expandtab		" Tabs to spaces
set number		    " Show line numbers
set showmatch		" Highlight matching [{()}]
set incsearch		" Search as characters are entered
set hlsearch		" Highlight matches when searching
set cursorline		" Highlight current line

" Settings for lightline
set noshowmode
set noruler
set hidden
set laststatus=2



call plug#begin('~/.config/nvim/bundle')

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'tpope/vim-fugitive'
Plug 'raimondi/delimitMate'
Plug 'itchyny/lightline.vim'

" Themes
Plug 'rakr/vim-one'
Plug 'crusoexia/vim-monokai'

call plug#end()



" To allow for transparent background
colorscheme one
set background=dark
set termguicolors
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
let g:lightline = {
    \ 'colorscheme': 'one',
    \ }


" Custom file highlights
au BufNewFile,BufRead /*.rasi setf css


autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
