" ===[ vim-plug init ]=== {{{1
call plug#begin('~/.config/plugins')

Plug 'junegunn/vim-easy-align'
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite.vim'

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'benekastah/neomake'  " linter a la Syntastic
Plug 'sjl/gundo.vim'

" Plug 'Yggdroot/indentLine' " show indent lines
Plug 'SirVer/ultisnips'    " Track the engine.
Plug 'honza/vim-snippets'  " Snippets
Plug 'scrooloose/nerdtree'

"Haskell Plugins
Plug 'eagletmt/neco-ghc',                 { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle',               { 'for': 'haskell' }
Plug 'neovimhaskell/haskell-vim',       { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim',               { 'for': 'haskell' }
Plug 'mpickering/hlint-refactor-vim',     { 'for': 'haskell' }
Plug 'Twinside/vim-syntax-haskell-cabal', { 'for': 'cabal' }
Plug 'Twinside/vim-haskellFold',          { 'for': 'haskell' }

Plug 'pbrisbin/vim-syntax-shakespeare'

"Colorschemes
Plug 'kien/rainbow_parentheses.vim' "Multi-color parantheses
Plug 'junegunn/seoul256.vim'        "low contrat 'seoul colors'

"Other
Plug 'bling/vim-airline'      " status line
Plug 'tpope/vim-commentary'   " add comments easily
Plug 'tpope/vim-surround'     " surround things
Plug 'zhaocai/GoldenView.Vim' " better splits
Plug 'majutsushi/tagbar'      " Tagbar
Plug 'Raimondi/delimitMate'   " auto close pairs
Plug 'rizzatti/dash.vim'      " dash docsets
Plug 'junegunn/goyo.vim'      " Distraction free writing

" Git
Plug 'airblade/vim-gitgutter' " see which lines have changed from last commit
Plug 'tpope/vim-fugitive'     " git wrapper

"Pandoc
Plug 'vim-pandoc/vim-pandoc-syntax', {'for': 'markdown'}
Plug 'tpope/vim-markdown',           {'for': 'markdown'}
Plug 'rhysd/unite-redpen.vim',       {'for': 'markdown,latex,tex,txt'}

"Scala
Plug 'derekwyatt/vim-scala',          {'for': 'scala'} "Scala syntax highlighting
Plug 'artur-shaik/vim-javacomplete2', {'for': 'scala,java'}

"Latex Plugin
Plug 'vim-scripts/LaTeX-Box', { 'for': 'tex,md' } "best latex plugin ever

"iOS plugins
Plug 'eraserhd/vim-ios',       { 'for': 'cocoa,swift'} " ios options for vim
Plug 'vim-scripts/cocoa.vim',  { 'for': 'cocoa,swift'} " cocoa plugin
Plug 'Rip-Rip/clang_complete', { 'for': 'cocoa,swift'}
Plug 'toyamarinyon/vim-swift', { 'for': 'cocoa,swift'} " swift support
Plug 'tpope/vim-fugitive'                              " git from vim

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

set gfn=Monaco:h11 " Use large font by default in MacVim

syntax enable
set background=dark
colorscheme seoul256
"1}}}
" ===[ Useful autocommands ]===  {{{1
" Vim marker folding method for vimscripts {{{2
au! BufNewFile,BufRead * if getline(1) =~ '"ft=vim' | setf vim | endif
autocmd BufWritePre * :%s/\s\+$//e
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType sh setlocal foldmethod=marker
augroup END
" 2}}}
" Autoload configuration when this file changes ($MYVIMRC) {{{2
" Source the vimrc file after saving it
augroup sourcing
  autocmd!
  autocmd bufwritepost $MYVIMRC source $MYVIMRC
augroup END
" 2}}}
" Custom filetypes {{{2
au! BufRead,BufNewfile *.fun set filetype=haskell "Fun Language (Oxford)
au! BufNewFile,BufRead *.scpt set filetype=javascript

augroup markdown
  autocmd!
  au BufRead,BufNewFile *.md setfiletype markdown
  au BufRead,BufNewFile *.md UltiSnipsAddFiletypes markdown.tex
  au BufEnter *.md silent! cd ..
  au FileType markdown setlocal spell
  set conceallevel=0
  augroup END

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
