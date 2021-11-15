"VimwikiBacklinks* ===[ vim-plug init ]=== {{{1
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
Plug 'altercation/vim-colors-solarized'
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'sjl/badwolf'
Plug 'reedes/vim-colors-pencil'
Plug 'morhetz/gruvbox'

"Statusline, Splits, etc.
Plug 'zhaocai/GoldenView.Vim' " better splits
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
"2}}}
"===[ Enhancements / Tools ]=== {{{2
Plug 'tpope/vim-commentary'   " add comments easily
Plug 'tpope/vim-surround'     " surround things
Plug 'jiangmiao/auto-pairs'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'glepnir/dashboard-nvim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'sheerun/vim-polyglot' " Syntax support for a lot of languages
Plug 'ekalinin/Dockerfile.vim' " Docker


" Snippets
Plug 'SirVer/ultisnips'    " Track the engine.
Plug 'honza/vim-snippets'  " Lots of Snippets
Plug 'pgilad/vim-skeletons' " file template using UltiSnips
"2}}}
"===[ Programming ]=== {{{2
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go' "Golang

" Git
Plug 'airblade/vim-gitgutter' " see which lines have changed from last commit
Plug 'tpope/vim-fugitive'

"2}}}
" ===[ Plugins for writing ]=== {{{2
Plug 'reedes/vim-lexical',           { 'for': [ 'pandoc', 'markdown', 'tex' ] }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'godlygeek/tabular' " tabular plugin is used to format tables
Plug 'elzr/vim-json' " JSON front matter highlight plugin
Plug 'plasticboy/vim-markdown'

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


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
" Ensure 256 colour support if the terminal supports it
if &term == "xterm" || &term == "xterm-256color" || &term == "screen-bce" || &term == "screen-256color" || &term == "screen" || &term == "tmux-256color-italic"
    let g:enable_bold_font = 1
    let g:enable_italic_font = 1
endif

" This is what sets vim to use 24-bit colors. It will also work for any version of neovim
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Match the color theme used in iterm
set background=dark
if has("gui_vimr")
  colorscheme solarized
  set background=light
  set conceallevel=0
elseif !empty($ITERM_PROFILE)
  colorscheme $ITERM_PROFILE
else
  colorscheme palenight
endif
"1}}}
"===[ statusline ]=== {{{1
set laststatus=2
set statusline=
set statusline+=%0*\ %{toupper(mode())} "display Mode
set statusline+=%2*\ %l/%L:%c "display Line/Total lines : current column
set statusline+=\ %*
set statusline+=%1*\ ‹‹
set statusline+=%3*\ %F "display full file path
set statusline+=%1*\ ››
set statusline+=%=
set statusline+=%3*\ ‹‹
set statusline+=\ %{(&fenc!=''?&fenc:&enc)} "display file encoding
set statusline+=%3*\ ::
set statusline+=\ %{WordCount()}\ words,
set statusline+=%3*\ ::
set statusline+=%3*\ %p "display percentage of file (where we are)
set statusline+=%3*\ ››\ %*
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
" ===[ Acknowledgments ]=== {{{1
" Many things in these files are taken from elsewhere
" bitbucket.org/sjl/dotfiles/src/cbbbc897e9b3/vim/vimrc
" blog.sanctum.geek.nz/vim-command-typos/
" vimrcfu.com/snippet/76
" 1}}}
