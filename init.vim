" ===[ vim-plug init ]=== {{{1
call plug#begin('~/.config/plugins')
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
"===[ Layout ]=== {{{2
"Colorschemes
Plug 'kien/rainbow_parentheses.vim' "Multi-color parantheses
Plug 'tomasr/molokai'
Plug 'rakr/vim-two-firewatch'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim'
Plug 'ayu-theme/ayu-vim'
Plug 'ayu-theme/ayu-vim-airline'

"Statusline, Splits, etc.
Plug 'bling/vim-airline'      " status line
Plug 'zhaocai/GoldenView.Vim' " better splits
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'

"2}}}
"===[ Enhancements / Tools ]=== {{{2
Plug 'tpope/vim-commentary'   " add comments easily
Plug 'tpope/vim-surround'     " surround things
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'sheerun/vim-polyglot' " Syntax support

" Snippets
Plug 'SirVer/ultisnips'    " Track the engine.
Plug 'honza/vim-snippets'  " Lots of Snippets
Plug 'pgilad/vim-skeletons' " file template using UltiSnips
"2}}}
"===[ Programming ]=== {{{2
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

Plug 'w0rp/ale'

"Python
Plug 'davidhalter/jedi-vim',         { 'for': 'python' }

"Golang
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'fatih/vim-go'

" Git
Plug 'airblade/vim-gitgutter' " see which lines have changed from last commit
Plug 'tpope/vim-fugitive'

" Docker
Plug 'ekalinin/Dockerfile.vim'

" ===[ Plugins for writing ]=== {{{2
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc-after'
Plug 'reedes/vim-lexical',           { 'for': [ 'pandoc', 'markdown', 'tex' ] }
Plug 'vimwiki/vimwiki'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-wordy'
"2}}}
call plug#end()
"1}}}
" ===[ All options ]=== {{{1
source $HOME/dotfiles/nvim/opciones/keys.vim            " maps and keys
source $HOME/dotfiles/nvim/opciones/plugins.vim
source $HOME/dotfiles/nvim/opciones/globales.vim        " global options
source $HOME/dotfiles/nvim/opciones/customFunctions.vim " simple custom functions
"1}}}
"===[ color options ]=== {{{1
syntax enable
set termguicolors
let ayucolor="mirage"   " for dark version of theme
let g:airline_theme='ayu' " if you have Airline installed and want the associated theme
colorscheme ayu
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
