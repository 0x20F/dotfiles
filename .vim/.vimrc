syntax on
filetype plugin indent on




" Vim features
" ========================
set smartindent     " Indent based on programming language
set autoindent      " For smartindent
set tabstop=4       " Number of visual spaces per tab
set shiftwidth=4    " Number of spaces when shift indenting
set expandtab       " Tabs to spaces
set number          " Show line numbers
set showmatch       " Highlight matching [{()}]
set incsearch       " Search as characters are entered
set hlsearch        " Highlight matches when searching
set cursorline      " Highlight current line
set laststatus=2    " So lightline renders properly
set noshowmode      " Hides current mode status 
set noruler         " For lightline 
set hidden          " For lightline
set updatetime=100  " For plugins that need to update faster




colorscheme iceberg
" To allow for transparent terminal background
hi Normal guibg=NONE ctermbg=NONE
" Set lightline color scheme
let g:lightline = { 'colorscheme': 'wombat' }




" Pathogen packages
" ========================
"   - tpope/vim-fugitive            : git on steroids
"   - raimondi/delimitMate          : autoclose quotes, parenthesis, etc.
"   - preservim/NERDTree            : directory tree 
"   - junegunn/fzf                  : fuzzy file searching
"       - fzf.git
"       - fzf.vim.git
"       - ripgrep (BurntSushi)      : for fuzzy searching inside files
"   - sheerun/polyglot              : multiple language color highlighting
"   - itchyny/lightline.vim         : bar at the bottom 
"
" ------------------------
"  pathogen path        : .vim/autoload
"  pathogen bundle      : .vim/bundle 
"
execute pathogen#infect()
call pathogen#helptags()




" Autoquit if nerdtree is the only active tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif




" Shortcut remapping
" ========================
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h

nnoremap <silent> ,<space> :noh<CR>
nnoremap <C-W>v :vsplit<CR>
nnoremap <C-W>h :split<CR>

" These 2 require 'fzf' and 'ripgrep', respectively
nnoremap <C-S-o> :Files<CR>   
nnoremap <C-S-f> :Rg<CR>      

nmap <F3> :NERDTreeToggle<CR>





