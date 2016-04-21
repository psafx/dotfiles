" Use Vim settings
set nocompatible

" Plugins
execute pathogen#infect()

" Syntax, FileType
syntax on
filetype plugin indent on

" Colorscheme
if &term == "xterm-256color" || &term == "linux"
  set t_Co=256
  colorscheme Tomorrow-Night-Bright
endif

" General
set autoread
set backspace=indent,eol,start
set clipboard^=unnamed
set complete=.,w,b,t
set completeopt+=longest,menuone
set dictionary+=/usr/share/dict/words
set encoding=utf-8 nobomb
set fileformats=unix
set hidden
set nostartofline
set nrformats-=octal
set path=.,**
set pastetoggle=<F10>
set switchbuf=useopen,usetab
set ttimeoutlen=50
set wildmenu wildcharm=<C-z>

" UI
set formatoptions+=1j
set lazyredraw
set linebreak
set list listchars=tab:»\ ,extends:›,precedes:‹,nbsp:_,trail:·
set nofoldenable
set nojoinspaces
set number
set scrolloff=3
set sidescrolloff=5
set showcmd showbreak=↪
set splitright

" Statusline
set laststatus=2
set statusline=\ %f%m%r%h%w\ %({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)

" Searching
set hlsearch incsearch
set ignorecase smartcase
set showmatch matchtime=2
set grepprg=ag\ --hidden\ --vimgrep grepformat^=%f:%l:%c:%m

" Indenting
au BufRead * set autoindent
set smarttab expandtab
set shiftround shiftwidth=2 softtabstop=2 tabstop=2

" Backup
"set history=200
set noswapfile
"set backup backupdir=~/.vim/backup/
"set directory=~/.vim/tmp

" Turn off error bells
set noerrorbells
set visualbell
set t_vb=

" Show whitespace
if &t_Co == 256
  hi ExtraWhiteSpace ctermbg=160 guibg=196
  au ColorScheme * hi ExtraWhiteSpace ctermbg=160 guibg=196
else
  hi ExtraWhiteSpace ctermbg=red guibg=red
  au ColorScheme * hi ExtraWhiteSpace ctermbg=red guibg=red
endif
au BufEnter * match ExtraWhiteSpace /\s\+$/
au InsertEnter * match ExtraWhiteSpace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Switch between splits
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>

" Move by display lines
nnoremap <expr> j  v:count == 0 ? 'gj' : 'j'
nnoremap <expr> k  v:count == 0 ? 'gk' : 'k'
nnoremap <expr> gj v:count == 0 ? 'j' : 'gj'
nnoremap <expr> gk v:count == 0 ? 'k' : 'gk'

" Remap some default keys to be more useful
nnoremap ; :
nnoremap Q gq
nnoremap Y y$
nnoremap S i<CR><ESC>^m`gk:silent! s/\s\+$//<CR>:noh<CR>``
nnoremap + za
xnoremap * :<C-u>call visualfuncs#start('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call visualfuncs#start('?')<CR>/<C-R>=@/<CR><CR>

" Make <c-l> clear the highlight as well as redraw
nnoremap <C-l> :nohls<CR><C-l>
inoremap <C-L> <C-O>:nohls<CR>

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Set file type
au BufNewFile,BufRead /etc/nginx/* set ft=nginx
au BufNewFile,BufRead *.tpl set filetype=html
au BufNewFile,BufRead *.go set filetype=golang

" Set tab size for specific file format
au FileType golang,java,objc,python,php,nginx setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
au FileType javascript,css setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2

"Jump to last cursor position when opening a file
au BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if line("'\"") > 0 && line("'\"") <= line("$")
        exe "normal! g`\""
        normal! zz
    endif
endfunction
