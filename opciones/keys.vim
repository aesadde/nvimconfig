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
" ===[ Text formatting ]=== {{{
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
"===[ Tagbar ]=== {{{2
"abre la lista de tags
nnoremap <Leader>tb :TagbarToggle<CR>
"2}}}
"===[ Unite ]=== {{{2
" search a file in the filetree
nnoremap <C-P> :<C-u>:UniteWithProjectDir -start-insert file_rec/async:!<cr>
" reset not it is <C-l> normally
nnoremap <leader>ur <Plug>(unite_restart)
nnoremap <leader>y :<C-u>Unite -auto-resize -no-split -buffer-name=yank history/yank<cr>

nnoremap // :Unite grep:<cr>
nnoremap <leader>b :Unite buffer<cr>

"grep tasks
nnoremap <silent><leader>ut :Unite -silent -auto-resize grep:%::TODO\|FIXME\|NOTE<CR>

function! UltiSnipsCallUnite()
  Unite -start-insert -winheight=100 -immediately -no-empty ultisnips
  return ''
endfunction

" more options for working with unite
" From: https://github.com/Shougo/unite.vim/issues/790
autocmd filetype unite call s:unite_settings()
function! s:unite_settings()
	nnoremap <silent> <buffer><expr> v unite#do_action('right')
	inoremap <silent> <buffer><expr> <c-v> unite#do_action('right')
	nnoremap <silent> <buffer><expr> s unite#do_action('below')
	inoremap <silent> <buffer><expr> <c-s> unite#do_action('below')
	nnoremap <silent> <buffer><expr> l     unite#do_action('default')
	inoremap <silent> <buffer><expr> <c-l>
				\ getcurpos()[1]==1 ? "\<right>" : unite#do_action('default')
	imap <silent> <buffer> ;         <plug>(unite_choose_action)
	nmap <silent> <buffer> ;         <plug>(unite_choose_action)
	nmap <silent> <buffer> <c-o>     <plug>(unite_redraw)
	imap <silent> <buffer> <c-o>     <plug>(unite_redraw)
	imap <silent> <buffer> <c-j>     <plug>(unite_select_next_line)
	imap <silent> <buffer> <c-k>     <plug>(unite_select_previous_line)
	imap <silent> <buffer> <tab>     <plug>(unite_complete)

	let unite = unite#get_current_unite()
	if unite.profile_name ==# 'search'
		nnoremap <silent> <buffer><expr> r unite#do_action('replace')
	else
		nnoremap <silent> <buffer><expr> r unite#do_action('rename')
	endif
endfunction

inoremap <silent> <F12> <C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
nnoremap <silent> <F12> a<C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
"2}}}
"===[ VimTex ]=== {{{2
nnoremap <localleader>lt :<c-u>Unite vimtex_toc<cr>
nnoremap <localleader>ly :<c-u>Unite vimtex_labels<cr>
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

" Move to begining or end of line in insert mode
imap <C-B> <C-O>0
imap <C-E> <C-O>$
"1}}}
