"Opciones Globales
"===[ GUI options ]===" {{{1
set title        " para darle a la ventana el nombre del archivo
set nowrap       " una linea de texto por pantalla
set number       " show line numbers
set lazyredraw   " redraw screen only when needed
set textwidth=80 " maximo de caracteres por linea
set formatoptions+=tcq
set showmatch    " show matching brackets
set cursorline   " set cursorcolumn
set linebreak    " pica lineas largas en el buffer para que se vea mejor
set display+=lastline
set modeline
"1}}}
"===[ Text Formatting options ]=== {{{1
set spell
set spelllang=en_us
set smartindent " smart indent
set noautoindent
set smarttab
set splitright  " Make vertical splits work sanely
set splitbelow  " Make horizontal splits work sanely
set shiftwidth=2
set shiftround
set expandtab
set softtabstop=2
set tabstop=2
set ignorecase  " better search ignoring capital letters
set smartcase

set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

filetype on
filetype plugin on
filetype indent on
"1}}}
"===[ Show 80th column ]=== {{{1
if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif
"1}}}
"===[ Disable all bells ]=== {{{1
set t_vb=
set novisualbell " disable visual bell
set noerrorbells " disable error bell
autocmd! GUIEnter * set vb t_vb=
"1}}}"
"===[ Line Return on reopening ]=== {{{1
" Make sure Vim returns to the same line when you reopen a file.
" Return to last edit position when opening files (You want this!)
augroup last_edit
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "normal! g`\"" |
        \ endif
augroup END
" Remember info about open buffers on close
set viminfo^=%
"1}}}
"===[ Wildmenu ]=== {{{1
set wildmenu
set wildmode=longest,list,full
set wildignore+=.hg,.git,.svn                        " Version control
set wildignore+=*.aux,*.out,*.toc                    " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg       " binary images
set wildignore+=**.~,.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                                " compiled spelling list
set wildignore+=*.hi                                 " haskell bin
set wildignore+=*.sw?                                " Vim swap files
set wildignore+=*.DS_Store                           " OSX stuff
set wildignore+=*.pyc,__pycache__                    " Python stuff"
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox,.stack-work
"1}}}
"===[ Others ]=== {{{1
set directory=/tmp                    " directory to place swap files in
set noswapfile                        " no quiero mas swaps
set fileformats=unix,mac,dos          " support all three, in this order
set modelines=1
autocmd BufEnter * :cd %:p:h          " auto-change directory to current buffer
set dictionary+=/usr/share/dict/words
set nobackup                          " Don't want any backup magic
set tags=./tags,./../tags,./*/tags

let $PATH = $PATH . ':' . expand("~/.local/bin") "faster tags

"1}}}
"===[ Folding ]=== {{{1
set foldmethod=indent
set foldlevel=99
"1}}}
"===[ Undo options ]=== {{{1
" enable persistent undo
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/tmp/undo
  if !isdirectory(&undodir)
    call mkdir(&undodir, 'p')
  endif
  set undoreload=10000
endif
"1}}}
" ===[ Omni completion options ]=== {{{
set omnifunc=syntaxcomplete#Complete
" set completeopt=longest,menu,preview
set completeopt=menuone,menu,longest
" }}}
" ===[ Annoyance Fixers ]==== {{{1
nnoremap <F1> <nop> "used to toggle help
nnoremap Q <nop> "used to start ex mode
nnoremap K <nop> "man pages wtf

" correct vim commands typos
" from: http://blog.sanctum.geek.nz/vim-command-typos/
if has("user_commands")
  command! -bang -nargs=? -complete=file E e<bang> <args>
  command! -bang -nargs=? -complete=file W w<bang> <args>
  command! -bang -nargs=? -complete=file Wq wq<bang> <args>
  command! -bang -nargs=? -complete=file WQ wq<bang> <args>
  command! -bang Wa wa<bang>
  command! -bang WA wa<bang>
  command! -bang Q q<bang>
  command! -bang QA qa<bang>
  command! -bang Qa qa<bang>
endif

" show cursorline in the current window
augroup cline
  au!
  au WinLeave * set nocursorline
  au WinEnter * set cursorline
  au InsertEnter * set cursorline
  au InsertLeave * set cursorline
augroup END

"relative numbers
augroup every
  autocmd!
  au InsertEnter * set norelativenumber
  au InsertLeave * set relativenumber
augroup END
"1}}}
" ===[ Print options ]=== {{{
set printoptions=paper:letter,syntax:y,wrap:y,duplex:long
" }}}
