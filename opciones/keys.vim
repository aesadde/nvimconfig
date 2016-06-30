"===[ map Leader ]=== {{{1
let mapleader=","
let g:mapleader=","
let g:localLeader=","
inoremap jj <ESC>
"1}}}
"===[ MISC ]=== {{{1
"fast saving
nnoremap <Leader>w :w!<CR>

"Clear highlights from search
nnoremap <Leader>/ :nohls<CR>

"fast vimrc editing
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
"1}}}
" === [ Text formatting ]=== {{{
"toggle paste mode
nnoremap <Leader>ps :set nopaste<CR>
nnoremap <Leader>sp :set paste<CR>
inoremap <C-v> <esc>"*gP<CR>
vnoremap <C-c> "*y<CR>

"paste key, con buena indentacion
nnoremap <Leader>p p=`]
"indenta de manera correcta todo el archivo
nnoremap <Leader>= 1G=G
"}}}
" ===[ Plugins shortcuts ]=== {{{1
"===[ gundo ]=== {{{2
nnoremap <Leader>u :GundoToggle<CR>
"2}}}
"===[ nerdtree ]=== {{{2
map <Leader>n :NERDTreeToggle<CR>
"2}}}

"===[ haskell plugins ]=== {{{2
"ghc-mod
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

" hlint
map <silent> <leader>hr :call ApplyOneSuggestion()<CR>
map <silent> <leader>hR :call ApplyAllSuggestions()<CR>
" Hoogle the word under the cursor
nnoremap <silent> <leader>hh :Hoogle<CR>
" Hoogle and prompt for input
nnoremap <leader>hH :Hoogle
" Hoogle for detailed documentation (e.g. "Functor")
nnoremap <silent> <leader>hi :HoogleInfo<CR>
" Hoogle for detailed documentation and prompt for input
nnoremap <leader>hI :HoogleInfo
" Hoogle, close the Hoogle window
nnoremap <silent> <leader>hz :HoogleClose<CR>
"2}}}

"===[ latex-box ]=== {{{2
" display current line in Skim
map <silent> <Leader>ls :silent
            \ !/Applications/Skim.app/Contents/SharedSupport/displayline
            \ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>"
            \ "%:p" <CR>
"2}}}

"=== [ Tagbar ]=== {{{2
"abre la lista de tags
nnoremap <Leader>tb :TagbarToggle<CR>
"2}}}

"=== [ Unite ]=== {{{2
" search a file in the filetree
nnoremap <C-P> :<C-u>Unite  -buffer-name=files   -start-insert buffer file_rec/async:!<cr>
" reset not it is <C-l> normally
nnoremap <leader>ur <Plug>(unite_restart)
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>

nnoremap // :Unite grep:.<cr>
nnoremap <leader>b :Unite buffer<cr>

"grep tasks
nnoremap <silent><leader>ut :Unite -silent -auto-resize grep:%::TODO\:\|FIXME\:\|NOTE\:<CR>

function! UltiSnipsCallUnite()
  Unite -start-insert -winheight=100 -immediately -no-empty ultisnips
  return ''
endfunction

inoremap <silent> <F12> <C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
nnoremap <silent> <F12> a<C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
"2}}}
"1}}}
" ===[ Motion ]=== {{{1
"one screen line at a time (instead of vim line)
nnoremap j gj
nnoremap k gk
nnoremap J <c-F>
nnoremap K <c-B>

"windows navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
noremap <c-h> <c-w>h

"this are to get used to NOT use arrow keys in insert mode (good practice is
"to exit to normal mode and move using normal keysnormal keys
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Move to next error after make
nnoremap  <leader>ne :cnext<cr>
nnoremap  <leader>pe :cprevious<cr>

"deoplete tab completion
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
" inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
"
"===[ UltiSnips ]=== {{{2
" let g:UltiSnipsJumpForwardTrigger = "<TAB>"
" let g:UltiSnipsJumpBackwardTrigger= "<S-TAB>"
"2}}}
"1}}}
