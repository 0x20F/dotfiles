#: ix-config
#: to: $HOME/.config/nvim


syntax on


" Vim Features
" -----------------------------
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


" Plugins
" -----------------------------
call plug#begin('~/.config/nvim/bundle')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'tpope/vim-fugitive'
Plug 'raimondi/delimitMate'
Plug 'itchyny/lightline.vim'
Plug 'preservim/NERDTree'
Plug 'sheerun/vim-polyglot'

" Themes
Plug 'rakr/vim-one'
Plug 'crusoexia/vim-monokai'

call plug#end()


" Misc
" -----------------------------
colorscheme one
set background=dark
set termguicolors
" Turn the background and line number background transparent
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
let g:lightline = { 'colorscheme': 'one' }


" Custom file highlights
au BufNewFile,BufRead /*.rasi setf css
" Autoquit if nerdtree is the only active tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" ncm2 setup
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
let g:NERDTreeShowHidden=1


" Shortcut remapping
" -----------------------------
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h

nnoremap <silent> ,<space> :noh<CR>
nnoremap <C-W>v :vsplit<CR>
nnoremap <C-W>h :split<CR>

" Requires 'fzf'
nnoremap <C-S-o> :Files<CR>
" Requires 'ripgrep'
nnoremap <C-S-f> :Rg<CR>

nmap <F3> :NERDTreeToggle<CR>






