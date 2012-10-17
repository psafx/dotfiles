" Pathogen to load everything
call pathogen#infect()

" Use Vim defaults instead of 100% vi compatibility
set nocompatible
" Modelines have historically been a source of security/resource
set nomodeline

" Enables syntax highlighting
syntax on

" Set colorscheme
if &term == "xterm-256color" || &term == "linux"
  set t_Co=256
  colorscheme Tomorrow-Night-Bright
"  colorscheme monokai
"  colorscheme leo
else
  colorscheme desert
  " Set highlight of matching bracket
  highlight MatchParen ctermbg=4
endif

" Centralize backups, swapfiles and undo history
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/tmp
"set undodir=$HOME/.vim/undo

" Remember more commands and search history
set history=1000
set undolevels=1000

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Load indentation rules and plugins according to the detected filetype
if has("autocmd")
  filetype plugin indent on
endif

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Don't show the intro message when starting vim
set shortmess=atI
" Use UTF-8 without BOM encoding
set encoding=utf-8 nobomb
" Don't add empty newlines at the end of files
set noeol
if has('win16') || has('win32') || has('win64')
  set fileformat=dos
else
  set binary
  set fileformat=unix
endif

" Watch for file changes
set autoread

" Show the filename in the window titlebar
if !has("gui_running")
  set titleold=
  if (&term == "xterm" && &t_ts == "")
    let &t_ts = "\e]2;"
  endif
  if &t_ts != ""
    set title titlestring=%t%m\ -\ VIM
  endif
endif

" Enable mouse in all modes
"set mouse=a
" Hide buffers when they are abandoned
set hidden
" Toggle paste mode with F2
set pastetoggle=<F2>

" Show the cursor position all the time
set ruler
" Show line number
"set number
" Show the current mode
set showmode
" Show (partial) command in status line
set showcmd
" Show matching brackets
set showmatch
set matchtime=3
" Do case insensitive matching
set ignorecase
" Do smart case matching
set smartcase
" Incremental search
set incsearch
" Highlight search
set hlsearch
" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" Report all changes
set report=0
" Open new split windows below current
"set splitbelow

" More powerful backspacing
set backspace=indent,eol,start
" Don't wrap lines
"set nowrap
" Don't reset cursor to start of line when moving around.
set nostartofline
" Enhance command-line completion
set wildmenu
set wildmode=list:longest,full
" Ignore files
set wildignore+=*.o,*.obj,*.r,*.class,*.pyc,*.so,*.sl,*.exe,*.dll,*.manifest
set wildignore+=*.tar,*.tgz,*.gz,*.bz2,*.dmg,*.rar,*.7z,*.zip,*.pdf
set wildignore+=*.jpg,*.png,*.gif,*.bmp,*.jpeg
set wildignore+=*CVS/*,*.svn/*,*.git/*
set wildignore+=*.toc,*.aux,*.dvi,*.DS_Store

" Optimize for fast terminal connections
set ttyfast
set lazyredraw

" Highlight whitespaces
set list
if &termencoding == "utf-8"
  set list listchars=tab:»·,trail:·,extends:>,precedes:<,nbsp:_
else
  set list listchars=tab:>-,trail:.,extends:>,precedes:<,nbsp:_
endif

" Highlight current line
"set cursorline

" Use C-indenting
set cindent

" Disable folding
set nofoldenable

" Remap colon key to semicolon
nnoremap ; :
" Remap J K in wrap mode
nnoremap j gj
nnoremap k gk

" Turn off error bells
set noerrorbells
set visualbell
set t_vb=

" Keep at least 3 lines around the cursor
set scrolloff=3
set sidescrolloff=5

" Always show status line
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]\ [%{&fo}]

" Nginx
au BufNewFile,bufRead /etc/nginx/* set ft=nginx
au BufNewFile,BufRead *.tpl set filetype=html
au BufNewFile,BufRead *.go set filetype=golang

" Set tab size for specific file format
au FileType php,perl setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
au FileType html,xhtml,xml,htmldjango setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
au FileType css setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
au FileType javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
au FileType python,objc,golang setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
au FileType nginx setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

" Match TODO /\s\+$/
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
