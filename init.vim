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
Plug 'drewtempelmeyer/palenight.vim'

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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'

" Git
Plug 'airblade/vim-gitgutter' " see which lines have changed from last commit
Plug 'tpope/vim-fugitive'

" Docker
Plug 'ekalinin/Dockerfile.vim'
"2}}}
" ===[ Plugins for writing ]=== {{{2
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'reedes/vim-lexical',           { 'for': [ 'pandoc', 'markdown', 'tex' ] }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
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
if (has("termguicolors"))
  set termguicolors
endif
set background=dark
" Match the color theme used in iterm
if !empty($ITERM_PROFILE)
  colorscheme $ITERM_PROFILE
else
  colorscheme palenight
endif
"1}}}
"===[ statusline ]=== {{{1
" Function: display errors from Ale in statusline
function! LinterStatus() abort
   let l:counts = ale#statusline#Count(bufnr(''))
   let l:all_errors = l:counts.error + l:counts.style_error
   let l:all_non_errors = l:counts.total - l:all_errors
   return l:counts.total == 0 ? '' : printf(
   \ 'W:%d E:%d',
   \ l:all_non_errors,
   \ l:all_errors
   \)
endfunction
set laststatus=2
set statusline=
set statusline+=%0*\ %{toupper(mode())} "display Mode
set statusline+=%2*\ %l/%L:%c "display Line/Total lines : current column
set statusline+=\ %*
set statusline+=%1*\ ‹‹
set statusline+=%3*\ %F "display full file path
set statusline+=%1*\ ››
set statusline+=%=
set statusline+=%3*\ %{LinterStatus()} "display ALE status
set statusline+=%3*\ ‹‹
set statusline+=\ %{(&fenc!=''?&fenc:&enc)} "display file encoding
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
" 1}}}
" ===[ Acknowledgments ]=== {{{1
" Many things in these files are taken from elsewhere
" bitbucket.org/sjl/dotfiles/src/cbbbc897e9b3/vim/vimrc
" blog.sanctum.geek.nz/vim-command-typos/
" vimrcfu.com/snippet/76
" 1}}}
