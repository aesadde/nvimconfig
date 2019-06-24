" ==[ Toggles quickfix list ]== {{{1
let g:quickfix_is_open = 0
let g:error_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction
nnoremap <leader>q :call QuickfixToggle()<cr>

let g:loclist_is_open = 0
let g:error_is_open = 0

function! LoclistToggle()
    if g:loclist_is_open
        lclose
        let g:loclist_is_open = 0
        execute g:loclist_return_to_window . "wincmd w"
    else
        let g:loclist_return_to_window = winnr()
        lopen
        let g:loclist_is_open = 1
    endif
endfunction
nnoremap <leader>lo :call LoclistToggle()<cr>
"1}}}
" ===[ Trailing whitespaces ]=== {{{
function! StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
" }}}
"===[ Word Count] === {{{
" from: http://stackoverflow.com/questions/114431/fast-word-count-function-in-vim
function! WordCount()
  let s:old_status = v:statusmsg
  exe "silent normal g\<c-g>"
  let s:word_count = str2nr(split(v:statusmsg)[11])
  let v:statusmsg = s:old_status
  return s:word_count
endfunction
"}}}
