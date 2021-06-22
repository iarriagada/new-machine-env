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

" set shortmess+=c

" show line numbers
set mouse=n

"i set mouse+=a

if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

set nu

" Wrap around long lines and prevent words from breaking at window limit
set wrap
set linebreak

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
"let python_highlight_all = 1

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

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
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" Max line length
let g:pymode_options_max_line_length = 79
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

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 80
    autocmd FileType python highlight Excess ctermfg=Black ctermbg=LightYellow
    autocmd FileType python highlight Excess guibg=LightYellow1 guifg=Black
    autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set nowrap
    augroup END

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

map <F2> :NERDTreeToggle<CR>
