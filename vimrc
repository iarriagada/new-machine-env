set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"plugins here

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'vim-scripts/indentpython.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'python-mode/python-mode'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'ap/vim-css-color'
Plugin 'vim-python/python-syntax'
"Plugin 'hail2u/vim-css-syntax'
Plugin 'wavded/vim-stylus'
Plugin 'jiangmiao/auto-pairs'

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim config here

let mapleader = "`"

colorscheme badwolf

"colorscheme goodwolf

"enable syntax highlighting
syntax enable

set noshowmode

set cmdheight=1

set backspace=indent,eol,start

filetype plugin on
set omnifunc=syntaxcomplete#Complete
" set shortmess+=c

" show line numbers
set mouse=n

"i set mouse+=a

" This enables mouse to work until the end of the screen
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

set nu

" Wrap around long lines and prevent words from breaking at window limit
set wrap linebreak

" indent when moving to the next line while writing code
set autoindent

" set tabs to have 4 spaces
set tabstop=4

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" expand tabs into spaces
set expandtab

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

"visual autocomplete for command menu
set wildmenu

" enable all Python syntax highlighting features
let python_highlight_all = 1

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" Auto load a file that has changed
set autoread

""""""""""""""""NerdTree config""""""""""""""""
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif

"""""""""""Jedi-Vim Config""""""""""
let g:jedi#force_py_version = 3
let jedi#popup_on_dot = 0
let jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = 2

"""""""""Python-Mode Config"""""""""
"Syntax
let g:pymode_python = 'python3'
"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" auto check on save
let g:pymode_lint_on_write = 0
"no auto fold
let g:pymode_folding = 0
" syntax highlighting (let python-syntax take care of highlighting)
"let g:pymode_syntax = 1
"let g:pymode_syntax_all = 1
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_syntax = 0
let g:pymode_syntax_all = 0
let g:pymode_syntax_indent_errors = 0 
let g:pymode_syntax_space_errors = 0
" Max line length
let g:pymode_options_max_line_length = 80
" Run Off (let jedi-vim handle this)
let g:pymode_run = 0
" Rope Off (let jedi-vim handle this)
let g:pymode_rope = 0
" Code completion off (let jedi-vim handle this)
let g:pymode_rope_completion = 0

""""""""""""Airline Config""""""""""""""""
let g:airline_powerline_fonts = 1
set laststatus=2

""""""REMAPS""""""
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
nmap <C-l> :PymodeLint<CR>

""""""auto-pairs""""""
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

map <C-j> cw<C-r>0<ESC>

map <F2> :NERDTreeToggle<CR>
