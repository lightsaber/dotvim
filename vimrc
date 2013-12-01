set nocompatible

" Call Pathogen
filetype off 
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype on
filetype plugin on
filetype plugin indent on

" Set the Map Leader
let mapleader=","

" Appearance
set background=dark
set t_Co=16
let g:solarized_termcolors=16
colorscheme solarized
syntax on
set guifont=Menlo\ Regular\ for\ Powerline:14

"editor options
set encoding=utf-8
set title
set number
set relativenumber
set nowrap
set nobackup
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set cursorline
set ruler
set showcmd
set tags=tags;/

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme = "bubblegum"


" Tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" Indenting
set smartindent
set autoindent

"searching
set ignorecase
set hlsearch
set incsearch
set showmatch

" Enable Code Folding
set fmr={,}
set fdm=marker
set nofoldenable
set foldlevel=2

" Window Movement with split windows
" TODO: map to super+arrows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"external tools
map <leader>a :Ack!
let g:ackprg="ack-grep -H --nocolor --nogroup --column"


" Set the Window Size
"if has("gui_running")
"else
"endif
 
" Bind F6 to CTAGS
nnoremap <F6> :!/usr/local/bin/ctags -R --exclude=.git --exclude=log *<CR>

" Mapping for Tasklist
map <leader>td <Plug>TaskList

" Bind F4 to :TlistToggle
nnoremap <F4> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1


" Enable Omni complete
" autocmd FileType python set omnifunc=pythoncomplete#Complete
" inoremap <C-space> <C-x><C-o>
" autocmd FileType ruby set omnifunc=ruby#Complete
" autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" let g:SuperTabDefaultCompletionType = "context"
" set completeopt=menuone,longest,preview

" jQuery Syntax
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
" Scala code formatting
au BufEnter *.scala setl formatprg=~/.vim/lib/scalariform.jar\ --stdin\ --stdout

" Add the virtualenv's site-packages to vim path
python << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>
