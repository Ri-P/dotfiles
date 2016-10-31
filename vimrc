set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'scrooloose/syntastic'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'embear/vim-localvimrc'

call plug#end()
" PlugInstall 		to install plugins
" PlugUpdate		to update plugins
" PlugUpgrade		to upgrade vim-plug itself

no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>

ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

inoremap jj <ESC>

syntax on
filetype on
filetype plugin indent on

set showcmd
set encoding=utf-8
set showmode
set visualbell
set cursorline
set relativenumber
set undofile

set cmdheight=2
set shortmess=a

let mapleader = ","

set wrap
set colorcolumn=80
au FocusLost * :wa

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>wc :wincmd q<cr>
nnoremap <leader>wr <C-W>r
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

colorscheme peachpuff

" tasklist
map <leader>td <Plug>TaskList

" compile
map <F2> :silent make\|redraw!\|cc<CR>

" debug,
" call :Pyclewn , :Cfile <executable>, :Cbreak <linenr> , :Crun
map <F5> :Cnext <CR>
map <F6> :Cstep <CR>
map <F7> :Ccontinue <CR>

" syntastic
" see also
" http://www.labri.fr/perso/fleury/posts/programming/using-clang-tidy-and-clang-format.html
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" localvimrc
let g:localvimrc_persistent = 1 "Store and restore decisions only if anser
				"was given in upper case (Y/N/A)

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" invoke syntastic manually with :SyntasticCheck
let g:syntastic_mode_map = {'mode': 'passive'}

let g:syntastic_cpp_checkers = ["clang_tidy"]
let g:syntastic_cpp_clang_tidy_exec = "/usr/bin/clang-tidy-3.9"
" view syntastic debug messages with :mes
let g:syntastic_debug = 0
let g:syntastic_cpp_clang_tidy_post_args = ""

" end syntastic

:highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
:match ExtraWhitespace /\s\+$/
