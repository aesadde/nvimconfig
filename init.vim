" ===[ vim-plug init ]=== {{{1
call plug#begin('~/.config/plugins')
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
"===[ Layout ]=== {{{2
"Colorschemes
Plug 'kien/rainbow_parentheses.vim' "Multi-color parantheses
Plug 'crusoexia/vim-monokai'


"Statusline, Splits, etc.
Plug 'bling/vim-airline'      " status line
Plug 'vim-airline/vim-airline-themes' " status line themes
Plug 'majutsushi/tagbar'      " Tagbar
Plug 'zhaocai/GoldenView.Vim' " better splits
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
"2}}}
"===[ Enhancements / Tools ]=== {{{2
Plug 'tpope/vim-commentary'   " add comments easily
Plug 'tpope/vim-surround'     " surround things
Plug 'Raimondi/delimitMate'   " auto close pairs
Plug 'junegunn/vim-easy-align'
Plug 'pgilad/vim-skeletons'  " automatically insert templates
Plug 'Shougo/unite.vim'
Plug 'Shougo/neoyank.vim'
Plug 'osyo-manga/unite-quickfix'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'sbdchd/neoformat'  " code formatter
Plug 'tmhedberg/SimpylFold'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'benekastah/neomake'  " linter a la Syntastic
Plug 'ludovicchabant/vim-gutentags' "manage tags
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Snippets
Plug 'SirVer/ultisnips'    " Track the engine.
Plug 'honza/vim-snippets'  " Lots of Snippets
"2}}}
"===[ Programming ]=== {{{2
"Haskell
Plug 'eagletmt/neco-ghc',                 { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle',               { 'for': 'haskell' }
Plug 'neovimhaskell/haskell-vim',         { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim',               { 'for': 'haskell' }
Plug 'mpickering/hlint-refactor-vim',     { 'for': 'haskell' }
Plug 'Twinside/vim-syntax-haskell-cabal', { 'for': 'cabal'   }
Plug 'Twinside/vim-haskellFold',          { 'for': 'haskell' }

"Python
Plug 'zchee/deoplete-jedi' ,         { 'for': 'python' }
Plug 'timothycrosley/isort',         { 'for': 'python' }
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'davidhalter/jedi-vim',         { 'for': 'python' }

"C++
Plug 'zchee/deoplete-clang', {'for': ['clang','cpp'] }

" Git
Plug 'airblade/vim-gitgutter' " see which lines have changed from last commit

"Scala
Plug 'derekwyatt/vim-scala',          {'for': 'scala'} "Scala syntax highlighting
Plug 'artur-shaik/vim-javacomplete2', {'for': 'scala,java'}

"Golang
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'zchee/deoplete-go', { 'do': 'make'}

"

" ===[ Plugins for writing ]=== {{{2
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'
Plug 'reedes/vim-wordy',             { 'for': [ 'pandoc', 'markdown' ,'tex' ] }
Plug 'reedes/vim-pencil',            { 'for': [ 'pandoc', 'markdown', 'tex' ] }
Plug 'reedes/vim-lexical',           { 'for': [ 'pandoc', 'markdown', 'tex' ] }
Plug 'junegunn/goyo.vim'      " Distraction free writing

"2}}}
call plug#end()
"1}}}
" ===[ All options ]=== {{{1
source $HOME/dotfiles/nvim/opciones/plugins.vim
source $HOME/dotfiles/nvim/opciones/globales.vim        " global options
source $HOME/dotfiles/nvim/opciones/keys.vim            " maps and keys
source $HOME/dotfiles/nvim/opciones/customFunctions.vim " simple custom functions
"1}}}
"===[ color options ]=== {{{1
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

syntax enable
set termguicolors
set background=dark
colorscheme molokai
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
"1}}}
" ===[ Useful autocommands ]===  {{{1
" ===[ Vim marker folding method for vimscripts ]=== {{{2
au! BufNewFile,BufRead * if getline(1) =~ '"ft=vim' | setf vim | endif

autocmd BufWritePre * :%s/\s\+$//e
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType sh setlocal foldmethod=marker
augroup END
" 2}}}
" ===[ Autoload configuration when this file changes ($MYVIMRC) ]=== {{{2
" Source the vimrc file after saving it
augroup sourcing
  autocmd!
  autocmd bufwritepost $MYVIMRC source $MYVIMRC
augroup END
" 2}}}
" ===[ Custom filetypes ]=== {{{2
au! BufRead,BufNewfile *.fun set filetype=haskell "Fun Language (Oxford)
au! BufNewFile,BufRead *.scpt set filetype=javascript "Osx scripts"
let g:tex_flavor = 'tex' "use always tex for latex
" Git commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" 2}}}
" 1}}}
" ===[ Acknowledgments ]=== {{{1
" Many things in these files are taken from elsewhere
" bitbucket.org/sjl/dotfiles/src/cbbbc897e9b3/vim/vimrc
" blog.sanctum.geek.nz/vim-command-typos/
" vimrcfu.com/snippet/76
" 1}}}
