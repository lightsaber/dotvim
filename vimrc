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

set background=dark
set t_Co=16
let g:solarized_termcolors=16
colorscheme solarized

"editor options
set number
set ignorecase
set nowrap
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set smarttab
set smartindent
set autoindent
set hlsearch
set incsearch
set showmatch
set title
set nobackup
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class

" Enable Code Folding
set fmr={,}
set fdm=marker
set nofoldenable
set foldlevel=2

" Window Movement with split windows
" TODO: map to super+arrows
"map <c-j> <c-w>j
"map <c-k> <c-w>k
"map <c-l> <c-w>l
"map <c-h> <c-w>h
map <leader>a :Ack!
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Set the Window Size
"if has("gui_running")
"else
"endif
 
" Bind F6 to CTAGS
nnoremap <F6> :!/usr/bin/ctags -R --python-kinds=-i *.py<CR>

" Mapping for Tasklist
map <leader>td <Plug>TaskList

" Bind F4 to :TlistToggle
nnoremap <F4> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1


" Enable Omni complete
" autocmd FileType python set omnifunc=pythoncomplete#Complete
" inoremap <C-space> <C-x><C-o>
autocmd FileType ruby set omnifunc=ruby#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" jQuery Syntax
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

"Fuzzy Finder
nnoremap <C-S-r> :FuzzyFinderFile \*\*/<CR>

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

"set up php make
map <C-B> :w !php -l<CR>
set makeprg=php\ -l\ %
set autowrite

inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>
